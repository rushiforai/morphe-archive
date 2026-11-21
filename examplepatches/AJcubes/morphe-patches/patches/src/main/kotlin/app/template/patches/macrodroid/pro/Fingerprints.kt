package app.template.patches.macrodroid.pro

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

// Settings.c3(Context)Z — the "vcp_count" device-cap pro check.
object IsProViaDeviceCapFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Landroid/preference/PreferenceManager;",
            name = "getDefaultSharedPreferences",
        ),
        string("vcp_count"),
        methodCall(
            definingClass = "Landroid/content/SharedPreferences;",
            name = "getInt",
        ),
        opcode(Opcode.SGET_OBJECT),
    ),
)
