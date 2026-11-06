package app.ayufa.patches.simeji.pet

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import app.ayufa.patches.simeji.shared.Constants.COMPATIBILITY_SIMEJI
import app.ayufa.patches.simeji.shared.returnFalseIfEnabled
import app.ayufa.patches.simeji.shared.returnVoidIfEnabled

/**
 * Drives every visibility change of the keyboard's pet (AI assistant)
 * icon: it attaches the icon view to the keyboard's top area and
 * shows it. Verified against Simeji 20.7.
 */
internal object PetKeyboardManagerChangeModeFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/pet/PetKeyboardManager;",
    name = "changeMode",
    returnType = "V",
    parameters = listOf("I")
)

/**
 * Reports whether the pet icon may currently be shown on the
 * keyboard. Verified against Simeji 20.7.
 */
internal object PetKeyboardManagerCanShowFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/pet/PetKeyboardManager;",
    name = "canShow",
    returnType = "Z"
)

/**
 * Height of the "stuff" band at the very top of the keyboard: the
 * strip that hosts the pet icon (and suggestion/ad items sized from
 * the same value). The candidate line has its own separate height,
 * so zeroing this collapses only the top strip. Verified against
 * Simeji 20.7.
 */
internal object StuffHeightFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/KbdControlPanelHeightVal;",
    name = "getStuffHeight",
    returnType = "I",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)
)

@Suppress("unused")
val hideAiAssistantIconPatch = bytecodePatch(
    name = "AIアシスタントのアイコンを非表示",
    description = "キーボード右上に表示されるロボット（AIアシスタント）の" +
        "アイコンと吹き出しメッセージを非表示にします。アイコンがあった" +
        "一番上の帯も畳むので、空の帯は残りません。入力・変換には影響" +
        "しません。有効・無効はアプリ内設定（Ayufaパッチ設定）でいつでも" +
        "切り替えられます。",
    default = true
) {
    compatibleWith(COMPATIBILITY_SIMEJI)

    extendWith("extensions/simeji.mpe")

    execute {
        // Freezing changeMode keeps the manager's mode at 0 (off)
        // while the toggle is on: the icon view is never shown, and
        // canShow()/canOpenAssistant() consistently report the pet
        // as unavailable.
        PetKeyboardManagerChangeModeFingerprint.method
            .returnVoidIfEnabled("hideAiAssistant", "ayufa_hide_ai_change_mode")
        PetKeyboardManagerCanShowFingerprint.method
            .returnFalseIfEnabled("hideAiAssistant", "ayufa_hide_ai_can_show")
        // Collapse the top strip while the toggle is on: the
        // keyboard's total height is the candidate line height plus
        // this "stuff" height, so returning 0 removes the band
        // entirely. Its other consumers only size pet/suggestion/ad
        // items, which are hidden anyway.
        StuffHeightFingerprint.method
            .returnFalseIfEnabled("hideAiAssistant", "ayufa_hide_ai_stuff_height")
    }
}
