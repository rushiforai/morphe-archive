package app.template.patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SPEEDOMETER_EXTENSION = "Lapp/template/extension/extension/MovableSpeedometer;"
private const val COMPOSER = "Landroidx/compose/runtime/Composer;"
private const val MODIFIER = "Landroidx/compose/ui/Modifier;"
private object SpeedometerView : Fingerprint(
    definingClass = "Lcom/waze/view/map/SpeedometerColoredView;",
    name = "<init>",
    parameters = listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;"),
)
private object MainActivityResume : Fingerprint(
    definingClass = "Lcom/waze/MainActivity;", name = "onResume", parameters = emptyList(),
)

private fun speedometerScreen(
    screen: String,
    dial: String,
    dialMethod: String,
    holder: String,
    holderFirst: Boolean = false,
) = Fingerprint(definingClass = screen, custom = { method, _ ->
    val prefix = if (holderFirst) listOf(holder, MODIFIER) else listOf(MODIFIER, holder)
    method.implementation?.instructions?.any {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == dial && ref.name == dialMethod &&
            ref.parameterTypes == prefix + listOf("Z", COMPOSER, "I")
    } == true
})

private const val MODERN_DRIVE = "Lcom/waze/main_screen/p/bb;"
private const val MODERN_MAP = "Lcom/waze/main_screen/t/an;"
private const val LEGACY_DIAL = "Lcom/waze/main_screen/f/c/e;"
private const val STOCK_DIAL = "Lcom/waze/main_screen/i/a/d;"
private const val COMPOSE_DIAL = "Lcom/waze/main_screen/g/b/a/g;"
private const val STOCK_HOLDER = "Lcom/waze/bz/t;"
private const val COMPOSE_HOLDER = "Lcom/waze/by/t;"
private const val OLD_HOLDER = "Lcom/waze/bv/t;"

private val stockMap = speedometerScreen(MODERN_MAP, STOCK_DIAL, "e", STOCK_HOLDER)
private val stockDrive = speedometerScreen(MODERN_DRIVE, STOCK_DIAL, "e", STOCK_HOLDER)
private val composeMap = speedometerScreen(MODERN_MAP, COMPOSE_DIAL, "b", COMPOSE_HOLDER, holderFirst = true)
private val composeDrive = speedometerScreen(MODERN_DRIVE, COMPOSE_DIAL, "b", COMPOSE_HOLDER, holderFirst = true)
private val oldMap = speedometerScreen("Lcom/waze/main_screen/s/al;", LEGACY_DIAL, "a", OLD_HOLDER)
private val oldDrive = speedometerScreen("Lcom/waze/main_screen/o/bl;", LEGACY_DIAL, "a", OLD_HOLDER)

private fun MutableMethod.keepDialVisible(dial: String, dialMethod: String, tracking: String, trackingMethod: String) {
    val instructions = implementation!!.instructions
    fun reference(index: Int) = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
    val dialCall = instructions.indices.single { index ->
        reference(index)?.let { it.definingClass == dial && it.name == dialMethod && it.parameterTypes.size == 5 } == true
    }
    // Use the tracking check immediately feeding the dial. Other controls share this predicate.
    val check = (dialCall - 1 downTo maxOf(0, dialCall - 22)).first { index ->
        reference(index)?.let {
            it.definingClass == tracking && it.name == trackingMethod && it.returnType == "Z" &&
                it.parameterTypes.singleOrNull()?.startsWith("Lcom/waze/map/canvas/") == true
        } == true
    }
    check(instructions[check + 1].opcode == Opcode.MOVE_RESULT)
    val register = when (val call = instructions[check]) {
        is Instruction35c -> call.registerC
        is Instruction3rc -> call.startRegister
        else -> error("Unexpected speedometer tracking check")
    }
    replaceInstruction(check, "invoke-static/range {v$register .. v$register}, $SPEEDOMETER_EXTENSION->showInMapMode(Ljava/lang/Enum;)Z")
}

@Suppress("unused")
val movableSpeedometerPatch = patch(
    name = "Advanced Speedometer",
    description = "Move and resize the in-app speedometer. Double-tap to swap the speedometer and speed limit. Keep the indicator visible while panning the map.",
    default = false,
) {
    compatibleWith(
        Compatibility(name = "Waze", packageName = "com.waze", apkFileType = ApkFileType.APK, appIconColor = 0x33CCFF, targets = listOf(AppTarget(version = null, isExperimental = true))),
        Compatibility(name = "Waze Mod", packageName = "com.chisadin.wazemod", apkFileType = ApkFileType.APK, appIconColor = 0x33CCFF, targets = listOf(AppTarget(version = null, isExperimental = true))),
    )
    extendWith("extensions/extension.mpe")
    execute {
        // Check the named widget exists, then install on the map activity itself.
        // The widget can be constructed with an application context, which has no window.
        SpeedometerView.method
        val method = MainActivityResume.method
        // At entry, p0 is guaranteed to be the Activity; Waze reuses that register later.
        method.addInstructions(0, "invoke-static {p0}, $SPEEDOMETER_EXTENSION->install(Landroid/app/Activity;)V")

        // Unknown experimental builds retain gesture support when no visibility profile matches.
        when {
            stockMap.matchOrNull() != null && stockDrive.matchOrNull() != null -> {
                for (screen in listOf(stockMap, stockDrive)) {
                    screen.method.keepDialVisible(STOCK_DIAL, "e", "Lcom/waze/main_screen/af/b/h;", "d")
                }
            }
            composeMap.matchOrNull() != null && composeDrive.matchOrNull() != null -> {
                for (screen in listOf(composeMap, composeDrive)) {
                    screen.method.keepDialVisible(COMPOSE_DIAL, "b", "Lcom/waze/design_components/d;", "f")
                }
            }
            oldMap.matchOrNull() != null && oldDrive.matchOrNull() != null -> {
                for (screen in listOf(oldMap, oldDrive)) {
                    screen.method.keepDialVisible(LEGACY_DIAL, "a", "Lcom/waze/map/ep;", "f")
                }
            }
        }
    }
}
