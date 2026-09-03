package morningentree.morphe.patches.fylo.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object DebugFeatureUnlockIsActiveFingerprint : Fingerprint(
    definingClass = "Lcom/aeroloom/fylofilemanager/data/billing/DebugFeatureUnlock;",
    name = "isActive",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/content/Context;"),
)
