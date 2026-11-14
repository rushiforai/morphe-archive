package app.template.patches.rillphone

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object CheckProStatusFingerprint : Fingerprint(
    definingClass = "Lf13;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("is_pro_iap"),
        string("is_pro_sub")
    )
)