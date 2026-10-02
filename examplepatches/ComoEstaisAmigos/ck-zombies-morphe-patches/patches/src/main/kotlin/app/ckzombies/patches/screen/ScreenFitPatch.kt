package app.ckzombies.patches.screen

import app.ckzombies.patches.shared.Constants.COMPATIBILITY_CK_ZOMBIES
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val SCREEN_FIT = "Lapp/ckzombies/extension/ScreenFit;"
internal const val PLATFORM_ACTIVITY = "Lcom/glu/platform/android/GluPlatformActivity;"

/** Builds the game's SurfaceView once the resource screen is done. */
internal object OnResDlDoneFingerprint : Fingerprint(
    definingClass = PLATFORM_ACTIVITY,
    name = "iOnResDLDone",
    returnType = "V",
    parameters = listOf(),
)

/**
 * `onTouchEvent()` hands every position, of every pointer and every batched move, to one of four
 * private methods as (x, y, pointer id). They track the touch and pass it on to the engine.
 */
internal class TouchFingerprint(name: String) : Fingerprint(
    definingClass = PLATFORM_ACTIVITY,
    name = name,
    returnType = "V",
    parameters = listOf("I", "I", "I"),
)

internal val TOUCH_METHODS = listOf("touchBegan", "touchMoved", "touchEnded", "touchCancelled")

private fun Instruction.field() = ((this as? ReferenceInstruction)?.reference as? FieldReference)

/** `ScreenFit.attach()` gets the view right after it is stored in `m_MainView`, before it is added to the layout. */
internal fun attachToMainView(build: MutableMethod) {
    val instructions = build.implementation?.instructions?.toList()
        ?: throw PatchException("iOnResDLDone has no code")
    val stores = instructions.indices.filter {
        instructions[it].opcode == Opcode.IPUT_OBJECT && instructions[it].field()?.name == "m_MainView"
    }
    val store = stores.singleOrNull()
        ?: throw PatchException("iOnResDLDone stores m_MainView ${stores.size} times, expected once")
    val view = (instructions[store] as TwoRegisterInstruction).registerA
    build.addInstruction(store + 1, "invoke-static {v$view}, $SCREEN_FIT->attach(Landroid/view/SurfaceView;)V")
}

/** Each touch method starts by bringing its x and y, `p1` and `p2`, from view to surface pixels. */
internal fun scaleTouch(touch: MutableMethod) {
    val registers = touch.implementation?.registerCount ?: throw PatchException("${touch.name} has no code")
    // p0 is this, then x, y and the pointer id; x and y must be below v16 for invoke-static.
    if (registers - 2 > 15) throw PatchException("${touch.name} has $registers registers, too many to reach y")
    touch.addInstructions(
        0,
        """
            invoke-static {p1}, $SCREEN_FIT->x(I)I
            move-result p1
            invoke-static {p2}, $SCREEN_FIT->y(I)I
            move-result p2
        """,
    )
}

/**
 * `touchBegan()` copies `TOUCH_MOVE_THRESHOLD` into the touch's tracker: how far the finger has
 * to move before the engine hears of a move. The game computed it in display pixels, so it goes
 * through `ScreenFit.threshold()` between the read and the store.
 */
internal fun scaleMoveThreshold(touchBegan: MutableMethod) {
    val instructions = touchBegan.implementation?.instructions?.toList()
        ?: throw PatchException("touchBegan has no code")
    val reads = instructions.indices.filter {
        instructions[it].opcode == Opcode.IGET && instructions[it].field()?.name == "TOUCH_MOVE_THRESHOLD"
    }
    val read = reads.singleOrNull()
        ?: throw PatchException("touchBegan reads TOUCH_MOVE_THRESHOLD ${reads.size} times, expected once")
    val threshold = (instructions[read] as TwoRegisterInstruction).registerA
    val next = instructions.getOrNull(read + 1)
    if (next?.opcode != Opcode.IPUT || next.field()?.name != "m_MoveThreshold" ||
        (next as TwoRegisterInstruction).registerA != threshold
    ) {
        throw PatchException("touchBegan does not store TOUCH_MOVE_THRESHOLD straight into the tracker")
    }
    touchBegan.addInstructions(
        read + 1,
        """
            invoke-static {v$threshold}, $SCREEN_FIT->threshold(I)I
            move-result v$threshold
        """,
    )
}

/**
 * The engine sizes everything from its surface and draws its art unscaled, so on a screen above
 * 720p the menus and text are small and the full screen pictures do not fill it. This gives the
 * engine a surface 720 pixels high, which Android stretches over the screen, and scales touch
 * positions to match (see the extension's `ScreenFit`). Off by default, because the stretched
 * picture is blurrier than the screen's own resolution.
 */
@Suppress("unused")
val screenFitPatch = bytecodePatch(
    name = "Render at 720p",
    description = "Makes the menus, text and pictures full size on screens above 720p, where they are " +
        "otherwise small. The game is drawn at 720p and stretched to the screen, so it looks slightly blurry.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_CK_ZOMBIES)

    extendWith("extensions/extension.mpe")

    execute {
        // Find everything first, so an APK that differs from Glu's is refused before any edit.
        val build = OnResDlDoneFingerprint.method
        val touches = TOUCH_METHODS.associateWith { TouchFingerprint(it).method }

        attachToMainView(build)
        scaleMoveThreshold(touches.getValue("touchBegan"))
        touches.values.forEach(::scaleTouch)
    }
}
