/*
 * h19e8p Patches
 * Copyright (C) 2026 h19e8p
 *
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version. See the LICENSE file.
 */

package app.h19e8p.patches.flags

import app.h19e8p.patches.settings.settingsPatch
import app.h19e8p.patches.shared.markApplied
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.mutableClassDefBy
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.Locale

private const val FLAG_READS = "Lapp/morphe/extension/h19e8p/flags/FlagReads;"

private val X =
    Compatibility(
        name = "X",
        packageName = "com.twitter.android",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x000000,
        targets = listOf(AppTarget(version = "12.19.1-release.0")),
    )

private fun text(japanese: String, english: String) = if (Locale.getDefault().language == "ja") japanese else english

/** X のフラグを読むクラス。piko の「Hook feature flag」と同じ手がかりで探す。 */
private object FeatureSwitchesFingerprint : Fingerprint(
    strings = listOf("feature_switches_configs_crashlytics_enabled"),
)

/** 拡張の中の、パッチが当たったかを表す印。 */
private object AppliedMarkFingerprint : Fingerprint(
    definingClass = FLAG_READS,
    strings = listOf("flags:info:applied"),
)

@Suppress("unused")
val flagToolsPatch =
    bytecodePatch(
        name = "Feature flag tools",
        description =
            text(
                "h19e8p Patches の設定画面に「要素から探す」と「フラグの読み取りを記録」を足します。" +
                    "見つけたフラグは、長押しで複数を選び、まとめて piko のフラグの一覧に追加できます" +
                    " (piko の「Hook feature flag」が要ります)。",
                "Adds \"Find from an element\" and \"Record flag reads\" to the h19e8p Patches settings. " +
                    "Found flags can be added to piko's flag list, several at once with a long press " +
                    "(needs piko's \"Hook feature flag\").",
            ),
    ) {
        compatibleWith(X)
        dependsOn(settingsPatch)

        execute {
            markApplied("flagTools")
            val featureSwitches = mutableClassDefBy(FeatureSwitchesFingerprint.classDef)
            // a は読んだことを記録する方、m は記録しない方。piko が値を書き換えるのは a だけだが、
            // どちらも X がフラグを読む所なので、両方で読み取りを受け取る。
            val readers =
                featureSwitches.methods.filter {
                    it.returnType == "Z" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "Z")
                }
            if (readers.isEmpty()) throw PatchException("The feature flag reader was not found")

            readers.forEach { method ->
                // 値を返す直前に、返す値を拡張に渡す。return の命令そのものを差し替えるので、
                // そこへの分岐 (既定の値を返す所など) も、必ず拡張を通る。後ろから処理して位置をずらさない。
                val returns = method.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN }.reversed()
                returns.forEach { (index, instruction) ->
                    val register = (instruction as OneRegisterInstruction).registerA
                    method.replaceInstruction(
                        index,
                        "invoke-static/range {v$register .. v$register}, $FLAG_READS->onReadValue(Z)Z",
                    )
                    method.addInstructions(
                        index + 1,
                        """
                        move-result v$register
                        return v$register
                        """,
                    )
                }
                // 入口でフラグの名前を渡す。返す所では、名前の入っていたレジスタが別の値で上書きされている。
                method.addInstruction(0, "invoke-static {p1}, $FLAG_READS->onReadStart(Ljava/lang/String;)V")
            }

            val mark = AppliedMarkFingerprint.method
            val index =
                mark.instructions.indexOfFirst {
                    (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) &&
                        ((it as ReferenceInstruction).reference as StringReference).string == "flags:info:applied"
                }
            val register = (mark.instructions.elementAt(index) as OneRegisterInstruction).registerA
            mark.replaceInstruction(index, "const-string v$register, \"true\"")
        }
    }
