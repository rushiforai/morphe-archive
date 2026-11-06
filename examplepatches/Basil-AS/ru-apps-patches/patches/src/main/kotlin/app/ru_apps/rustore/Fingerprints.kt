// Ported from Freeman022026/rustore-privacy-patches (GPLv3), dev/freeman022026/rustore/patches/Fingerprints.kt.
package app.ru_apps.rustore

import app.morphe.patcher.Fingerprint

internal fun methodFingerprint(
    definingClass: String,
    name: String,
    returnType: String,
    parameters: List<String> = emptyList(),
    strings: List<String> = emptyList()
) = Fingerprint(
    definingClass = definingClass,
    name = name,
    returnType = returnType,
    parameters = parameters,
    strings = strings
)

// definingClass moved from Lz41/hj; to Lb51/ol; - confirmed via live decompile
// (ru.vk.store 1.111.0.3, 2026-10): the only remaining method shaped
// `a()Ljava/lang/String;` with both the "android_id" (Settings.Secure read)
// and "value" string anchors in the same method body. Its source file is now
// an r8-map-id hash (fully source-stripped), so the string anchors are the
// only stable match left.
internal val rustoreSdkDeviceIdFingerprint = methodFingerprint(
    "Lb51/ol;",
    "a",
    "Ljava/lang/String;",
    strings = listOf("android_id", "value")
)

// definingClass moved from Lb40/c; to Lx20/c; - confirmed via live decompile
// (ru.vk.store 1.111.0.3, 2026-10) by matching the method body (same cached
// field read, same "next_device_id is null or empty" fallback), not just the
// string anchors.
internal val vkSdkDeviceIdFingerprint = methodFingerprint(
    "Lx20/c;",
    "a",
    "Ljava/lang/String;",
    listOf("Landroid/content/Context;"),
    listOf("__vk_device_id__", "next_device_id is null or empty: ")
)
