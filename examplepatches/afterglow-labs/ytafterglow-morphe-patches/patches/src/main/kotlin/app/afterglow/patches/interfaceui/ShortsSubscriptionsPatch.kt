package app.afterglow.patches.interfaceui

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.shared.smali
import app.afterglow.patches.shared.writtenRegisters
import app.afterglow.patches.tweaks.navigation.shortsButtonsHookPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.security.MessageDigest

private const val BINDINGS = "$EXTENSION_PACKAGE/interfaceui/ShortsSubscriptionsBindings;"
private const val OWNER = "$EXTENSION_PACKAGE/interfaceui/ShortsSubscriptionsBindings\$Owner;"
private const val ELEMENT_COMMAND = "Lcom/google/protos/youtube/elements/CommandOuterClass\$Command;"

private fun instructionsByAddress(method: Method): Map<Int, Instruction> {
    var address = 0
    return method.implementation!!.instructions.associate { instruction ->
        (address to instruction).also { address += instruction.codeUnits }
    }
}

private val shortsSubscriptionsResourcePatch = resourcePatch {
    execute {
        document("res/values/ids.xml").use { doc ->
            doc.documentElement.appendChild(doc.createElement("item").apply {
                setAttribute("type", "id")
                setAttribute("name", "afterglow_shorts_subscriptions_role")
            })
        }
    }
}

/** Only the owning component's primary click command may establish its subscription role. */
internal val shortsSubscriptionsHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    // Reuse the same native tag map and mount lifecycle as the header buttons.
    // No header policy or generic paused-player visibility is changed.
    dependsOn(shortsButtonsHookPatch, shortsSubscriptionsResourcePatch)
    execute {
        val binding = Fingerprint(definingClass = "Lvrx;", name = "e", returnType = "V",
            parameters = listOf("Lhfs;", "Lwuw;", "Ljava/lang/String;", "Ljava/lang/Object;", "Lwwa;", "Lwuf;"),
            filters = listOf(
                methodCall(smali = "Lwbv;->N()Z"),
                methodCall(smali = "Lwbv;->s()Lwbq;"),
                methodCall(smali = "Lxso;->C(Lwbq;Lwuw;)Lxso;"),
                methodCall(smali = "Lvrs;-><init>(Lvrx;Lxso;Lwwa;Lwuf;Lwuw;)V"),
                methodCall(smali = "Lwwa;->p(Lwvv;)V"),
            )).match()
        val original = binding.method.implementation!!.instructions.toList()
        val commandGetter = binding.instructionMatches[1]
        val commandResult = original[commandGetter.index + 1]
        val commandRegister = (commandResult as? OneRegisterInstruction)?.registerA
        require(binding.method.implementation!!.registerCount == 15
                && commandGetter.instruction.invokeRegisters == listOf(12)
                && commandResult.opcode == Opcode.MOVE_RESULT_OBJECT && commandRegister == 1
                && binding.instructionMatches[2].index == commandGetter.index + 2
                && binding.instructionMatches[2].instruction.invokeRegisters == listOf(11, 1, 10)
                && binding.instructionMatches[3].instruction.invokeRegisters == listOf(1, 2, 3, 4, 5, 6)
                && binding.instructionMatches[4].instruction.invokeRegisters == listOf(4, 1)) {
            "Shorts primary command and owning builder registers changed"
        }
        require(original.take(commandGetter.index).none { 13 in it.writtenRegisters }) {
            "Primary command owner is no longer the native builder parameter"
        }
        require(original.count {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.smali == "Lwbv;->s()Lwbq;"
        } == 1) { "Primary click command getter is ambiguous" }

        // Verify the complete primary click chain, including separation from long-click.
        Fingerprint(definingClass = "Lvmr;", name = "p", parameters = listOf("Lwvv;"), returnType = "V",
            filters = listOf(fieldAccess(smali = "Lvmr;->n:Ljava/util/List;", opcode = Opcode.IPUT_OBJECT),
                methodCall(smali = "Ljava/util/List;->add(Ljava/lang/Object;)Z"))).method
        Fingerprint(definingClass = "Lvmr;", name = "b", parameters = listOf("Lhfs;"), returnType = "Lhfn;",
            filters = listOf(fieldAccess(smali = "Lvmr;->O:Z", opcode = Opcode.IPUT_BOOLEAN),
                fieldAccess(smali = "Lvmr;->n:Ljava/util/List;"),
                fieldAccess(smali = "Lvmu;->E:Ljava/util/List;", opcode = Opcode.IPUT_OBJECT))).method
        Fingerprint(definingClass = "Lvmr;", name = "L", parameters = emptyList(), returnType = "V",
            strings = listOf("Element already built!"), filters = listOf(fieldAccess(smali = "Lvmr;->O:Z"))).method
        Fingerprint(definingClass = "Lvmu;", name = "aC", parameters = listOf("Lhfs;"), returnType = "Lhfn;",
            filters = listOf(fieldAccess(smali = "Lvmu;->E:Ljava/util/List;"),
                fieldAccess(smali = "Lvmv;->e:Ljava/util/List;", opcode = Opcode.IPUT_OBJECT),
                methodCall(smali = "Lhfk;->s(Lhhl;)V"))).method
        Fingerprint(definingClass = "Lhfk;", name = "s", parameters = listOf("Lhhl;"), returnType = "V",
            filters = listOf(methodCall(smali = "Lhji;->h(Lhhl;)V"))).method
        Fingerprint(definingClass = "Lhji;", name = "h", parameters = listOf("Lhhl;"), returnType = "V",
            filters = listOf(fieldAccess(smali = "Lhji;->r:Lhhl;", opcode = Opcode.IPUT_OBJECT))).method
        Fingerprint(definingClass = "Lvrs;", name = "a", returnType = "V",
            parameters = listOf("Landroid/view/View;", "Lwzs;", "Landroid/view/MotionEvent;"),
            filters = listOf(fieldAccess(smali = "Lvrs;->e:Lxso;"),
                methodCall(smali = "Lxso;->y()$ELEMENT_COMMAND"),
                methodCall(smali = "Lwuj;->a(${ELEMENT_COMMAND}Lwug;)Lbuop;"))).method

        // Lwbq.f serializes only this one Elements Command. Never scan an element
        // buffer and never call Lxso.y, FutureTask.run, or the native dispatcher.
        Fingerprint(definingClass = "Lxso;", name = "z", returnType = ELEMENT_COMMAND,
            parameters = listOf("Lwbq;", "Lwwm;", "Lwuw;"), filters = listOf(
                methodCall(smali = "Lwbq;->f()[B"),
                fieldAccess(smali = "$ELEMENT_COMMAND->a:$ELEMENT_COMMAND"),
                methodCall(smali = "Lbbjw;->parseFrom(Lbbjw;[BLcom/google/protobuf/ExtensionRegistryLite;)Lbbjw;"))).method
        Fingerprint(definingClass = "Lbglu;", name = "<clinit>", returnType = "V", filters = listOf(literal(169495254L))).method
        Fingerprint(definingClass = "Lblie;", name = "<clinit>", returnType = "V", filters = listOf(literal(139608561L))).method
        val schemaMethod = Fingerprint(definingClass = "Lblie;", name = "dynamicMethod", returnType = "Ljava/lang/Object;").method
        val schema = schemaMethod.implementation!!.instructions.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
        }.single { it.startsWith("\u0001;") }
        require(MessageDigest.getInstance("SHA-256").digest(schema.toByteArray(Charsets.UTF_8))
            .joinToString("") { "%02x".format(it) } == "8f84dacff5daa3676080a66cc3bfb07021fc530187c3c78af07c624d0a1bad59") {
            "Reel endpoint source field26 schema changed"
        }
        val enumCode = instructionsByAddress(Fingerprint(definingClass = "Lazkf;", name = "aM",
            parameters = listOf("I"), returnType = "I").method)
        val enumSwitch = enumCode[0] as? OffsetInstruction ?: error("Reel source enum switch changed")
        val enumTable = enumCode[enumSwitch.codeOffset] as? SwitchPayload ?: error("Reel source table changed")
        val sourceTarget = enumTable.switchElements.single { it.key == 32 }.offset
        require((enumCode[sourceTarget] as? NarrowLiteralInstruction)?.narrowLiteral == 33)
        val labels = instructionsByAddress(Fingerprint(definingClass = "Lathz;", name = "apply",
            parameters = listOf("Ljava/lang/Object;"), returnType = "Ljava/lang/Object;").method)
        require(labels.any { (address, instruction) ->
            instruction.opcode == Opcode.PACKED_SWITCH &&
                (labels[address + (instruction as OffsetInstruction).codeOffset] as? SwitchPayload)?.switchElements?.any { entry ->
                    entry.key == 33 &&
                        ((labels[address + entry.offset] as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                        "REEL_WATCH_ENDPOINT_SOURCE_PAUSED_STATE_SUBSCRIPTIONS"
                } == true
        }) { "Reel source32 is no longer the paused subscriptions source" }

        for (type in listOf("Lvmr;", "Lwvq;")) {
            val owner = mutableClassDefBy(type)
            require(owner.interfaces.contains("$EXTENSION_PACKAGE/navigation/ShortsHeaderBindings\$TagBuilder;")
                    && !owner.interfaces.contains(OWNER)
                    && owner.methods.none { it.name == "afterglow_subscriptionOwner" })
            if (type == "Lvmr;") require(owner.superclass == "Ljava/lang/Object;"
                    && owner.methods.none { it.name == "equals" || it.name == "hashCode" }) {
                "Subscription builder no longer has native object identity"
            }
            owner.interfaces.add(OWNER)
            if (type == "Lvmr;") owner.addMethod("afterglow_subscriptionOwner", "Ljava/lang/Object;", 1,
                "return-object p0")
            else {
                Fingerprint(definingClass = type, name = "p", parameters = listOf("Lwvv;"), returnType = "V",
                    filters = listOf(fieldAccess(smali = "$type->a:Lwwa;"),
                        methodCall(smali = "Lwwa;->p(Lwvv;)V"))).method
                owner.addMethod("afterglow_subscriptionOwner", "Ljava/lang/Object;", 3, """
                    iget-object v0, p0, $type->a:Lwwa;
                    instance-of v1, v0, $OWNER
                    if-eqz v1, :unknown
                    check-cast v0, $OWNER
                    invoke-interface { v0 }, $OWNER->afterglow_subscriptionOwner()Ljava/lang/Object;
                    move-result-object v0
                    return-object v0
                    :unknown
                    const/4 v0, 0x0
                    return-object v0
                """)
            }
        }
        val bridge = "afterglow_subscriptionsPrimary"
        val extension = mutableClassDefBy(BINDINGS)
        require(extension.methods.none { it.name == bridge })
        extension.methods.add(ImmutableMethod(BINDINGS, bridge,
            listOf(ImmutableMethodParameter("Lwbq;", null, null), ImmutableMethodParameter("Ljava/lang/Object;", null, null)),
            "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            MutableMethodImplementation(3)).toMutable().apply { addInstructions(0, """
                invoke-static {}, $BINDINGS->shouldInspect()Z
                move-result v0
                if-eqz v0, :done
                invoke-interface { p0 }, Lwbq;->f()[B
                move-result-object v0
                invoke-static { p1, v0 }, $BINDINGS->primaryCommand(Ljava/lang/Object;[B)V
                goto :done
                :failed
                move-exception v0
                invoke-static { v0 }, $BINDINGS->failure(Ljava/lang/Throwable;)V
                const/4 v0, 0x0
                invoke-static { p1, v0 }, $BINDINGS->primaryCommand(Ljava/lang/Object;[B)V
                :done
                return-void
            """)
                // InlineSmaliCompiler returns instructions only; .catch text
                // would discard the exception table. Add the actual DEX region.
                implementation!!.apply {
                    require(instructions.size == 12 && instructions[7].opcode == Opcode.MOVE_EXCEPTION)
                    addCatch("Ljava/lang/Throwable;", newLabelForIndex(3), newLabelForIndex(6), newLabelForIndex(7))
                }
            })
        binding.method.addInstructions(commandGetter.index + 2,
            "invoke-static { v1, v13 }, $BINDINGS->$bridge(Lwbq;Ljava/lang/Object;)V")

        val mount = Fingerprint(definingClass = "Lhiy;", name = "q", returnType = "V",
            parameters = listOf("Ljava/lang/Object;", "Lhhx;"), filters = listOf(
                fieldAccess(smali = "Lhji;->r:Lhhl;"),
                methodCall(smali = "Landroid/view/View;->setOnClickListener(Landroid/view/View\$OnClickListener;)V"),
                methodCall(smali = "Landroid/view/View;->setTag(ILjava/lang/Object;)V"))).method
        val content = mount.implementation!!.registerCount - 2
        require(mount.implementation!!.instructions.none { it.opcode != Opcode.CHECK_CAST && content in it.writtenRegisters })
        mount.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }.asReversed().forEach { index ->
                mount.addInstructionsAtControlFlowLabel(index,
                    "invoke-static/range { p0 .. p0 }, $BINDINGS->mounted(Ljava/lang/Object;)V")
            }
        val unmount = Fingerprint(definingClass = "Lhiy;", name = "u", returnType = "V",
            parameters = listOf("Ljava/lang/Object;", "Lhhx;", "I"), filters = listOf(
                methodCall(smali = "Landroid/view/View;->setTag(ILjava/lang/Object;)V"))).method
        unmount.addInstructions(0, "invoke-static/range { p0 .. p0 }, $BINDINGS->unmounted(Ljava/lang/Object;)V")
        println("Afterglow paused subscriptions: primary endpoint source32, exact native builder tag and view restoration")
    }
}
