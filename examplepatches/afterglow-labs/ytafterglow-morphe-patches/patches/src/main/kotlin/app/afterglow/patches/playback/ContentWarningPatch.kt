/*
 * YTAfterglow for Android.
 *
 * Adapted from the "Remove viewer discretion dialog" patch of Morphe patches v2.2.0
 * (https://github.com/MorpheApp/morphe-patches, GPLv3), which was forked from ReVanced
 * patches (https://github.com/ReVanced/revanced-patches, GPLv3). Modified for
 * YTAfterglow: rewritten for patcher 2.1.0, gated by the iOS setting noContentWarning.
 * Not an official Morphe or ReVanced file.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.smali
import app.afterglow.patches.video.debugMatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val CONTENT_WARNING_CLASS = "$EXTENSION_PLAYBACK/ContentWarning;"

/** Runs after the viewer accepts the dialog: allows adult and controversial content. 21.43.523: `Lasgr;->a(Laksd;)V`. */
internal object AdultContentRunnableFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L"),
    filters = listOf(
        opcode(Opcode.IGET_OBJECT),
        string("allowControversialContent"),
        methodCall(parameters = listOf(), returnType = "Z", location = MatchAfterWithin(1)),
        string("allowAdultContent"),
    ),
)

/** The state that keeps what the viewer allowed; its toString names the two fields. 21.43.523: `Laluu;->lm()`. */
internal object AdultContentSetPropertiesFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf(
        "lastAudioTurnedOnInlinePlaybackId",
        "lastAudioTurnedOffInlinePlaybackId",
        "captionsRequested",
    ),
    filters = listOf(
        opcode(Opcode.IGET_BOOLEAN),
        string("allowAdultContent", location = MatchAfterImmediately()),
        fieldAccess(opcode = Opcode.IGET_BOOLEAN, location = MatchAfterWithin(2)),
        string("allowControversialContent", location = MatchAfterImmediately()),
    ),
)

/**
 * The iOS setting `noContentWarning` (tweak "content-warning"): iOS confirms YouTube's
 * sensitive content alert as soon as it would show. Here the two answers that decide if the
 * viewer discretion dialog shows (adult and controversial content allowed) read as true, both
 * where the dialog is decided and where the allowed state is kept, so the video plays as if
 * the viewer had accepted. The age restriction itself is not bypassed.
 *
 * 21.43.523: the dialog decision is `Lasgu;->lo(Lasfp;)V`, the allowed state is stored in
 * `Lasgu;->sa(Laluu;)V`.
 */
internal val contentWarningHookPatch = bytecodePatch(
    description = "Accepts YouTube's viewer discretion dialog when Afterglow skips it.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)

    execute {
        val runnableType = AdultContentRunnableFingerprint.method.definingClass
        val skipDialog = Fingerprint(
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = "V",
            parameters = listOf("L"),
            filters = listOf(
                methodCall(opcode = Opcode.INVOKE_VIRTUAL, smali = "Ljava/lang/Boolean;->booleanValue()Z"),
                opcode(Opcode.MOVE_RESULT, location = MatchAfterImmediately()),
                opcode(Opcode.INVOKE_VIRTUAL, location = MatchAfterWithin(4)),
                opcode(Opcode.MOVE_RESULT, location = MatchAfterImmediately()),
                methodCall(
                    opcode = Opcode.INVOKE_DIRECT,
                    name = "<init>",
                    definingClass = runnableType,
                    location = MatchAfterWithin(5),
                ),
            ),
        )
        val skipDialogMethod = skipDialog.method
        val skipDialogResults = listOf(skipDialog.instructionMatches[3].index, skipDialog.instructionMatches[1].index)

        val propertyMatches = AdultContentSetPropertiesFingerprint.instructionMatches
        val setProperties = Fingerprint(
            classFingerprint = skipDialog,
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = "V",
            parameters = listOf("L"),
            filters = listOf(
                fieldAccess(propertyMatches[0].fieldReference, Opcode.IPUT_BOOLEAN),
                fieldAccess(propertyMatches[2].fieldReference, Opcode.IPUT_BOOLEAN, location = MatchAfterWithin(3)),
            ),
        )
        val setPropertiesMethod = setProperties.method
        val propertyStores = listOf(setProperties.instructionMatches[1].index, setProperties.instructionMatches[0].index)

        debugMatch("contentWarningRunnable", AdultContentRunnableFingerprint.method)
        debugMatch("contentWarningSkipDialog", skipDialogMethod)
        debugMatch("contentWarningProperties", AdultContentSetPropertiesFingerprint.method)
        debugMatch("contentWarningSetProperties", setPropertiesMethod)

        fun MutableMethod.allow(index: Int, register: Int) = addInstructions(
            index,
            """
                ${invokeStaticOne(register, "$CONTENT_WARNING_CLASS->allowContent(Z)Z")}
                move-result v$register
            """,
        )

        // The two boolean results the dialog decision reads, highest index first.
        skipDialogResults.forEach { index ->
            skipDialogMethod.allow(index + 1, skipDialogMethod.getInstruction<OneRegisterInstruction>(index).registerA)
        }

        // The stored allowed state, before each store, highest index first.
        propertyStores.forEach { index ->
            setPropertiesMethod.allow(index, setPropertiesMethod.getInstruction<TwoRegisterInstruction>(index).registerA)
        }
    }
}
