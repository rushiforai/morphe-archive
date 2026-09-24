package app.template.patches.sweepy

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * PairIP initializes before Sweepy's application code through this content provider.
 * Its class and method names are stable in the Play-distributed 6.1.3 APK.
 */
object PairIpLicenseProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseContentProvider;",
    name = "onCreate",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = emptyList(),
)
