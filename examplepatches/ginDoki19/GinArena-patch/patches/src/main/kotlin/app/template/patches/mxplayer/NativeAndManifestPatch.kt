package app.template.patches.mxplayer

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/**
 * Ground-up native & manifest patch for MX Player 3.4.1 / 3.4.0 / 3.3.1 standalone APKs:
 *
 * 1. Disarms `libmx-bh.so` across both `armeabi-v7a` and `arm64-v8a` WITHOUT NOP'ing `BH_n -> ApkDetect_init`:
 *    - `BH_n` executes `ApkDetect_init` completely so `g_apkDetectStarted = 1` (`0x54c64` ARM32 / `0x710f8` ARM64)
 *      and `g_apkDetectPtr` (`0x54c68` ARM32 / `0x710f0` ARM64: `expectedSig`, `std::mutex`, `std::condition_variable`,
 *      and clean `0` `.bss` tamper ints) are validly constructed, preventing both:
 *        (a) the post-folder-scan `SIGABRT` (`operator delete(ptr + 0x0bdc0000)`) triggered when `libmxvp.so`
 *            (`MediaScanner`) calls `bh_nn_5` / `bh_nn_6` while `g_apkDetectStarted == 0`, and
 *        (b) `SIGSEGV` null-pointer dereferences of `g_apkDetectPtr` inside `AG` / `AS_e` (`0x21874` ARM32 /
 *            `0x35a68` & `0x35bcc` ARM64).
 *    - Neutralizes only the tail `ApkDetect` worker-thread allocation & `pthread_create` call at the end of
 *      `ApkDetect_init`, forces the `g_apkDetectStarted` guard getter (`0x21860` ARM32 / `0x35a5c` ARM64) to
 *      return `1` unconditionally (even before `BH_n` runs), and patches `ApkDetect::doDetect` + `_parseSignerHash`
 *      as defense-in-depth.
 * 2. Cleans `AndroidManifest.xml` without breaking Firebase `ComponentRegistrar`, AdMob `APPLICATION_ID`, or
 *    Amazon `MAPClient` startup invariants, removes OTT deep links from `ActivityWelcomeMX`, and removes Meta's
 *    unused `assets/audience_network.dex` payload.
 */
internal val nativeAndManifestPatch = resourcePatch {
    execute {
        // 1. Patch `lib/armeabi-v7a/libmx-bh.so` and `lib/arm64-v8a/libmx-bh.so`.
        val libEntries = listApkEntries("lib/").toSet()
        var patchedAbis = 0

        val arm32Path = "lib/armeabi-v7a/libmx-bh.so"
        if (arm32Path in libEntries) {
            val file = get(arm32Path, true)
            val data = file.readBytes()

            // (a) ApkDetect_init tail (0x1ca08..0x1ca20): replace `bl operator new` (+0) and
            //     `bl spawnThread` (+16) with `mov r0, #0` so `g_apkDetectPtr->thread = NULL` and no
            //     background tamper thread is ever created while `g_apkDetectPtr` & `g_apkDetectStarted`
            //     stay fully initialized.
            data.patchUniqueWindow(
                description = "armeabi-v7a ApkDetect_init worker-thread spawn",
                expected = hexBytes("20be00eb20109fe50420a0e101108fe061f8ffeb000084e5"),
                edits = listOf(
                    0 to hexBytes("0000a0e3"),  // mov r0, #0
                    16 to hexBytes("0000a0e3"), // mov r0, #0
                ),
            )

            // (b) Guard getter (0x21860..0x21870) called by `bh_nn_3..6` (`libmxvp.so` MediaScanner)
            //     and `BH_n1`: `mov r0, #1; bx lr`.
            data.patchUniqueWindow(
                description = "armeabi-v7a g_apkDetectStarted guard getter",
                expected = hexBytes("08009fe500008fe00000d0e51eff2fe1"),
                edits = listOf(
                    0 to hexBytes("0100a0e31eff2fe1"), // mov r0, #1; bx lr
                ),
            )

            // (c) Defense-in-depth: ApkDetect::doDetect & _parseSignerHash.
            data.patchUniqueWindow(
                description = "armeabi-v7a ApkDetect::doDetect flag #1",
                expected = hexBytes("0050a0e1010090e10100a0e314008de5"),
                edits = listOf(8 to hexBytes("0000a0e3")), // mov r0, #0
            )
            data.patchUniqueWindow(
                description = "armeabi-v7a ApkDetect::doDetect timing flag #2",
                expected = hexBytes("011052e00000f0e20140003314408de5"),
                edits = listOf(8 to hexBytes("0040a0e3")), // mov r4, #0
            )
            data.patchUniqueWindow(
                description = "armeabi-v7a _parseSignerHash call",
                expected = hexBytes("c10a45f418109de5b8eeffeb000095e5"),
                edits = listOf(8 to hexBytes("00f020e3")), // nop
            )

            file.writeBytes(data)
            patchedAbis++
        }

        val arm64Path = "lib/arm64-v8a/libmx-bh.so"
        if (arm64Path in libEntries) {
            val file = get(arm64Path, true)
            val data = file.readBytes()

            // (a) ApkDetect_init tail (0x312a8..0x312c4): replace `bl operator new` (+0) with
            //     `mov x0, xzr` and `bl spawnThread` (+20) with `nop` so `str x20, [x19]` stores NULL.
            data.patchUniqueWindow(
                description = "arm64-v8a ApkDetect_init worker-thread spawn",
                expected = hexBytes("2eb500941f2003d561010010e20313aaf40300aaf7f8ff97740200f9"),
                edits = listOf(
                    0 to hexBytes("e0031faa"),  // mov x0, xzr
                    20 to hexBytes("1f2003d5"), // nop
                ),
            )

            // (b) Guard getter (0x35a5c..0x35a68) called by `bh_nn_3..6` (`libmxvp.so` MediaScanner)
            //     and `BH_n1`: `mov w0, #1; ret`.
            data.patchUniqueWindow(
                description = "arm64-v8a g_apkDetectStarted guard getter",
                expected = hexBytes("e801009000e14339c0035fd6"),
                edits = listOf(
                    0 to hexBytes("20008052c0035fd6"), // mov w0, #1; ret
                ),
            )

            // (c) Defense-in-depth: ApkDetect::doDetect & _parseSignerHash.
            data.patchUniqueWindow(
                description = "arm64-v8a ApkDetect::doDetect flag #1",
                expected = hexBytes("f31700b9800000b5360080520a000014"),
                edits = listOf(8 to hexBytes("16008052")), // mov w22, #0
            )
            data.patchUniqueWindow(
                description = "arm64-v8a ApkDetect::doDetect timing flag #2",
                expected = hexBytes("e809a0723f0108ebf6979f1aa00304d1"),
                edits = listOf(8 to hexBytes("16008052")), // mov w22, #0
            )
            data.patchUniqueWindow(
                description = "arm64-v8a _parseSignerHash call",
                expected = hexBytes("ff7f03a9ff4300b921f0ff97e03b40b9"),
                edits = listOf(8 to hexBytes("1f2003d5")), // nop
            )

            file.writeBytes(data)
            patchedAbis++
        }

        if (patchedAbis == 0) {
            throw PatchException(
                "Neither arm64-v8a nor armeabi-v7a libmx-bh.so was found. " +
                    "Ensure you are patching a standalone MX Player 3.4.1, 3.4.0, or 3.3.1 APK.",
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
                "android.permission.POST_NOTIFICATIONS",
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

        val crashClass = FirebaseExceptionRecordFingerprint.classDef
        crashClass.returnVoid(FirebaseExceptionRecordFingerprint.method)
    }
}
