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

    /**
     * Thumb `adds r0, #0x48; bx lr` over the PUSH prologue. The hand-packaged APK
     * used this on GetIMEI_JNI. The same four bytes skip the other JNI that hits
     * a permission unused-permissions removes: GET_ACCOUNTS on AccountManager,
     * READ_PHONE_STATE on TelephonyManager.getDeviceId. Gingerbread throws
     * SecurityException; Dalvik then aborts (deadd00d) if the next JNI GetFieldID
     * runs with that exception still pending.
     */
    private const val THUMB_RETURN = "48307047"

    val SERIAL_ID = listOf(
        ByteEdit(0x231E8, "f0b55746", THUMB_RETURN), // GetIMEI_JNI
    )

    val JNI_GUARDS = listOf(
        ByteEdit(0x21C94, "f0b55f46", THUMB_RETURN), // GetPrimaryAccountName_JNI(char const*, CStrChar&)
        ByteEdit(0x21E6C, "f0b55f46", THUMB_RETURN), // GetPrimaryAccountName_JNI(CStrChar&)
        ByteEdit(0x2307C, "f0b55746", THUMB_RETURN), // GetDeviceID_JNI
    )
}
