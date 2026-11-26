package app.bin0culars.patches.reddit.layout.glassnav

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.classDefByOrNull
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HOME_PAGER_SCREEN_CLASS =
    "Lcom/reddit/feedslegacy/switcher/impl/homepager/compose/HomePagerScreen;"
private const val UPDATE_SCROLL_STATE_CLASS =
    "Lcom/reddit/feedslegacy/switcher/impl/homepager/compose/HomePagerScreen\$updateNestedListScrollState\$1;"
private const val TOP_BAR_STATE_EXTENSION_CLASS =
    "Lapp/bin0culars/extension/reddit/GlassTopBarState;"
private const val COMPOSE_RUNTIME_PREFIX = "Landroidx/compose/runtime/"

private object UpdateScrollStateConstructorFingerprint : Fingerprint(
    definingClass = UPDATE_SCROLL_STATE_CLASS,
    name = "<init>",
    returnType = "V",
    parameters = listOf(HOME_PAGER_SCREEN_CLASS, "Z", "L"),
)

private fun isMutableStateFactory(inst: Instruction): MethodReference? =
    ((inst as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf { ref ->
        (inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE) &&
            ref.definingClass.startsWith(COMPOSE_RUNTIME_PREFIX) &&
            ref.parameterTypes.size == 1 &&
            ref.parameterTypes[0].toString() == "Ljava/lang/Object;" &&
            ref.returnType.startsWith("L")
    }

private fun findMutableStateFactory(): MethodReference? {
    val screenClass = classDefByOrNull(HOME_PAGER_SCREEN_CLASS) ?: return null
    return screenClass.methods.firstNotNullOfOrNull { method ->
        method.implementation?.instructions?.firstNotNullOfOrNull(::isMutableStateFactory)
    }
}

internal fun hookGlassTopBarAtTop() {
    val constructorMethod = UpdateScrollStateConstructorFingerprint.methodOrNull ?: return
    val stateFactoryRef = findMutableStateFactory() ?: return

    fillBridge(
        "createState",
        """
            invoke-static { p0 }, ${stateFactoryRef.toSmali()}
            move-result-object p0
            return-object p0
        """,
        extensionClass = TOP_BAR_STATE_EXTENSION_CLASS,
    )
    constructorMethod.addInstructions(
        0,
        "invoke-static/range { p2 .. p2 }, $SEARCH_EXTENSION_CLASS->onFeedAtTop(Z)V",
    )
    hookGlassFeedRegistry()
}
