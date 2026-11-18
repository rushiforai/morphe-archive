package app.afterglow.patches.playback

import app.afterglow.patches.litho.afterglowLithoFilterPatch
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.shared.smali
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/** Both action bars retain reactive component state independently of their host views. */
internal val watchActionsHookPatch = bytecodePatch {
    dependsOn(afterglowLithoFilterPatch)
    execute {
        val conversion = Fingerprint(returnType = "Ljava/lang/Object;",
            parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), filters = listOf(
                string("Template produced null Element"),
                methodCall(parameters = List(5) { "L" }, returnType = "L")
            ))
        val method = conversion.method
        val call = conversion.instructionMatches.last()
        val convert = call.methodReference
        val instructions = method.implementation!!.instructions.toList()
        val registers = instructions[call.index].invokeRegisters
        val contextType = convert.parameterTypes[0].toString()
        val conversionType = convert.parameterTypes[1].toString()
        val elementType = convert.parameterTypes[2].toString()
        fun read(type: String) = instructions.withIndex().single { (_, instruction) ->
            instruction.opcode == Opcode.IGET_OBJECT &&
                ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.type == type
        }
        val contextRead = read(conversionType)
        val contextField = (contextRead.value as ReferenceInstruction).reference as FieldReference
        val ownerRegister = (contextRead.value as TwoRegisterInstruction).registerB
        val elementRead = read(elementType)
        val modelType = ((elementRead.value as ReferenceInstruction).reference as FieldReference).definingClass
        val modelRegister = (elementRead.value as TwoRegisterInstruction).registerB
        val owner = mutableClassDefBy(contextField.definingClass)

        val update = Fingerprint(returnType = "V", parameters = listOf("Ljava/lang/Object;"),
            filters = listOf(string("updateState:ComponentType.triggerStateUpdate"))).method
        val subscriber = owner.fields.single { it.type == update.definingClass }
        val disposed = owner.methods.single { it.parameterTypes.isEmpty() && it.returnType == "Z" }
        val moveContext = owner.methods.single { it.parameterTypes == listOf(contextType) && it.returnType == "V" }
        val constructor = mutableClassDefBy(method.definingClass).methods.single {
            it.name == "<init>" && it.parameterTypes == listOf("Ljava/lang/Object;", "I")
        }
        val subscribe = owner.methods.single { candidate -> candidate.implementation?.instructions?.any {
            (it as? ReferenceInstruction)?.reference == constructor
        } == true }
        val subscribeInstructions = subscribe.implementation!!.instructions.toList()
        val constructorIndex = subscribeInstructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.smali == constructor.smali
        }
        val discriminatorRegister = subscribeInstructions[constructorIndex].invokeRegisters.last()
        val discriminator = subscribeInstructions.take(constructorIndex).last {
            it is NarrowLiteralInstruction && (it as? com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction)?.registerA == discriminatorRegister
        } as NarrowLiteralInstruction

        val bridge = "$EXTENSION_PACKAGE/playback/WatchActionsController;"
        owner.interfaces.add(bridge)
        fun field(name: String, type: String): String {
            owner.fields.add(ImmutableField(owner.type, name, type, AccessFlags.PRIVATE.value,
                null, null, null).toMutable())
            return "${owner.type}->$name:$type"
        }
        val model = field("afterglow_actionModel", modelType)
        val context = field("afterglow_actionContext", contextType)
        fun bridgeMethod(name: String, parameters: List<String>, result: String, registers: Int, body: String) {
            owner.methods.add(ImmutableMethod(owner.type, name,
                parameters.map { ImmutableMethodParameter(it, null, null) }, result,
                AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or AccessFlags.DECLARED_SYNCHRONIZED.value,
                null, null, MutableMethodImplementation(registers)).toMutable().apply {
                addInstructions(0, """
                    monitor-enter p0
                    :start
                    $body
                    :end
                    monitor-exit p0
                    ${if (result == "V") "return-void" else "return v0"}
                    :error
                    move-exception v0
                    monitor-exit p0
                    throw v0
                """)
                guardWatchActionsMonitor()
            })
        }
        bridgeMethod("afterglow_rememberActions", List(2) { "Ljava/lang/Object;" }, "V", 4, """
            invoke-virtual { p0 }, ${disposed.smali}
            move-result v0
            if-nez v0, :end
            check-cast p1, $modelType
            iput-object p1, p0, $model
        """)
        bridgeMethod("afterglow_refreshActions", emptyList(), "Z", 5, """
            invoke-virtual { p0 }, ${disposed.smali}
            move-result v0
            if-nez v0, :unavailable
            iget-object v1, p0, $model
            if-eqz v1, :unavailable
            iget-object v2, p0, $context
            if-eqz v2, :unavailable
            new-instance v0, ${method.definingClass}
            const/16 v3, ${discriminator.narrowLiteral}
            invoke-direct { v0, p0, v3 }, ${constructor.smali}
            invoke-virtual { v0, v1, v2 }, ${method.smali}
            move-result-object v1
            iget-object v0, p0, ${subscriber.smali}
            if-eqz v0, :unavailable
            invoke-virtual { v0, v1 }, ${update.smali}
            const/4 v0, 0x1
            goto :end
            :unavailable
            const/4 v0, 0x0
        """)
        // Keep the component's newest scoped context when Litho transfers its state.
        val contextEmit = moveContext.implementation!!.instructions.indexOfFirst {
            val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
            reference?.parameterTypes == listOf("Ljava/lang/Object;") && reference.returnType == "V"
        }
        if (contextEmit < 0) throw PatchException("Reactive component has no context emission")
        // The native monitor and disposed checks already guard this call.
        moveContext.addInstructions(contextEmit, "iput-object p1, p0, $context")
        // Initial subscription also publishes its scoped context while holding the
        // native owner monitor. Cache it there, so deferred model observations can
        // never overwrite a newer context after Litho transfers ownership.
        val emit = (moveContext.implementation!!.instructions[contextEmit + 1] as ReferenceInstruction)
            .reference as MethodReference
        val subscribeContextEmit = subscribe.implementation!!.instructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.smali == emit.smali
        }
        val contextParameter = subscribe.parameterTypes.map { it.toString() }.withIndex()
            .single { it.value == contextType }.index + 1
        require(subscribeContextEmit >= 0) { "Reactive subscription has no context emission" }
        subscribe.addInstructions(subscribeContextEmit, "iput-object p$contextParameter, p0, $context")
        // Mirror native disposal. Cached data lives on the owner, never in a global strong map.
        for (candidate in owner.methods.toList()) {
            if (candidate.name == "<init>" || conversionType in candidate.parameterTypes) continue
            val clears = candidate.implementation?.instructions?.withIndex()?.filter { (_, instruction) ->
                instruction.opcode == Opcode.IPUT_OBJECT &&
                    ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.smali == contextField.smali
            } ?: continue
            for ((index, instruction) in clears.reversed()) {
                val write = instruction as TwoRegisterInstruction
                candidate.addInstructions(index + 1, """
                    iput-object v${write.registerA}, v${write.registerB}, $model
                    iput-object v${write.registerA}, v${write.registerB}, $context
                """)
            }
        }
        if (listOf(ownerRegister, modelRegister, registers[1], registers[2]).any { it >= 16 })
            throw PatchException("Watch actions conversion registers no longer fit the verified call")
        method.addInstructions(call.index, """
            invoke-static { v$ownerRegister, v$modelRegister, v${registers[1]}, v${registers[2]} }, $EXTENSION_PACKAGE/playback/WatchActions;->observe($bridge${"Ljava/lang/Object;".repeat(2)}$EXTENSION_PACKAGE/litho/LithoContext;)V
        """)
        println("Afterglow watch actions: ${method.smali}, state ${owner.type}, update ${update.smali}")
    }
}
