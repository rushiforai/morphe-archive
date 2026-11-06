package app.ayufa.patches.transit.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21s
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Makes a view permanently GONE by setting its visibility right
 * after the super-constructor call, before the constructor body
 * runs. At that point no local register holds anything the rest of
 * the constructor needs (the pre-super code only passes arguments
 * through the parameter registers), so writing the constant to v0
 * is safe. p0 is `this` and stays valid for the whole constructor.
 *
 * Used on the ad placement views, whose own load/render methods
 * are R8-obfuscated per screen, while the view classes and their
 * constructors kept stable names and signatures.
 */
internal fun MutableMethod.goneAfterSuperInit() {
    addInstructions(
        superInitIndex() + 1,
        """
            const/16 v0, 0x8
            invoke-virtual { p0, v0 }, Landroid/view/View;->setVisibility(I)V
        """
    )
}

internal fun MutableMethod.superInitIndex(): Int {
    val methodInstructions = implementation?.instructions
        ?: throw PatchException("constructor has no implementation: $this")
    val superIndex = methodInstructions.indexOfFirst { instruction ->
        (instruction.opcode == Opcode.INVOKE_DIRECT ||
            instruction.opcode == Opcode.INVOKE_DIRECT_RANGE) &&
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                ?.name == "<init>"
    }
    if (superIndex < 0) {
        throw PatchException("No super constructor call found in $this")
    }
    return superIndex
}

/**
 * Makes an activity finish itself right after its super.onCreate()
 * call, so the screen never becomes visible. Used for the LY
 * linkage promotion modal.
 */
internal fun MutableMethod.finishImmediatelyAfterSuperOnCreate() {
    addInstructions(
        superOnCreateIndex() + 1,
        """
            invoke-virtual { p0 }, Landroid/app/Activity;->finish()V
            return-void
        """
    )
}

internal fun MutableMethod.superOnCreateIndex(): Int {
    val methodInstructions = implementation?.instructions
        ?: throw PatchException("onCreate has no implementation: $this")
    val superIndex = methodInstructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_SUPER &&
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                ?.name == "onCreate"
    }
    if (superIndex < 0) {
        throw PatchException("No super.onCreate() call found in $this")
    }
    return superIndex
}

/**
 * Rewrites every View.setVisibility(int) call inside this method
 * so the argument is forced to GONE (8) immediately before the
 * call, whatever the caller computed. Used on the ad views'
 * visibility state machines, which otherwise force the ad slot's
 * inner root and ad container back to VISIBLE on every ad state
 * change. Insertions run from the last call site backwards so
 * earlier indices stay valid.
 */
internal fun MutableMethod.forceVisibilityCallsGone() {
    val methodInstructions = implementation?.instructions ?: return
    val callSites = methodInstructions.mapIndexedNotNull { index, instruction ->
        val reference =
            (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if ((instruction.opcode == Opcode.INVOKE_VIRTUAL ||
                instruction.opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
            reference?.name == "setVisibility" &&
            reference.returnType == "V" &&
            reference.parameterTypes == listOf("I")
        ) {
            index
        } else {
            null
        }
    }
    callSites.sortedDescending().forEach { index ->
        val argRegister = when (val instruction = methodInstructions[index]) {
            is Instruction35c -> instruction.registerD
            is Instruction3rc -> instruction.startRegister + 1
            else -> return@forEach
        }
        addInstructions(index, "const/16 v$argRegister, 0x8")
    }
}

/**
 * Adds a setVisibility(int) override to this class that always
 * applies GONE, whatever the caller asked for. Several ad slots
 * are re-shown by code outside the view itself (state collectors,
 * image-load callbacks in the ad manager package all call
 * View.setVisibility(VISIBLE) on the view), so hiding at
 * construction time or inside the view's own state machine is
 * not enough; the override intercepts every show request at
 * dispatch time. No-op if the class already declares the method.
 */
internal fun MutableClass.pinVisibilityGone() {
    val alreadyDeclared = methods.any {
        it.name == "setVisibility" && it.parameterTypes == listOf("I")
    }
    if (alreadyDeclared) return

    val viewSetVisibility = ImmutableMethodReference(
        "Landroid/view/View;",
        "setVisibility",
        listOf("I"),
        "V"
    )
    val implementation = MutableMethodImplementation(3)
    implementation.addInstruction(BuilderInstruction21s(Opcode.CONST_16, 0, 8))
    implementation.addInstruction(
        BuilderInstruction35c(
            Opcode.INVOKE_SUPER, 2, 1, 0, 0, 0, 0, viewSetVisibility
        )
    )
    implementation.addInstruction(BuilderInstruction10x(Opcode.RETURN_VOID))
    val override = MutableMethod(
        ImmutableMethod(
            type,
            "setVisibility",
            listOf(ImmutableMethodParameter("I", null, null)),
            "V",
            AccessFlags.PUBLIC.value,
            null,
            null,
            implementation
        )
    )
    virtualMethods.add(override)
}
