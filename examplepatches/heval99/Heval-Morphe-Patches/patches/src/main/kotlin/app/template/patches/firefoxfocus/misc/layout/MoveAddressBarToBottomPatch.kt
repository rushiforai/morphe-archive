package app.template.patches.firefoxfocus.misc.layout

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.COMPATIBILITY_FIREFOX_FOCUS
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.w3c.dom.Element

private const val BROWSER_LAYOUT = "res/layout/fragment_browser.xml"
private const val TOOLBAR = "mozilla.components.browser.toolbar.BrowserToolbar"

// Focus's toolbar helpers (top-level Kotlin functions in ext/BrowserToolbar.kt; the file facade and
// the function names are kept) and the fullscreen handler, which all position the page for a
// toolbar at the top.
private const val TOOLBAR_KT = "Lorg/mozilla/focus/ext/BrowserToolbarKt;"
private const val FULLSCREEN = "Lorg/mozilla/focus/browser/integration/FullScreenIntegration\$feature\$2;"
private const val BROWSER_TOOLBAR = "Lmozilla/components/browser/toolbar/BrowserToolbar;"
private const val ENGINE_VIEW = "Lmozilla/components/concept/engine/EngineView;"
private const val MARGIN_PARAMS = "Landroid/view/ViewGroup\$MarginLayoutParams;"

private fun MutableMethod.topMarginWrites() = instructions.withIndex().filter { (_, insn) ->
    insn.opcode == Opcode.IPUT &&
        ((insn as ReferenceInstruction).reference as FieldReference).let { it.definingClass == MARGIN_PARAMS && it.name == "topMargin" }
}.map { it.index }

/** Turns the `iput vA, vB, MarginLayoutParams->topMargin` at [index] into a bottomMargin write. */
private fun MutableMethod.writeBottomMarginAt(index: Int) {
    val insn = instructions[index] as TwoRegisterInstruction
    replaceInstruction(index, "iput v${insn.registerA}, v${insn.registerB}, $MARGIN_PARAMS->bottomMargin:I")
}

/**
 * The code half. Focus lays the page out for a top toolbar in code:
 * - enableDynamicBehavior (hide on scroll) gives the toolbar a scrolling behaviour with
 *   DependencyGravity.Top and the page a clipping behaviour for a top toolbar; R8 kept no bottom
 *   variant, so a bottom bar would slide up over the page while scrolling. With the bar at the
 *   bottom it now shows the bar fixed instead (it calls showAsFixed and returns).
 * - showAsFixed reserves the toolbar height as the page's topMargin, which would leave a gap at the
 *   top and hide the bottom of the page under the bar; it now sets bottomMargin.
 * - Entering fullscreen clears that margin; it now clears bottomMargin.
 */
private val moveAddressBarToBottomCodePatch = bytecodePatch(
    description = "Lays the page out for an address bar at the bottom.",
) {
    compatibleWith(COMPATIBILITY_FIREFOX_FOCUS)

    execute {
        val toolbarKt = mutableClassDefBy(TOOLBAR_KT)
        fun helper(name: String, parameters: List<String>) = toolbarKt.methods.singleOrNull {
            it.name == name && it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == parameters
        } ?: throw PatchException("$TOOLBAR_KT.$name(${parameters.joinToString("")}) not found")

        val fixedSignature = listOf(BROWSER_TOOLBAR, "Landroid/content/Context;", ENGINE_VIEW)
        val enableDynamic = helper("enableDynamicBehavior", fixedSignature)
        val showAsFixed = helper("showAsFixed", fixedSignature)
        val fullscreen = mutableClassDefBy(FULLSCREEN).methods.singleOrNull {
            it.name == "invoke" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;")
        } ?: throw PatchException("$FULLSCREEN.invoke(Object) not found")

        // Validate every site before the first edit.
        val fixedWrites = showAsFixed.topMarginWrites()
        if (fixedWrites.size != 1) throw PatchException("showAsFixed writes topMargin ${fixedWrites.size} times, expected once")
        val fullscreenWrites = fullscreen.topMarginWrites()
        if (fullscreenWrites.size != 1) {
            throw PatchException("$FULLSCREEN.invoke writes topMargin ${fullscreenWrites.size} times, expected once")
        }

        showAsFixed.writeBottomMarginAt(fixedWrites.single())
        fullscreen.writeBottomMarginAt(fullscreenWrites.single())
        enableDynamic.addInstructionsChecked(
            0,
            """
                invoke-static { p0, p1, p2 }, $TOOLBAR_KT->showAsFixed($BROWSER_TOOLBAR${"Landroid/content/Context;"}$ENGINE_VIEW)V
                return-void
            """.trimIndent(),
        )
    }
}

/**
 * Firefox Focus pins its address bar to the top of `fragment_browser.xml` (the toolbar's
 * android:layout_gravity is 0x30 = top). The layout is a CoordinatorLayout that fills the screen,
 * so changing the toolbar gravity to bottom moves the bar; the code half above keeps the page out
 * from under it. The toolbar keeps its id, height and elevation. Hide on scroll is off with the bar
 * at the bottom (fixed 2026-11-07: the first version kept Focus's top-toolbar behaviours, so the
 * bar slid up over the page while scrolling and the fixed mode left a gap at the top).
 */
@Suppress("unused")
val moveAddressBarToBottomPatch = resourcePatch(
    name = "Move address bar to the bottom",
    description = "Moves the address bar to the bottom of the screen.",
) {
    compatibleWith(COMPATIBILITY_FIREFOX_FOCUS)

    dependsOn(moveAddressBarToBottomCodePatch)

    execute {
        document(BROWSER_LAYOUT).use { doc ->
            val toolbars = doc.getElementsByTagName(TOOLBAR)
                .let { list -> (0 until list.length).map { list.item(it) as Element } }
            val toolbar = toolbars.singleOrNull()
                ?: throw PatchException("$BROWSER_LAYOUT: expected one $TOOLBAR, found ${toolbars.size}")
            if (toolbar.getAttribute("android:id") != "@id/browserToolbar") {
                throw PatchException("$BROWSER_LAYOUT: the toolbar id is ${toolbar.getAttribute("android:id")}")
            }
            toolbar.setAttribute("android:layout_gravity", "bottom")
        }
    }
}
