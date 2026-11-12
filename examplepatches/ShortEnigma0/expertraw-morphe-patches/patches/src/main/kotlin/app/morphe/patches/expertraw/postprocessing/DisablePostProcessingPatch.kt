/*
 * Expert RAW patches for Morphe.
 * Licensed under the GNU General Public License version 3 (GPLv3), with the Additional
 * Terms under Section 7 described in the LICENSE file of this repository.
 */
package app.morphe.patches.expertraw.postprocessing

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patches.expertraw.misc.compat.signatureCompatibilityPatch
import app.morphe.patches.expertraw.misc.extension.sharedExtensionPatch
import app.morphe.patches.expertraw.shared.Constants.APP
import app.morphe.patches.expertraw.shared.Constants.COMPATIBILITY_EXPERT_RAW
import app.morphe.patches.expertraw.shared.Constants.EXTENSION
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val BYPASS = "$EXTENSION/PpBypass;"
private const val IMMEDIATE = "$EXTENSION/PpImmediate;"
private const val REFRESH = "$EXTENSION/PpRefresh;"
private const val CONTEXT_FIELD = "$APP/core2/maker/MakerBase;->mContext:Landroid/content/Context;"

@Suppress("unused")
val disablePostProcessingPatch = patch(
    name = "Disable post-processing",
    description = "Adds Settings > Pictures > \"Disable post-processing\". When on, each shot is a single " +
        "frame instead of a multi-frame burst (no multi-frame merge or HDR stacking for RAW and JPEG), " +
        "saved right away without the \"Refining image\" notification. Lab modes are unchanged.",
) {
    compatibleWith(COMPATIBILITY_EXPERT_RAW)

    dependsOn(sharedExtensionPatch, signatureCompatibilityPatch)

    execute {
        // region Single-frame capture.

        IsSingleFrameConditionFingerprint.method.addInstructionsWithLabels(
            0,
            """
                iget-object v0, p0, $CONTEXT_FIELD
                invoke-static { v0 }, $BYPASS->forceSingleFrame(Landroid/content/Context;)Z
                move-result v0
                if-eqz v0, :stock
                return v0
                :stock
                nop
            """
        )

        ArcUpdateEvListFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, $CONTEXT_FIELD
                invoke-static { v0 }, $BYPASS->forceSingleFrame(Landroid/content/Context;)Z
                move-result v0
                or-int/2addr p1, v0
            """
        )

        // endregion

        // region Process single-frame shots now, without the "Refining image" notification.

        WaitRequestFingerprint.method.apply {
            val insns = implementation!!.instructions
            val castIndex = insns.indexOfFirst {
                it.opcode == Opcode.CHECK_CAST &&
                    ((it as ReferenceInstruction).reference as TypeReference).type ==
                    "$APP/core2/processor/request/PostProcessRequest;"
            }
            if (castIndex < 0) throw IllegalStateException("waitRequest: request cast not found")
            val request = (insns[castIndex] as OneRegisterInstruction).registerA
            val temp = if (request == 1) 2 else 1

            addInstructionsWithLabels(
                castIndex + 1,
                """
                    invoke-static { v$request }, $IMMEDIATE->processNow($APP/core2/processor/request/ProcessRequestImpl;)Z
                    move-result v$temp
                    if-eqz v$temp, :stock
                    iget-object v$temp, p0, $APP/core2/processor/PostProcessThread;->mSequenceStackLock:Ljava/util/concurrent/locks/ReentrantLock;
                    invoke-virtual { v$temp }, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V
                    const/4 v$temp, 0x1
                    return v$temp
                    :stock
                    nop
                """
            )
        }

        NotificationSendMessageFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p1 }, $IMMEDIATE->suppressNotification(Ljava/lang/Enum;)Z
                move-result v0
                if-eqz v0, :send
                return-void
                :send
                nop
            """
        )

        // endregion

        // region Thumbnail: refresh after the photo is indexed, open it with a MediaStore uri.

        ScanFileCompletedFingerprint.method.addInstruction(
            0,
            "invoke-static { p2, p3 }, $REFRESH->onScanned(Ljava/lang/String;Landroid/net/Uri;)V"
        )
        CameraActivityOnResumeFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $REFRESH->attach(Ljava/lang/Object;)V"
        )

        LatestMediaGetUriFingerprint.method.apply {
            val insns = implementation!!.instructions
            val index = insns.indexOfFirst {
                it.opcode == Opcode.IGET_OBJECT &&
                    ((it as ReferenceInstruction).reference as FieldReference).name == "mSecMpUri"
            }
            if (index < 0) throw IllegalStateException("getUri: mSecMpUri read not found")
            val register = (insns[index] as OneRegisterInstruction).registerA
            val owner = "$APP/LatestMediaContent;"
            replaceInstruction(index, "iget-object v$register, p0, $owner->mMpUri:Landroid/net/Uri;")
            addInstructionsWithLabels(
                index + 1,
                """
                    if-nez v$register, :have
                    iget-object v$register, p0, $owner->mSecMpUri:Landroid/net/Uri;
                    :have
                    nop
                """
            )
        }

        // endregion

        // region Settings switch (Settings > Pictures, above Labs).

        resourceXml("res/xml/setting.xml").use { xml ->
            val labs = xml.elementByAttribute("android:key", "@string/key_labs_feature")
            val category = labs.parent ?: throw IllegalStateException("setting.xml: Pictures category not found")
            category.insertChild(labs.index, "app.morphe.extension.expertraw.PpBypassPreference") {
                setAttribute("android:persistent", "false")
                setAttribute("android:title", "@string/mod_disable_pp_title")
                setAttribute("android:key", "mod_disable_post_processing")
                setAttribute("android:summary", "@string/mod_disable_pp_summary")
                setAttribute("android:dependency", "@string/dep_pictures")
            }
        }
        resourceXml("res/values/strings.xml").use { xml ->
            val resources = xml.elements("resources").first()
            resources.appendChild("string") {
                setAttribute("name", "mod_disable_pp_title")
                text = "Disable post-processing"
            }
            resources.appendChild("string") {
                setAttribute("name", "mod_disable_pp_summary")
                text = "Capture a single frame instead of a multi-frame burst. " +
                    "Skips multi-frame merge/HDR stacking for RAW and JPEG. Restart the app to apply changes."
            }
        }

        // endregion
    }
}
