package app.morphe.patches.klikk.shared.patches.models.userData

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

internal object GetIdFingerprint : Fingerprint(
    definingClass = "Lcom/angel/klikk/models/UserData;",
    name = "getId",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = Type.STRING,
    parameters = emptyList(),
)
