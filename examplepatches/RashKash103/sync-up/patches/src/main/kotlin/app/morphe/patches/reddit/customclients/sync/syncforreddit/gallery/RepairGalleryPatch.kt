package app.morphe.patches.reddit.customclients.sync.syncforreddit.gallery

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.returnEarly
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/gallery/GalleryRepair;"

@Suppress("unused")
val repairGalleryPatch = bytecodePatch(
    name = "Repair a gallery Reddit says has failed",
    description = "Finds the pictures of a gallery that opens empty because Reddit marked them " +
            "as failed, by asking i.redd.it for them, and leaves a gallery with nothing wrong " +
            "untouched.",
    default = true,
) {
    category("2. Media")

    dependsOn(sharedExtensionPatch)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        Fingerprint(
            definingClass = EXTENSION_CLASS_DESCRIPTOR,
            name = "isPatchIncluded",
        ).method.returnEarly(true)

        galleryResponseFingerprint.method.apply {
            // The response is read into a String of its own before anything is parsed, and that
            // String is read twice — once for the pictures and once for the starting position —
            // so mending it where it is made covers both. The alternative, standing in for the
            // whole method, would mean reproducing a parser rather than correcting what it is
            // given.
            val readIntoString = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_DIRECT &&
                        getReference<MethodReference>()?.let {
                            it.definingClass == "Ljava/lang/String;" &&
                                    it.name == "<init>" &&
                                    it.parameterTypes.singleOrNull() == "[B"
                        } == true
            }

            // Whichever register the String was built in, rather than the one it happens to be
            // in today: it is a local the compiler chose and nothing says it will stay v4.
            val register = getInstruction<FiveRegisterInstruction>(readIntoString).registerC
            if (register > 15) {
                throw PatchException(
                    "The response is held in v$register, which an invoke-static cannot name",
                )
            }

            addInstructions(
                readIntoString + 1,
                """
                invoke-static { v$register }, $EXTENSION_CLASS_DESCRIPTOR->repair(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$register
                """,
            )
        }
    }
}
