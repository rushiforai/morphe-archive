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

private const val PKG = "com.guardian"
private const val OBJECT = "Ljava/lang/Object;"
private const val STRING = "Ljava/lang/String;"
private const val METERING_RETROFIT_API = "Lcom/theguardian/metering/api/RetrofitApi;"
private const val GMA = "Lcom/google/android/gms/ads/"
private const val AD_MANAGER_AD_VIEW = "${GMA}admanager/AdManagerAdView;"
private const val SWITCH_KEY = "Lcom/guardian/util/switches/RemoteSwitches\$Companion\$Key;"
private const val FIREBASE_ANALYTICS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"
private const val NATIVE_APP_SUBMISSION = "Lophan/thrift/nativeapp/NativeAppSubmission;"
private const val PUSH_RECEIVED_URL = "https://mobile-events.guardianapis.com/notification/received?platform=android"

class GuardianSmokeTest {

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

    private fun Method.strings(): List<String> = instructions().mapNotNull { it.stringRef() }

    private fun Method.calls(predicate: (MethodReference) -> Boolean): Boolean =
        instructions().any { insn -> insn.methodRef()?.let(predicate) == true }

    private fun MethodReference.parameters(): List<String> = parameterTypes.map(CharSequence::toString)

    private fun List<ClassDef>.methods(): List<Pair<ClassDef, Method>> =
        flatMap { classDef -> classDef.methods.map { classDef to it } }

    /** The class whose no-arg toString() holds a string satisfying [match] (as the patches find them). */
    private fun List<ClassDef>.byToString(label: String, match: (String) -> Boolean): ClassDef {
        val found = filter { classDef ->
            classDef.methods.any { method ->
                method.name == "toString" && method.parameterTypes.isEmpty() &&
                    method.returnType == STRING && method.strings().any(match)
            }
        }
        return found.singleOrNull() ?: error("expected one $label class, found ${found.map { it.type }}")
    }

    /** sget-object of [type]'s own static field of type [type]. */
    private fun Instruction.isSingletonLoad(type: String): Boolean =
        opcode == Opcode.SGET_OBJECT && fieldRef()?.let { it.definingClass == type && it.type == type } == true

    /** Instruction indices to code-unit addresses, to resolve branch offsets. */
    private fun List<Instruction>.addresses(): List<Int> =
        runningFold(0) { address, insn -> address + insn.codeUnits }

    @Test
    fun `Disable article limit, Disable ads and Disable telemetry short-circuit the metering, ad and tracking paths`() {
        val root = repoRoot()
        val apk = File(root, "apks/guardian/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "6.239.23439",
            patchNames = setOf("Disable article limit", "Disable ads", "Disable telemetry"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val allMethods = classes.methods()

        // The metering states, by their toString() strings.
        val none = classes.byToString("None") { it.startsWith("None(shouldTrackArticleView=") }.type
        val offlineWall = classes.byToString("OfflineWall") { it == "OfflineWall" }.type
        val signInWall = classes.byToString("SignInWall") { it == "SignInWall" }.type

        // Disable article limit 1: GetMeterApiState, the only RetrofitApi.message caller, returns
        // None(false) at entry.
        val meterCallers = allMethods.filter { (_, method) ->
            method.calls { it.definingClass == METERING_RETROFIT_API && it.name == "message" }
        }
        val (meterClass, meterApiState) = meterCallers.singleOrNull()
            ?: error("expected one RetrofitApi.message caller, found ${meterCallers.map { "${it.first.type}->${it.second.name}" }}")
        val meterLabel = "GetMeterApiState (${meterClass.type}->${meterApiState.name})"
        assertTrue(
            "Failed to get metering message for articleId: " in meterApiState.strings(),
            "$meterLabel lost its metering message log string"
        )
        assertNoneReturned(meterApiState.instructions(), 0, none, meterLabel)

        // Disable article limit 2: GetMeteringStateImpl (the only (String, ...) Object caller of
        // GetMeterApiState) returns None(false) instead of the OfflineWall, and keeps SignInWall.
        val stateCallers = allMethods.filter { (_, method) ->
            method.returnType == OBJECT && method.parameterTypes.firstOrNull()?.toString() == STRING &&
                method.calls {
                    it.definingClass == meterClass.type && it.name == meterApiState.name &&
                        it.parameters() == meterApiState.parameterTypes.map(CharSequence::toString) &&
                        it.returnType == meterApiState.returnType
                }
        }
        val (stateClass, meteringState) = stateCallers.singleOrNull()
            ?: error("expected one GetMeteringStateImpl, found ${stateCallers.map { "${it.first.type}->${it.second.name}" }}")
        val stateLabel = "GetMeteringStateImpl (${stateClass.type}->${meteringState.name})"
        val stateInsns = meteringState.instructions()
        assertTrue("sign_in_date_key" in meteringState.strings(), "$stateLabel lost its sign-in gate check")
        assertTrue(
            stateInsns.none { it.isSingletonLoad(offlineWall) },
            "$stateLabel still loads the OfflineWall ($offlineWall)"
        )
        assertTrue(
            stateInsns.any { it.isSingletonLoad(signInWall) },
            "$stateLabel no longer loads the SignInWall ($signInWall); the sign-in gate must stay"
        )
        // The patched return: new-instance None, const/4 0, invoke-direct <init>(Z), return-object.
        val replaced = stateInsns.indices.filter { index ->
            val ret = stateInsns.getOrNull(index + 3)
            stateInsns[index].opcode == Opcode.NEW_INSTANCE && stateInsns[index].typeRef() == none &&
                stateInsns.getOrNull(index + 1)?.opcode == Opcode.CONST_4 &&
                ret?.opcode == Opcode.RETURN_OBJECT
        }
        assertTrue(replaced.size == 1, "$stateLabel has ${replaced.size} patched None returns, expected one")
        assertNoneReturned(stateInsns, replaced.single(), none, stateLabel)

        // Disable ads 1: the GMA load method reports a LoadAdError to the AdManagerAdView's
        // listener and returns before any ad request.
        val loadAds = allMethods.filter { (_, method) ->
            method.returnType == "V" && method.parameterTypes.size == 2 &&
                method.parameterTypes[1].toString() == AD_MANAGER_AD_VIEW &&
                method.strings().containsAll(
                    listOf("preparing ad request: %s", "No consent given for google ads", "Forced ad failure"),
                )
        }
        val (loadAdClass, loadAd) = loadAds.singleOrNull()
            ?: error("expected one GMA load method, found ${loadAds.map { "${it.first.type}->${it.second.name}" }}")
        val adLabel = "GMA load (${loadAdClass.type}->${loadAd.name})"
        val adInsns = loadAd.instructions()
        // v-register of the AdManagerAdView (second) parameter: p0 sits after the locals, and
        // static methods have no `this`.
        val first = if (AccessFlags.STATIC.isSet(loadAd.accessFlags)) 0 else 1
        val words = loadAd.parameterTypes.map { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
        val p0Register = loadAd.implementation!!.registerCount - words.sum() - first
        val adViewRegister = p0Register + first + words[0]
        val getListener = adInsns.getOrNull(0)
        val getListenerRegister = when (getListener) {
            is RegisterRangeInstruction -> getListener.startRegister.takeIf { getListener.registerCount == 1 }
            is FiveRegisterInstruction -> getListener.registerC.takeIf { getListener.registerCount == 1 }
            else -> null
        }
        assertTrue(
            getListener?.methodRef()?.let { it.definingClass == "${GMA}BaseAdView;" && it.name == "getAdListener" } == true &&
                getListenerRegister == adViewRegister,
            "$adLabel does not start with getAdListener() on the AdManagerAdView (v$adViewRegister); " +
                "found ${getListener?.opcode} ${getListener?.methodRef()}"
        )
        val listener = (adInsns.getOrNull(1) as? OneRegisterInstruction)?.registerA
        assertTrue(
            adInsns.getOrNull(1)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
                adInsns.getOrNull(2)?.opcode == Opcode.IF_EQZ &&
                (adInsns[2] as OneRegisterInstruction).registerA == listener,
            "$adLabel does not null-check the listener; found ${adInsns.getOrNull(1)?.opcode}, ${adInsns.getOrNull(2)?.opcode}"
        )
        val failIndex = adInsns.indexOfFirst {
            it.methodRef()?.let { ref -> ref.definingClass == "${GMA}AdListener;" && ref.name == "onAdFailedToLoad" } == true
        }
        val errorInit = adInsns.getOrNull(failIndex - 1)?.methodRef()
        assertTrue(
            failIndex in 3..12 && (adInsns[failIndex] as FiveRegisterInstruction).registerC == listener &&
                errorInit?.definingClass == "${GMA}LoadAdError;" && errorInit.name == "<init>",
            "$adLabel does not report a new LoadAdError to onAdFailedToLoad in its prologue (index $failIndex)"
        )
        val returnIndex = failIndex + 1
        assertTrue(
            adInsns.getOrNull(returnIndex)?.opcode == Opcode.RETURN_VOID,
            "$adLabel does not return after onAdFailedToLoad; found ${adInsns.getOrNull(returnIndex)?.opcode}"
        )
        val addresses = adInsns.addresses()
        assertTrue(
            addresses[2] + (adInsns[2] as OffsetInstruction).codeOffset == addresses[returnIndex],
            "$adLabel: the null-listener branch does not jump to the prologue's return-void"
        )

        // Disable ads 2: ShouldLoadAds (no-arg Z reading a RemoteSwitches key and isPremium())
        // answers false.
        val shouldLoadAds = allMethods.filter { (_, method) ->
            method.returnType == "Z" && method.parameterTypes.isEmpty() &&
                method.instructions().any { it.opcode == Opcode.SGET_OBJECT && it.fieldRef()?.type == SWITCH_KEY } &&
                method.calls { it.name == "isPremium" && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        }
        val (shouldLoadAdsClass, shouldLoadAdsMethod) = shouldLoadAds.singleOrNull()
            ?: error("expected one ShouldLoadAds, found ${shouldLoadAds.map { "${it.first.type}->${it.second.name}" }}")
        assertForcedBoolean(
            shouldLoadAdsMethod,
            expected = false,
            label = "ShouldLoadAds (${shouldLoadAdsClass.type}->${shouldLoadAdsMethod.name})",
        )

        // Disable telemetry 1: the manifest deactivates Firebase Analytics; the stock
        // collection_enabled=false switch is kept.
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
        assertEquals(
            listOf("true"),
            metaData["firebase_analytics_collection_deactivated"],
            "meta-data firebase_analytics_collection_deactivated",
        )
        assertEquals(
            listOf("false"),
            metaData["firebase_analytics_collection_enabled"],
            "meta-data firebase_analytics_collection_enabled must stay as shipped",
        )

        // Disable telemetry 2: SdkManager's gate (the (Sdk)Z method reading the Sdk's remote switch
        // key and isPremium()) answers false. The other (Sdk)Z method, the consent check, still
        // runs its Sourcepoint lookup.
        val sdk = classes.byToString("Sdk") { it.startsWith("Sdk(remoteSwitchKey=") }.type
        val sdkChecks = allMethods.filter { (_, method) ->
            method.returnType == "Z" && method.implementation != null &&
                method.parameterTypes.map(CharSequence::toString) == listOf(sdk)
        }
        val (gates, consentChecks) = sdkChecks.partition { (_, method) ->
            method.instructions().any { it.fieldRef()?.let { ref -> ref.definingClass == sdk && ref.type == SWITCH_KEY } == true } &&
                method.calls { it.name == "isPremium" && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        }
        val (gateClass, gate) = gates.singleOrNull()
            ?: error("expected one SdkManager gate, found ${gates.map { "${it.first.type}->${it.second.name}" }}")
        assertForcedBoolean(gate, expected = false, label = "SdkManager gate (${gateClass.type}->${gate.name})")
        assertTrue(
            consentChecks.size == 1 && consentChecks.single().second.instructions().first().opcode != Opcode.CONST_4 &&
                consentChecks.single().second.calls { it.definingClass == "Lcom/sourcepoint/cmplibrary/util/SpUtils;" },
            "the consent check must be the other (Sdk)Z method and stay unpatched; found " +
                consentChecks.map { "${it.first.type}->${it.second.name}" }
        )

        // Disable telemetry 3: the Ophan uploader returns at once.
        val ophan = allMethods.filter { (_, method) ->
            method.returnType == "V" && method.implementation != null &&
                method.parameterTypes.map(CharSequence::toString) == listOf(NATIVE_APP_SUBMISSION) &&
                // The fingerprint matches the endpoint by prefix and the message exactly.
                method.strings().any { it.startsWith("https://ophan.theguardian.com/mob") } &&
                "Ophan submission failed" in method.strings()
        }
        val (ophanClass, ophanSubmit) = ophan.singleOrNull()
            ?: error("expected one Ophan uploader, found ${ophan.map { "${it.first.type}->${it.second.name}" }}")
        assertReturnsEarlyVoid(ophanSubmit, "Ophan uploader (${ophanClass.type}->${ophanSubmit.name})")

        // Disable telemetry 4: FirebaseAnalytics' only instance (Z)V loads false into p1 first and
        // its only (Bundle, String)V (logEvent) returns at once.
        val analytics = classes.singleOrNull { it.type == FIREBASE_ANALYTICS }
            ?: error("$FIREBASE_ANALYTICS not found in the emitted dexes")
        assertCollectionForcedOff(analytics, "FirebaseAnalytics.setAnalyticsCollectionEnabled")
        assertReturnsEarlyVoid(
            analytics.singleVoid(listOf("Landroid/os/Bundle;", STRING), "FirebaseAnalytics.logEvent"),
            "FirebaseAnalytics.logEvent(Bundle, String)",
        )

        // Disable telemetry 5: Crashlytics (the class whose static no-arg getInstance returns
        // itself and holds "FirebaseCrashlytics component is not present.") gets the same two hooks.
        val crashlyticsClasses = classes.filter { classDef ->
            classDef.methods.any { method ->
                AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.isEmpty() &&
                    method.returnType == classDef.type &&
                    "FirebaseCrashlytics component is not present." in method.strings()
            }
        }
        val crashlytics = crashlyticsClasses.singleOrNull()
            ?: error("expected one FirebaseCrashlytics class, found ${crashlyticsClasses.map { it.type }}")
        assertCollectionForcedOff(crashlytics, "FirebaseCrashlytics.setCrashlyticsCollectionEnabled (${crashlytics.type})")
        assertReturnsEarlyVoid(
            crashlytics.singleVoid(listOf(STRING), "FirebaseCrashlytics.log"),
            "FirebaseCrashlytics.log(String) (${crashlytics.type})",
        )

        // Disable telemetry 6: the push "received" beacon returns Boolean.FALSE before its request.
        val beacons = allMethods.filter { (_, method) ->
            method.returnType == OBJECT && method.parameterTypes.map(CharSequence::toString) == listOf(OBJECT) &&
                PUSH_RECEIVED_URL in method.strings()
        }
        val (beaconClass, beacon) = beacons.singleOrNull()
            ?: error("expected one push received beacon, found ${beacons.map { "${it.first.type}->${it.second.name}" }}")
        val beaconLabel = "push received beacon (${beaconClass.type}->${beacon.name})"
        val load = beacon.instructions().getOrNull(0)
        val ret = beacon.instructions().getOrNull(1)
        assertTrue(
            load?.opcode == Opcode.SGET_OBJECT &&
                load.fieldRef()?.let { it.definingClass == "Ljava/lang/Boolean;" && it.name == "FALSE" } == true,
            "$beaconLabel does not load Boolean.FALSE first; found ${load?.opcode} ${load?.fieldRef()}"
        )
        assertTrue(
            ret?.opcode == Opcode.RETURN_OBJECT &&
                (ret as OneRegisterInstruction).registerA == (load as OneRegisterInstruction).registerA,
            "$beaconLabel does not return the Boolean.FALSE it loaded; found ${ret?.opcode}"
        )
    }

    /** The class's single concrete instance method returning V with exactly [parameters]. */
    private fun ClassDef.singleVoid(parameters: List<String>, label: String): Method {
        val found = methods.filter { method ->
            !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                method.implementation != null && method.parameterTypes.map(CharSequence::toString) == parameters
        }
        return found.singleOrNull() ?: error("expected one $label, found ${found.map { it.name }}")
    }

    /** Asserts the class's only instance (Z)V starts with `const/4 p1, 0x0`. */
    private fun assertCollectionForcedOff(classDef: ClassDef, label: String) {
        val method = classDef.singleVoid(listOf("Z"), label)
        val first = method.instructions().firstOrNull()
        // p1 is the last register of an instance method with one single-word parameter.
        val p1 = method.implementation!!.registerCount - 1
        assertTrue(
            first is NarrowLiteralInstruction && first.opcode == Opcode.CONST_4 && first.narrowLiteral == 0 &&
                (first as OneRegisterInstruction).registerA == p1,
            "$label does not load false into p1 (v$p1) first; found ${first?.opcode}"
        )
    }

    /**
     * Asserts `new-instance vR, None; const/4 vT, 0x0; invoke-direct {vR, vT}, None-><init>(Z)V;
     * return-object vR` starting at [start].
     */
    private fun assertNoneReturned(insns: List<Instruction>, start: Int, none: String, label: String) {
        val create = insns.getOrNull(start)
        val flag = insns.getOrNull(start + 1)
        val init = insns.getOrNull(start + 2)
        val ret = insns.getOrNull(start + 3)
        assertTrue(
            create?.opcode == Opcode.NEW_INSTANCE && create.typeRef() == none,
            "$label does not create $none at $start; found ${create?.opcode}"
        )
        val register = (create as OneRegisterInstruction).registerA
        assertTrue(
            flag is NarrowLiteralInstruction && flag.opcode == Opcode.CONST_4 && flag.narrowLiteral == 0,
            "$label does not load false for shouldTrackArticleView; found ${flag?.opcode}"
        )
        val flagRegister = (flag as OneRegisterInstruction).registerA
        val initRef = init?.methodRef()
        assertTrue(
            init?.opcode == Opcode.INVOKE_DIRECT && initRef?.definingClass == none && initRef.name == "<init>" &&
                initRef.parameters() == listOf("Z") &&
                (init as FiveRegisterInstruction).registerC == register && init.registerD == flagRegister,
            "$label does not construct $none(false); found ${init?.opcode} $initRef"
        )
        assertTrue(
            ret?.opcode == Opcode.RETURN_OBJECT && (ret as OneRegisterInstruction).registerA == register,
            "$label does not return the None; found ${ret?.opcode}"
        )
    }
}
