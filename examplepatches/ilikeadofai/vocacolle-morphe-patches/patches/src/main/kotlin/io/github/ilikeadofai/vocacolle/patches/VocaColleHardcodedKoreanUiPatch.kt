package io.github.ilikeadofai.vocacolle.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import io.github.ilikeadofai.vocacolle.patches.shared.Constants.VOCACOLLE

private const val UI_LANGUAGE_TRANSLATOR =
    "Lio/github/ilikeadofai/vocacolle/extension/UiLanguageTranslator;"

private val externalLinkDialogTitle = string("リンク先に遷移する")
private val externalLinkDialogOk = string("OK")
private val externalLinkDialogCancel = string("Cancel")
private val byteDanceLandingDownload = string("ダウンロード")
private val byteDanceVideoLandingDownload = string("ダウンロード")
private const val PROSEKA_DESCRIPTION =
    "「ロキ」「シャルル」「Tell Your World」「ハッピーシンセサイザ」などの名曲を3DMV付きで多数収録！SEGA×Colorful Paletteが贈る、誰でもかんたんに楽しめるリズムゲーム。"
private val prosekaDescription = string(PROSEKA_DESCRIPTION)
private val prosekaSubtitle = string("初音ミクも登場する新作リズムゲーム")
private val prosekaTitle = string("プロジェクトセカイ カラフルステージ！ feat. 初音ミク")

private object ExternalLinkDialogFingerprint : Fingerprint(
    definingClass = "Lyc/u\$c;",
    name = "shouldOverrideUrlLoading",
    returnType = "Z",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    filters = listOf(externalLinkDialogTitle, externalLinkDialogOk, externalLinkDialogCancel)
)

private object ByteDanceLandingDownloadFingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/sdk/openadsdk/activity/single/TTLandingPageActivity;",
    name = "<init>",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(byteDanceLandingDownload)
)

private object ByteDanceVideoLandingDownloadFingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/sdk/openadsdk/activity/single/TTVideoLandingPageActivity;",
    name = "<init>",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(byteDanceVideoLandingDownload)
)

private object ProsekaTopContentFingerprint : Fingerprint(
    definingClass = "Ldj/j;",
    name = "l",
    returnType = "Lnl/L;",
    parameters = listOf("Lq0/r;", "I"),
    filters = listOf(prosekaDescription, prosekaSubtitle, prosekaTitle)
)

@Suppress("unused")
val vocacolleHardcodedKoreanUiPatch = bytecodePatch(
    name = null,
    description = "Localizes production Compose and third-party UI literals using the selected display language.",
    default = true
) {
    compatibleWith(VOCACOLLE)
    extendWith("extensions/extension.mpe")

    execute {
        injectRuntimeTranslations(ExternalLinkDialogFingerprint, expectedMatches = 3)
        injectRuntimeTranslations(ByteDanceLandingDownloadFingerprint, expectedMatches = 1)
        injectRuntimeTranslations(ByteDanceVideoLandingDownloadFingerprint, expectedMatches = 1)
        injectRuntimeTranslations(ProsekaTopContentFingerprint, expectedMatches = 3)
    }
}

context(_: BytecodePatchContext)
private fun injectRuntimeTranslations(fingerprint: Fingerprint, expectedMatches: Int) {
    val matches = fingerprint.instructionMatches
    check(matches.size == expectedMatches) {
        "Expected $expectedMatches UI literals in ${fingerprint.method.definingClass}->${fingerprint.method.name}, " +
            "found ${matches.size}"
    }
    matches.sortedByDescending { it.index }.forEach { match ->
        val register = fingerprint.method
            .getInstruction<OneRegisterInstruction>(match.index)
            .registerA
        fingerprint.method.addInstructions(
            match.index + 1,
            """
                invoke-static {v$register}, $UI_LANGUAGE_TRANSLATOR->translateHardcoded(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$register
            """.trimIndent()
        )
    }
}
