package app.dieroboter.patches.flappybird

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22c
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.value.ImmutableEncodedValue
import com.android.tools.smali.dexlib2.immutable.value.ImmutableFloatEncodedValue
import com.android.tools.smali.dexlib2.immutable.value.ImmutableIntEncodedValue
import app.dieroboter.patches.shared.Constants.COMPATIBILITY_FLAPPY_BIRD

// Adaptive layout values, added to GameActivity as public static fields by
// this patch and read by the edited methods via sget. They are computed from
// the real display size in GameActivity.a() (see ADAPTIVE_COMPUTE_BLOCK) and
// carry the stock (512) layout as their initial values, so any read before
// that computation still yields the original layout.
private const val F_HEIGHT = "Lcom/dotgears/GameActivity;->adaptiveHeight:F"
private const val F_HEIGHT_INT = "Lcom/dotgears/GameActivity;->adaptiveHeightInt:I"
private const val F_MINUS_8 = "Lcom/dotgears/GameActivity;->adaptiveHeightMinus8:I"
private const val F_MINUS_112 = "Lcom/dotgears/GameActivity;->adaptiveHeightMinus112:I"
private const val F_MINUS_172 = "Lcom/dotgears/GameActivity;->adaptiveHeightMinus172:I"
private const val F_HALF_MINUS_10 = "Lcom/dotgears/GameActivity;->adaptiveHalfMinus10:I"
private const val F_HALF_MINUS_36 = "Lcom/dotgears/GameActivity;->adaptiveHalfMinus36:I"
private const val F_HALF_MINUS_106 = "Lcom/dotgears/GameActivity;->adaptiveHalfMinus106:I"
private const val F_HALF_MINUS_110 = "Lcom/dotgears/GameActivity;->adaptiveHalfMinus110:I"
private const val F_HALF_MINUS_126 = "Lcom/dotgears/GameActivity;->adaptiveHalfMinus126:I"
private const val F_PIPE_MIN = "Lcom/dotgears/GameActivity;->adaptivePipeMin:I"
private const val F_PIPE_MAX = "Lcom/dotgears/GameActivity;->adaptivePipeMax:I"

private val ADAPTIVE_FIELDS: List<Triple<String, String, ImmutableEncodedValue>> = listOf(
    Triple("adaptiveHeight", "F", ImmutableFloatEncodedValue(512.0f)),
    Triple("adaptiveHeightInt", "I", ImmutableIntEncodedValue(512)),
    Triple("adaptiveHeightMinus8", "I", ImmutableIntEncodedValue(504)),
    Triple("adaptiveHeightMinus112", "I", ImmutableIntEncodedValue(400)),
    Triple("adaptiveHeightMinus172", "I", ImmutableIntEncodedValue(340)),
    Triple("adaptiveHalfMinus10", "I", ImmutableIntEncodedValue(246)),
    Triple("adaptiveHalfMinus36", "I", ImmutableIntEncodedValue(220)),
    Triple("adaptiveHalfMinus106", "I", ImmutableIntEncodedValue(150)),
    Triple("adaptiveHalfMinus110", "I", ImmutableIntEncodedValue(146)),
    Triple("adaptiveHalfMinus126", "I", ImmutableIntEncodedValue(130)),
    Triple("adaptivePipeMin", "I", ImmutableIntEncodedValue(180)),
    Triple("adaptivePipeMax", "I", ImmutableIntEncodedValue(360)),
)

/** Replaces const/16 loads of [literal] with sget of [fieldRef] (same register). */
private fun MutableMethod.replaceConst16WithField(literal: Int, fieldRef: String, count: Int = 1) {
    requireLiteralIndices(literal, Opcode.CONST_16, count).forEach { index ->
        val register = getInstruction<OneRegisterInstruction>(index).registerA
        replaceInstruction(index, "sget v$register, $fieldRef")
    }
}

/**
 * Replaces rsub-int loads of [literal] (vA = literal - vB) with the field
 * equivalent: sget vS, fieldRef; sub-int vA, vS, vB. At every rsub site in
 * this codebase the destination register equals the source register, so the
 * field value cannot be loaded into vA first (it would destroy vB); it goes
 * through [scratch] instead. Each call site passes a register that a
 * forward-liveness check on the stock method shows is rewritten before any
 * read after the site. Re-searches after each replacement because the
 * inserted instruction shifts later indices.
 */
private fun MutableMethod.replaceRsubWithField(literal: Int, fieldRef: String, scratch: Int, count: Int = 1) {
    repeat(count) {
        val index = literalIndices(literal, Opcode.RSUB_INT).firstOrNull()
            ?: throw PatchException("rsub-int $literal not found in $definingClass->$name")
        val insn = getInstruction<TwoRegisterInstruction>(index)
        replaceInstruction(index, "sget v$scratch, $fieldRef")
        addInstructions(index + 1, "sub-int v${insn.registerA}, v$scratch, v${insn.registerB}")
    }
}

/**
 * Replaces an add-int/lit16 of [literal] (vA = vB + literal) with the field
 * equivalent through [scratch] (same dest == source situation as
 * [replaceRsubWithField]): sget vS, fieldRef; add-int vA, vS, vB.
 */
private fun MutableMethod.replaceAddLit16WithField(literal: Int, fieldRef: String, scratch: Int) {
    val index = requireLiteralIndices(literal, Opcode.ADD_INT_LIT16).single()
    val insn = getInstruction<TwoRegisterInstruction>(index)
    replaceInstruction(index, "sget v$scratch, $fieldRef")
    addInstructions(index + 1, "add-int v${insn.registerA}, v$scratch, v${insn.registerB}")
}

/** Deletes the [iget P; iget f.d; add-int/2addr; add-int/lit8] offset block (port: removed). */
private fun MutableMethod.deletePipeOffsetBlock() {
    val instrs = implementation!!.instructions
    val start = instrs.indices.firstOrNull { i ->
        instrs[i].refString() == "Lcom/dotgears/flappy/c;->P:Lcom/dotgears/f;" &&
            instrs[i + 1].refString() == "Lcom/dotgears/f;->d:I" &&
            instrs[i + 2].opcode == Opcode.ADD_INT_2ADDR &&
            instrs[i + 3].opcode == Opcode.ADD_INT_LIT8
    } ?: throw PatchException("Pipe offset block not found in $definingClass->$name")
    removeInstructions(start, 4)
}

/**
 * Replaces a K:/R: pipe setup span (position computed from atlas fields, then
 * f.a(II) positions the element) with the port's fixed flag setup:
 * const/4 v1, 0; f.F = false; f.G = false.
 */
private fun MutableMethod.replacePipeSetupWithFlags(fieldRef: String, span: Int) {
    val instrs = implementation!!.instructions
    val start = instrs.indices.firstOrNull { i ->
        instrs[i].refString() == fieldRef &&
            instrs[i + span - 1].refString() == "Lcom/dotgears/f;->a(II)V"
    } ?: throw PatchException("Pipe setup span not found in $definingClass->$name")
    removeInstructions(start, span)
    addInstructions(
        start,
        """
        const/4 v1, 0x0
        iput-boolean v1, v0, Lcom/dotgears/f;->F:Z
        iput-boolean v1, v0, Lcom/dotgears/f;->G:Z
        """,
    )
}

// Window handling inserted into GameActivity.onCreate right after the super
// call, in two pieces. The head holds the guarded cutout/immersive work;
// the tail (getDecorView + legacy system-UI flags) runs unconditionally and
// is the convergence point of the head's three forward branches.
//
// The split is load-bearing. The head's branches target the tail through an
// ExternalLabel, never through a label written inside inserted text: when
// this block was inserted whole at superCall + 1 (dev.1), the inline
// compiler resolved the in-text :flappy_port_cond label one instruction
// early — onto the hide call instead of the trailing getDecorView — so on
// the SDK-guard paths v1 reached the hide call holding an int and the
// method failed verification on every device (VerifyError at class load).
//
// The getDecorView() at the head is also load-bearing: on Android 17
// PhoneWindow.getInsetsController() dereferences the DecorView field
// directly, so calling it before the DecorView exists throws inside the
// framework getter (the null-check on the returned controller below cannot
// catch that). Forcing the DecorView into existence first keeps the insets
// call safe on Android 17 and changes nothing on older versions, where the
// getter created the DecorView itself.
private const val ONCREATE_WINDOW_HEAD = """
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
    move-result-object v0
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v1
    sget v1, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
    const/16 v2, 0x1c
    if-lt v1, v2, :flappy_port_cond
    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager${'$'}LayoutParams;
    move-result-object v1
    const/4 v2, 0x1
    iput v2, v1, Landroid/view/WindowManager${'$'}LayoutParams;->layoutInDisplayCutoutMode:I
    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager${'$'}LayoutParams;)V
    sget v1, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
    const/16 v2, 0x1e
    if-lt v1, v2, :flappy_port_cond
    const/4 v1, 0x0
    invoke-virtual {v0, v1}, Landroid/view/Window;->setDecorFitsSystemWindows(Z)V
    invoke-virtual {v0}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;
    move-result-object v1
    if-eqz v1, :flappy_port_cond
    const/4 v2, 0x2
    invoke-interface {v1, v2}, Landroid/view/WindowInsetsController;->setSystemBarsBehavior(I)V
    const/4 v2, 0x3
    invoke-interface {v1, v2}, Landroid/view/WindowInsetsController;->hide(I)V
"""

private const val ONCREATE_WINDOW_TAIL = """
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;
    move-result-object v1
    const/16 v2, 0x1706
    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V
"""

/**
 * Computes the adaptive layout values from the display size and stores them
 * in GameActivity's static fields. World height H = 288 * screenHeight /
 * screenWidth, clamped to a minimum of 384 (the 4:3 layout height) and a
 * maximum of 560 (see below). Runs at the top of GameActivity.a(), before
 * the camera and resolution policy are built from adaptiveHeight; v0 and
 * v2 are scratch (the stock method writes both before reading them), v1
 * holds H.
 *
 * The size comes from Display.getRealMetrics (the full physical panel),
 * NOT Resources.getDisplayMetrics: at engine-init time the latter can
 * report the app-area height with system-bar/cutout insets still deducted
 * (observed on a 1080x2400 phone: 2100 px, yielding H=560 instead of 640),
 * and with that inconsistent input the render mapping fell a few pixels
 * short of the panel's bottom edge - a black sliver under the ground with
 * the pipes (which extend below the world bottom) showing through it.
 * Real metrics are immune to the window state, and on displays where the
 * plain metrics were already the full panel they return the same numbers.
 *
 * The 560 ceiling is deliberate, at the user's request: it keeps the
 * framing that the accidental 560 layout produced on his phone (sprites
 * ~14% larger than the 640 layout). The engine cover-scales the world to
 * the panel and crops the side margins symmetrically; every UI element in
 * this game is center- or bottom-anchored, so the panel and buttons keep
 * their distances from the screen edges and only the scrolling pipes and
 * the background edges ever leave the frame. Screens whose natural H is
 * below 560 (16:9 and shorter) never reach the ceiling.
 *
 * Every derived value is the linear function of H that passes through both
 * known layouts (stock at H=512, the port at H=640), so H=512 reproduces
 * stock exactly and H=640 reproduces the port exactly:
 *   Minus8 = H-8, Minus112 = H-112 (ground top), Minus172 = H-172,
 *   HalfMinusK = H/2-K (center-anchored positions),
 *   PipeMin = 180 + (H-512)*28/128, PipeMax = 360 + (H-512)*56/128
 * (the pipe gap random range; its endpoints were hand-tuned in both builds,
 * so it is interpolated rather than anchored). Below H=512 the interpolated
 * PipeMax is additionally capped at H-152: the linear value's margin above
 * the ground top (H-112) would otherwise shrink past the stock 40 units and
 * cross the ground line near H=441, letting pipe gaps spawn inside the
 * ground. The cap equals the linear value at H=512 and never binds at or
 * above it, so both known layouts stay exact.
 */
private const val ADAPTIVE_COMPUTE_BLOCK = """
    invoke-virtual {p0}, Lcom/dotgears/GameActivity;->getWindowManager()Landroid/view/WindowManager;
    move-result-object v0
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;
    move-result-object v0
    new-instance v2, Landroid/util/DisplayMetrics;
    invoke-direct {v2}, Landroid/util/DisplayMetrics;-><init>()V
    invoke-virtual {v0, v2}, Landroid/view/Display;->getRealMetrics(Landroid/util/DisplayMetrics;)V
    iget v1, v2, Landroid/util/DisplayMetrics;->heightPixels:I
    int-to-float v1, v1
    iget v0, v2, Landroid/util/DisplayMetrics;->widthPixels:I
    int-to-float v0, v0
    div-float/2addr v1, v0
    const/high16 v0, 0x43900000
    mul-float/2addr v1, v0
    const/high16 v0, 0x43c00000
    cmpg-float v0, v1, v0
    if-gez v0, :flappy_adaptive_clamped
    const/high16 v1, 0x43c00000
    :flappy_adaptive_clamped
    const/high16 v0, 0x440c0000
    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F
    move-result v1
    sput v1, Lcom/dotgears/GameActivity;->adaptiveHeight:F
    float-to-int v0, v1
    sput v0, Lcom/dotgears/GameActivity;->adaptiveHeightInt:I
    const/high16 v0, 0x41000000
    sub-float v0, v1, v0
    float-to-int v0, v0
    sput v0, Lcom/dotgears/GameActivity;->adaptiveHeightMinus8:I
    const/high16 v0, 0x42e00000
    sub-float v0, v1, v0
    float-to-int v0, v0
    sput v0, Lcom/dotgears/GameActivity;->adaptiveHeightMinus112:I
    const/high16 v0, 0x432c0000
    sub-float v0, v1, v0
    float-to-int v0, v0
    sput v0, Lcom/dotgears/GameActivity;->adaptiveHeightMinus172:I
    const/high16 v0, 0x3f000000
    mul-float v0, v1, v0
    const/high16 v2, 0x41200000
    sub-float/2addr v0, v2
    float-to-int v0, v0
    sput v0, Lcom/dotgears/GameActivity;->adaptiveHalfMinus10:I
    const/high16 v0, 0x3f000000
    mul-float v0, v1, v0
    const/high16 v2, 0x42100000
    sub-float/2addr v0, v2
    float-to-int v0, v0
    sput v0, Lcom/dotgears/GameActivity;->adaptiveHalfMinus36:I
    const/high16 v0, 0x3f000000
    mul-float v0, v1, v0
    const/high16 v2, 0x42d40000
    sub-float/2addr v0, v2
    float-to-int v0, v0
    sput v0, Lcom/dotgears/GameActivity;->adaptiveHalfMinus106:I
    const/high16 v0, 0x3f000000
    mul-float v0, v1, v0
    const/high16 v2, 0x42dc0000
    sub-float/2addr v0, v2
    float-to-int v0, v0
    sput v0, Lcom/dotgears/GameActivity;->adaptiveHalfMinus110:I
    const/high16 v0, 0x3f000000
    mul-float v0, v1, v0
    const/high16 v2, 0x42fc0000
    sub-float/2addr v0, v2
    float-to-int v0, v0
    sput v0, Lcom/dotgears/GameActivity;->adaptiveHalfMinus126:I
    const/high16 v0, 0x44000000
    sub-float v0, v1, v0
    const/high16 v2, 0x3e600000
    mul-float/2addr v0, v2
    const/high16 v2, 0x43340000
    add-float/2addr v0, v2
    float-to-int v0, v0
    sput v0, Lcom/dotgears/GameActivity;->adaptivePipeMin:I
    const/high16 v0, 0x44000000
    sub-float v0, v1, v0
    const/high16 v2, 0x3ee00000
    mul-float/2addr v0, v2
    const/high16 v2, 0x43b40000
    add-float/2addr v0, v2
    const/high16 v2, 0x43180000
    sub-float v2, v1, v2
    cmpg-float v2, v0, v2
    if-lez v2, :flappy_adaptive_pipemax_ok
    const/high16 v2, 0x43180000
    sub-float v0, v1, v2
    :flappy_adaptive_pipemax_ok
    float-to-int v0, v0
    sput v0, Lcom/dotgears/GameActivity;->adaptivePipeMax:I
"""

// Draws the background region into the world rect, with its texture's top
// cropped when the world is shorter than the stock 512: the cropped top
// (v1' = v2 - (v2 - v1) * H / 512, clamped below at v1) keeps the art's
// bottom 1:1 with the world, so the skyline and bushes stay on the ground.
// The clamp is a branch-free Math.max on purpose: a text-block label
// inserted into this particular method assembled to the wrong target
// (verified in the output smali), so this block uses no labels or
// branches (the inline smali compiler also has no abs-float).
private const val SCENE_HEAD_BLOCK = """
    iget v5, v0, Lcom/dotgears/i;->d:F
    iget v6, v0, Lcom/dotgears/i;->e:F
    iget v7, v0, Lcom/dotgears/i;->f:F
    iget v8, v0, Lcom/dotgears/i;->g:F
    sget v1, Lcom/dotgears/GameActivity;->adaptiveHeight:F
    const/high16 v2, 0x44000000
    div-float/2addr v1, v2
    sub-float v2, v8, v6
    mul-float/2addr v2, v1
    sub-float v2, v8, v2
    invoke-static {v2, v6}, Ljava/lang/Math;->max(FF)F
    move-result v6
    const/4 v1, 0x0
    const/4 v2, 0x0
    const/16 v3, 0x120
    sget v4, Lcom/dotgears/GameActivity;->adaptiveHeightInt:I
    move-object v0, p0
    invoke-virtual/range {v0 .. v9}, Lcom/dotgears/flappy/c;->a(IIIIFFFFF)V
    const/4 v8, 0x0
"""

private const val SETUP_BLOCK = """
    sget-object v0, Lcom/dotgears/g;->D:Lcom/dotgears/g;
    iget-object v0, v0, Lcom/dotgears/g;->C:Lcom/dotgears/p;
    sget-object v1, Lcom/dotgears/g;->D:Lcom/dotgears/g;
    iget v1, v1, Lcom/dotgears/g;->y:I
    sget-object v2, Lcom/dotgears/g;->D:Lcom/dotgears/g;
    iget v2, v2, Lcom/dotgears/g;->z:I
    const/16 v3, 0xa
    const/16 v4, 0x14
    const/16 v5, 0x1e
    const/16 v6, 0x28
    invoke-virtual/range {v0 .. v6}, Lcom/dotgears/p;->a(IIIIII)V
    return-void
"""

/**
 * The display adaptation of the 64-bit port, generalized from a fixed
 * 640-unit world to the actual display:
 *
 * - The world height is computed at startup from the screen size (288 units
 *   wide, height scaled to the display, never below 384, the 4:3 height,
 *   and never above 560, the framing ceiling),
 *   and the camera and resolution policy are built from it. Every layout
 *   constant the port baked for 640 becomes a read of a derived value of
 *   that height (see ADAPTIVE_COMPUTE_BLOCK), so the game adapts to any
 *   screen from 4:3 up through tall phones with no letterbox bars, while a
 *   20:9 screen gets exactly the port's 640 layout and a 16:9 screen gets
 *   exactly the stock layout.
 * - On screens shorter than the stock 512 height, the background draw
 *   crops sky off the top of its texture instead of scaling the whole
 *   image into the shorter world, so the skyline and bushes keep their
 *   stock positions relative to the ground; at 512 and above the full
 *   texture is drawn, as in the port.
 * - The pipe/ground elements stop being positioned from atlas offsets and
 *   get the fixed F/G flag setup; a score-overlay tap block and per-frame
 *   element updates tied to the old layout are removed, and a scene trigger
 *   is re-gated on the port's state flag.
 * - GameActivity.onCreate gains the port's window handling: display-cutout
 *   shortEdges mode on API 28+, decor-not-fitted + hidden transient system
 *   bars on API 30+, and the immersive systemUiVisibility flags — the fix
 *   for the black bar on tall screens.
 * - The texture-region setup that the stock code re-ran every frame moves
 *   to a one-time init call (the port's flicker fix). It needs seven
 *   registers, more than the init method has, so it is added as a small
 *   static helper method on the same class and invoked from init.
 */
@Suppress("unused")
val widescreenPatch = bytecodePatch(
    name = "Adapt to modern displays",
    description = "Adapts the game world to the display: the world height is computed at startup from the screen size, and the scene, pipe and texture geometry follows it, so the game adapts to any screen from 4:3 up through tall phones without bars. On screens shorter than the original 16:9 the background is anchored to the ground, so its skyline and bushes stay sitting on the ground instead of sinking behind it. Also adds display-cutout and immersive window handling and moves the per-frame texture setup to a one-time init call.",
    default = true
) {
    compatibleWith(COMPATIBILITY_FLAPPY_BIRD)

    execute {
        // Add the adaptive layout fields to GameActivity (initial values are
        // the stock 512 layout).
        run {
            val activityClass = mutableClassDefBy(GAME_ACTIVITY)
            ADAPTIVE_FIELDS.forEach { (fieldName, fieldType, initialValue) ->
                activityClass.staticFields.add(
                    MutableField(
                        ImmutableField(
                            GAME_ACTIVITY,
                            fieldName,
                            fieldType,
                            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                            initialValue,
                            emptySet(),
                            emptySet(),
                        ),
                    ),
                )
            }
        }

        // Engine options: compute the adaptive values first, then build the
        // camera and resolution policy from adaptiveHeight instead of the
        // stock 512.0f constant (one register feeds both constructors).
        EngineConfigFingerprint.method.apply {
            // Replace first: the compute block itself loads 0x44000000 several
            // times, so the camera constant must be gone before it is added.
            val index = requireLiteralIndices(0x44000000, Opcode.CONST_HIGH16).single()
            val register = getInstruction<OneRegisterInstruction>(index).registerA
            replaceInstruction(index, "sget v$register, $F_HEIGHT")
            addInstructions(0, ADAPTIVE_COMPUTE_BLOCK)
        }

        // onCreate: insert the port's cutout/immersive window block right
        // after the super call (never at index 0: before super.onCreate the
        // window has no DecorView, and on Android 17 getInsetsController()
        // throws on the missing DecorView instead of returning null).
        // Tail first so its getDecorView is a real instruction the head's
        // branches can target through an ExternalLabel.
        GameActivityOnCreateFingerprint.method.apply {
            val superCall = requireFirstIndex {
                it.opcode == Opcode.INVOKE_SUPER &&
                    it.refString() == "Lorg/andengine/ui/activity/SimpleBaseGameActivity;->onCreate(Landroid/os/Bundle;)V"
            }
            if (superCall != 0) {
                throw PatchException("Unexpected onCreate shape: super call is not first")
            }
            addInstructions(superCall + 1, ONCREATE_WINDOW_TAIL)
            val tailStart = getInstruction(superCall + 1)
            addInstructionsWithLabels(
                superCall + 1,
                ONCREATE_WINDOW_HEAD,
                ExternalLabel("flappy_port_cond", tailStart),
            )
        }

        // Bird: init position is center-anchored (H/2 - 10); the update floor
        // checks run against the ground top (H - 112).
        BirdInitFingerprint.method.replaceConst16WithField(0xf6, F_HALF_MINUS_10)
        BirdUpdateFingerprint.method.replaceRsubWithField(0x190, F_MINUS_112, scratch = 4, count = 2)

        // Scene update: the complex method, edited region by region.
        SceneUpdateFingerprint.method.apply {
            // 1. Delete the H-gated score-overlay block (11 instructions ending
            //    in the a(i, I, I, F) call).
            run {
                val instrs = implementation!!.instructions
                val start = instrs.indices.firstOrNull { i ->
                    instrs[i].refString() == "Lcom/dotgears/flappy/c;->H:Z" &&
                        instrs[i + 1].opcode == Opcode.IF_EQZ
                } ?: throw PatchException("H-gated block not found in scene update")
                if (instrs[start + 10].refString() != "Lcom/dotgears/flappy/c;->a(Lcom/dotgears/i;IIF)V") {
                    throw PatchException("Unexpected H-gated block shape in scene update")
                }
                removeInstructions(start, 11)
            }

            // 2. Delete the P atlas-offset block.
            deletePipeOffsetBlock()

            // 3. K pipe setup span (8 instructions) -> fixed F/G flags.
            replacePipeSetupWithFlags("Lcom/dotgears/flappy/c;->K:Lcom/dotgears/f;", span = 8)

            // 4. The ground elements' Y (H - 172).
            replaceConst16WithField(0x154, F_MINUS_172)

            // 5. Delete the per-frame P element updates.
            run {
                val instrs = implementation!!.instructions
                val start = instrs.indices.firstOrNull { i ->
                    instrs[i].refString() == "Lcom/dotgears/flappy/c;->P:Lcom/dotgears/f;" &&
                        instrs[i + 1].refString() == "Lcom/dotgears/f;->a(F)V" &&
                        instrs[i + 2].refString() == "Lcom/dotgears/flappy/c;->P:Lcom/dotgears/f;" &&
                        instrs[i + 3].refString() == "Lcom/dotgears/f;->a(Lcom/dotgears/g;)V"
                } ?: throw PatchException("Per-frame P updates not found in scene update")
                removeInstructions(start, 4)
            }

            // 6. Scene trigger rework. Stock layout here:
            //      if-eqz K.h -> :cond_b        (guards the two calls below)
            //      const/4 v0, 0x5
            //      invoke a(ZIF)                 (call A)
            //      const/16 v0, 0xa
            //      invoke c(10, v8)              (call B — kept by the port)
            //      :cond_b
            //      iget-object P; iget-boolean P.h; if-eqz -> :cond_c
            //      invoke c(v12, v8)             (trigger — deleted by the port)
            //      const/16 v0, 0xa
            //      invoke c(10, v8)              (call C — deleted by the port)
            //      :cond_c
            //      iget-object R ...             (landing instruction)
            //    The port deletes the whole P.h block (trigger + call C),
            //    inserts an e.F gate (iget am; iget-boolean F; if-nez) between
            //    call A and call B, and lands both the K.h branch and the new
            //    gate branch on the landing instruction.
            run {
                val instrs = implementation!!.instructions
                val aCall = instrs.indices.firstOrNull {
                    instrs[it].refString() == "Lcom/dotgears/flappy/c;->a(ZIF)V"
                } ?: throw PatchException("a(ZIF) call not found in scene update")
                // Call B (kept) must follow immediately: const/16 0xa + invoke c(II).
                if ((instrs[aCall + 1] as? NarrowLiteralInstruction)?.narrowLiteral != 0xa ||
                    instrs[aCall + 2].refString() != "Lcom/dotgears/flappy/c;->c(II)V"
                ) {
                    throw PatchException("Unexpected shape after a(ZIF) in scene update")
                }
                // The trigger invoke: c(II) whose first argument register is v12.
                val trigger = instrs.indices.firstOrNull { i ->
                    i > aCall && instrs[i].refString() == "Lcom/dotgears/flappy/c;->c(II)V" &&
                        (instrs[i] as? FiveRegisterInstruction)?.registerD == 12
                } ?: throw PatchException("Trigger invoke c(v12, ...) not found in scene update")
                // Block start = iget-object P, three before the trigger; verify shape.
                val blockStart = trigger - 3
                if (instrs[blockStart].refString() != "Lcom/dotgears/flappy/c;->P:Lcom/dotgears/f;" ||
                    instrs[blockStart + 1].refString() != "Lcom/dotgears/f;->h:Z" ||
                    instrs[blockStart + 2].opcode != Opcode.IF_EQZ ||
                    (instrs[trigger + 1] as? NarrowLiteralInstruction)?.narrowLiteral != 0xa ||
                    instrs[trigger + 2].refString() != "Lcom/dotgears/flappy/c;->c(II)V"
                ) {
                    throw PatchException("Unexpected trigger block shape in scene update")
                }
                // Landing = first instruction after the deleted block; it
                // carries the :cond_c label. Also read p0's register number
                // from the block's iget-object (its object register).
                val landingLabel = implementation!!.newLabelForIndex(trigger + 3)
                val thisRegister = getInstruction<TwoRegisterInstruction>(blockStart).registerB

                // Repoint the K.h branch (two before call A, right after the
                // iget-boolean K.h) at the landing instruction.
                val outerBranch = getInstruction<BuilderInstruction21t>(aCall - 2)
                if (outerBranch.opcode != Opcode.IF_EQZ) {
                    throw PatchException("Unexpected K.h branch in scene update")
                }
                replaceInstruction(
                    aCall - 2,
                    BuilderInstruction21t(Opcode.IF_EQZ, outerBranch.registerA, landingLabel),
                )

                // Delete the P.h block: iget P, iget-boolean h, if, trigger
                // invoke, const 0xa, call C invoke (6 instructions).
                removeInstructions(blockStart, 6)

                // Insert the e.F gate between call A and call B, built as
                // builder instructions so its branch targets the landing
                // label object directly.
                addInstructions(
                    aCall + 1,
                    listOf(
                        BuilderInstruction22c(
                            Opcode.IGET_OBJECT,
                            0,
                            thisRegister,
                            ImmutableFieldReference(
                                "Lcom/dotgears/flappy/c;",
                                "am",
                                "Lcom/dotgears/flappy/e;",
                            ),
                        ),
                        BuilderInstruction22c(
                            Opcode.IGET_BOOLEAN,
                            0,
                            0,
                            ImmutableFieldReference("Lcom/dotgears/flappy/e;", "F", "Z"),
                        ),
                        BuilderInstruction21t(Opcode.IF_NEZ, 0, landingLabel),
                    ),
                )
            }

            // 7. Scene head call: swap the a(i, I, I, F) call for the port's
            //    region-based a(IIIIFFFFF) setup block.
            run {
                val head = requireFirstIndex {
                    it.refString() == "Lcom/dotgears/flappy/c;->a(Lcom/dotgears/i;IIF)V"
                }
                removeInstruction(head)
                addInstructions(head, SCENE_HEAD_BLOCK)
            }

            // 8. Remaining adaptive constants: the pipe gap random range
            //    (j.a(II) bounds), the ground-top and full-height rsub
            //    checks, and the center-anchored title/bird positions.
            replaceConst16WithField(0xb4, F_PIPE_MIN)
            replaceConst16WithField(0x168, F_PIPE_MAX)
            replaceRsubWithField(0x190, F_MINUS_112, scratch = 3)
            replaceRsubWithField(0x200, F_HEIGHT_INT, scratch = 3, count = 2)
            replaceConst16WithField(0x96, F_HALF_MINUS_106)
            replaceAddLit16WithField(0x96, F_HALF_MINUS_106, scratch = 3)
        }

        // Scene layout: ground Y (H - 172), offset-block deletion, K and R spans.
        SceneLayoutFingerprint.method.apply {
            replaceConst16WithField(0x154, F_MINUS_172)
            deletePipeOffsetBlock()
            replacePipeSetupWithFlags("Lcom/dotgears/flappy/c;->K:Lcom/dotgears/f;", span = 7)
            replacePipeSetupWithFlags("Lcom/dotgears/flappy/c;->R:Lcom/dotgears/f;", span = 6)
        }

        // e: delete the per-frame texture setup block (12 instructions around
        //    the p.a(IIIIII) call).
        EUpdateFingerprint.method.apply {
            val call = requireFirstIndex { it.refString() == "Lcom/dotgears/p;->a(IIIIII)V" }
            val instrs = implementation!!.instructions
            if (instrs[call - 9].refString() != "Lcom/dotgears/g;->D:Lcom/dotgears/g;" ||
                instrs[call + 2].refString() != "Lcom/dotgears/g;->c(II)V"
            ) {
                throw PatchException("Unexpected texture setup block shape in e.a(F)")
            }
            removeInstructions(call - 9, 12)
        }

        // e init: add the one-time setup as a static helper (it needs seven
        // registers; the init method only has five locals), set f = 1, and
        // call the helper. The trailing g.c(II) call switches its last
        // argument to a literal 0, as in the port.
        run {
            val eClass = mutableClassDefBy(E_CLASS)
            val helper = MutableMethod(
                ImmutableMethod(
                    E_CLASS,
                    "flappyPortSetup",
                    emptyList(),
                    "V",
                    AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                    emptySet(),
                    emptySet(),
                    ImmutableMethodImplementation(7, emptyList(), emptyList(), emptyList()),
                ),
            )
            eClass.methods.add(helper)
            helper.addInstructions(0, SETUP_BLOCK)
        }
        EInitFingerprint.method.apply {
            val iput = requireFirstIndex {
                it.opcode == Opcode.IPUT && it.refString() == "Lcom/dotgears/flappy/e;->f:I"
            }
            replaceInstruction(iput, "const/4 v0, 0x1")
            addInstructions(
                iput + 1,
                """
                iput v0, p0, Lcom/dotgears/flappy/e;->f:I
                invoke-static {}, Lcom/dotgears/flappy/e;->flappyPortSetup()V
                """,
            )
            val call = requireFirstIndex { it.refString() == "Lcom/dotgears/g;->c(II)V" }
            replaceInstruction(call, "const/4 v2, 0x0")
            addInstructions(call + 1, "invoke-virtual {v0, v1, v2}, Lcom/dotgears/g;->c(II)V")
        }

        // e draw helper: center-anchored offset (H/2 - 126).
        EDrawFingerprint.method.replaceAddLit16WithField(0x82, F_HALF_MINUS_126, scratch = 3)

        // f draw helper: center-anchored positions (H/2 - 110, H/2 - 36).
        FDrawFingerprint.method.replaceConst16WithField(0x92, F_HALF_MINUS_110)
        FDrawFingerprint.method.replaceConst16WithField(0xdc, F_HALF_MINUS_36)

        // p: constructor rsub against H; region size H - 8.
        PConstructorFingerprint.method.replaceRsubWithField(0x200, F_HEIGHT_INT, scratch = 1)
        PRegionFingerprint.method.replaceConst16WithField(0x1f8, F_MINUS_8)
    }
}
