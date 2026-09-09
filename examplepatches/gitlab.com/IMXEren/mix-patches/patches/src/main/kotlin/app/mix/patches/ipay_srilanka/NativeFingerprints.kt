package app.mix.patches.ipay_srilanka

import app.mix.native.NativeFingerprint

/** The native component of the target app. */
internal const val LIBIPAY_NATIVE = "libipay_native.so"

/**
 * Entry points into the app's native component, resolved by their exported JNI symbols.
 *
 * - [V1sFingerprint]: cached state flag queried by the startup flow; the
 *   runtime-registered second entry sits immediately after it (entry + [C1S_ENTRY_OFFSET_FROM_V1S])
 *   inside the same discovered region.
 * - [V1s1D1Fingerprint]: activity-level setup routine.
 * - [LolcIPayFingerprint]: shared notification handler.
 */

/** Address offset of the runtime-registered entry relative to the `v1s` entry. */
internal const val C1S_ENTRY_OFFSET_FROM_V1S = 0xC

internal object V1sFingerprint : NativeFingerprint(
    definingLibrary = LIBIPAY_NATIVE,
    name = "Java_com_ipay_mobile_util_s1c_S1v_v1s",
)

internal object V1s1D1Fingerprint : NativeFingerprint(
    definingLibrary = LIBIPAY_NATIVE,
    name = "Java_com_ipay_mobile_util_s1c_S1v_v1s1D1",
)

internal object LolcIPayFingerprint : NativeFingerprint(
    definingLibrary = LIBIPAY_NATIVE,
    name = "Java_com_ipay_mobile_util_s1c_Lolc_iPay",
)
