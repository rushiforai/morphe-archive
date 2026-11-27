/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.linkedin.feed

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.shared.Constants.KEEP_FEED
import app.fakh.patches.linkedin.shared.settingsPatch
import app.fakh.patches.shared.register
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SHARED_PREFERENCES = "Lcom/linkedin/android/infra/data/FlagshipSharedPreferences;"

/**
 * Where the feeds read the time the app last went to the background, to decide whether to reload on reopen:
 * the server driven feed's GetLongAppBackgroundTimeMillis expression and the classic feed's 7 minute rule.
 * Notifications, video sound and other readers of that time are left alone.
 */
private val FEED_CLASSES = setOf(
    "Lcom/linkedin/sdui/viewdata/expressions/GetLongAppBackgroundTimeMillis;",
    "Lcom/linkedin/android/infra/sdui/expressions/NumericExpressionEvaluator;",
    "Lcom/linkedin/android/feed/pages/main/MainFeedFragment;",
    "Lcom/linkedin/android/feed/pages/main/session/MainFeedSessionManager;",
)

@Suppress("unused")
val keepFeedPatch = patch(
    name = "Keep feed on reopen",
    description = "Keeps your place in the feed when you come back to LinkedIn.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Feed")
    dependsOn(settingsPatch)

    execute {
        register(KEEP_FEED)

        var patched = 0
        classDefForEach { classDef ->
            if (classDef.type !in FEED_CLASSES) return@classDefForEach
            mutableClassDefBy(classDef).methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                // From the end, so an insert does not shift the indexes still to come.
                for (index in instructions.indices.reversed()) {
                    val instruction = instructions[index]
                    if (instruction.opcode != Opcode.INVOKE_VIRTUAL) continue
                    val reference = (instruction as ReferenceInstruction).reference as? MethodReference ?: continue
                    if (reference.definingClass != SHARED_PREFERENCES ||
                        reference.name != "getAppLastBackgroundTimeStamp"
                    ) continue
                    val result = method.getInstruction(index + 1)
                    if (result.opcode != Opcode.MOVE_RESULT_WIDE) continue
                    val register = (result as OneRegisterInstruction).registerA
                    method.addInstructions(
                        index + 2,
                        """
                            invoke-static/range { v$register .. v${register + 1} }, $EXTENSION_PACKAGE/KeepFeed;->feedBackgroundTime(J)J
                            move-result-wide v$register
                        """
                    )
                    patched++
                }
            }
        }
        if (patched == 0) throw PatchException("The feed's background time reads were not found")
    }
}
