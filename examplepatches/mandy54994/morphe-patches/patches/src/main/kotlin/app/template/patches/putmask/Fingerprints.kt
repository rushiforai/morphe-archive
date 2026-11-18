package app.template.patches.putmask

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// Targets: com.putmask.facefilter.license.drplAgue1.l(Context, List) -> Drplague1 (enum)
internal object LicenseCheckFingerprint : Fingerprint(
    returnType = "Lcom/putmask/facefilter/license/drplAgue1\$Drplague1;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/util/List;"
    )
)

// Targets: p136drplAGUE.Drplague1.a(Context) -> boolean
internal object PremiumAnyFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;")
)