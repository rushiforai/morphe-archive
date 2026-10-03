package app.aidan.patches.aftership.account

import app.aidan.patches.aftership.auth.bypassSignatureCheckResourcePatch
import app.aidan.patches.aftership.shared.Constants.COMPATIBILITY_AFTERSHIP
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val ACCOUNT_FRAGMENT = "LN5/k;"

@Suppress("unused")
val removeAfterShipAccountPageLinksPatch = bytecodePatch(
    name = "Remove AfterShip Account Page Links",
    description = "Removes the About the app, Share the app, and Feedback links from the Account screen.",
    default = true
) {
    compatibleWith(COMPATIBILITY_AFTERSHIP)
    dependsOn(bypassSignatureCheckResourcePatch)

    execute {
        patchAccountFragment()
    }
}

/**
 * Hides the About, Share, and Feedback rows when the Account view is created.
 *
 * @throws PatchException if the Account class or implemented onViewCreated method is missing.
 */
private fun BytecodePatchContext.patchAccountFragment() {
    val classDef = classDefByOrNull(ACCOUNT_FRAGMENT)
        ?: throw PatchException("Class $ACCOUNT_FRAGMENT not found")
    val mutableClass = mutableClassDefBy(classDef)
    val onViewCreatedMethod = mutableClass.methods.firstOrNull {
        it.name == "onViewCreated" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Method onViewCreated not found in $ACCOUNT_FRAGMENT")

    val implementation = onViewCreatedMethod.implementation
        ?: throw PatchException("onViewCreated has no implementation in $ACCOUNT_FRAGMENT")

    val superCallIndex = implementation.instructions.indexOfFirst {
        it.opcode == Opcode.INVOKE_SUPER || it.opcode == Opcode.INVOKE_SUPER_RANGE
    }
    val insertIndex = if (superCallIndex >= 0) superCallIndex + 1 else 3

    onViewCreatedMethod.addInstructions(
        insertIndex,
        """
            const/16 v0, 0x8
            iget-object v1, p0, LN5/k;->p:Lz2/p;
            iget-object v2, v1, Lz2/p;->e:LM0/d;
            iget-object v2, v2, LM0/d;->b:Ljava/lang/Object;
            check-cast v2, Landroid/view/View;
            invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V
            iget-object v2, v1, Lz2/p;->v:LM0/d;
            iget-object v2, v2, LM0/d;->b:Ljava/lang/Object;
            check-cast v2, Landroid/view/View;
            invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V
            iget-object v1, v1, Lz2/p;->r:LM0/d;
            iget-object v1, v1, LM0/d;->b:Ljava/lang/Object;
            check-cast v1, Landroid/view/View;
            invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V
        """.trimIndent()
    )
}
