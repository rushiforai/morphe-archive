package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.cards

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.returnEarly
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/ui/cards/NarrowLinkCards;"

@Suppress("unused")
val narrowLinkCardsPatch = bytecodePatch(
    name = "Stack a link post's picture over its title in columns",
    description = "Draws a link post's picture across the top of its card with the title " +
            "underneath where the feed is in more than one column, instead of beside the " +
            "title in the width that is left over.",
    default = true,
) {
    category("4. Feed")

    dependsOn(sharedExtensionPatch)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        Fingerprint(
            definingClass = EXTENSION_CLASS_DESCRIPTOR,
            name = "isPatchIncluded",
        ).method.returnEarly(true)

        cardLinkHolderFingerprint.method.apply {
            // The card and the view mode are both parameters, and the constructor is two
            // instructions long, so neither has been written over by the time this runs — but
            // the call still goes after the superclass constructor rather than in front of it,
            // since nothing may touch the object before that has run.
            val superCall = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_DIRECT &&
                        (getReference<MethodReference>()?.name == "<init>")
            }

            if (parameters.size != 4) {
                throw PatchException(
                    "A link card holder is built from ${parameters.size} things rather than " +
                            "four, so it is no longer clear which is the card",
                )
            }

            addInstructions(
                superCall + 1,
                "invoke-static { p3, p4 }, " +
                        "$EXTENSION_CLASS_DESCRIPTOR->over(Landroid/view/View;I)V",
            )
        }
    }
}
