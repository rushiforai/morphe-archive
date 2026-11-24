package app.pablobaro.patches.spotify.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import org.w3c.dom.Document
import org.w3c.dom.Element

/** Background of the mini player until it is tinted with the first color. */
internal const val MINI_PLAYER_BACKGROUND = "res/drawable/floating_layout_bg.xml"

/**
 * Paints the background of the full screen player with the color extracted from the cover art.
 * The class is not obfuscated, and it is not used by the mini player, the lyrics or any header.
 */
private object PlayerBackgroundSetColorFingerprint : Fingerprint(
    definingClass = "Lcom/spotify/nowplaying/uiusecases/overlay/OverlayHidingGradientBackgroundView;",
    name = "setColor",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("I"),
)

/**
 * Tints the background of the mini player. Every color of the bar passes through it: the default color,
 * the color of the cover art and each frame of the animation between them.
 * The class is obfuscated, but the bar is the only one that tints the background of a MotionLayout this way.
 */
private object MiniPlayerBackgroundSetTintFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I"),
    filters = listOf(
        fieldAccess(
            type = "Landroidx/constraintlayout/motion/widget/MotionLayout;",
            opcode = Opcode.IGET_OBJECT,
        ),
        methodCall(smali = "Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;"),
        methodCall(smali = "Landroid/graphics/drawable/Drawable;->setTint(I)V"),
    ),
)

/**
 * Overrides the colors passed to the backgrounds of the full screen player and the mini player. The extraction
 * itself is untouched, since its colors are also used by other surfaces and to pick readable text colors.
 */
internal fun BytecodePatchContext.useDarkPlayer(background: Int, miniPlayerBackground: Int) {
    PlayerBackgroundSetColorFingerprint.method.addInstruction(0, "const p1, $background")

    val miniPlayerMatches = MiniPlayerBackgroundSetTintFingerprint.matchAll()
    val miniPlayerMatch = miniPlayerMatches.singleOrNull()
        ?: throw PatchException("Expected one mini player background method, found ${miniPlayerMatches.size}")
    miniPlayerMatch.method.addInstruction(0, "const p1, $miniPlayerBackground")
}

/** Sets the solid color of a shape drawable. Returns false if it does not have any. */
internal fun Document.replaceSolidColor(color: Int): Boolean {
    val solid = getElementsByTagName("solid").item(0) as Element?
    if (solid == null || !solid.hasAttribute("android:color")) return false
    solid.setAttribute("android:color", formatColor(color))
    return true
}
