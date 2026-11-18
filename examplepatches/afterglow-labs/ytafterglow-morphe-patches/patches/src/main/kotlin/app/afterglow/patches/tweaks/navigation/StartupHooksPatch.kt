/*
 * YTAfterglow for Android.
 *
 * Hooks adapted from Morphe patches v2.2.0 (https://github.com/MorpheApp/morphe-patches, GPLv3),
 * forked from ReVanced patches (https://github.com/ReVanced/revanced-patches, GPLv3): the Change start page patch.
 * Modified for YTAfterglow: rewritten for patcher 2.1.0 and YouTube 21.43.523 and driven by the
 * iOS settings. Not an official Morphe or ReVanced file.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package app.afterglow.patches.tweaks.navigation

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val STARTUP_HOOKS = "$EXTENSION_PACKAGE/navigation/StartupHooks;"

/**
 * Where YouTube opens (iOS startupTab, and shortsOnlyMode's Shorts start): the default page's
 * browse id, the launch intent's action for Shorts, and the guide request's milestone. Used by
 * the named "Startup tab and animation" patch and by the Shorts hooks.
 *
 * startupAnimation enables the two native eligibility gates before Lrtt is obtained.
 * OFF preserves the native decisions. Style flag 1074339245, native assets, the
 * low-memory animation fallback and all controller cleanup remain unchanged.
 */
internal val startupHooksPatch = bytecodePatch(
    description = "Hooks YouTube's start page for the Afterglow startup settings.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)

    execute {
        StartupBrowseIdFingerprint.let {
            val index = it.instructionMatches.first().index
            val register = it.method.instruction<OneRegisterInstruction>(index).registerA
            it.method.addInstructions(
                index + 1,
                """
                    ${invokeStatic(register, method = "$STARTUP_HOOKS->browseId(Ljava/lang/String;)Ljava/lang/String;")}
                    move-result-object v$register
                """,
            )
        }

        LaunchIntentFingerprint.method.addInstructions(
            0,
            "invoke-static/range { p1 .. p1 }, $STARTUP_HOOKS->launchIntent(Landroid/content/Intent;)V",
        )

        GuideRequestFingerprint.let {
            it.method.overrideFlagRead(it.instructionMatches.first().index, "$STARTUP_HOOKS->guideMilestone(I)I")
        }

        // MainActivity.onCreate has another Lafnm.B call for unrelated startup work.
        // Match this whole eligibility sequence, including the type-mask bypass, and
        // verify both branch targets before changing either boolean result.
        val animation = Fingerprint(
            definingClass = "Lcom/google/android/apps/youtube/app/watchwhile/MainActivity;",
            name = "onCreate", parameters = listOf("Landroid/os/Bundle;"), returnType = "V",
            filters = listOf(
                literal(264),
                methodCall(smali = "Lafnm;->a(I)I", location = MatchAfterImmediately()),
                opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
                methodCall(smali = "Lafnm;->B(I)Z", location = MatchAfterImmediately()),
                opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
                opcode(Opcode.IF_NEZ, MatchAfterImmediately()),
                literal(5, location = MatchAfterImmediately()),
                opcode(Opcode.IF_NE, MatchAfterImmediately()),
                literal(1073814999, location = MatchAfterImmediately()),
                methodCall(smali = "Laflv;->f(I)Z", location = MatchAfterImmediately()),
                opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
                opcode(Opcode.IF_EQZ, MatchAfterImmediately()),
                literal(1073815427, location = MatchAfterImmediately()),
                methodCall(smali = "Laflv;->f(I)Z", location = MatchAfterImmediately()),
                opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
                opcode(Opcode.IF_NEZ, MatchAfterImmediately()),
            ),
        ).match()
        val instructions = animation.method.implementation!!.instructions.toList()
        val addresses = IntArray(instructions.size)
        var address = 0
        instructions.forEachIndexed { index, instruction -> addresses[index] = address; address += instruction.codeUnits }
        fun target(index: Int) = addresses.indexOf(addresses[index] + (instructions[index] as OffsetInstruction).codeOffset)
        val matches = animation.instructionMatches
        require(target(matches[5].index) == matches[12].index) { "Startup state gate no longer reaches type eligibility" }
        val controller = target(matches[15].index)
        require(controller >= 0 && instructions.getOrNull(controller + 3)?.let {
            it.opcode == Opcode.CHECK_CAST && ((it as ReferenceInstruction).reference as TypeReference).type == "Lrtt;"
        } == true && literalLoads(animation.method, 1074339245L).size == 1) {
            "Startup type gate no longer reaches the native animation controller/style"
        }
        listOf(matches[4].index, matches[14].index).sortedDescending().forEach { index ->
            val register = (instructions[index] as OneRegisterInstruction).registerA
            animation.method.addInstructions(index + 1, """
                ${invokeStatic(register, method = "$STARTUP_HOOKS->animationEligible(Z)Z")}
                move-result v$register
            """)
        }
    }
}
