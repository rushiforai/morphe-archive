/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0). The feed cache's merge as the place to take ads out
 * is the one zeldrisho/morphe-patches found: https://github.com/zeldrisho/morphe-patches
 */
package app.morphe.patches.threads.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.parameterRegister
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.extension.writeStub
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.getReference
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val FEED_ADS = "$EXTENSION_PACKAGE/ads/FeedAds;"
// The shared hook fails for whichever feed patch was selected, so its messages name both.
private const val PATCH = "Feed filter (Hide ads, Hide suggested users)"

/** One pre-cache page boundary shared by independently selected feed patches. */
internal val feedPageFilterPatch = bytecodePatch {
    dependsOn(settingsPatch)
    dependsOn(threadsExtensionPatch)
    execute {
        val merge = FeedPageMergeFingerprint.method

        // The feed item's own getter for its post. It answers null for an item that carries none.
        val instructions = merge.implementation!!.instructions.toList()
        val getters = instructions.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode != Opcode.INVOKE_VIRTUAL && instruction.opcode != Opcode.INVOKE_VIRTUAL_RANGE) {
                return@mapIndexedNotNull null
            }
            val reference = instruction.getReference<MethodReference>() ?: return@mapIndexedNotNull null
            if (reference.returnType != MEDIA || reference.parameterTypes.isNotEmpty() || reference.definingClass == MEDIA) {
                return@mapIndexedNotNull null
            }
            val receiver = when (instruction) {
                is FiveRegisterInstruction -> instruction.registerC
                is RegisterRangeInstruction -> instruction.startRegister
                else -> return@mapIndexedNotNull null
            }
            val lastWrite = instructions.take(index).lastOrNull {
                val register = (it as? OneRegisterInstruction)?.registerA
                it.opcode.setsRegister() && (register == receiver || it.opcode.setsWideRegister() && register == receiver - 1)
            }
            reference.takeIf {
                lastWrite?.opcode == Opcode.CHECK_CAST &&
                    lastWrite.getReference<TypeReference>()?.type == reference.definingClass
            }
        }.distinctBy { it.toString() }
        val itemMedia = getters.singleOrPatchException(
            "$PATCH: item-owned no-argument Media getter in ${merge.definingClass}->${merge.name}",
        )
        mutableClassDefBy(itemMedia.definingClass).methods.filter {
            it.name == itemMedia.name && it.returnType == MEDIA && it.parameterTypes.isEmpty() &&
                !AccessFlags.STATIC.isSet(it.accessFlags)
        }.singleOrPatchException("$PATCH: declaration of $itemMedia")

        writeStub(
            FEED_ADS, "itemMedia", 2,
            """
                instance-of v0, p0, ${itemMedia.definingClass}
                if-eqz v0, :none
                check-cast p0, ${itemMedia.definingClass}
                invoke-virtual { p0 }, ${itemMedia.definingClass}->${itemMedia.name}()$MEDIA
                move-result-object v0
                return-object v0
                :none
                const/4 v0, 0x0
                return-object v0
            """,
        )
        // The page, first thing. A resumed merge is called again with no page and reads its own saved
        // copy, which is the one filtered here on the first call.
        val page = merge.parameterRegister(4)
        merge.addInstructions(
            0,
            """
                invoke-static/range { $page .. $page }, $FEED_ADS->filter(Ljava/util/List;)Ljava/util/List;
                move-result-object $page
            """,
        )

    }
}
