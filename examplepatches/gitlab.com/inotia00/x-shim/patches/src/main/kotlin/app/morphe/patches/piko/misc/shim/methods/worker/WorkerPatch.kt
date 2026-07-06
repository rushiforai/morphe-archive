package app.morphe.patches.piko.misc.shim.methods.worker

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.piko.misc.shim.methods.advancedModeEnabled
import app.morphe.patches.piko.misc.shim.methods.patchModeCheckPatch
import app.morphe.patches.piko.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c

val workerPatch = bytecodePatch(
    description = "Worker",
) {
    dependsOn(patchModeCheckPatch)

    execute {
        if (!advancedModeEnabled()) {
            return@execute
        }

        val localField = OfflinePingSenderConstructorFingerprint
            .getReference<FieldReference>()!!

        val helperMethod = OfflinePingSenderSyntheticFingerprint
            .getReference<MethodReference>()!!

        val successResultType: TypeReference
        val successResultMethod: MethodReference
        val failureResultType: TypeReference
        val failureResultMethod: MethodReference

        OfflineNotificationPosterDoWorkFingerprint.apply {
            successResultType = getReference<TypeReference>(1)!!
            successResultMethod = getReference<MethodReference>(2)!!
            failureResultType = getReference<TypeReference>(4)!!
            failureResultMethod = getReference<MethodReference>(5)!!
        }

        OfflinePingSenderDoWorkFingerprint.let {
            val registerCount = 2
            val tryStartIndex = 0
            val tryEndIndex = 4
            val catchIndex = 5
            val exceptionType = "Landroid/os/RemoteException;"

            val instructions = listOf(
                // :try_start_0
                ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 1, localField),
                ImmutableInstruction35c(Opcode.INVOKE_INTERFACE, 1, 0, 0, 0, 0, 0, helperMethod),
                ImmutableInstruction21c(Opcode.NEW_INSTANCE, 0, successResultType),
                ImmutableInstruction35c(Opcode.INVOKE_DIRECT, 1, 0, 0, 0, 0, 0, successResultMethod),
                // :try_end_0
                // .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
                ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
                // :catch_0
                ImmutableInstruction11x(Opcode.MOVE_EXCEPTION, 0),
                ImmutableInstruction21c(Opcode.NEW_INSTANCE, 0, failureResultType),
                ImmutableInstruction35c(Opcode.INVOKE_DIRECT, 1, 0, 0, 0, 0, 0, failureResultMethod),
                ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)
            )

            var currentAddress = 0
            var tryStartAddress = 0
            var tryEndAddress = 0
            var catchAddress = 0

            for ((i, element) in instructions.withIndex()) {
                if (i == tryStartIndex) tryStartAddress = currentAddress
                if (i == tryEndIndex) tryEndAddress = currentAddress
                if (i == catchIndex) catchAddress = currentAddress

                currentAddress += element.codeUnits
            }

            val tryCodeUnitCount = tryEndAddress - tryStartAddress

            val exceptionHandler = ImmutableExceptionHandler(exceptionType, catchAddress)
            val tryBlock =
                ImmutableTryBlock(tryStartAddress, tryCodeUnitCount, listOf(exceptionHandler))

            it.method.apply {
                val assembledMethod = ImmutableMethod(
                    definingClass,
                    name,
                    parameters,
                    returnType,
                    accessFlags,
                    null,
                    null,
                    ImmutableMethodImplementation(
                        registerCount,
                        instructions,
                        listOf(tryBlock),
                        null
                    )
                ).toMutable()

                it.classDef.methods.remove(this)
                it.classDef.methods.add(assembledMethod)
            }
        }
    }
}
