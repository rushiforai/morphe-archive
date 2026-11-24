package app.deadcrossing.patches.nativelib

import app.adebisi.patches.shared.ByteEdit

/**
 * TEXTREL fix starts as the same five-run pattern as Origins: reloc type `R_ARM_RELATIVE`
 * (0x17) becomes `R_ARM_NONE`, the 2011 NDK `__on_dlclose` stub is rewritten PC-relative,
 * its literal is adjusted, and `DT_TEXTREL` (0x16) becomes `DT_DEBUG` (0x15).
 *
 * `libmain` and `libunity` also keep a Thumb `__aeabi_atexit` whose literal is
 * `R_ARM_ABS32` against `__cxa_atexit`. Dropping `DT_TEXTREL` without retyping that
 * reloc leaves the linker writing into RX `.text`. Those two libraries replace
 * `ldr r3, [pc]; blx r3` with `bl __cxa_atexit@plt` and retype the ABS32 to `R_ARM_NONE`.
 * `libfXs1` / `libmono` have no second text reloc.
 *
 * Real `libmono` / `libunity` live under `assets/libs`. `lib/` holds proxies that extract
 * those files. Modern Android copies the patched real libraries over the proxies, then
 * deletes [DROPPED_ASSET_LIBS]. Proxy bytes are not hashed: they are overwritten, and
 * the APK signer plus the real library hashes already pin the stock build.
 */
internal object NativeEdits {
    const val FXS1 = "lib/armeabi-v7a/libfXs1.so"
    const val MAIN = "lib/armeabi-v7a/libmain.so"
    const val MONO_REAL = "assets/libs/armeabi-v7a/libmono.so"
    const val UNITY_REAL = "assets/libs/armeabi-v7a/libunity.so"
    const val MONO_PROXY = "lib/armeabi-v7a/libmono.so"
    const val UNITY_PROXY = "lib/armeabi-v7a/libunity.so"

    val DROPPED_ASSET_LIBS = listOf(MONO_REAL, UNITY_REAL)

    const val FXS1_SHA256 = "4ccdf57134e8acbcdb02080165eec44ceaf870bd53256bdfeb21cd8c17f70f28"
    const val MAIN_SHA256 = "aa6d178d84881b15ed7047636b61f26546f1490797267ef9271e07619281b5d4"
    const val MONO_REAL_SHA256 = "37608588bca57f1eb79ff0d26319f4a8c7dc32b7f196295c554ededd1758609a"
    const val UNITY_REAL_SHA256 = "4e08525f13afaf6b8f8d8a56445d8c4173ae324b52fa9809a5d40ea40415b0f8"

    val FXS1_TEXTREL = listOf(
        ByteEdit(0xD28, "17", "00"),
        ByteEdit(0xE5A, "8fe2", "9fe5"),
        ByteEdit(0xE5E, "90e5", "8fe0"),
        ByteEdit(0xE64, "603b", "fc2c"),
        ByteEdit(0x2AC4, "16", "15"),
    )

    val MAIN_TEXTREL = listOf(
        ByteEdit(0x2B80, "17", "00"),
        ByteEdit(0x313A, "8fe2", "9fe5"),
        ByteEdit(0x313E, "90e5", "8fe0"),
        ByteEdit(0x3144, "00b00000", "bc7e0000"),
        ByteEdit(0x9DC0, "16", "15"),
        ByteEdit(0x3152, "024b9847", "fff7a7ff"),
        ByteEdit(0x2E98, "02", "00"),
    )

    val MONO_TEXTREL = listOf(
        ByteEdit(0xDF28, "17", "00"),
        ByteEdit(0x15AAA, "8fe2", "9fe5"),
        ByteEdit(0x15AAE, "90e5", "8fe0"),
        ByteEdit(0x15AB4, "b0d23b", "fc773a"),
        ByteEdit(0x3B85B4, "16", "15"),
    )

    val UNITY_TEXTREL = listOf(
        ByteEdit(0x356D8, "17", "00"),
        ByteEdit(0x68A72, "8fe2", "9fe5"),
        ByteEdit(0x68A76, "90e5", "8fe0"),
        ByteEdit(0x68A7C, "00309100", "84a58a00"),
        ByteEdit(0x910BB4, "16", "15"),
        ByteEdit(0x68A8A, "024b9847", "fff753fb"),
        ByteEdit(0x62B58, "02", "00"),
    )

    /**
     * Unity 4 `http://stats.unity3d.com/HWStats.cgi` C string in `libunity`.
     * Applied on [UNITY_PROXY] after Modern Android copies the real library there.
     */
    val UNITY_HWSTATS = listOf(
        ByteEdit(
            0x8742A4,
            "687474703a2f2f73746174732e756e69747933642e636f6d2f485753746174732e636769",
            "000000000000000000000000000000000000000000000000000000000000000000000000",
        ),
    )
}
