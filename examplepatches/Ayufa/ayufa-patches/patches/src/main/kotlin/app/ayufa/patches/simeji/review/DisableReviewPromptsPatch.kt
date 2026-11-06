package app.ayufa.patches.simeji.review

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.ayufa.patches.simeji.shared.Constants.COMPATIBILITY_SIMEJI
import app.ayufa.patches.simeji.shared.finishIfEnabledAfterSuperOnCreate
import app.ayufa.patches.simeji.shared.returnVoidIfEnabled

/**
 * Simeji's own Google Play guide / rating dialog activity.
 * Verified against Simeji 20.7.
 */
internal object GpGuideDialogActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simejicore/popup/gppop/GPGuideDialogActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

/**
 * Entry point of the Play in-app review flow. Verified against
 * Simeji 20.7.
 */
internal object GpInAppReviewAskFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simejicore/popup/gppop/GpInAppReview;",
    name = "askForReview",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;")
)

@Suppress("unused")
val disableReviewPromptsPatch = bytecodePatch(
    name = "レビュー依頼を無効化",
    description = "Google Play の評価依頼を無効化します。Simeji 独自のガイド" +
        "ダイアログと、Play のアプリ内レビューの両方が対象です。有効・無効は" +
        "アプリ内設定（Ayufaパッチ設定）でいつでも切り替えられます。",
    default = true
) {
    compatibleWith(COMPATIBILITY_SIMEJI)

    extendWith("extensions/simeji.mpe")

    execute {
        GpGuideDialogActivityOnCreateFingerprint.method
            .finishIfEnabledAfterSuperOnCreate(
                "disableReviewPrompts", "ayufa_disable_review_dialog"
            )
        GpInAppReviewAskFingerprint.method
            .returnVoidIfEnabled("disableReviewPrompts", "ayufa_disable_review_flow")
    }
}
