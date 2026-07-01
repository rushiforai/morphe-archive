package app.cesbar.patches.velov

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

// TODO: Make smarter fingerprints instead of hardcoded ones.  
object a0MethodFingerprint : Fingerprint(
    definingClass = "Lcom/jcdecaux/vls/app/map/wrapper/DefaultMapWrapper;",
    name = "a0",
    parameters = listOf("Lcom/google/android/gms/maps/model/LatLng;", "F", "Lkotlin/jvm/functions/Function0;", "Z"),
    returnType = "V"
)

object h0MethodFingerprint : Fingerprint(
    definingClass = "Lcom/jcdecaux/vls/app/map/wrapper/DefaultMapWrapper;",
    name = "h0",
    parameters = listOf("Lcom/google/android/gms/maps/model/LatLng;", "Ljava/lang/Float;", "Ljava/lang/Float;"),
    returnType = "V"
)

object eMethodFingerprint : Fingerprint(
    definingClass = "Lcom/jcdecaux/vls/app/map/wrapper/DefaultMapWrapper;",
    name = "E",
    parameters = listOf("Lcom/jcdecaux/vls/app/map/model/MapItem;", "Lkotlin/jvm/functions/Function0;"),
    returnType = "V"
)

object j0MethodFingerprint : Fingerprint(
    definingClass = "Lcom/jcdecaux/vls/app/map/wrapper/DefaultMapWrapper;",
    name = "j0",
    parameters = listOf("Lcom/jcdecaux/vls/app/map/wrapper/DefaultMapWrapper;", "Ly2/a;"),
    returnType = "V"
)


@Suppress("unused")
val disableAllMapAnimationsPatch = bytecodePatch(
    name = "Disable map animations",
    description = "Disable the map zoom-in animation"
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val instantMoveMethodRef = ImmutableMethodReference(
            "Ly2/c;", 
            "i", 
            listOf("Ly2/a;"),
            "V"
        )

        val methodsToPatch = listOfNotNull(
            a0MethodFingerprint.method,
            h0MethodFingerprint.method,
            eMethodFingerprint.method,
            j0MethodFingerprint.method
        )


        methodsToPatch.forEach { method ->
            val implementation = method.implementation as? MutableMethodImplementation ?: return@forEach
            val instructions = implementation.instructions

            val instructionIndicesToReplace = instructions.withIndex().filter { (_, inst) ->
                val ref = (inst as? ReferenceInstruction)?.reference as? MethodReference ?: return@filter false
                ref.definingClass == "Ly2/c;" && (ref.name == "c" || ref.name == "d")
            }.map { it.index }

            instructionIndicesToReplace.forEach { index ->
                val originalInst = instructions[index] as? Instruction35c ?: return@forEach

                val newInst = BuilderInstruction35c(
                    originalInst.opcode,
                    2,
                    originalInst.registerC,
                    originalInst.registerD,
                    0, 0, 0,
                    instantMoveMethodRef
                )

                method.replaceInstruction(index, newInst)
            }
        }
    }
}