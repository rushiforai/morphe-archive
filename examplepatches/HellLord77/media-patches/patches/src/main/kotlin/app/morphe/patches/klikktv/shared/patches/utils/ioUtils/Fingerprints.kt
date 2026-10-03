package app.morphe.patches.klikktv.shared.patches.utils.ioUtils

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

internal object GetSharedPreferenceStringFingerprint : Fingerprint(
    definingClass = "Lcom/angel/klikk/tv/utils/IOUtils;",
    name = "getSharedPreferenceString",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = Type.STRING,
    parameters = listOf(Type.CONTEXT, Type.STRING),
)