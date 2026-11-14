package app.s.chzzk.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.parameterTypeNames
import app.s.chzzk.common.utils.smaliReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val MODIFIER = "Landroidx/compose/ui/Modifier;"
private const val COMPOSER = "Landroidx/compose/runtime/Composer;"
private const val DETAIL = "Lcom/navercorp/game/android/community/ui/common/ui/overlayplayerend/live/streaming/StreamingLiveDetail;"
private const val STATUS = "Lcom/navercorp/game/android/community/data/core/entity/serviceplayable/StreamingLiveStatus;"

internal fun BytecodePatchContext.addPlayerInfoBackgroundHooks() {
    val color = classDefBy("Landroidx/compose/ui/graphics/ColorKt;").methods.single {
        it.parameterTypeNames == listOf("I") && it.returnType == "J"
    }
    val shape = classDefBy("Landroidx/compose/ui/graphics/RectangleShapeKt;").fields.single {
        AccessFlags.STATIC.isSet(it.accessFlags) && it.type.startsWith("L")
    }
    val background = classDefBy("Landroidx/compose/foundation/BackgroundKt;").methods.single {
        it.parameterTypeNames == listOf(MODIFIER, "J", "Landroidx/compose/ui/graphics/Shape;") && it.returnType == MODIFIER
    }
    uiBridge("playerInfoModifier", 6, """
        invoke-static {}, $SETTINGS->playerInfoBackgroundEnabled()Z
        move-result v0
        if-eqz v0, :original
        invoke-static {}, $SETTINGS->playerInfoColor()I
        move-result v0
        invoke-static {v0}, ${color.smaliReference}
        move-result-wide v1
        sget-object v3, ${shape.smaliReference}
        check-cast p0, $MODIFIER
        invoke-static {p0, v1, v2, v3}, ${background.smaliReference}
        move-result-object p0
        :original
        return-object p0
    """)

    fun applyToInfoColumn(method: MutableMethod) {
        val call = method.implementation!!.instructions.withIndex().first { (_, instruction) ->
            instruction.getReference<MethodReference>()?.let {
                it.definingClass == "Landroidx/compose/ui/ComposedModifierKt;" &&
                    it.parameterTypes.map(CharSequence::toString) == listOf(COMPOSER, MODIFIER) && it.returnType == MODIFIER
            } == true
        }
        val register = when (val instruction = call.value) {
            is FiveRegisterInstruction -> instruction.registerD
            is RegisterRangeInstruction -> instruction.startRegister + 1
            else -> error("Unexpected info modifier invocation")
        }
        method.addInstructions(call.index, """
            invoke-static/range {v$register .. v$register}, $CHAT_UI->playerInfoModifier(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$register
            check-cast v$register, $MODIFIER
        """.trimIndent())
    }

    val simple = mutableClassDefBy("Lcom/navercorp/game/android/community/app/ui/overlayplayerend/live/simple/SimpleLiveEndInfoScreenKt;")
        .methods.single { it.parameterTypeNames.take(3) == listOf(MODIFIER, DETAIL, STATUS) }
    applyToInfoColumn(simple)
    val liveItem = "Lcom/navercorp/game/android/community/data/core/entity/serviceplayable/StreamingLiveItem;"
    val opened = classDefBy(liveItem).methods.single { method ->
        method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/String;" &&
            method.implementation?.instructions?.count() == 2 &&
            method.implementation?.instructions?.any {
                it.getReference<FieldReference>()?.let { field -> field.definingClass == liveItem && field.name == "openDate" } == true
            } == true
    }
    val animated = mutableListOf<Pair<String, String>>()
    classDefForEach { definition ->
        if (definition.fields.any { it.type == DETAIL } && definition.fields.any { it.type == STATUS }) {
            definition.methods.filter { method ->
                method.returnType == "Ljava/lang/Object;" && method.parameterTypeNames == List(4) { "Ljava/lang/Object;" } &&
                    method.implementation?.instructions?.any { instruction ->
                        instruction.getReference<MethodReference>()?.let {
                            it.definingClass == liveItem && it.name == opened.name && it.returnType == "Ljava/lang/String;"
                        } == true
                    } == true
            }.forEach { animated.add(definition.type to it.name) }
        }
    }
    check(animated.size == 1) { "CHZZK animated broadcast info contract changed: $animated" }
    val (owner, name) = animated.single()
    applyToInfoColumn(mutableClassDefBy(owner).methods.single { it.name == name && it.parameterTypes.size == 4 })
}
