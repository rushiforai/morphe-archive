package patches.soundcloud

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import patches.shared.uniqueMatch

// Ported from lootdev78/psylos-morphe-patches ("Hide Cast icon") to SoundCloud 2026.11.02.
// Obfuscated names, registers and hook points were re-derived for this release.

private const val ROOT = "Lcom/soundcloud/android/"

private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun MutableMethod.indexOfOrThrow(what: String, predicate: (Instruction) -> Boolean): Int =
    instructions.indexOfFirst(predicate).takeIf { it >= 0 }
        ?: throw PatchException("SoundCloud $what changed")

context(context: BytecodePatchContext)
private fun target(owner: String, name: String, result: String, vararg parameters: String) =
    Fingerprint(
        definingClass = "$ROOT$owner;",
        name = name,
        returnType = result,
        parameters = parameters.toList(),
    ).uniqueMatch().method

@Suppress("unused")
val hideCastIconPatch = bytecodePatch(
    name = "Hide Cast icon",
    description = "Hides SoundCloud's Cast button in both the toolbar menu and standalone media route views.",
    default = true,
) {
    compatibleWith(soundcloud)
    dependsOn(originalInput)

    execute {
        val optional = "Lcom/soundcloud/java/optional/Optional;"
        target(
            "cast/ui/DefaultCastButtonInstaller", "a", optional,
            "Landroidx/fragment/app/FragmentActivity;", "Landroid/view/Menu;", "I",
        ).apply {
            // Runs right after the original setVisible(true); p1 is the Cast MenuItem here.
            val index = indexOfOrThrow("Cast menu installer") {
                it.methodRef()?.let { ref -> ref.definingClass == optional && ref.name == "g" } == true
            }
            addInstructions(
                index,
                """
                    const/4 p2, 0x0
                    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;
                """,
            )
        }

        target("cast/ui/DefaultCastButtonInstaller", "b", "V", "${ROOT}cast/ui/ThemeableMediaRouteButton;").apply {
            val index = indexOfOrThrow("Cast view installer") {
                it.methodRef()?.let { ref ->
                    ref.definingClass == "Landroidx/mediarouter/app/MediaRouteButton;" && ref.name == "setDialogFactory"
                } == true
            }
            addInstructions(
                index + 1,
                """
                    const/16 v0, 0x8
                    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V
                """,
            )
        }
    }
}
