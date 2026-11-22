/*
 * h19e8p Patches
 * Copyright (C) 2026 h19e8p
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version. See the LICENSE file.
 */

package app.h19e8p.patches.composer

import app.h19e8p.patches.settings.settingsPatch
import app.h19e8p.patches.shared.markApplied
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import java.util.Locale

private const val COMPOSER_UNDO = "Lapp/morphe/extension/h19e8p/composer/ComposerUndo;"

private val X =
    Compatibility(
        name = "X",
        packageName = "com.twitter.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(AppTarget(version = "12.19.1-release.0")),
    )

private fun text(japanese: String, english: String) = if (Locale.getDefault().language == "ja") japanese else english

/** 投稿の本文の入力欄の入れ物 (TweetBox) が、中の入力欄を見つけ終える所。 */
private object TweetBoxInflatedFingerprint : Fingerprint(
    name = "onFinishInflate",
    returnType = "V",
    strings = listOf("No edit text found in layout"),
)

/** 投稿画面の下のボタンの列 (画像・GIF・投票などの並び) を作る所。 */
private object FooterActionBarFingerprint : Fingerprint(
    definingClass = "Lcom/twitter/composer/view/ComposerFooterActionBar;",
    name = "<init>",
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;"),
)

@Suppress("unused")
val composerUndoPatch =
    bytecodePatch(
        name = "Undo and redo in the composer",
        description =
            text(
                "投稿画面の下のボタンの列に「元に戻す」「やり直す」を足します。スレッドでは投稿ごとに履歴を持ち、" +
                    "続けて打った文字はまとめて戻ります。",
                "Adds Undo and Redo to the button row of the composer. Each post in a thread has its own history, " +
                    "and text typed in a row is undone at once.",
            ),
    ) {
        compatibleWith(X)
        dependsOn(settingsPatch)

        execute {
            markApplied("composerUndo")
            beforeEveryReturn(TweetBoxInflatedFingerprint.method, "invoke-static {p0}, $COMPOSER_UNDO->onTweetBox(Landroid/view/View;)V")
            beforeEveryReturn(FooterActionBarFingerprint.method, "invoke-static {p0}, $COMPOSER_UNDO->onFooter(Landroid/view/View;)V")
        }
    }

/**
 * メソッドのすべての return-void の前に、1つの命令を足す。return-void そのものを差し替えて後ろに
 * return-void を置き直すので、return-void へ飛ぶ分岐も必ず足した命令を通る。
 */
private fun beforeEveryReturn(method: MutableMethod, instruction: String) {
    val returns = method.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
    if (returns.isEmpty()) throw PatchException("${method.name} has no return-void")
    returns.reversed().forEach {
        method.replaceInstruction(it, instruction)
        method.addInstruction(it + 1, "return-void")
    }
}
