package app.s.chzzk.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.localRegisterCount
import app.s.chzzk.common.utils.parameterTypeNames
import app.s.chzzk.common.utils.smaliReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val FOLLOWING = "Lcom/navercorp/game/android/community/app/ui/home/following/"
private const val COMPOSER = "Landroidx/compose/runtime/Composer;"
private const val FUNCTION = "Lkotlin/jvm/functions/Function1;"

internal fun BytecodePatchContext.addFollowingEntryHooks() {
    val androidView = classDefBy("Landroidx/compose/ui/viewinterop/AndroidView_androidKt;").methods.single {
        it.returnType == "V" && it.parameterTypeNames ==
            listOf(FUNCTION, "Landroidx/compose/ui/Modifier;", FUNCTION, COMPOSER, "I", "I")
    }
    val settings = mutableClassDefBy(SETTINGS)
    val original = settings.methods.single {
        it.name == "renderFollowingEntry" && it.parameterTypeNames == listOf("Ljava/lang/Object;") &&
            it.returnType == "V"
    }
    val render = MutableMethod(ImmutableMethod(
        SETTINGS, original.name, original.parameters, original.returnType, original.accessFlags,
        original.annotations, original.hiddenApiRestrictions,
        ImmutableMethodImplementation(7, emptyList(), emptyList(), emptyList())
    ))
    render.addInstructions(0, """
        invoke-static {}, $SETTINGS->followingEntryFactory()Ljava/lang/Object;
        move-result-object v0
        check-cast v0, $FUNCTION
        const/4 v1, 0x0
        const/4 v2, 0x0
        move-object v3, p0
        check-cast v3, $COMPOSER
        const/4 v4, 0x0
        const/4 v5, 0x6
        invoke-static/range {v0 .. v5}, ${androidView.smaliReference}
        return-void
    """.trimIndent())
    settings.methods.remove(original)
    settings.methods.add(render)
    if (packageMetadata.versionName in setOf("1.3.0", "1.4.0")) {
        addTvFollowingEntry()
        return
    }
    addProfileFollowEntry()
    val candidates = mutableListOf<String>()
    classDefForEach { owner ->
        if (owner.type.startsWith(FOLLOWING)) {
            owner.methods.filter { method ->
                method.name == "invoke" && method.parameterTypeNames ==
                    List(3) { "Ljava/lang/Object;" } && method.implementation?.instructions?.let { instructions ->
                    instructions.any {
                        it.opcode == Opcode.CHECK_CAST &&
                            it.getReference<TypeReference>()?.type == "Landroidx/compose/foundation/layout/ColumnScope;"
                    } && instructions.any {
                        it.getReference<MethodReference>()?.definingClass == "${FOLLOWING}FollowingTabScreenKt;"
                    }
                } == true
            }.forEach { candidates.add(owner.type) }
        }
    }
    val owner = candidates.single()
    val method = mutableClassDefBy(owner).methods.single {
        it.name == "invoke" && it.parameterTypeNames == List(3) { "Ljava/lang/Object;" }
    }
    val instructions = method.implementation!!.instructions
    val column = instructions.indexOfFirst {
        it.opcode == Opcode.CHECK_CAST &&
            it.getReference<TypeReference>()?.type == "Landroidx/compose/foundation/layout/ColumnScope;"
    }
    val gate = (column + 1 until instructions.size).first { index ->
        instructions[index].getReference<MethodReference>()?.let {
            it.definingClass == COMPOSER && it.returnType == "Z" && it.parameterTypeNames == listOf("I", "Z")
        } == true
    }
    check(instructions[gate + 1].opcode == Opcode.MOVE_RESULT && instructions[gate + 2].opcode == Opcode.IF_EQZ)
    check(instructions[gate + 3].getReference<MethodReference>()?.let {
        it.definingClass == "Landroidx/compose/runtime/State;" && it.returnType == "Ljava/lang/Object;"
    } == true)
    val composer = (instructions[gate] as FiveRegisterInstruction).registerC
    method.addInstructions(gate + 3,
        "invoke-static/range {v$composer .. v$composer}, $SETTINGS->renderFollowingEntry(Ljava/lang/Object;)V")
}

private fun Instruction.registers(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is ThreeRegisterInstruction -> listOf(registerA, registerB, registerC)
    is TwoRegisterInstruction -> listOf(registerA, registerB)
    is OneRegisterInstruction -> listOf(registerA)
    else -> emptyList()
}

private fun BytecodePatchContext.addProfileFollowEntry() {
    val channel = "Lcom/navercorp/game/android/community/data/core/entity/channel/StreamingChannelDetail;"
    val model = "Lcom/navercorp/game/android/community/app/ui/home/channel/ChannelViewModel;"
    val screen = mutableClassDefBy("Lcom/navercorp/game/android/community/app/ui/home/channel/ChannelScreenKt;")
        .methods.single {
            it.parameterTypeNames == listOf("Landroidx/compose/ui/Modifier;", model, COMPOSER, "I")
        }
    val instructions = screen.implementation!!.instructions.toList()
    val infoCast = instructions.indexOfFirst {
        (it.opcode == Opcode.CHECK_CAST && it.getReference<TypeReference>()?.type == channel) ||
            it.getReference<MethodReference>()?.returnType == channel
    }
    check(infoCast >= 0)
    val infoField = instructions.take(infoCast).mapNotNull { it.getReference<FieldReference>() }
        .last { it.definingClass == model && it.type == "Landroidx/lifecycle/MutableLiveData;" }
    val getters = listOf("channelId", "channelName", "channelImageUrl").map { field ->
        classDefBy(channel).methods.single { method ->
            method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/String;" &&
                method.implementation?.instructions?.count() == 2 &&
                method.implementation?.instructions?.any {
                    it.getReference<FieldReference>()?.let { ref -> ref.definingClass == channel && ref.name == field } == true
                } == true
        }
    }
    val settings = mutableClassDefBy(SETTINGS)
    val bodies = mapOf(
        "profileChannel" to """
            if-eqz p0, :missing
            check-cast p0, $model
            iget-object p0, p0, ${infoField.smaliReference}
            invoke-virtual {p0}, Landroidx/lifecycle/LiveData;->getValue()Ljava/lang/Object;
            move-result-object p0
            if-eqz p0, :missing
            check-cast p0, $channel
            const/4 v0, 0x3
            new-array v0, v0, [Ljava/lang/String;
            ${getters.mapIndexed { index, getter -> """
                invoke-virtual {p0}, ${getter.smaliReference}
                move-result-object v2
                const/4 v1, $index
                aput-object v2, v0, v1
            """.trimIndent() }.joinToString("\n")}
            return-object v0
            :missing
            const/4 v0, 0x0
            return-object v0
        """,
        "renderProfileFollow" to """
            invoke-static {}, $SETTINGS->profileFollowFactory()Ljava/lang/Object;
            move-result-object v0
            check-cast v0, $FUNCTION
            const/4 v1, 0x0
            move-object v2, v0
            move-object v3, p0
            check-cast v3, $COMPOSER
            const/4 v4, 0x0
            const/4 v5, 0x2
            invoke-static/range {v0 .. v5}, ${classDefBy("Landroidx/compose/ui/viewinterop/AndroidView_androidKt;").methods.single {
                it.returnType == "V" && it.parameterTypeNames == listOf(FUNCTION, "Landroidx/compose/ui/Modifier;", FUNCTION, COMPOSER, "I", "I")
            }.smaliReference}
            return-void
        """,
    )
    for ((name, body) in bodies) {
        val original = settings.methods.single { it.name == name }
        val bridge = MutableMethod(ImmutableMethod(SETTINGS, name, original.parameters,
            original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions,
            ImmutableMethodImplementation(7, emptyList(), emptyList(), emptyList())))
        bridge.addInstructions(0, body.trimIndent())
        settings.methods.remove(original)
        settings.methods.add(bridge)
    }
    val buttons = instructions.withIndex().filter {
        it.value.getReference<MethodReference>()?.let { ref ->
            ref.definingClass == "Lcom/navercorp/game/android/community/ui/common/ui/channel/button/ChannelMotionButtonScreenKt;" &&
                ref.name == "a" && ref.parameterTypeNames.size == 9 && ref.parameterTypeNames[6] == COMPOSER
        } == true
    }
    check(buttons.isNotEmpty())
    for ((index, instruction) in buttons.reversed()) {
        val composer = instruction.registers()[6]
        screen.addInstructions(index + 1,
            "invoke-static/range {v$composer .. v$composer}, $SETTINGS->renderProfileFollow(Ljava/lang/Object;)V")
    }
    screen.addInstructions(0,
        "invoke-static/range {p1 .. p1}, $SETTINGS->captureProfileModel(Ljava/lang/Object;)V")
}

private fun BytecodePatchContext.addTvFollowingEntry() {
    val owner = mutableClassDefBy("Lcom/navercorp/game/android/community/tv/ui/TvScreenKt;")
    val nav = "Lcom/navercorp/game/android/community/tv/feature/navigation/NavComposableWithMainTopLevel;"
    val method = owner.methods.single {
        it.returnType == "V" && it.parameterTypeNames ==
            listOf("Landroidx/tv/material3/NavigationDrawerScope;", "Landroidx/compose/ui/Modifier;", nav,
                "Z", "Z", FUNCTION, FUNCTION, FUNCTION, COMPOSER, "I", "I")
    }
    val instructions = method.implementation!!.instructions
    val call = instructions.withIndex().single {
        it.value.getReference<MethodReference>()?.let { ref ->
            ref.definingClass == "Lcom/navercorp/game/android/community/tv/ui/component/GNBMenuItemKt;" &&
                ref.parameterTypeNames.size == 10 && ref.parameterTypeNames[8] == COMPOSER
        } == true
    }.index
    val range = instructions[call] as RegisterRangeInstruction
    check(range.registerCount == 10)
    val composer = range.startRegister + 8
    val scratch = range.startRegister + 9
    check(scratch < method.localRegisterCount && instructions.drop(call + 1).none { scratch in it.registers() })

    val settings = mutableClassDefBy(SETTINGS)
    val name = "renderTvFollowingEntry"
    check(settings.methods.none { it.name == name })
    val bridge = MutableMethod(ImmutableMethod(
        SETTINGS, name, List(2) { ImmutableMethodParameter("Ljava/lang/Object;", emptySet(), null) },
        "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList())
    ))
    bridge.addInstructions(0, """
        instance-of v0, p1, Lcom/navercorp/game/android/community/tv/ui/home/NavTopLevelFollowingComposable;
        if-eqz v0, :done
        invoke-static/range {p0 .. p0}, $SETTINGS->renderFollowingEntry(Ljava/lang/Object;)V
        :done
        return-void
    """.trimIndent())
    settings.methods.add(bridge)
    method.addInstructions(call + 1, """
        move-object/from16 v$scratch, p2
        invoke-static/range {v$composer .. v$scratch}, ${bridge.smaliReference}
    """.trimIndent())
}
