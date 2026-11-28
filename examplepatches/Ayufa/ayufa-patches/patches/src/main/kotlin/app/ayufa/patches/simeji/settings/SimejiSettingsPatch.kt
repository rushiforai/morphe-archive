package app.ayufa.patches.simeji.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.ayufa.patches.simeji.shared.Constants.COMPATIBILITY_SIMEJI
import app.ayufa.patches.simeji.shared.SIMEJI_SETTINGS_ENTRY_CLASS
import app.ayufa.patches.simeji.shared.substituteNavBarColor

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
 * the items. Verified against Simeji 22.5.
 */
internal object SettingHomeFragmentInitItemsFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/home/setting/SettingHomeFragment;",
    name = "initSettingItems",
    returnType = "V",
    parameters = listOf("Landroid/view/View;")
)

/**
 * Paints the strip at the very bottom of the keyboard root view
 * (the navigation-bar area the IME window covers on Android 15+).
 * The colour comes from the theme's navigation-bar colour; when the
 * theme has none, stock Simeji falls back to black here. The colour
 * lands in v0, and v1 is still unused at this point (both verified
 * against the 22.5 dex: 9 registers, this in p0).
 */
internal object KeyboardRootViewOnDrawFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/keyboard/SimejiKeyboardRootView;",
    name = "onDraw",
    returnType = "V",
    parameters = listOf("Landroid/graphics/Canvas;")
)

/**
 * Applies the theme's navigation-bar colour to the IME window
 * (`Window.setNavigationBarColor`). When the theme has no colour,
 * stock restores a previously saved default colour — on Android 15+
 * a transparent default is saved as black — so the window ends up
 * black as well. The colour lands in v7 (the former theme
 * parameter register) and v0 is still unused at this point
 * (verified against the 22.5 dex: 8 registers).
 */
internal object ThemeManagerUpdateNavBarColorFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/theme/ThemeManager;",
    name = "updateThemeNavBarColor",
    returnType = "V",
    parameters = listOf("Ljp/baidu/simeji/theme/ITheme;")
)

/**
 * Lifts the keyboard above the system bar on Pixel devices (the
 * Android 15 compatibility path driven by the
 * KEY_PIXEL_SYS_BAR_UP cloud flag). Inline in this private method
 * in 22.5 (not a synthetic lambda): after `checkUp()`, when the
 * theme has no navigation-bar colour it sets the IME window's
 * navigation-bar colour to black directly. The colour lands in v2
 * and v5 is dead at this point — it was consumed by an earlier
 * branch and is overwritten with the black constant right after
 * (verified against the 22.5 dex: 11 registers).
 */
internal object OpenWnnUpdateSoftInputWindowLayoutParametersFingerprint : Fingerprint(
    definingClass = "Ljp/co/omronsoft/openwnn/OpenWnn;",
    name = "updateSoftInputWindowLayoutParameters",
    returnType = "V",
    parameters = listOf()
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

        // Built-in navigation-bar strip colour matching: each site
        // passes its stock theme colour through the extension
        // resolver, which returns a non-null colour unchanged and
        // substitutes a sampled theme colour for a null one. There
        // is no runtime setting for this; it is always on.
        KeyboardRootViewOnDrawFingerprint.method.substituteNavBarColor(
            colorRegister = "v0",
            tempRegister = "v1",
            contextSetup =
                "invoke-virtual { p0 }, Landroid/view/View;->getContext()Landroid/content/Context;\n" +
                    "move-result-object v1"
        )
        ThemeManagerUpdateNavBarColorFingerprint.method.substituteNavBarColor(
            colorRegister = "v7",
            tempRegister = "v0",
            contextSetup = "const/4 v0, 0x0"
        )
        OpenWnnUpdateSoftInputWindowLayoutParametersFingerprint.method
            .substituteNavBarColor(
                colorRegister = "v2",
                tempRegister = "v5",
                contextSetup = "const/4 v5, 0x0"
            )
    }
}
