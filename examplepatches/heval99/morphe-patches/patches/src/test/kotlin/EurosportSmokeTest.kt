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
import org.w3c.dom.Element
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory

private const val PKG = "com.eurosport"
private const val STRING = "Ljava/lang/String;"
private const val CONTEXT = "Landroid/content/Context;"
private const val STORYTELLER_SETTINGS = "Lcom/storyteller/domain/settings/entities/Settings;"
private const val CLIPS_AD_CONFIGURATION = "Lcom/storyteller/Storyteller\$StorytellerClipsAdConfiguration;"
private const val STORYTELLER_COMPANION = "Lcom/storyteller/Storyteller\$Companion;"
private const val EVENT_TRACKING_OPTIONS = "Lcom/storyteller/Storyteller\$StorytellerEventTrackingOptions;"
private const val TEADS_AD_PLACEMENT_MEDIA = "Ltv/teads/sdk/combinedsdk/adplacement/TeadsAdPlacementMedia;"
private const val COMSCORE_ANALYTICS = "Lcom/comscore/Analytics;"
private const val NEW_RELIC = "Lcom/newrelic/agent/android/NewRelic;"
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"
private const val APPTENTIVE = "Lapptentive/com/android/feedback/Apptentive;"
private val AD_SDKS = setOf("GOOGLE_AD", "TEADS")
private val TELEMETRY_SDKS = setOf("ADOBE", "APPSFLYER", "CHARTBEAT", "PERMUTIVE", "MUX", "MEDIAMELON")

class EurosportSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.methodRef(): MethodReference? =
        (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Instruction.fieldRef(): FieldReference? =
        (this as? ReferenceInstruction)?.reference as? FieldReference

    private fun Instruction.stringRef(): String? =
        ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    private fun Instruction.register(): Int? = (this as? OneRegisterInstruction)?.registerA

    private fun Method.strings(): List<String> = instructions().mapNotNull { it.stringRef() }

    private fun Method.params(): List<String> = parameterTypes.map(CharSequence::toString)

    private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)

    private fun Instruction.isConstZero(register: Int) =
        this is NarrowLiteralInstruction && narrowLiteral == 0 && this.register() == register &&
            (opcode == Opcode.CONST_4 || opcode == Opcode.CONST_16)

    /** The class whose no-arg toString() holds a string starting with [prefix] (as the patches find them). */
    private fun List<ClassDef>.byToString(prefix: String, contains: String? = null): ClassDef {
        val found = filter { classDef ->
            classDef.methods.any { method ->
                method.name == "toString" && method.parameterTypes.isEmpty() && method.returnType == STRING &&
                    method.strings().let { strings ->
                        strings.any { it.startsWith(prefix) } && (contains == null || strings.any { contains in it })
                    }
            }
        }
        return found.singleOrNull() ?: error("expected one $prefix class, found ${found.map { it.type }}")
    }

    private fun ClassDef.toStringMethod() = method("toString", emptyList())

    /** The only concrete static (1 arg) method returning [type], as the patches find it. */
    private fun List<ClassDef>.staticFactory(type: String): Pair<ClassDef, Method> {
        val found = flatMap { classDef ->
            classDef.methods.filter {
                it.isStatic() && it.returnType == type && it.parameterTypes.size == 1 && it.implementation != null
            }.map { classDef to it }
        }
        return found.singleOrNull() ?: error("expected one static factory of $type, found ${found.map { "${it.first.type}->${it.second.name}" }}")
    }

    private fun assertReturnsNull(method: Method, label: String) {
        val insns = method.instructions()
        val first = insns.getOrNull(0)
        assertTrue(
            first != null && first.isConstZero(first.register() ?: -1) &&
                insns.getOrNull(1)?.opcode == Opcode.RETURN_OBJECT && insns[1].register() == first.register(),
            "$label does not return null at entry; found ${first?.opcode}, ${insns.getOrNull(1)?.opcode}"
        )
    }

    /** Index of the method's only store of [opcode] into [field] (by name), and its source register. */
    private fun Method.store(opcode: Opcode, field: String): Pair<Int, Int> {
        val stores = instructions().withIndex().filter { (_, insn) ->
            insn.opcode == opcode && insn.fieldRef()?.let { it.definingClass == definingClass && it.name == field } == true
        }
        val (index, insn) = stores.singleOrNull() ?: error("$definingClass->$name: expected one $opcode to $field, found ${stores.size}")
        return index to (insn as TwoRegisterInstruction).registerA
    }

    private fun Instruction.passes(register: Int): Boolean = when (this) {
        is RegisterRangeInstruction -> register in startRegister until startRegister + registerCount
        is FiveRegisterInstruction ->
            listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount).contains(register)
        else -> false
    }

    @Test
    fun `Disable ads, Disable telemetry and Hide partner promotions hook every ad, tracking and banner path`() {
        val root = repoRoot()
        val apk = File(root, "apks/eurosport/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "8.34.1",
            patchNames = setOf("Disable ads", "Disable telemetry", "Hide partner promotions"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }
        fun kept(type: String) = byType[type] ?: error("$type not found in the emitted dexes")

        // Disable ads 1 + Disable telemetry 1: the SdkConfig constructor ends with two blocks, one
        // per patch, that re-read the Sdk, compare its name() and store enabled = false on a match.
        val sdkConfig = classes.byToString("SdkConfig(sdk=")
        val sdkConstructor = sdkConfig.methods.single { it.name == "<init>" && it.parameterTypes.size == 3 }
        val sdk = sdkConstructor.params()[0]
        val enabled = sdkConfig.fields.single { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "Z" }.name
        val sdkInsns = sdkConstructor.instructions()
        assertEquals(Opcode.RETURN_VOID, sdkInsns.last().opcode, "SdkConfig <init> must still end with return-void")
        val blockStarts = sdkInsns.indices.filter {
            sdkInsns[it].opcode == Opcode.IGET_BOOLEAN && sdkInsns[it].fieldRef()?.name == enabled
        }
        assertEquals(2, blockStarts.size, "SdkConfig <init> should have two kill-switch blocks, found ${blockStarts.size}")
        val blocks = blockStarts.map { start ->
            val accumulator = sdkInsns[start].register()!!
            assertTrue(
                sdkInsns[start + 1].opcode == Opcode.IGET_OBJECT && sdkInsns[start + 1].fieldRef()?.type == sdk &&
                    sdkInsns[start + 2].methodRef()?.let { it.definingClass == "Ljava/lang/Enum;" && it.name == "name" } == true &&
                    sdkInsns[start + 3].opcode == Opcode.MOVE_RESULT_OBJECT,
                "SdkConfig block at $start does not read the Sdk's name()"
            )
            val names = mutableSetOf<String>()
            var i = start + 4
            while (sdkInsns[i].opcode == Opcode.CONST_STRING) {
                val name = sdkInsns[i].stringRef()!!
                assertTrue(
                    sdkInsns[i + 1].methodRef()?.let { it.definingClass == STRING && it.name == "equals" } == true &&
                        sdkInsns[i + 2].opcode == Opcode.MOVE_RESULT && sdkInsns[i + 3].opcode == Opcode.IF_EQZ &&
                        sdkInsns[i + 4].isConstZero(accumulator),
                    "SdkConfig block at $start: $name does not clear the result register v$accumulator"
                )
                names += name
                i += 5
            }
            val store = sdkInsns[i]
            assertTrue(
                store.opcode == Opcode.IPUT_BOOLEAN && store.fieldRef()?.name == enabled &&
                    (store as TwoRegisterInstruction).registerA == accumulator,
                "SdkConfig block at $start does not end by storing v$accumulator into $enabled; found ${store.opcode}"
            )
            names
        }
        assertEquals(setOf(AD_SDKS, TELEMETRY_SDKS), blocks.toSet(), "SdkConfig blocks disable the wrong SDKs")
        assertTrue(
            "STORYTELLER" !in sdkConstructor.strings(),
            "SdkConfig <init> must leave STORYTELLER at its server value"
        )

        // Disable ads 2: the AdPlaceholderModel factory answers null, next to "Unsupported provider: ".
        val placeholder = classes.byToString("AdPlaceholderModel(content=").type
        val (factoryClass, factory) = classes.staticFactory(placeholder)
        assertTrue(
            factoryClass.methods.any { method -> method.strings().any { it.startsWith("Unsupported provider: ") } },
            "${factoryClass.type} lost its \"Unsupported provider: \" method"
        )
        assertReturnsNull(factory, "AdPlaceholderModel factory (${factoryClass.type}->${factory.name})")

        // Disable ads 3: PlayerMediaInfo's constructors load null into the adsMetadata store's
        // register, and nothing else in the class writes that field.
        val playerInfo = classes.byToString("PlayerMediaInfo(id=", "adsMetadata=")
        val adsMetadataType = classes.byToString("AdsMetadata(id=").type
        val adsMetadata = playerInfo.fields.single { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == adsMetadataType }.name
        val playerInfoToString = playerInfo.toStringMethod().instructions()
        val adsMetadataString = playerInfoToString.indexOfFirst { it.stringRef()?.contains("adsMetadata=") == true }
        val adsMetadataRegister = playerInfoToString[adsMetadataString].register()!!
        val consumer = (adsMetadataString + 1 until playerInfoToString.size)
            .first { playerInfoToString[it].passes(adsMetadataRegister) }
        assertEquals(
            adsMetadata,
            playerInfoToString.drop(consumer + 1).takeWhile { it.stringRef() == null }
                .first { it.opcode == Opcode.IGET_OBJECT }.fieldRef()?.name,
            "PlayerMediaInfo toString does not print the $adsMetadataType field after adsMetadata="
        )
        val adsMetadataWriters = playerInfo.methods.filter { method ->
            method.instructions().any { it.opcode == Opcode.IPUT_OBJECT && it.fieldRef()?.name == adsMetadata }
        }
        assertTrue(adsMetadataWriters.isNotEmpty(), "no PlayerMediaInfo constructor stores $adsMetadata")
        adsMetadataWriters.forEach { writer ->
            assertEquals("<init>", writer.name, "PlayerMediaInfo.${writer.name} stores $adsMetadata outside a constructor")
            val (index, register) = writer.store(Opcode.IPUT_OBJECT, adsMetadata)
            assertTrue(
                writer.instructions()[index - 1].isConstZero(register),
                "PlayerMediaInfo <init>(${writer.params().size} args) does not load null into v$register before storing $adsMetadata"
            )
        }

        // Disable ads 4: both Storyteller Settings constructors store AdSource.NoAds.
        val settings = kept(STORYTELLER_SETTINGS)
        val adSource = settings.methods.filter { it.name == "<init>" }.flatMap { it.params() }.toSet().single { type ->
            byType[type]?.let { enum ->
                enum.superclass == "Ljava/lang/Enum;" &&
                    enum.methods.firstOrNull { it.name == "<clinit>" }?.strings()
                        ?.containsAll(listOf("NoAds", "IntegratingApp", "Storyteller")) == true
            } == true
        }
        val clinit = kept(adSource).method("<clinit>", emptyList()).instructions()
        val noAds = clinit.drop(clinit.indexOfFirst { it.stringRef() == "NoAds" })
            .first { it.opcode == Opcode.SPUT_OBJECT && it.fieldRef()?.definingClass == adSource }.fieldRef()!!.name
        val adSourceField = settings.fields.single { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == adSource }.name
        val settingsConstructors = settings.methods.filter { it.name == "<init>" && adSource in it.params() }
        assertEquals(2, settingsConstructors.size, "expected the public and the serializer Settings constructor")
        settingsConstructors.forEach { constructor ->
            val (index, register) = constructor.store(Opcode.IPUT_OBJECT, adSourceField)
            val load = constructor.instructions()[index - 1]
            assertTrue(
                load.opcode == Opcode.SGET_OBJECT && load.fieldRef()?.let { it.definingClass == adSource && it.name == noAds } == true &&
                    load.register() == register,
                "Settings <init>(${constructor.params().first()}...) does not load AdSource.NoAds into v$register first"
            )
        }

        // Disable ads 5: the Clips bottom banner and pre-roll getters answer false.
        val clipsAds = kept(CLIPS_AD_CONFIGURATION)
        assertForcedBoolean(clipsAds.method("getBottomBannerEnabled", emptyList()), false, "getBottomBannerEnabled")
        assertForcedBoolean(clipsAds.method("getPreRollEnabled", emptyList()), false, "getPreRollEnabled")

        // Disable ads 6: setModules replaces its list with an empty one before anything else.
        val setModules = kept(STORYTELLER_COMPANION).method("setModules", listOf("Ljava/util/List;"))
        val modulesInsns = setModules.instructions()
        val p1 = setModules.implementation!!.registerCount - 1
        assertTrue(
            modulesInsns[0].methodRef()?.let { it.definingClass == "Ljava/util/Collections;" && it.name == "emptyList" } == true &&
                modulesInsns[1].opcode == Opcode.MOVE_RESULT_OBJECT && modulesInsns[1].register() == p1,
            "setModules does not replace p1 (v$p1) with Collections.emptyList(); found ${modulesInsns[0].opcode}, ${modulesInsns[1].opcode}"
        )

        // Disable ads 7: the app's Teads loader returns at once.
        val teadsLoaders = classes.filterNot { it.type.startsWith("Ltv/teads/") }.flatMap { classDef ->
            classDef.methods.filter { method ->
                method.instructions().any {
                    it.opcode == Opcode.NEW_INSTANCE &&
                        ((it as ReferenceInstruction).reference as? TypeReference)?.type == TEADS_AD_PLACEMENT_MEDIA
                }
            }.map { classDef to it }
        }
        assertTrue(teadsLoaders.isNotEmpty(), "no app method creates $TEADS_AD_PLACEMENT_MEDIA")
        teadsLoaders.forEach { (classDef, loader) ->
            assertReturnsEarlyVoid(loader, "Teads loader (${classDef.type}->${loader.name})")
        }

        // Disable telemetry 2: the manifest switches.
        val manifestFile = workDir.walkTopDown()
            .filter { it.name == "AndroidManifest.xml" && it.readText().contains("firebase_analytics_collection_deactivated") }
            .firstOrNull() ?: error("no decoded AndroidManifest.xml with the telemetry meta-data under $workDir")
        val manifest = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(manifestFile).documentElement
        fun Element.children(tag: String) =
            getElementsByTagName(tag).let { list -> (0 until list.length).map { list.item(it) as Element } }
        val application = manifest.children("application").single()
        val metaData = application.children("meta-data")
            .filter { it.parentNode == application }
            .groupBy({ it.getAttribute("android:name") }, { it.getAttribute("android:value") })
        mapOf(
            "firebase_analytics_collection_deactivated" to "true",
            "google_analytics_adid_collection_enabled" to "false",
            "firebase_crashlytics_collection_enabled" to "false",
        ).forEach { (name, value) -> assertEquals(listOf(value), metaData[name], "meta-data $name") }

        // Disable telemetry 3: Comscore start and every concrete static notify* return at once.
        val comscore = kept(COMSCORE_ANALYTICS)
        assertReturnsEarlyVoid(comscore.method("start", listOf(CONTEXT)), "Comscore Analytics.start(Context)")
        val notifies = comscore.methods.filter {
            it.isStatic() && it.name.startsWith("notify") && it.returnType == "V" && it.implementation != null
        }
        assertTrue(notifies.any { it.name == "notifyHiddenEvent" }, "Comscore notifyHiddenEvent not found")
        notifies.forEach { assertReturnsEarlyVoid(it, "Comscore Analytics.${it.name}(${it.params().joinToString()})") }

        // Disable telemetry 4: the New Relic agent never starts.
        assertReturnsEarlyVoid(
            kept(NEW_RELIC).methods.single { it.name == "start" && it.params() == listOf(CONTEXT) && !it.isStatic() },
            "NewRelic.start(Context)",
        )

        // Disable telemetry 5: every concrete AppsFlyer entry point returns at once.
        val appsFlyer = classes.filter { it.superclass == APPSFLYER_LIB }.flatMap { classDef ->
            classDef.methods.filter {
                it.name in setOf("start", "logEvent", "logSession", "logAdRevenue") && it.returnType == "V" && it.implementation != null
            }
        }
        assertTrue(appsFlyer.any { it.name == "start" }, "no concrete AppsFlyerLib start()")
        assertTrue(appsFlyer.any { it.name == "logEvent" }, "no concrete AppsFlyerLib logEvent")
        appsFlyer.forEach { assertReturnsEarlyVoid(it, "AppsFlyer ${it.definingClass}->${it.name}(${it.params().joinToString()})") }

        // Disable telemetry 6: Apptentive never registers or engages.
        val apptentive = kept(APPTENTIVE).methods.filter {
            (it.name == "register" || it.name == "engage") && it.returnType == "V" && it.implementation != null
        }
        assertTrue(apptentive.any { it.name == "register" } && apptentive.any { it.name == "engage" }, "Apptentive register/engage not found")
        apptentive.forEach { assertReturnsEarlyVoid(it, "Apptentive.${it.name}(${it.params().joinToString()})") }

        // Disable telemetry 7: Storyteller's own tracking switches are stored as false; the
        // personalization and remote viewing store switches are left alone.
        val trackingOptions = kept(EVENT_TRACKING_OPTIONS).methods.single {
            it.name == "<init>" && it.params().joinToString("") == "ZZZZZZLjava/util/List;"
        }
        val trackingInsns = trackingOptions.instructions()
        listOf("enableStorytellerTracking", "enableUserActivityTracking", "enableAdTracking", "enableFullVideoAnalytics")
            .forEach { field ->
                val (index, register) = trackingOptions.store(Opcode.IPUT_BOOLEAN, field)
                assertTrue(trackingInsns[index - 1].isConstZero(register), "$field is not stored as false (v$register)")
            }
        listOf("enablePersonalization", "enableRemoteViewingStore").forEach { field ->
            val (index, register) = trackingOptions.store(Opcode.IPUT_BOOLEAN, field)
            assertTrue(!trackingInsns[index - 1].isConstZero(register), "$field must keep the app's value")
        }

        // Hide partner promotions: the WatchBannerUi factory answers null.
        val banner = classes.byToString("WatchBannerUi(label=").type
        val (bannerClass, bannerFactory) = classes.staticFactory(banner)
        assertReturnsNull(bannerFactory, "WatchBannerUi factory (${bannerClass.type}->${bannerFactory.name})")
    }
}
