package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import dev.twitchpatches.patches.twitch.reload.nativeReloadMethod
import dev.twitchpatches.patches.twitch.shared.*

private const val BRIDGE = "Ldev/twitchpatches/extension/ui/UiComposeBridge;"

internal fun BytecodePatchContext.injectUiComposition() {
    val all = mutableListOf<Method>()
    classDefForEach { all.addAll(it.methods) }
    val contract = resolveUiComposition(all)
    val owner = mutableClassDefBy(BRIDGE)
    val update = owner.methods.filter { it.name == "update" && it.parameterTypes.isEmpty() }.uniqueHook("UI state update bridge")
    owner.methods.remove(update)
    owner.methods.add(nativeReloadMethod(BRIDGE, "update", emptyList(), "V", 3, """
        invoke-static {}, $UI_SETTINGS->snapshot()Ljava/lang/String;
        move-result-object v1
        sget-object v0, $BRIDGE->state:Ljava/lang/Object;
        if-nez v0, :existing
        invoke-static {v1}, ${contract.factory}
        move-result-object v0
        sput-object v0, $BRIDGE->state:Ljava/lang/Object;
        return-void
        :existing
        check-cast v0, ${contract.factory.returnType}
        const/4 v2, 0x0
        invoke-virtual {v0, v2, v1}, ${contract.setter.reference}
        return-void
    """, static = true))
    owner.methods.add(nativeReloadMethod(BRIDGE, "hidden", listOf("Ljava/lang/String;", contract.composer), "Z", 5, """
        sget-object v0, $BRIDGE->state:Ljava/lang/Object;
        check-cast v0, ${contract.collect.parameterTypes[0]}
        invoke-static {v0, p1}, ${contract.collect}
        move-result-object v0
        invoke-interface {v0}, ${contract.value}
        invoke-static/range {p0 .. p0}, $UI_SETTINGS->enabled(Ljava/lang/String;)Z
        move-result v0
        return v0
    """, static = true))
    injectNativeUiMenus(all, contract)
    restoreVerticalLayoutControls(all, contract)
    val train = all.filter { it.returnType == "V" && it.parameterTypes.size == 3 &&
        it.parameterTypes[1] == contract.composer &&
        it.hasStrings("VerticalTheatreHypeTrainHighlightsFragment/arguments")
    }.uniqueHook("native vertical Hype Train container")
    val trainWrapper = uiWrapper(train, "verticalHypeTrain", contract, """
        const-string v1, "hide_hype_trains"
        invoke-static {v1, v0}, $BRIDGE->hidden(Ljava/lang/String;${contract.composer})Z
        move-result v1
        if-nez v1, :done
    """)
    owner.methods.add(trainWrapper)
    replaceUiCalls(all.filter { it.references().any { ref -> ref.toString() == train.reference } }, train.reference, trainWrapper)
    for ((layout, renderer) in listOf("classic" to contract.classic, "vertical" to contract.vertical)) {
        for ((part, original) in contract.controls) {
            if (renderer.references().none { it.toString() == original.reference }) continue
            val key = "${layout}_controls_hide_$part"
            val wrapper = uiWrapper(original, "${layout}_$part", contract,
                "const-string v1, \"$key\"\ninvoke-static {v1, v0}, $BRIDGE->hidden(Ljava/lang/String;${contract.composer})Z\nmove-result v1\nif-nez v1, :done")
            owner.methods.add(wrapper)
            replaceUiCalls(listOf(renderer), original.reference, wrapper)
        }
    }
    val support = contract.support
    val wrapper = uiWrapper(support, "channelAction", contract, """
        sget-object v1, ${contract.subscribe}
        if-eq p1, v1, :subscribe
        sget-object v1, ${contract.gift}
        if-eq p1, v1, :gift
        goto :render
        :subscribe
        const-string v1, "vertical_support_hide_subscribe"
        goto :check
        :gift
        const-string v1, "vertical_support_hide_gift"
        :check
        invoke-static {v1, v0}, $BRIDGE->hidden(Ljava/lang/String;${contract.composer})Z
        move-result v1
        if-nez v1, :done
        :render
    """)
    owner.methods.add(wrapper)
    replaceUiCalls(contract.actionCallers.getValue(support.reference), support.reference, wrapper)
    val bits = uiWrapper(contract.bits, "vertical_bits", contract, """
        const-string v1, "vertical_support_hide_bits"
        invoke-static {v1, v0}, $BRIDGE->hidden(Ljava/lang/String;${contract.composer})Z
        move-result v1
        if-nez v1, :done
    """)
    owner.methods.add(bits)
    replaceUiCalls(contract.supportCallers, contract.bits.reference, bits)
    contract.classicActions.forEach { (part, original) ->
        val action = uiWrapper(original, "classic_$part", contract, """
            const-string v1, "classic_support_hide_$part"
            invoke-static {v1, v0}, $BRIDGE->hidden(Ljava/lang/String;${contract.composer})Z
            move-result v1
            if-nez v1, :done
        """)
        owner.methods.add(action)
        replaceUiCalls(contract.actionCallers.getValue(original.reference), original.reference, action)
    }
    injectClassicActionState(owner, contract.classicRow)
    val row = uiWrapper(contract.classicRow.renderer, "classicActionRow", contract, """
        invoke-static/range {p0 .. p0}, $BRIDGE->filteredClassicModel(${contract.classicRow.renderer.parameterTypes[0]})${contract.classicRow.renderer.parameterTypes[0]}
        move-result-object p0
        invoke-static/range {p0 .. p0}, $BRIDGE->classicActionsEmpty(${contract.classicRow.renderer.parameterTypes[0]})Z
        move-result v1
        if-nez v1, :done
    """)
    owner.methods.add(row)
    replaceNativeUiCalls(contract.actionCallers.getValue(contract.classicRow.renderer.reference), contract.classicRow.renderer.reference, row)
    injectClassicHeader(all, owner, contract.classicRow)
    injectMetadataActions(all, owner, contract)
}

internal fun uiWrapper(original: Method, name: String, contract: UiCompositionContract, condition: String): app.morphe.patcher.util.proxy.mutableTypes.MutableMethod {
    require(original.returnType == "V" && com.android.tools.smali.dexlib2.AccessFlags.STATIC.isSet(original.accessFlags) &&
        com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.isSet(original.accessFlags) &&
        original.parameterTypes.none { it == "J" || it == "D" } && original.parameterTypes.count { it == contract.composer } == 1) {
        "UI settings: native renderer parameter contract changed."
    }
    return nativeReloadMethod(BRIDGE, name, original.parameterTypes.map { it.toString() }, "V", original.parameterTypes.size + 3, """
        move-object v0, p${original.parameterTypes.indexOfFirst { it.toString() == contract.composer }}
        check-cast v0, ${contract.concrete}
        const v1, ${name.hashCode()}
        invoke-virtual {v0, v1}, ${contract.start}
        $condition
        invoke-static/range {p0 .. p${original.parameterTypes.size - 1}}, ${original.reference}
        :done
        invoke-virtual {v0}, ${contract.end}
        return-void
    """, static = true)
}

private fun BytecodePatchContext.replaceUiCalls(methods: List<Method>, original: String, replacement: MethodReference) {
    rewriteUiCalls(methods, original, replacement) { source ->
        mutableClassDefBy(source.definingClass).methods.single { it.reference == source.reference }
    }
}

internal fun rewriteUiCalls(methods: List<Method>, original: String, replacement: MethodReference,
    mutableMethod: (Method) -> MutableMethod) {
    methods.forEach { source ->
        if (source.implementation?.instructions?.none {
            (it as? ReferenceInstruction)?.reference?.toString() == original
        } != false) return@forEach
        val method = mutableMethod(source)
        method.code().withIndex().filter { (it.value as? ReferenceInstruction)?.reference?.toString() == original }.forEach { (index, call) ->
            method.replaceInstruction(index, when (call) {
                is FiveRegisterInstruction -> BuilderInstruction35c(call.opcode, call.registerCount, call.registerC,
                    call.registerD, call.registerE, call.registerF, call.registerG, replacement)
                is RegisterRangeInstruction -> BuilderInstruction3rc(call.opcode, call.startRegister, call.registerCount, replacement)
                else -> error("UI settings: unsupported native composition invocation.")
            })
        }
    }
}
