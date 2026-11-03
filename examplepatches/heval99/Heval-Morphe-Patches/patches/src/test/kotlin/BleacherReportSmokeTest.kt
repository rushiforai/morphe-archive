import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "com.bleacherreport.android.teamstream"
private const val STRING = "Ljava/lang/String;"
private const val OBJECT = "Ljava/lang/Object;"
private const val MOBILE_ADS = "Lcom/google/android/gms/ads/MobileAds;"
private const val COMSCORE_ANALYTICS = "Lcom/comscore/Analytics;"
private val BETTING_STATS_ITEMS = listOf(
    "StatsBetting", "StatsLiveOdds", "StatsOdds", "StatsMoneyline", "StatsTotalPoints", "StatsSpread",
    "StatsDrawNoBet", "StatsThreeWayMoneyline", "StatsPlayerProp",
)

class BleacherReportSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.methodRef(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Instruction.fieldRef(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference

    private fun Instruction.typeRef(): String? = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

    private fun Instruction.stringRef(): String? =
        ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    private fun Instruction.register(): Int? = (this as? OneRegisterInstruction)?.registerA

    private fun Instruction.passes(register: Int): Boolean = when (this) {
        is RegisterRangeInstruction -> register in startRegister until startRegister + registerCount
        is FiveRegisterInstruction ->
            listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount).contains(register)
        else -> false
    }

    private fun Instruction.isConst(register: Int, value: Int) =
        this is NarrowLiteralInstruction && narrowLiteral == value && register() == register &&
            (opcode == Opcode.CONST_4 || opcode == Opcode.CONST_16)

    private fun Method.strings(): List<String> = instructions().mapNotNull { it.stringRef() }

    private fun Method.params(): List<String> = parameterTypes.map(CharSequence::toString)

    private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)

    private fun Method.label() = "$definingClass->$name(${params().joinToString("")})"

    /** p-register [p] as a v-register index. */
    private fun Method.p(p: Int): Int {
        val ins = params().sumOf { if (it == "J" || it == "D") 2 else 1 } + if (isStatic()) 0 else 1
        return implementation!!.registerCount - ins + p
    }

    private fun List<ClassDef>.single(label: String, predicate: (ClassDef, Method) -> Boolean): Method {
        val found = flatMap { classDef ->
            classDef.methods.filter { it.implementation != null && predicate(classDef, it) }
        }
        return found.singleOrNull() ?: error("expected one $label, found ${found.map { it.label() }}")
    }

    private fun List<ClassDef>.byToString(prefix: String): ClassDef {
        val found = filter { classDef ->
            classDef.methods.any { method ->
                method.name == "toString" && method.parameterTypes.isEmpty() &&
                    method.strings().any { it.startsWith(prefix) }
            }
        }
        return found.singleOrNull() ?: error("expected one $prefix class, found ${found.map { it.type }}")
    }

    private fun assertReturnsNull(method: Method) {
        val insns = method.instructions()
        val first = insns.getOrNull(0)
        assertTrue(
            first != null && first.isConst(first.register() ?: -1, 0) &&
                insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT && insns[1].register() == first.register(),
            "${method.label()} does not return null at entry; found ${first?.opcode}, ${insns.getOrNull(1)?.opcode}",
        )
    }

    /** `sget-object vX, kotlin.Unit; return-object vX` at entry. Unit is R8-renamed inside kotlin/. */
    private fun assertReturnsUnit(method: Method) {
        val insns = method.instructions()
        val unit = insns.getOrNull(0)?.fieldRef()
        assertTrue(
            insns.getOrNull(0)?.opcode == Opcode.SGET_OBJECT && unit != null && unit.type == unit.definingClass &&
                unit.definingClass.startsWith("Lkotlin/") &&
                insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT && insns[1].register() == insns[0].register(),
            "${method.label()} does not return Unit at entry; found ${insns.getOrNull(0)?.opcode} $unit, ${insns.getOrNull(1)?.opcode}",
        )
        // The same Unit the stock code returns further down.
        assertTrue(
            insns.drop(2).any { it.opcode == Opcode.SGET_OBJECT && it.fieldRef()?.let { f -> f.definingClass == unit!!.definingClass && f.name == unit.name } == true },
            "${method.label()} returns ${unit} at entry, which its stock code never returns",
        )
    }

    /** `return Result.failure(<new [exception]>)` at entry, Result.failure taken as a kotlin/ static (Throwable). */
    private fun assertReturnsFailure(method: Method, exception: String, withMessage: Boolean) {
        val insns = method.instructions()
        val ctor = if (withMessage) 2 else 1
        val failure = insns.getOrNull(ctor + 1)?.methodRef()
        assertTrue(
            insns.getOrNull(0)?.opcode == Opcode.NEW_INSTANCE && insns[0].typeRef() == exception &&
                insns.getOrNull(ctor)?.opcode == Opcode.INVOKE_DIRECT &&
                insns[ctor].methodRef()?.let { it.definingClass == exception && it.name == "<init>" } == true &&
                insns[ctor + 1].opcode == Opcode.INVOKE_STATIC && failure != null &&
                failure.definingClass.startsWith("Lkotlin/") && failure.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Throwable;") &&
                insns.getOrNull(ctor + 2)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
                insns.getOrNull(ctor + 3)?.opcode == Opcode.RETURN_OBJECT,
            "${method.label()} does not return Result.failure($exception) at entry; found ${insns.take(ctor + 4).map { it.opcode }}",
        )
        if (withMessage) assertEquals("Ad Unit is missing", insns[1].stringRef(), "${method.label()} failure message")
    }

    @Test
    fun `Disable ads, Disable telemetry and Hide betting content hook every ad, tracking and betting path`() {
        val root = repoRoot()
        val apk = File(root, "apks/bleacherreport/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "11.13.0.39",
            patchNames = setOf("Disable ads", "Disable telemetry", "Hide betting content"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }

        // Launch tasks: the LaunchTask base (by its cast message), config.taskId (read by its
        // equals) and ExecutionResult.Success (by toString), found the way the patch finds them.
        val launchEquals = classes.single("LaunchTask.equals") { _, m ->
            m.name == "equals" && m.strings().any { it.endsWith(".launchtaskmanager.LaunchTask") }
        }
        val launchTask = launchEquals.definingClass
        val reads = launchEquals.instructions().filter { it.opcode == Opcode.IGET_OBJECT }.mapNotNull { it.fieldRef() }
        val configField = reads.first { it.definingClass == launchTask }
        val taskIdField = reads.first { it.definingClass == configField.type && it.type == STRING }
        val success = classes.byToString("Success(taskId=").type
        val execute = byType.getValue(launchTask).methods.single {
            AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.returnType == OBJECT && it.parameterTypes.size == 1
        }
        fun assertReturnsSuccess(taskName: String) {
            val configs = classes.filter { classDef ->
                classDef.superclass == configField.type &&
                    classDef.methods.any { it.name == "<clinit>" && taskName in it.strings() }
            }
            val config = configs.singleOrNull()?.type ?: error("expected one $taskName config, found ${configs.map { it.type }}")
            val tasks = classes.filter { classDef ->
                classDef.superclass == launchTask && classDef.methods.any { m ->
                    m.name == "<init>" && m.instructions().any { it.opcode == Opcode.SGET_OBJECT && it.fieldRef()?.definingClass == config }
                }
            }
            val task = tasks.singleOrNull() ?: error("expected one $taskName, found ${tasks.map { it.type }}")
            val method = task.method(execute.name, execute.params())
            val insns = method.instructions()
            val ok = insns.size > 6 &&
                insns[0].opcode == Opcode.MOVE_OBJECT_FROM16 &&
                insns[1].opcode == Opcode.IGET_OBJECT && insns[1].fieldRef()?.name == configField.name &&
                insns[1].fieldRef()?.definingClass == launchTask &&
                insns[2].opcode == Opcode.IGET_OBJECT && insns[2].fieldRef()?.name == taskIdField.name &&
                insns[2].fieldRef()?.definingClass == configField.type &&
                insns[3].opcode == Opcode.NEW_INSTANCE && insns[3].typeRef() == success &&
                insns[4].opcode == Opcode.INVOKE_DIRECT && insns[4].methodRef()?.let { it.definingClass == success && it.name == "<init>" } == true &&
                insns[5].opcode == Opcode.RETURN_OBJECT && insns[5].register() == insns[3].register()
            assertTrue(ok, "$taskName (${task.type}) does not return Success(taskId) at entry; found ${insns.take(6).map { it.opcode }}")
        }

        // ---- Disable ads ----

        // 1. getFeaturesAdConfig answers Result.failure(AdConfigException); the exception class is
        // checked by its own source file name, independently of the patch.
        val adConfigException = classes.single { it.sourceFile == "AdConfigException.kt" }.type
        val adConfig = classes.single("getFeaturesAdConfig") { _, m ->
            m.returnType == OBJECT && m.strings().let { "getFeaturesAdConfig() " in it && "Returning hardcoded ad config" in it }
        }
        assertReturnsFailure(adConfig, adConfigException, withMessage = false)

        // 2. The feed ad inserter: ads = emptyList() into p2, alerted ad = null into p5.
        val inserter = classes.single("AdContentInserterImpl.insert") { c, m ->
            c.sourceFile == "AdContentInserterImpl.kt" && m.returnType == "Ljava/util/ArrayList;" && m.parameterTypes.size == 6
        }
        val inserterInsns = inserter.instructions()
        assertTrue(
            inserterInsns[0].opcode == Opcode.INVOKE_STATIC &&
                inserterInsns[0].methodRef()?.let { it.definingClass == "Ljava/util/Collections;" && it.name == "emptyList" } == true &&
                inserterInsns[1].opcode == Opcode.MOVE_RESULT_OBJECT && inserterInsns[1].register() == inserter.p(2) &&
                inserterInsns[2].isConst(inserter.p(5), 0),
            "AdContentInserterImpl.insert does not empty the ads and null the alerted ad; found ${inserterInsns.take(3).map { it.opcode }}",
        )

        // 3. AdsManagerImpl: loadAd returns at once, loadSplashAd fails, Amazon init returns Unit.
        val loadAd = classes.single("AdsManagerImpl.loadAd") { _, m ->
            m.returnType == "V" && m.strings().any { it.startsWith("Ad Unit is missing in ") }
        }
        assertReturnsEarlyVoid(loadAd, "AdsManagerImpl.loadAd")
        val loadSplash = classes.single("AdsManagerImpl.loadSplashAd") { _, m ->
            m.returnType == OBJECT && m.strings().any { it.startsWith("loadSplashAd() ad=") }
        }
        assertReturnsFailure(loadSplash, "Ljava/lang/IllegalArgumentException;", withMessage = true)
        val amazon = classes.single("AdsManagerImpl Amazon init") { _, m ->
            m.returnType == OBJECT && m.strings().any { it.startsWith("Amazon Services SDK could not be started") }
        }
        assertReturnsUnit(amazon)

        // 4. The ad launch tasks.
        assertReturnsSuccess("AdSetupLaunchTask")
        assertReturnsSuccess("SplashAdLaunchTask")

        // 5. Rule 9.
        assertMobileAdsStaticsNeutralised(byType.getValue(MOBILE_ADS), GMA_THROWING_STATICS + "registerWebView")

        // ---- Disable telemetry ----

        // 1. mParticle (with Apptentive), Datadog and comScore launch tasks.
        assertReturnsSuccess("MParticleLaunchTask")
        assertReturnsSuccess("DatadogLaunchTask")
        assertReturnsSuccess("ComScoreLaunchTask")

        // 2. comScore statics.
        val comScoreStatics = byType.getValue(COMSCORE_ANALYTICS).methods.filter {
            it.isStatic() && it.returnType == "V" && it.implementation != null && it.name != "<clinit>"
        }
        assertTrue(comScoreStatics.any { it.name == "start" }, "comScore Analytics.start not found")
        assertTrue(comScoreStatics.any { it.name == "notifyUxActive" }, "comScore Analytics.notifyUxActive not found")
        comScoreStatics.forEach { assertReturnsEarlyVoid(it, "comScore ${it.label()}") }

        // 3. Crashlytics.
        val arbiter = classes.single("Crashlytics DataCollectionArbiter") { _, m ->
            m.returnType == "Z" && m.parameterTypes.isEmpty() &&
                m.strings().any { it.startsWith("firebase_crashlytics_collection_enabled manifest flag") }
        }
        assertForcedBoolean(arbiter, expected = false, label = "Crashlytics isAutomaticDataCollectionEnabled")

        // 4. Branch: each read of the tracking-state preference is followed by `const 1` on its
        // result register (3 readers in 11.12.0.33).
        var branchReads = 0
        for (classDef in classes) for (method in classDef.methods) {
            val insns = method.instructions()
            insns.indices.filter { insns[it].stringRef() == "bnc_tracking_state" }.forEach { key ->
                val register = insns[key].register()!!
                val call = (key + 1 until insns.size).first { insns[it].passes(register) }
                if (insns[call].methodRef()?.returnType != "Z") return@forEach
                val result = insns[call + 1]
                assertEquals(Opcode.MOVE_RESULT, result.opcode, "${method.label()}: Branch read has no move-result")
                assertTrue(
                    insns[call + 2].isConst(result.register()!!, 1),
                    "${method.label()}: Branch tracking-state read is not forced to true; next is ${insns[call + 2].opcode}",
                )
                branchReads++
            }
        }
        assertEquals(3, branchReads, "expected the 3 Branch tracking-state reads to be forced")

        // 5. Beam event queue and monitor; 6. Braze event forwarding.
        assertReturnsUnit(classes.single("Beam PersistentEventQueue.add") { _, m ->
            m.returnType == OBJECT && m.parameterTypes.size == 2 &&
                m.strings().any { it.startsWith("EnrichedEventQueue.add(): exception") }
        })
        assertReturnsUnit(classes.single("Beam EventQueueMonitor.onTaskExecution") { _, m ->
            m.returnType == OBJECT && m.parameterTypes.size == 1 &&
                m.strings().any { it.startsWith("onTaskExecution skipped, mode is ") }
        })
        assertReturnsUnit(classes.single("CanonicalEventInteractorImpl dispatch") { _, m ->
            m.returnType == OBJECT && m.parameterTypes.size == 2 && "br-braze-event-forwarding" in m.strings()
        })

        // ---- Hide betting content ----

        // 1. The Stats item mapper: null-guard, StatsItemType.name(), one equals per betting type,
        // then `return null`, before the stock code.
        val stats = classes.byToString("Stats(type=")
        val typeField = stats.fields.single { !AccessFlags.STATIC.isSet(it.accessFlags) }
        val mapper = classes.single("ChannelItemsMapper Stats mapper") { c, m ->
            c.sourceFile == "ChannelItemsMapper.kt" && m.isStatic() && m.parameterTypes.size == 2 &&
                m.parameterTypes[0].toString() == stats.type
        }
        val mapperInsns = mapper.instructions()
        val checks = BETTING_STATS_ITEMS.size * 4
        assertTrue(
            mapperInsns[0].opcode == Opcode.IF_EQZ && mapperInsns[0].register() == mapper.p(0) &&
                mapperInsns[1].opcode == Opcode.MOVE_OBJECT_FROM16 &&
                mapperInsns[2].opcode == Opcode.IGET_OBJECT && mapperInsns[2].fieldRef()?.name == typeField.name &&
                mapperInsns[2].fieldRef()?.definingClass == stats.type &&
                mapperInsns[3].opcode == Opcode.IF_EQZ &&
                mapperInsns[4].methodRef()?.let { it.definingClass == "Ljava/lang/Enum;" && it.name == "name" } == true &&
                mapperInsns[5].opcode == Opcode.MOVE_RESULT_OBJECT,
            "the Stats mapper does not read StatsItemType.name() at entry; found ${mapperInsns.take(6).map { it.opcode }}",
        )
        assertEquals(
            BETTING_STATS_ITEMS,
            mapperInsns.subList(6, 6 + checks).mapNotNull { it.stringRef() },
            "the Stats mapper does not check every betting StatsItemType",
        )
        assertTrue(
            mapperInsns.subList(6, 6 + checks).count { it.opcode == Opcode.IF_NEZ } == BETTING_STATS_ITEMS.size &&
                mapperInsns[6 + checks].opcode == Opcode.GOTO &&
                mapperInsns[7 + checks].isConst(0, 0) &&
                mapperInsns[8 + checks].opcode == Opcode.RETURN_OBJECT &&
                mapperInsns[9 + checks].opcode == Opcode.MOVE_OBJECT_FROM16,
            "the Stats mapper does not return null for the betting types; found ${mapperInsns.subList(6 + checks, 10 + checks).map { it.opcode }}",
        )

        // 2. The odds and trending bets module mappers.
        for (source in listOf("OddsStateMapper.kt", "TrendingBetsStateMapper.kt")) {
            assertReturnsNull(classes.single(source) { c, m ->
                c.sourceFile == source && m.isStatic() && m.parameterTypes.size == 2 &&
                    m.returnType.startsWith("L") && m.parameterTypes.all { it.startsWith("L") }
            })
        }

        // 3. Scores: `const 0` right before each store of bettingLink and bettingDisclaimer.
        val scores = classes.byToString("Scores(calendarNavigation=")
        val scoresToString = scores.method("toString", emptyList()).instructions()
        val scoresConstructor = scores.methods.single { it.name == "<init>" && it.parameterTypes.size == 6 }
        val constructorInsns = scoresConstructor.instructions()
        for (label in listOf(", bettingLink=", ", bettingDisclaimer=")) {
            val at = scoresToString.indexOfFirst { it.stringRef() == label }
            val field = scoresToString.drop(at + 1).first { it.opcode == Opcode.IGET_OBJECT }.fieldRef()!!
            val store = constructorInsns.indexOfFirst { it.opcode == Opcode.IPUT_OBJECT && it.fieldRef()?.name == field.name }
            assertTrue(store > 0, "Scores <init> does not store ${field.name}")
            val register = (constructorInsns[store] as TwoRegisterInstruction).registerA
            assertTrue(
                constructorInsns[store - 1].isConst(register, 0),
                "Scores <init> does not null $label before storing it; found ${constructorInsns[store - 1].opcode}",
            )
        }
    }
}
