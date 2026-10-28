package app.template.patches.mxplayer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/**
 * Ground-up native & manifest patch for MX Player 3.4.1 (2001003551) standalone APKs:
 *
 * 1. Disarms `libmx-bh.so` across both `arm64-v8a` and `armeabi-v7a` while preserving genuine
 *    RSA/whitebox key initialization AND zero-CPU `waitForApkDetectInitialDone()` synchronization:
 *    - `BH.d(App)` (`BH_n -> ApkDetect_init`) runs untouched in `Application.onCreate()`, allocating
 *      `g_apkDetectPtr` (`0x710f0` ARM64 / `0x54c68` ARM32), setting `g_apkDetectStarted = 1`
 *      (`0x710f8` ARM64 / `0x54c64` ARM32), and starting the `ApkDetect` init worker thread.
 *    - Inside `ApkDetect::run()` (`0x31550` ARM64 / `0x1cc68` ARM32):
 *        * Unpacks `g_apkDetectPtr`'s internal strings (`0x70`, `0x88`, `0xa0`) and decodes `BH.d`'s
 *          hex configuration blob into the RSA/whitebox key material (`0x3f154` / `0x2b41c`).
 *        * Skips APK certificate check #1 (`0x31a1c -> 0x31cc8` ARM64 / `0x1d188 -> 0x1d2d8` ARM32)
 *          and executes `0x377e8` (ARM64) / `0x236a0` (ARM32) so `.bss [0x713a8]` & `[0x713b0]`
 *          (the RSA/whitebox keys required by `AG.g` / `AS.e`) are genuinely allocated and initialized
 *          — preventing the Home-screen `SIGSEGV` that occurs if `AG.g` runs with null key pointers.
 *        * Frees temporary unpacking buffers (`0x3d7a8` + `0x374a8` ARM64 / `0x29c54` + `0x23420` ARM32),
 *          stores `g_apkDetectInitialDone = 1` (`0x713a0` ARM64 / `0x54f30` ARM32) with release barrier
 *          semantics so `waitForApkDetectInitialDone()` (`0x35a48` / `0x21840`) never spins at 100% CPU,
 *          and returns cleanly through `threadWrapper` (`DetachCurrentThread()`) in ~1 ms with zero
 *          lingering background thread and zero anti-tamper re-checks.
 *    - Forces `g_apkDetectStarted` (`0x35a5c` / `0x21860`) and `isApkZipCheckDone` (`0x35bb4` / `0x21a98`)
 *      to return `1`, synthesizes clean `[100..255]` check bytes in `buildBhSecurityPayload` (`0x35ae4` /
 *      `0x21884`), and neutralizes the `0x0bdc0000` `operator delete` crash-bomb (`0x3491c` / `0x20658`).
 * 2. Cleans `AndroidManifest.xml` without breaking Firebase `ComponentRegistrar`, AdMob `APPLICATION_ID`, or
 *    Amazon `MAPClient` startup invariants, removes OTT deep links from `ActivityWelcomeMX`, and removes Meta's
 *    unused `assets/audience_network.dex` payload.
 */
internal val nativeAndManifestPatch = resourcePatch {
    execute {
        // 1. Patch `lib/armeabi-v7a/libmx-bh.so` and `lib/arm64-v8a/libmx-bh.so` (MX Player 3.4.1).
        val libEntries = listApkEntries("lib/").toSet()
        var patchedAbis = 0

        val arm32Path = "lib/armeabi-v7a/libmx-bh.so"
        if (arm32Path in libEntries) {
            val file = get(arm32Path, true)
            val data = file.readBytes()

            // (a) ApkDetect thread entry (0x1ca38..0x1ca44): tail-call `b #0x1cc68` (`ApkDetect::run`)
            //     so returning from `ApkDetect::run` returns directly to `threadWrapper`
            //     (`JavaVM->DetachCurrentThread()`) instead of falling into `ApkDetect::~ApkDetect`.
            data.patchUniqueWindow(
                description = "armeabi-v7a ApkDetect thread entry tail-call",
                expected = hexBytes("00482de90db0a0e1880000eb"),
                edits = listOf(
                    0 to hexBytes("8a0000ea00f020e300f020e3"),
                ),
            )

            // (b) ApkDetect::run (0x1d184..0x1d194): skip APK signature check #1 (`0x1d188..0x1d2d4`)
            //     and jump directly to `0x1d2d8` where `0x236a0` initializes the RSA/whitebox keys
            //     required by `AG.g` / `AS.e` and destroys temporary unpacking buffers (`0x29c54`, `0x23420`).
            data.patchUniqueWindow(
                description = "armeabi-v7a ApkDetect skip cert check to RSA key init",
                expected = hexBytes("583800eb18409de538508de220008de5"),
                edits = listOf(
                    4 to hexBytes("0000a0e314008de5500000ea"),
                ),
            )

            // (c) ApkDetect::run post-key-init exit (0x1d2f0..0x1d320): right after `bl #0x23420`,
            //     set `g_apkDetectInitialDone = 1` (`0x54f30` via PC-relative `movw`/`movt` + `dmb ish`)
            //     to unblock `waitForApkDetectInitialDone()`, unwind stack (`+0x188`, `vpop {d8,d9}`, `+4`),
            //     and `pop {r4..fp, pc}` so the worker thread detaches and exits cleanly in ~1 ms.
            data.patchUniqueWindow(
                description = "armeabi-v7a ApkDetect post-key-init clean exit",
                expected = hexBytes(
                    "4a1800eb5bf07ff520009de5020050e3140f9fe500008fe0" +
                        "6000001a0010a0e3001080e55bf07ff5df0c00eb020050e3",
                ),
                edits = listOf(
                    4 to hexBytes(
                        "2c0c07e3030040e300008fe00110a0e35bf07ff5001080e5" +
                            "5bf07ff562df8de2048bbdec04d08de2f08fbde8",
                    ),
                ),
            )

            // (d) Guard getter (0x21860..0x21870) called by `bh_nn_3..6` (`libmxvp.so` MediaScanner)
            //     and `BH_n1`: `mov r0, #1; bx lr`.
            data.patchUniqueWindow(
                description = "armeabi-v7a g_apkDetectStarted guard getter",
                expected = hexBytes("08009fe500008fe00000d0e51eff2fe1"),
                edits = listOf(
                    0 to hexBytes("0100a0e31eff2fe1"),
                ),
            )

            // (e) Bypass `isApkZipCheckDone()` (0x21a98..0x21ab8 -> `mov r0, #1; bx lr`) so `AG.g`
            //     and `AG.d` never signal `g_apkDetectPtr`'s condition variable after thread exit.
            data.patchUniqueWindow(
                description = "armeabi-v7a isApkZipCheckDone check",
                expected = hexBytes("18009fe500008fe0000090e55bf07ff5010040e2100f6fe1a002a0e11eff2fe1"),
                edits = listOf(
                    0 to hexBytes("0100a0e31eff2fe100f020e300f020e300f020e300f020e300f020e300f020e3"),
                ),
            )

            // (f) Synthesize clean post-ApkDetect check values (`[100..255]`) in `buildBhSecurityPayload`
            //     (0x21884..0x218e0 -> `b #0x21978`) so signed `X-BH` tokens pass server validation.
            data.patchUniqueWindow(
                description = "armeabi-v7a buildBhSecurityPayload clean token bytes",
                expected = hexBytes(
                    "d0019fe5d0119fe500008fe0cc219fe501108fe0000090e502208fe020008de5" +
                        "bc019fe55bf07ff5001091e51c108de500008fe0ac119fe55bf07ff5002092e5" +
                        "18208de501108fe09c219fe55bf07ff5000090e510008de502208fe0",
                ),
                edits = listOf(
                    0 to hexBytes(
                        "8900a0e314008de59500a0e320008de5a300a0e31c008de5ac00a0e318008de5" +
                            "b500a0e310008de5c200a0e30c008de5cd00a0e308008de5d500a0e304008de5" +
                            "dd00a0e300008de5e570a0e3ec80a0e3f290a0e3f860a0e3250000ea",
                    ),
                ),
            )

            // (g) Defense-in-depth: disarm crash-bomb `0x20658` (`bx lr`).
            data.patchUniqueWindow(
                description = "armeabi-v7a crash-bomb disarm",
                expected = hexBytes("104c2de908b08de20040a0e105af00eb000054e30600000a"),
                edits = listOf(0 to hexBytes("1eff2fe1")),
            )

            file.writeBytes(data)
            patchedAbis++
        }

        val arm64Path = "lib/arm64-v8a/libmx-bh.so"
        if (arm64Path in libEntries) {
            val file = get(arm64Path, true)
            val data = file.readBytes()

            // (a) ApkDetect thread entry (0x312dc..0x312e8): tail-call `b #0x31550` (`ApkDetect::run`)
            //     so returning from `ApkDetect::run` returns directly to `threadWrapper` (`0x2f794`
            //     `JavaVM->DetachCurrentThread()`) instead of falling into `ApkDetect::~ApkDetect`.
            data.patchUniqueWindow(
                description = "arm64-v8a ApkDetect thread entry tail-call",
                expected = hexBytes("fd7bbfa9fd0300919b000094"),
                edits = listOf(
                    0 to hexBytes("9d0000141f2003d51f2003d5"),
                ),
            )

            // (b) ApkDetect::run (0x31a18..0x31a28): skip APK signature check #1 (`0x31a1c..0x31cc4`)
            //     and jump directly to `0x31cc8` where `0x377e8` allocates & populates `.bss [0x713a8]`
            //     and `[0x713b0]` (the RSA/whitebox keys dereferenced by `AG.g` / `AS.e`) and cleans up
            //     temporary unpacking buffers (`0x3d7a8`, `0x374a8`).
            data.patchUniqueWindow(
                description = "arm64-v8a ApkDetect skip cert check to RSA key init",
                expected = hexBytes("f903002aa0c301d1e1031caa86310094"),
                edits = listOf(
                    4 to hexBytes("16008052aa000014"),
                ),
            )

            // (c) ApkDetect::run post-key-init exit (0x31ce4..0x31d14): right after `bl #0x374a8`,
            //     store `g_apkDetectInitialDone = 1` (`stlr w8, [0x713a0]`) so `waitForApkDetectInitialDone()`
            //     (`0x35a48`) unblocks cleanly with zero spin, unwind the `0x230` + `0x60` stack frame,
            //     and `ret` to `threadWrapper` (`DetachCurrentThread()`) in ~1 ms.
            data.patchUniqueWindow(
                description = "arm64-v8a ApkDetect post-key-init clean exit",
                expected = hexBytes(
                    "f11500943f0b00711f2003d5a8a11f10410c00541ffd9f88" +
                        "1a0b00941f080071e10d0054e00317aa77fdff97e00317aa",
                ),
                edits = listOf(
                    4 to hexBytes(
                        "28008052a9b51f1028fd9f88ffc30891f44f45a9f65744a9" +
                            "f85f43a9fa6742a9fc6f41a9fd7bc6a8c0035fd6",
                    ),
                ),
            )

            // (d) Guard getter (0x35a5c..0x35a68) called by `bh_nn_3..6` (`libmxvp.so` MediaScanner)
            //     and `BH_n1`: `mov w0, #1; ret`.
            data.patchUniqueWindow(
                description = "arm64-v8a g_apkDetectStarted guard getter",
                expected = hexBytes("e801009000e14339c0035fd6"),
                edits = listOf(
                    0 to hexBytes("20008052c0035fd6"),
                ),
            )

            // (e) Bypass `isApkZipCheckDone()` (0x35bb4..0x35bcc -> `mov w0, #1; ret`) so `AG.g`
            //     and `AG.d` never signal `g_apkDetectPtr`'s condition variable after thread exit.
            data.patchUniqueWindow(
                description = "arm64-v8a isApkZipCheckDone check",
                expected = hexBytes("1f2003d568ab1d1008fddf881f050071e0179f1ac0035fd6"),
                edits = listOf(
                    0 to hexBytes("20008052c0035fd61f2003d51f2003d51f2003d51f2003d5"),
                ),
            )

            // (f) Synthesize clean post-ApkDetect check values (`[100..255]`) in `buildBhSecurityPayload`
            //     (0x35ae4..0x35b18: 13 `ldar` -> 13 `mov wReg, #cleanVal`) for valid `X-BH` tokens.
            data.patchUniqueWindow(
                description = "arm64-v8a buildBhSecurityPayload clean token bytes",
                expected = hexBytes(
                    "08fddf8829fddf884afddf886bfddf888cfddf88adfddf88cefddf88effddf88" +
                        "10fedf8831fedf8800fcdf8821fcdf8842fcdf88",
                ),
                edits = listOf(
                    0 to hexBytes(
                        "a8128052691480528a158052ab1680524c1880522d118052ae198052af1a8052" +
                            "b01b8052b11c8052801d8052411e8052021f8052",
                    ),
                ),
            )

            // (g) Defense-in-depth: disarm crash-bomb `0x3491c` (`ret`).
            data.patchUniqueWindow(
                description = "arm64-v8a crash-bomb disarm",
                expected = hexBytes("fd7bbea9f30b00f9fd030091f30300aa89a70094f30000b4"),
                edits = listOf(0 to hexBytes("c0035fd6")),
            )

            file.writeBytes(data)
            patchedAbis++
        }

        if (patchedAbis == 0) {
            throw PatchException(
                "Neither arm64-v8a nor armeabi-v7a libmx-bh.so was found. " +
                    "Ensure you are patching a standalone MX Player 3.4.1 (2001003551) APK.",
            )
        }

        // 2. Harden AndroidManifest.xml safely.
        document("AndroidManifest.xml").use { doc ->
            val root = doc.documentElement
            val pkg = root.getAttribute("package").ifEmpty { "com.mxtech.videoplayer.ad" }

            root.removeAndroidAttribute("sharedUserId")
            root.removeAndroidAttribute("sharedUserMaxSdkVersion")

            val unwantedPermissions = setOf(
                "com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_TOPICS",
                "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
                "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
                "com.dti.folderlauncher.permission.BIND_APPHUB_SERVICE",
                "com.google.android.c2dm.permission.RECEIVE",
                "$pkg.permission.C2D_MESSAGE",
            )
            doc.removeNodesByAndroidName("uses-permission", unwantedPermissions)
            doc.removeNodesByAndroidName("permission", unwantedPermissions)
            doc.removeNodesByAndroidName("uses-library", setOf("android.ext.adservices"))

            val disabledSdkPrefixes = listOf(
                "com.google.android.gms.ads.",
                "com.applovin.",
                "com.vungle.",
                "com.facebook.ads.",
                "com.facebook.internal.FacebookInitProvider",
                "com.inmobi.",
                "com.fyber.inneractive.",
                "com.mbridge.msdk.",
                "com.bytedance.sdk.openadsdk.",
                "com.ironsource.",
                "com.unity3d.services.ads.",
                "com.unity3d.ads.",
                "com.chartboost.",
                "com.pubmatic.",
                "sg.bigo.ads.",
                "com.clevertap.android.sdk.",
                "com.google.firebase.messaging.",
                "com.google.android.gms.measurement.",
            )

            // Disable third-party ad/tracker/push ContentProviders, Activities, Services, and Receivers
            // while keeping FirebaseInitProvider / ComponentDiscoveryService and Amazon MAP providers intact.
            for (tag in listOf("provider", "activity", "service", "receiver")) {
                val nodes = doc.getElementsByTagName(tag)
                for (i in 0 until nodes.length) {
                    val el = nodes.item(i) as? Element ?: continue
                    val name = el.androidName()
                    if (tag == "provider" &&
                        (name.contains("MapInformationProvider") || name.contains("CrossAppContextProvider"))
                    ) {
                        el.setAndroidAttribute("exported", "false")
                        continue
                    }
                    if (disabledSdkPrefixes.any(name::startsWith)) {
                        el.setAndroidAttribute("enabled", "false")
                        el.setAndroidAttribute("exported", "false")
                    }
                }
            }

            // Set privacy/analytics opt-out flags on <application> while preserving existing meta-data.
            val appEl = doc.getElementsByTagName("application").item(0) as? Element
            appEl?.upsertMetaData(
                doc,
                mapOf(
                    "firebase_analytics_collection_deactivated" to "true",
                    "google_analytics_adid_collection_enabled" to "false",
                    "google_analytics_ssaid_collection_enabled" to "false",
                    "google_analytics_default_allow_ad_personalization_signals" to "false",
                    "firebase_messaging_auto_init_enabled" to "false",
                    "com.google.android.gms.ads.flag.OPTIMIZE_INITIALIZATION" to "true",
                    "com.google.android.gms.ads.flag.OPTIMIZE_AD_LOADING" to "true",
                ),
            )

            // Strip mxplay / mxplayer.in OTT web/app-link intent-filters from ActivityWelcomeMX
            // while keeping its MAIN / LAUNCHER intent-filter intact.
            doc.stripWelcomeDeepLinks()
        }

        // 3. Remove unused 5 MB Meta Audience Network dynamic payload if present.
        val assetsEntries = listApkEntries("assets/").toSet()
        if ("assets/audience_network.dex" in assetsEntries) {
            delete("assets/audience_network.dex")
        }
    }
}

private fun hexBytes(hex: String): ByteArray {
    require(hex.length % 2 == 0) { "Hex string must have even length" }
    return ByteArray(hex.length / 2) { idx ->
        hex.substring(idx * 2, idx * 2 + 2).toInt(16).toByte()
    }
}

private fun ByteArray.patchUniqueWindow(
    description: String,
    expected: ByteArray,
    edits: List<Pair<Int, ByteArray>>,
) {
    var matchIndex = -1
    val limit = size - expected.size
    outer@ for (i in 0..limit) {
        for (j in expected.indices) {
            if (this[i + j] != expected[j]) continue@outer
        }
        if (matchIndex != -1) {
            throw PatchException("Multiple matches for $description in libmx-bh.so ($matchIndex and $i)")
        }
        matchIndex = i
    }
    if (matchIndex == -1) {
        throw PatchException("Pattern not found for $description in libmx-bh.so")
    }
    for ((offset, patch) in edits) {
        System.arraycopy(patch, 0, this, matchIndex + offset, patch.size)
    }
}

private fun Element.androidName(): String =
    getAttributeNS(ANDROID_NS, "name").ifEmpty { getAttribute("android:name") }

private fun Element.setAndroidAttribute(localName: String, value: String) {
    if (hasAttribute("android:$localName")) {
        setAttribute("android:$localName", value)
    } else {
        setAttributeNS(ANDROID_NS, "android:$localName", value)
    }
}

private fun Element.removeAndroidAttribute(localName: String) {
    if (hasAttributeNS(ANDROID_NS, localName)) removeAttributeNS(ANDROID_NS, localName)
    if (hasAttribute("android:$localName")) removeAttribute("android:$localName")
}

private fun Document.removeNodesByAndroidName(tagName: String, names: Set<String>) {
    val nodes = getElementsByTagName(tagName)
    val matching = ArrayList<Element>()
    for (i in 0 until nodes.length) {
        val el = nodes.item(i) as? Element ?: continue
        if (el.androidName() in names) matching.add(el)
    }
    for (el in matching) el.parentNode?.removeChild(el)
}

private fun Element.upsertMetaData(doc: Document, entries: Map<String, String>) {
    val seen = HashSet<String>()
    val children = childNodes
    for (i in 0 until children.length) {
        val child = children.item(i) as? Element ?: continue
        if (child.tagName != "meta-data") continue
        val key = child.androidName()
        val desired = entries[key] ?: continue
        child.removeAndroidAttribute("resource")
        child.setAndroidAttribute("value", desired)
        seen.add(key)
    }
    for ((key, desired) in entries) {
        if (key in seen) continue
        val meta = doc.createElement("meta-data")
        meta.setAttributeNS(ANDROID_NS, "android:name", key)
        meta.setAttributeNS(ANDROID_NS, "android:value", desired)
        appendChild(meta)
    }
}

private fun Document.stripWelcomeDeepLinks() {
    val activities = getElementsByTagName("activity")
    for (i in 0 until activities.length) {
        val activity = activities.item(i) as? Element ?: continue
        if (!activity.androidName().endsWith("ActivityWelcomeMX")) continue
        val toRemove = ArrayList<Element>()
        val children = activity.childNodes
        for (j in 0 until children.length) {
            val child = children.item(j) as? Element ?: continue
            if (child.tagName == "intent-filter" && child.getElementsByTagName("data").length > 0) {
                toRemove.add(child)
            }
        }
        for (filter in toRemove) activity.removeChild(filter)
    }
}

/**
 * Shared unnamed integrity & manifest core patch depended on by all 4 MX Player patch cards so
 * any subset of selected cards in Morphe Manager always disarms `libmx-bh.so`, `BH.c`, and
 * `FirebaseExceptionHandler` cleanly once per session.
 */
internal val mxIntegrityCorePatch = bytecodePatch {
    dependsOn(nativeAndManifestPatch)

    execute {
        val bhClass = BhClinitFingerprint.classDef
        bhClass.returnBoolean(
            bhClass.requireMethod("c", "Z", listOf("Landroid/content/Context;")),
            false,
        )

        // Disarm `SuspectChecker.java` (`Const.e()` `Signature.hashCode() == 723508793` check) so
        // `PackageManager.getPackageInfo(..., GET_SIGNATURES)` is skipped and `X-MX-Timestamp`
        // always carries genuine stock-signature trailing digits (`{0, 2, 5, 6, 9}`).
        val constClass = ConstClinitFingerprint.classDef
        val signHeaderMethod = constClass.methods.firstOrNull { method ->
            method.implementation?.instructions?.any { insn ->
                insn is NarrowLiteralInstruction && insn.narrowLiteral == 723508793
            } == true
        } ?: throw PatchException("Failed to locate signature-hash header method on ${constClass.type}")

        val suspectCheckerTypes = signHeaderMethod.instructions
            .filter { it.opcode == Opcode.SPUT_BOOLEAN }
            .mapNotNull { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.definingClass }
            .distinct()
        if (suspectCheckerTypes.size != 1) {
            throw PatchException("Expected exactly 1 SuspectChecker holder class, got: $suspectCheckerTypes")
        }

        val suspectClass = mutableClassDefBy(suspectCheckerTypes.single())
        val boolFields = suspectClass.staticFields.filter { it.type == "Z" }.toList()
        if (boolFields.size != 2) {
            throw PatchException("Expected 2 boolean flags on ${suspectClass.type}, got ${boolFields.size}")
        }
        val setTrueSmali = buildString {
            appendLine("const/4 v0, 0x1")
            for (field in boolFields) {
                appendLine("sput-boolean v0, ${suspectClass.type}->${field.name}:Z")
            }
        }.trimIndent()

        val existingClinit = suspectClass.methods.firstOrNull { it.name == "<clinit>" && it.parameterTypes.isEmpty() }
        if (existingClinit != null) {
            suspectClass.wrapWithPrivateOrig(existingClinit, localRegisters = 1) { origName ->
                """
                    invoke-static {}, ${suspectClass.type}->$origName()V
                    $setTrueSmali
                    return-void
                """
            }
        } else {
            val clinit = ImmutableMethod(
                suspectClass.type,
                "<clinit>",
                emptyList(),
                "V",
                AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value,
                emptySet(),
                emptySet(),
                MutableMethodImplementation(1),
            ).toMutable()
            clinit.addInstructions(0, "$setTrueSmali\nreturn-void")
            suspectClass.methods.add(clinit)
        }

        val crashClass = FirebaseExceptionRecordFingerprint.classDef
        crashClass.returnVoid(FirebaseExceptionRecordFingerprint.method)
    }
}
