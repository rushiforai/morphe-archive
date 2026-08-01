package app.template.patches.etesty

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_ETESTY_AUTOSKOLA
import com.android.tools.smali.dexlib2.AccessFlags

private const val LICENCE_CLASS = "Lcz/etesty/autoskola/api/Licence;"

private val licenceIsFullVersionFingerprint = Fingerprint(
    definingClass = LICENCE_CLASS,
    name = "isFullVersion",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
)

val enablePremiumFeaturesPatch = bytecodePatch(
    name = "Enable premium features",
    description = "Bypasses the premium/licence gate so premium content and unlimited tests become available.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ETESTY_AUTOSKOLA)

    execute {
        licenceIsFullVersionFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
