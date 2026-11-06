package app.ayufa.patches.simeji.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.ayufa.patches.simeji.shared.Constants.COMPATIBILITY_SIMEJI
import app.ayufa.patches.simeji.shared.SIMEJI_SETTINGS_ENTRY_CLASS

/**
 * Builds the settings tab's item list (the 設定 tab of the home
 * screen). The list is a static layout of SimejiSettingItemView
 * items wired up here; it contains a hidden test item that the
 * extension repurposes into the "Ayufaパッチ設定" entry.
 *
 * The hook sits at the very start of this method, where the view
 * parameter register is still intact (by the end of the method the
 * compiler has recycled it as scratch — an end-of-method hook here
 * received an unrelated item view instead). The extension posts the
 * actual work, so it runs after this method has finished resetting
 * the items. Verified against Simeji 20.7.
 */
internal object SettingHomeFragmentInitItemsFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/home/setting/SettingHomeFragment;",
    name = "initSettingItems",
    returnType = "V",
    parameters = listOf("Landroid/view/View;")
)

@Suppress("unused")
val simejiSettingsPatch = bytecodePatch(
    name = "アプリ内設定画面を追加",
    description = "Simeji の設定タブの一覧に「Ayufaパッチ設定」の入口を" +
        "追加します。各 Simeji パッチの有効・無効や VIP偽装を、再パッチ" +
        "なしでアプリ内から切り替えられるようになります。他の Simeji " +
        "パッチを切り替えるには、このパッチの適用が必要です（未適用の" +
        "場合は各パッチの初期値どおりに動作します）。",
    default = true
) {
    compatibleWith(COMPATIBILITY_SIMEJI)

    extendWith("extensions/simeji.mpe")

    execute {
        SettingHomeFragmentInitItemsFingerprint.method.addInstructions(
            0,
            "invoke-static { p1 }, " +
                "$SIMEJI_SETTINGS_ENTRY_CLASS->attach(Landroid/view/View;)V"
        )
    }
}
