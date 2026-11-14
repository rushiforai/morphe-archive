package app.zeta.patches.hermes

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.zeta.patches.shared.ActivityOnCreateFingerprint
import app.zeta.patches.shared.ActivityOnResumeFingerprint
import app.zeta.patches.shared.Constants.ZETA

private const val EXTENSION_CLASS = "Lapp/zeta/extension/ZetaExtension;"

@Suppress("unused")
val hermesMemoryPatch = patch(
    name = "Hermes Persistent Memory",
    description = "キャラクター別・ユーザー別の永続記憶をローカル管理し、チャットメッセージにプロンプトとして自動注入します。画面上HUDからON/OFF切り替え可能です。",
    default = true
) {
    compatibleWith(ZETA)

    extendWith("extensions/extension.mpe")

    execute {
        // Activity.onCreate の直後に ZetaExtension.init(activity) を注入
        ActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0 }, $EXTENSION_CLASS->init(Landroid/app/Activity;)V
            """.trimIndent()
        )

        // Activity.onResume にも念のため注入
        ActivityOnResumeFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0 }, $EXTENSION_CLASS->init(Landroid/app/Activity;)V
            """.trimIndent()
        )
    }
}
