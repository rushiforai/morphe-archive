import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
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

private const val PKG = "com.football433"
private const val STRING = "Ljava/lang/String;"
private const val METHOD_CALL = "Lio/flutter/plugin/common/MethodCall;"
private const val METHOD_RESULT = "Lio/flutter/plugin/common/MethodChannel\$Result;"
private const val UXCAM = "Lcom/uxcam/UXCam;"
private const val AIRSHIP_CONFIG_BUILDER = "Lcom/urbanairship/AirshipConfigOptions\$Builder;"
private const val FAIL_LOAD_HELPER = "morpheFailLoad"
private val LOAD_METHOD_NAMES = listOf(
    "loadBannerAd", "loadAdManagerBannerAd", "loadFluidAd", "loadNativeAd", "loadInterstitialAd",
    "loadAdManagerInterstitialAd", "loadRewardedAd", "loadRewardedInterstitialAd", "loadAppOpenAd",
)

class Football433SmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.methodRef(): MethodReference? =
        (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Instruction.fieldRef(): FieldReference? =
        (this as? ReferenceInstruction)?.reference as? FieldReference

    private fun Instruction.typeRef(): String? =
        ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

    private fun Instruction.stringRef(): String? =
        ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    private fun Instruction.registers(): List<Int> = when (this) {
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        else -> emptyList()
    }

    private fun Method.strings(): List<String> = instructions().mapNotNull { it.stringRef() }

    private fun Method.params(): List<String> = parameterTypes.map(CharSequence::toString)

    private fun MethodReference.params(): List<String> = parameterTypes.map(CharSequence::toString)

    private fun List<ClassDef>.methods(): List<Pair<ClassDef, Method>> =
        flatMap { classDef -> classDef.methods.map { classDef to it } }

    private fun List<Pair<ClassDef, Method>>.single(label: String, predicate: (Method) -> Boolean): Pair<ClassDef, Method> {
        val found = filter { (_, method) -> method.implementation != null && predicate(method) }
        return found.singleOrNull()
            ?: error("expected one $label, found ${found.map { "${it.first.type}->${it.second.name}" }}")
    }

    /** p-register [p] as a v-register index. */
    private fun Method.p(p: Int): Int {
        val ins = params().sumOf { if (it == "J" || it == "D") 2 else 1 } + if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
        return implementation!!.registerCount - ins + p
    }

    /** Instruction indices to code-unit addresses, to resolve branch offsets. */
    private fun List<Instruction>.addresses(): List<Int> =
        runningFold(0) { address, insn -> address + insn.codeUnits }

    @Test
    fun `Disable ads fails every plugin ad load and Disable telemetry switches off Sentry, UXCam, Airship analytics and Branch tracking`() {
        val root = repoRoot()
        val apk = File(root, "apks/football433/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "2.3.585",
            patchNames = setOf("Disable ads", "Disable telemetry"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val allMethods = classes.methods()
        val byType = classes.associateBy { it.type }

        // The plugin's AdInstanceManager, FlutterAd and FlutterLoadAdError, found as the patch does.
        val (managerClass, fail) = allMethods.single("AdInstanceManager.onAdFailedToLoad") {
            it.returnType == "V" && it.params().size == 2 && it.params()[0] == "I" &&
                it.strings().containsAll(listOf("adId", "eventName", "onAdFailedToLoad", "loadAdError"))
        }
        val manager = managerClass.type
        val loadAdError = fail.params()[1]
        val (trackClass, track) = allMethods.single("AdInstanceManager.trackAd") {
            it.returnType == "V" && it.params().size == 2 && it.params()[1] == "I" &&
                "Ad for following adId already exists: %d" in it.strings()
        }
        assertEquals(manager, trackClass.type, "trackAd and onAdFailedToLoad must share the manager")
        val flutterAd = track.params()[0]
        val adIdField = byType.getValue(flutterAd).fields.single { it.type == "I" && !AccessFlags.STATIC.isSet(it.accessFlags) }

        // Disable ads 1: the manager's helper builds FlutterLoadAdError(3, GMA domain, "Ad blocked",
        // null) and passes it with the adId (p1) to onAdFailedToLoad on itself (p0).
        val helper = managerClass.methods.singleOrNull {
            it.name == FAIL_LOAD_HELPER && it.params() == listOf("I") && it.returnType == "V"
        } ?: error("$manager has no $FAIL_LOAD_HELPER(I)V")
        val h = helper.instructions()
        assertTrue(
            h.getOrNull(0)?.opcode == Opcode.NEW_INSTANCE && h[0].typeRef() == loadAdError,
            "$FAIL_LOAD_HELPER does not create a $loadAdError first; found ${h.getOrNull(0)?.opcode}"
        )
        val error = (h[0] as OneRegisterInstruction).registerA
        val code = h.getOrNull(1)
        assertTrue(
            code is NarrowLiteralInstruction && code.narrowLiteral == 3,
            "$FAIL_LOAD_HELPER does not load error code 3 (NO_FILL); found ${code?.opcode}"
        )
        assertEquals("com.google.android.gms.ads", h.getOrNull(2)?.stringRef(), "$FAIL_LOAD_HELPER error domain")
        assertEquals("Ad blocked", h.getOrNull(3)?.stringRef(), "$FAIL_LOAD_HELPER error message")
        val info = h.getOrNull(4)
        assertTrue(info is NarrowLiteralInstruction && info.narrowLiteral == 0, "$FAIL_LOAD_HELPER does not pass a null ResponseInfo")
        val init = h.getOrNull(5)
        val initRef = init?.methodRef()
        assertTrue(
            init?.opcode == Opcode.INVOKE_DIRECT_RANGE && initRef?.definingClass == loadAdError && initRef.name == "<init>" &&
                initRef.params().take(3) == listOf("I", STRING, STRING) && initRef.params().size == 4 &&
                init.registers() == listOf(error, (code as OneRegisterInstruction).registerA, (h[2] as OneRegisterInstruction).registerA,
                    (h[3] as OneRegisterInstruction).registerA, (info as OneRegisterInstruction).registerA),
            "$FAIL_LOAD_HELPER does not construct the error from code, domain, message and null; found ${init?.opcode} $initRef"
        )
        val report = h.getOrNull(6)
        assertTrue(
            report?.opcode == Opcode.INVOKE_VIRTUAL && report.methodRef()?.let {
                it.definingClass == manager && it.name == fail.name && it.params() == fail.params()
            } == true && report.registers() == listOf(helper.p(0), helper.p(1), error),
            "$FAIL_LOAD_HELPER does not call $manager->${fail.name}(adId, error) on itself; found ${report?.opcode} ${report?.methodRef()}"
        )
        assertTrue(h.getOrNull(7)?.opcode == Opcode.RETURN_VOID, "$FAIL_LOAD_HELPER does not return after reporting")

        // The load methods, as the patch finds them: onMethodCall's trackAd(ad, adId) calls, each
        // followed by a no-arg load on the ad. One per load* channel method.
        val (_, onMethodCall) = allMethods.single("GoogleMobileAdsPlugin.onMethodCall") {
            it.returnType == "V" && it.params() == listOf(METHOD_CALL, METHOD_RESULT) &&
                it.strings().containsAll(LOAD_METHOD_NAMES + "MobileAds#initialize")
        }
        val calls = onMethodCall.instructions()
        val loadRefs = calls.indices.mapNotNull { index ->
            val ref = calls[index].methodRef()
            if (ref?.definingClass != manager || ref.name != track.name || ref.params() != track.params()) return@mapNotNull null
            val ad = calls[index].registers()[1]
            val next = (index + 1 until calls.size).first { calls[it].methodRef() != null }
            val load = calls[next].methodRef()!!
            assertTrue(
                load.params().isEmpty() && load.returnType == "V" && calls[next].registers() == listOf(ad),
                "trackAd at $index is not followed by a no-arg load on the ad; found $load"
            )
            load
        }
        assertEquals(LOAD_METHOD_NAMES.size, loadRefs.size, "trackAd + load calls in onMethodCall")

        // Resolve to the defining class, walking up from the (possibly subclass-typed) call.
        fun chain(type: String) = generateSequence(type) { byType[it]?.superclass }.takeWhile { it != flutterAd }
        fun isFlutterAd(type: String) = generateSequence(type) { byType[it]?.superclass }.any { it == flutterAd }
        val loads = loadRefs.map { ref ->
            val owner = chain(ref.definingClass).first { type ->
                byType.getValue(type).methods.any { it.name == ref.name && it.parameterTypes.isEmpty() && it.implementation != null }
            }
            byType.getValue(owner) to byType.getValue(owner).method(ref.name, emptyList())
        }.distinctBy { it.first.type }
        assertEquals(8, loads.size, "distinct load methods (the fluid ad inherits the Ad Manager banner's)")
        val adClasses = classes.filter {
            it.type != flutterAd && isFlutterAd(it.type) && !AccessFlags.ABSTRACT.isSet(it.accessFlags)
        }
        assertEquals(LOAD_METHOD_NAMES.size, adClasses.size, "concrete FlutterAd classes: ${adClasses.map { it.type }}")
        adClasses.forEach { ad ->
            assertTrue(
                chain(ad.type).any { type -> loads.any { it.first.type == type } },
                "${ad.type} reaches no patched load method"
            )
        }

        // Disable ads 2: every load starts with iget-object manager; if-eqz -> return-void;
        // iget adId; invoke-virtual manager->morpheFailLoad(adId); return-void.
        loads.forEach { (adClass, load) ->
            val label = "${adClass.type}->${load.name}()V"
            val insns = load.instructions()
            val getManager = insns.getOrNull(0)
            assertTrue(
                getManager?.opcode == Opcode.IGET_OBJECT && getManager.fieldRef()?.type == manager &&
                    (getManager as TwoRegisterInstruction).registerB == load.p(0),
                "$label does not read its $manager field first; found ${getManager?.opcode} ${getManager?.fieldRef()}"
            )
            val managerRegister = (getManager as OneRegisterInstruction).registerA
            val guard = insns.getOrNull(1)
            assertTrue(
                guard?.opcode == Opcode.IF_EQZ && (guard as OneRegisterInstruction).registerA == managerRegister,
                "$label does not null-check the manager; found ${guard?.opcode}"
            )
            val getId = insns.getOrNull(2)
            assertTrue(
                getId?.opcode == Opcode.IGET && getId.fieldRef()?.let { it.definingClass == flutterAd && it.name == adIdField.name } == true &&
                    (getId as TwoRegisterInstruction).registerB == load.p(0),
                "$label does not read FlutterAd's adId; found ${getId?.opcode} ${getId?.fieldRef()}"
            )
            val callHelper = insns.getOrNull(3)
            assertTrue(
                callHelper?.opcode == Opcode.INVOKE_VIRTUAL &&
                    callHelper.methodRef()?.let { it.definingClass == manager && it.name == FAIL_LOAD_HELPER } == true &&
                    callHelper.registers() == listOf(managerRegister, (getId as OneRegisterInstruction).registerA),
                "$label does not call $FAIL_LOAD_HELPER(adId) on the manager; found ${callHelper?.opcode} ${callHelper?.methodRef()}"
            )
            assertTrue(insns.getOrNull(4)?.opcode == Opcode.RETURN_VOID, "$label does not return after failing the ad")
            val addresses = insns.addresses()
            assertTrue(
                addresses[1] + (guard as OffsetInstruction).codeOffset == addresses[4],
                "$label: the null-manager branch does not jump to the prologue's return-void"
            )
        }

        // Disable telemetry 1: the manifest disables Sentry.
        val manifestFile = workDir.walkTopDown()
            .filter { it.name == "AndroidManifest.xml" && it.readText().contains("io.sentry.enabled") }
            .firstOrNull() ?: error("no decoded AndroidManifest.xml with io.sentry.enabled under $workDir")
        val manifest = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(manifestFile).documentElement
        val application = manifest.getElementsByTagName("application").item(0) as Element
        val metas = application.getElementsByTagName("meta-data")
        val sentryEnabled = (0 until metas.length).map { metas.item(it) as Element }
            .filter { it.parentNode == application && it.getAttribute("android:name") == "io.sentry.enabled" }
            .map { it.getAttribute("android:value") }
        assertEquals(listOf("false"), sentryEnabled, "meta-data io.sentry.enabled")

        // Disable telemetry 2: the UXCam startWithConfiguration handler answers Boolean.FALSE on
        // its Result (p2) and returns.
        val (uxcamClass, uxcamStart) = allMethods.single("UXCam startWithConfiguration handler") {
            it.returnType == "V" && it.params() == listOf("Ljava/util/Map;", METHOD_RESULT) &&
                it.strings().containsAll(listOf("userAppKey", "enableMultiSessionRecord", "enableCrashHandling"))
        }
        val uxLabel = "UXCam handler (${uxcamClass.type}->${uxcamStart.name})"
        val ux = uxcamStart.instructions()
        assertTrue(
            ux.getOrNull(0)?.opcode == Opcode.SGET_OBJECT &&
                ux[0].fieldRef()?.let { it.definingClass == "Ljava/lang/Boolean;" && it.name == "FALSE" } == true,
            "$uxLabel does not load Boolean.FALSE first; found ${ux.getOrNull(0)?.opcode}"
        )
        assertTrue(
            ux.getOrNull(1)?.opcode == Opcode.INVOKE_INTERFACE &&
                ux[1].methodRef()?.let { it.definingClass == METHOD_RESULT && it.params() == listOf("Ljava/lang/Object;") } == true &&
                ux[1].registers() == listOf(uxcamStart.p(2), (ux[0] as OneRegisterInstruction).registerA),
            "$uxLabel does not answer Result(p2).success(FALSE); found ${ux.getOrNull(1)?.opcode} ${ux.getOrNull(1)?.methodRef()}"
        )
        assertTrue(ux.getOrNull(2)?.opcode == Opcode.RETURN_VOID, "$uxLabel does not return after answering")

        // Disable telemetry 3: every concrete static void UXCam.start* returns at once.
        val uxcamStatics = byType.getValue(UXCAM).methods.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" && it.name.startsWith("start") && it.implementation != null
        }
        assertTrue(
            uxcamStatics.map { it.name }.containsAll(listOf("startWithConfigurationCrossPlatform", "startApplicationWithKeyForCordova", "startWithKey")),
            "UXCam lacks a start method the plugin calls: ${uxcamStatics.map { it.name }}"
        )
        uxcamStatics.forEach { assertReturnsEarlyVoid(it, "UXCam.${it.name}(${it.params().joinToString()})") }

        // Disable telemetry 4: Airship's config builder reports analytics disabled.
        assertForcedBoolean(
            byType.getValue(AIRSHIP_CONFIG_BUILDER).method("getAnalyticsEnabled", emptyList()),
            expected = false,
            label = "AirshipConfigOptions.Builder.getAnalyticsEnabled",
        )

        // Disable telemetry 5: both Branch "branchAttributionLevel" readers overwrite the argument
        // with "NONE" right after reading it.
        val branchReaders = allMethods.filter { (_, method) ->
            method.implementation != null && method.returnType == "V" && method.params().firstOrNull() == METHOD_CALL &&
                method.strings().containsAll(listOf("FlutterBranchSDK", "branchAttributionLevel"))
        }
        assertEquals(2, branchReaders.size, "Branch attribution level readers: ${branchReaders.map { "${it.first.type}->${it.second.name}" }}")
        branchReaders.forEach { (branchClass, reader) ->
            val label = "Branch reader (${branchClass.type}->${reader.name})"
            val insns = reader.instructions()
            val site = insns.indexOfFirst { it.stringRef() == "branchAttributionLevel" }
            val result = insns.getOrNull(site + 2)
            val forced = insns.getOrNull(site + 3)
            assertTrue(
                insns.getOrNull(site + 1)?.methodRef()?.definingClass == METHOD_CALL && result?.opcode == Opcode.MOVE_RESULT_OBJECT,
                "$label does not read the argument through MethodCall; found ${insns.getOrNull(site + 1)?.opcode}, ${result?.opcode}"
            )
            assertTrue(
                forced?.opcode == Opcode.CONST_STRING && forced.stringRef() == "NONE" &&
                    (forced as OneRegisterInstruction).registerA == (result as OneRegisterInstruction).registerA,
                "$label does not overwrite the read value with \"NONE\"; found ${forced?.opcode} ${forced?.stringRef()}"
            )
        }
    }
}
