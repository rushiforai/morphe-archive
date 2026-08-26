package morningentree.morphe.patches.mlmanager.pro

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object ProPackageCheckFingerprint : Fingerprint(
    definingClass = "Lj2/o;",
    name = "B",
    parameters = listOf("Landroid/content/Context;"),
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

internal object LicenseDontAllowFingerprint : Fingerprint(
    definingClass = "Lz1/a0;",
    name = "e",
    parameters = listOf("I"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
)

internal object ServerValidationCallbackFingerprint : Fingerprint(
    definingClass = "Lz1/a0;",
    name = "c",
    parameters = listOf("Lcom/javiersantos/servervalidation/objects/ServerValidationsResponse;"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC),
)
