package app.pomee4.patches.reddit.commentswipe

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.findFreeRegister
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val EXTENSION_CLASS = "Lapp/pomee4/extension/commentswipe/PostSwipe;"

/**
 * Post parts with their own horizontal swipes (galleries and carousels) keep the area they are laid out
 * in, so a post swipe that starts outside of them is not left to them.
 *
 * @param ownSwipeSections The section types of the parts.
 * @param sectionComposable The composable of feed post sections, (context, composer, changed).
 */
internal fun BytecodePatchContext.ownSwipeAreas(
    ownSwipeSections: List<String>,
    positionModifier: PositionModifier,
    sectionComposable: Method,
) {
    val composableParameters = sectionComposable.parameterTypes.map { it.toString() }

    // The key of a feed section: the String method without parameters of the section interface.
    val keyMethod = ownSwipeSections.asSequence()
        .flatMap { type -> classDefByOrNull(type)?.interfaces?.asSequence() ?: emptySequence() }
        .mapNotNull { classDefByOrNull(it) }
        .filter { anInterface ->
            anInterface.methods.any {
                it.name == sectionComposable.name && it.parameterTypes.map { p -> p.toString() } == composableParameters
            }
        }
        .mapNotNull { anInterface ->
            anInterface.methods.singleOrNull { it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty() }
        }
        .firstOrNull() ?: throw PatchException("No section key method")
    implementStub(
        "sectionKey", "Ljava/lang/String;",
        """
            instance-of p1, p0, ${keyMethod.definingClass}
            if-eqz p1, :no_key
            check-cast p0, ${keyMethod.definingClass}
            invoke-interface { p0 }, ${keyMethod.definingClass}->${keyMethod.name}()Ljava/lang/String;
            move-result-object p1
            return-object p1
            :no_key
            const/4 p1, 0x0
            return-object p1
        """
    )

    // Each part starts its content from the default modifier: sget-object vM, <default Modifier>.
    var hooked = 0
    ownSwipeSections.forEach { type ->
        val composable = mutableClassDefBy(type).methods.firstOrNull {
            it.name == sectionComposable.name && it.implementation != null &&
                it.parameterTypes.map { p -> p.toString() } == composableParameters
        } ?: return@forEach
        val instructions = composable.implementation!!.instructions.toList()
        val index = instructions.indexOfFirst {
            it.opcode == Opcode.SGET_OBJECT &&
                (it as ReferenceInstruction).reference == positionModifier.defaultModifier
        }
        if (index < 0) return@forEach
        val modifierRegister = (instructions[index] as OneRegisterInstruction).registerA
        val sectionRegister = composable.findFreeRegister(index + 1, modifierRegister)
        if (modifierRegister > 15 || sectionRegister > 15) return@forEach
        composable.addInstructions(
            index + 1,
            """
                move-object/from16 v$sectionRegister, p0
                invoke-static { v$modifierRegister, v$sectionRegister }, $EXTENSION_CLASS->onOwnSwipeArea(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$modifierRegister
                check-cast v$modifierRegister, ${positionModifier.modifierType}
            """
        )
        hooked++
    }
    if (hooked == 0) throw PatchException("No gallery or carousel layout found")
}
