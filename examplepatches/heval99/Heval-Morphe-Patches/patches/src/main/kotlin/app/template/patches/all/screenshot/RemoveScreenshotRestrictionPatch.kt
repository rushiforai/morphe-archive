package app.template.patches.all.screenshot

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.logging.Logger

// Universal patch (no compatibleWith: applies to any app, so it is opt-in), based on
// rushiranpise/Ri-Vanced-Universal-Morphe-Patches "Remove screenshot restriction"
// (GPLv3) with these fixes over the upstream design:
//
//   1. invoke-virtual/range call sites are rewritten too (upstream matches only the
//      non-range form, so a call compiled under register pressure kept FLAG_SECURE);
//   2. the LayoutParams-constructor path is covered by also redirecting
//      Window.setAttributes and WindowManager/ViewManager addView/updateViewLayout
//      (invoke-interface: both are interfaces) into extension helpers that clear the bit
//      on the params object at attach time - `new LayoutParams(w, h, type,
//      FLAG_SECURE|..., format)` never produces an app-dex instruction upstream could match;
//   3. SurfaceView.setSecure(Z) (the per-surface equivalent of FLAG_SECURE) is redirected
//      to a helper that always passes false;
//   4. classes are scanned read-only first and only the matching ones are made mutable,
//      so the patcher re-emits a handful of classes instead of the whole app; within a
//      method, edits are collected first and applied bottom-up so one insertion never
//      shifts another pending index.
//
// Apps block screenshots by setting FLAG_SECURE (0x2000) on their windows. Window.addFlags/
// setFlags call sites are redirected into the extensions/screenshot.mpe helper (all other
// window flags keep working), and every direct WindowManager.LayoutParams.flags write (also
// through an app subclass of LayoutParams) is followed by a helper call that clears the bit
// on the params object. The helper call goes *after* the iput rather than masking the value
// register before it: a mask inserted before the iput is skipped by branches that target the
// iput, and masking the register in place would change a value the method may still read
// later (or retype a const 0 that is reused as null), while the object register after an
// iput is untouched and always a valid LayoutParams.
//
// Out of reach of any dex patch: flags set from native code or by reflection; Widevine L1
// video stays black in screenshots - that is protected output, not FLAG_SECURE. An app with
// no matched call or write fails the patch loudly instead of reporting a silent "Applied";
// the smoke test asserts the rewrites on Moon+ Reader.

private val logger = Logger.getLogger("RemoveScreenshotRestriction")

private const val EXTENSION_PACKAGE = "Lapp/template/extension/screenshot/"
private const val EXTENSION_CLASS = "${EXTENSION_PACKAGE}RemoveScreenshotRestrictionPatch;"
private const val WINDOW = "Landroid/view/Window;"
private const val WINDOW_MANAGER = "Landroid/view/WindowManager;"
private const val VIEW_MANAGER = "Landroid/view/ViewManager;"
private const val LAYOUT_PARAMS = "Landroid/view/WindowManager\$LayoutParams;"
private const val VIEW = "Landroid/view/View;"
private const val VIEW_GROUP_LAYOUT_PARAMS = "Landroid/view/ViewGroup\$LayoutParams;"
private const val SURFACE_VIEW = "Landroid/view/SurfaceView;"

// Public framework subclasses of SurfaceView a setSecure call site can name; app subclasses
// are found by walking their superclass chain to one of these.
private val FRAMEWORK_SURFACE_VIEWS = setOf(
    SURFACE_VIEW,
    "Landroid/opengl/GLSurfaceView;",
    "Landroid/widget/VideoView;",
)

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
)

/**
 * A call redirected into the extension. The extension method takes the original receiver
 * (typed as [owner]) as its first parameter, so one entry per (declared class, signature)
 * apps can reference: addView/updateViewLayout are declared on ViewManager and inherited by
 * WindowManager, and compiled call sites name whichever type the receiver had.
 */
private class Redirect(val owner: String, val name: String, val parameters: List<String>) {
    val target = "$EXTENSION_CLASS->$name(${(listOf(owner) + parameters).joinToString("")})V"
}

private val REDIRECTS = listOf(
    Redirect(WINDOW, "addFlags", listOf("I")),
    Redirect(WINDOW, "setFlags", listOf("I", "I")),
    Redirect(WINDOW, "setAttributes", listOf(LAYOUT_PARAMS)),
    Redirect(VIEW_MANAGER, "addView", listOf(VIEW, VIEW_GROUP_LAYOUT_PARAMS)),
    Redirect(WINDOW_MANAGER, "addView", listOf(VIEW, VIEW_GROUP_LAYOUT_PARAMS)),
    Redirect(VIEW_MANAGER, "updateViewLayout", listOf(VIEW, VIEW_GROUP_LAYOUT_PARAMS)),
    Redirect(WINDOW_MANAGER, "updateViewLayout", listOf(VIEW, VIEW_GROUP_LAYOUT_PARAMS)),
    Redirect(SURFACE_VIEW, "setSecure", listOf("Z")),
)

private const val CLEAR_SECURE_FLAG = "$EXTENSION_CLASS->clearSecureFlag($LAYOUT_PARAMS)V"

private sealed interface Edit

/** Replace the invoke at this index with [smali] (an invoke-static into the extension). */
private class RedirectCall(val smali: String) : Edit

/** Insert a clearSecureFlag call on [objectRegister] right after the LayoutParams.flags iput. */
private class MaskFlagWrite(val objectRegister: Int) : Edit

@Suppress("unused")
val removeScreenshotRestrictionPatch = bytecodePatch(
    name = "Remove screenshot restriction",
    description = "Allows screenshots and screen recording in apps that block them.",
    default = false,
) {
    extendWith("extensions/screenshot.mpe")

    execute {
        // A field reference names the class the compiler saw, which can be an app subclass
        // of LayoutParams; it still resolves to LayoutParams.flags unless a class on the way
        // declares its own instance field `flags:I`.
        val layoutParamsTypes = SubtypeCheck(this, setOf(LAYOUT_PARAMS)) { classDef ->
            classDef.fields.any {
                it.name == "flags" && it.type == "I" && !AccessFlags.STATIC.isSet(it.accessFlags)
            }
        }
        val surfaceViewTypes = SubtypeCheck(this, FRAMEWORK_SURFACE_VIEWS)

        fun editFor(instruction: Instruction): Edit? {
            if (instruction.opcode == Opcode.IPUT) {
                val field = (instruction as ReferenceInstruction).reference as FieldReference
                if (field.name != "flags" || field.type != "I") return null
                if (field.definingClass !in layoutParamsTypes) return null
                return MaskFlagWrite((instruction as TwoRegisterInstruction).registerB)
            }

            if (instruction.opcode !in INVOKE_OPCODES) return null
            val call = (instruction as ReferenceInstruction).reference as MethodReference
            val parameters = call.parameterTypes.map(CharSequence::toString)
            val redirect = REDIRECTS.firstOrNull { redirect ->
                redirect.name == call.name && redirect.parameters == parameters &&
                    (call.definingClass == redirect.owner ||
                        (redirect.owner == SURFACE_VIEW && call.definingClass in surfaceViewTypes))
            } ?: return null

            // Every invoke form passes its arguments in order starting at the receiver,
            // and invoke-static takes them in the same order.
            val smali = when (instruction) {
                is RegisterRangeInstruction -> {
                    val last = instruction.startRegister + instruction.registerCount - 1
                    "invoke-static/range { v${instruction.startRegister} .. v$last }, ${redirect.target}"
                }
                is FiveRegisterInstruction -> {
                    val registers = listOf(
                        instruction.registerC, instruction.registerD, instruction.registerE,
                        instruction.registerF, instruction.registerG,
                    ).take(instruction.registerCount)
                    "invoke-static { ${registers.joinToString { "v$it" }} }, ${redirect.target}"
                }
                else -> throw PatchException("Unexpected invoke format ${instruction.opcode}")
            }
            return RedirectCall(smali)
        }

        // Collect first, read-only: mutating classes while iterating them is not allowed, and
        // making every class mutable would re-emit the whole app.
        val targets = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            // Never rewrite the injected extension itself: its own Window calls would
            // be redirected into itself (infinite recursion at runtime).
            if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEach
            if (classDef.methods.any { m -> m.implementation?.instructions?.any { editFor(it) != null } == true }) {
                targets += classDef
            }
        }
        if (targets.isEmpty()) {
            throw PatchException(
                "No FLAG_SECURE usage found (no window flag, window attach or SurfaceView.setSecure " +
                    "call and no WindowManager.LayoutParams.flags write)",
            )
        }

        var redirected = 0
        var masked = 0
        for (classDef in targets) {
            for (method in mutableClassDefBy(classDef).methods) {
                val instructions = method.implementation?.instructions?.toList() ?: continue
                val edits = instructions.mapIndexedNotNull { index, instruction ->
                    editFor(instruction)?.let { index to it }
                }

                // Bottom-up, so an insertion never shifts a pending index. The mask call goes
                // after its iput; inserting at index + 1 leaves index and everything above it
                // in place.
                for ((index, edit) in edits.asReversed()) {
                    when (edit) {
                        is RedirectCall -> {
                            method.replaceInstruction(index, edit.smali)
                            redirected++
                        }
                        is MaskFlagWrite -> {
                            method.addInstructionsChecked(
                                index + 1,
                                "invoke-static { v${edit.objectRegister} }, $CLEAR_SECURE_FLAG",
                            )
                            masked++
                        }
                    }
                }
            }
        }

        logger.info(
            "Remove screenshot restriction: $redirected call sites redirected, $masked " +
                "LayoutParams.flags writes masked in ${targets.size} classes",
        )
    }
}

/**
 * Memoized "is [type] one of [roots] or an app class extending one" check. Only app classes
 * are walked (framework types outside [roots] end the walk); [stopAt] rejects a class on the
 * way, e.g. one that shadows the inherited member.
 */
private class SubtypeCheck(
    private val context: BytecodePatchContext,
    private val roots: Set<String>,
    private val stopAt: (ClassDef) -> Boolean = { false },
) {
    private val cache = HashMap<String, Boolean>()

    operator fun contains(type: String): Boolean {
        cache[type]?.let { return it }
        val result = when {
            type in roots -> true
            else -> {
                val classDef = context.classDefByOrNull(type)
                val superclass = classDef?.superclass
                classDef != null && !stopAt(classDef) && superclass != null && superclass in this
            }
        }
        cache[type] = result
        return result
    }
}
