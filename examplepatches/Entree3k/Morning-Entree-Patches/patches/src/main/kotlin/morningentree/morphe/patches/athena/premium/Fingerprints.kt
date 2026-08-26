package morningentree.morphe.patches.athena.premium

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object GetPremiumUnlockedFingerprint : Fingerprint(
    definingClass = "Lcom/kin/athena/domain/model/Settings;",
    name = "getPremiumUnlocked",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = emptyList(),
)
