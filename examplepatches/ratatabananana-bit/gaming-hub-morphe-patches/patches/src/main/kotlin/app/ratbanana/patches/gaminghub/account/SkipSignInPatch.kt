package app.ratbanana.patches.gaminghub.account

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.ratbanana.patches.gaminghub.shared.Constants.COMPATIBILITY_GAMING_HUB
import app.ratbanana.patches.gaminghub.shared.Constants.EXTENSION_PACKAGE
import app.ratbanana.patches.gaminghub.shared.requireFreeRegistersAtEntry

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/AccountOnboarding;"

@Suppress("unused")
val skipSignInPatch = bytecodePatch(
    name = "Skip mandatory sign-in",
    description = "Experimental. Opens Gaming Hub without the mandatory Samsung account sign-in. " +
        "Required for any patched Gaming Hub, because Samsung account sign-in only works with the " +
        "original Samsung signature. Features that need an account will not work.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GAMING_HUB)

    extendWith("extensions/extension.mpe")

    execute {
        val privacyNoticeCheck = IsPrivacyNoticeRequiredFingerprint.method
        val privacyNoticeCheckClass = IsPrivacyNoticeRequiredFingerprint.classDef
        val settingRepositoryType = privacyNoticeCheck.parameterTypes[1].toString()

        // Kotlin object: the check is an instance method on a static singleton.
        val privacyNoticeCheckInstance = privacyNoticeCheckClass.staticFields.firstOrNull {
            it.type == privacyNoticeCheckClass.type
        } ?: throw PatchException("Privacy notice check singleton not found in ${privacyNoticeCheckClass.type}")

        val settingRepositoryField = classDefBy(START_VIEW_MODEL_CLASS).instanceFields.firstOrNull {
            it.type == settingRepositoryType
        } ?: throw PatchException("Setting repository field not found in $START_VIEW_MODEL_CLASS")

        GetOnboardingStatusFingerprint.method.apply {
            requireFreeRegistersAtEntry(3)

            // A suspend function may return its result directly instead of COROUTINE_SUSPENDED,
            // so returning the status here completes the call without ever suspending.
            addInstructionsWithLabels(
                0,
                """
                    sget-object v1, ${privacyNoticeCheckInstance.definingClass}->${privacyNoticeCheckInstance.name}:${privacyNoticeCheckInstance.type}
                    iget-object v2, p0, $START_VIEW_MODEL_CLASS->${settingRepositoryField.name}:$settingRepositoryType
                    invoke-virtual { v1, p1, v2 }, ${privacyNoticeCheck.definingClass}->${privacyNoticeCheck.name}(Landroid/content/Context;$settingRepositoryType)Z
                    move-result v1
                    const-class v0, $ONBOARDING_STATUS_CLASS
                    invoke-static { p1, v0, v1 }, $EXTENSION_CLASS->getSkippedOnboardingStatus(Landroid/content/Context;Ljava/lang/Class;Z)Ljava/lang/Object;
                    move-result-object v0
                    if-eqz v0, :run_onboarding
                    return-object v0
                    :run_onboarding
                    nop
                """,
            )
        }
    }
}
