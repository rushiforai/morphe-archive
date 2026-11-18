package app.ckzorigins.patches.nativelib

import app.ckzorigins.patches.shared.ByteEdit

internal object NativeEdits {
    const val UNITY = "lib/armeabi-v7a/libunity.so"
    const val UNITY_SHA256 = "eb8ab8714c7eda4dbf49c5f032557caba08c4eadfe02742b8337c7f184cf4724"

    val TEXTREL = listOf(
        ByteEdit(0x1DC64, "17", "00"),
        ByteEdit(0x4ADF2, "8fe2", "9fe5"),
        ByteEdit(0x4ADF6, "90e5", "8fe0"),
        ByteEdit(0x4ADFC, "f0f768", "f44964"),
        ByteEdit(0x67D020, "16", "15"),
    )

    const val GWALLET = "lib/armeabi-v7a/libgwallet.so"
    const val GWALLET_SHA256 = "3e29cec10b75491bb42c55918ce11420b13cfc16c7ab5c6c15ded1466ce815b5"

    val SERIAL_ID = listOf(
        ByteEdit(0x231E8, "f0b55746", "48307047"),
    )
}
