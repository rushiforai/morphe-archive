import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

// The patch is universal (no compatibility declaration), so the target app only needs to
// actually use the rewritten patterns. Moon+ Reader references FLAG_SECURE, Window.addFlags,
// Window.setFlags, WindowManager.addView and WindowManager.LayoutParams.flags in its dexes.
private const val EXTENSION_PACKAGE = "Lapp/template/extension/screenshot/"
private const val EXTENSION_CLASS = "${EXTENSION_PACKAGE}RemoveScreenshotRestrictionPatch;"
private const val WINDOW = "Landroid/view/Window;"
private const val WINDOW_MANAGER = "Landroid/view/WindowManager;"
private const val VIEW_MANAGER = "Landroid/view/ViewManager;"
private const val LAYOUT_PARAMS = "Landroid/view/WindowManager\$LayoutParams;"
private const val SURFACE_VIEW = "Landroid/view/SurfaceView;"

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
)

// (declared class, name, parameter count) of every call the patch redirects.
private val REDIRECTED_CALLS = setOf(
    Triple(WINDOW, "addFlags", 1),
    Triple(WINDOW, "setFlags", 2),
    Triple(WINDOW, "setAttributes", 1),
    Triple(VIEW_MANAGER, "addView", 2),
    Triple(WINDOW_MANAGER, "addView", 2),
    Triple(VIEW_MANAGER, "updateViewLayout", 2),
    Triple(WINDOW_MANAGER, "updateViewLayout", 2),
    Triple(SURFACE_VIEW, "setSecure", 1),
)

class RemoveScreenshotRestrictionSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `redirects Window flag calls and masks direct LayoutParams flag writes`() {
        val root = repoRoot()
        val apk = File(root, "apks/moonreader/base.apk")

        // The APK lives in the gitignored apks/ directory. Skip rather than fail when it is
        // absent, so CI stays green; locally it is present and the test really runs.
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = "com.flyersoft.moonreader",
            version = "10.8",
            patchNames = setOf("Remove screenshot restriction"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
            filterByCompatibility = false,
        )
        val byType = classes.associateBy { it.type }

        // Recursion guard: the extension ships in the patched dexes and keeps its own real
        // framework calls (it is never redirected into itself).
        val extensionClass = byType[EXTENSION_CLASS] ?: error("extension class missing from emitted dexes")
        for ((owner, name, opcode) in listOf(
            Triple(WINDOW, "addFlags", Opcode.INVOKE_VIRTUAL),
            Triple(WINDOW, "setFlags", Opcode.INVOKE_VIRTUAL),
            Triple(WINDOW, "setAttributes", Opcode.INVOKE_VIRTUAL),
            Triple(WINDOW_MANAGER, "addView", Opcode.INVOKE_INTERFACE),
            Triple(VIEW_MANAGER, "updateViewLayout", Opcode.INVOKE_INTERFACE),
            Triple(SURFACE_VIEW, "setSecure", Opcode.INVOKE_VIRTUAL),
        )) {
            val helper = extensionClass.methods.filter { it.name == name }
            assertTrue(
                helper.any { method ->
                    method.instructions().any { insn ->
                        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
                        insn.opcode == opcode && ref?.definingClass == owner && ref.name == name
                    }
                },
                "extension helper $name no longer calls $opcode $owner->$name (recursion guard broken)",
            )
        }

        // Find LayoutParams.flags and SurfaceView subclasses the way the patch does: by
        // walking the superclass chain through the app's own classes.
        val layoutParamsTypes = subtypes(byType, setOf(LAYOUT_PARAMS)) { classDef ->
            classDef.fields.any {
                it.name == "flags" && it.type == "I" && !AccessFlags.STATIC.isSet(it.accessFlags)
            }
        }
        val surfaceViewTypes = subtypes(
            byType,
            setOf(SURFACE_VIEW, "Landroid/opengl/GLSurfaceView;", "Landroid/widget/VideoView;"),
        )

        var windowFlagRedirects = 0
        var attachRedirects = 0
        var maskedWrites = 0
        val leftovers = mutableListOf<String>()
        for (clazz in classes) {
            if (clazz.type.startsWith(EXTENSION_PACKAGE)) continue
            for (method in clazz.methods) {
                val insns = method.instructions()
                val where = "${clazz.type}->${method.name}"
                for ((index, insn) in insns.withIndex()) {
                    val ref = (insn as? ReferenceInstruction)?.reference

                    if (insn.opcode == Opcode.INVOKE_STATIC || insn.opcode == Opcode.INVOKE_STATIC_RANGE) {
                        if ((ref as? MethodReference)?.definingClass == EXTENSION_CLASS) {
                            when (ref.name) {
                                "addFlags", "setFlags" -> windowFlagRedirects++
                                "setAttributes", "addView", "updateViewLayout" -> attachRedirects++
                            }
                        }
                    }

                    // No call the patch redirects may survive outside the extension.
                    if (insn.opcode in INVOKE_OPCODES && ref is MethodReference) {
                        val owner = if (ref.definingClass in surfaceViewTypes) SURFACE_VIEW else ref.definingClass
                        if (Triple(owner, ref.name, ref.parameterTypes.size) in REDIRECTED_CALLS) {
                            leftovers += "$where: unredirected ${insn.opcode} ${ref.definingClass}->${ref.name}"
                        }
                    }

                    // Every LayoutParams.flags write must be directly followed by the patch's
                    // own clearSecureFlag call on the same params object. The app's own
                    // `flags &= ~FLAG_SECURE` cannot satisfy this; only the patch emits it.
                    val field = ref as? FieldReference
                    if (insn.opcode == Opcode.IPUT && field?.name == "flags" && field.type == "I" &&
                        field.definingClass in layoutParamsTypes
                    ) {
                        val next = insns.getOrNull(index + 1)
                        val call = (next as? ReferenceInstruction)?.reference as? MethodReference
                        val masked = next?.opcode == Opcode.INVOKE_STATIC &&
                            call?.definingClass == EXTENSION_CLASS &&
                            call.name == "clearSecureFlag" &&
                            (next as FiveRegisterInstruction).registerCount == 1 &&
                            next.registerC == (insn as TwoRegisterInstruction).registerB
                        if (masked) maskedWrites++ else leftovers += "$where: unmasked iput ${field.definingClass}->flags"
                    }
                }
            }
        }

        assertTrue(leftovers.isEmpty(), "unpatched FLAG_SECURE paths remain:\n${leftovers.joinToString("\n")}")
        assertTrue(
            windowFlagRedirects >= 1,
            "no Window.addFlags/setFlags call site was redirected to the extension " +
                "(silent no-op - the universal patch matched nothing)",
        )
        assertTrue(
            attachRedirects >= 1,
            "no setAttributes/addView/updateViewLayout call site was redirected - " +
                "the LayoutParams-constructor path would stay uncovered",
        )
        assertTrue(
            maskedWrites >= 1,
            "no WindowManager.LayoutParams.flags write is followed by clearSecureFlag",
        )
    }

    private fun subtypes(
        byType: Map<String, ClassDef>,
        roots: Set<String>,
        stopAt: (ClassDef) -> Boolean = { false },
    ): Set<String> = byType.keys.filterTo(roots.toMutableSet()) { type ->
        var current: ClassDef? = byType[type]
        var result = false
        while (current != null && !stopAt(current)) {
            val superclass = current.superclass ?: break
            if (superclass in roots) {
                result = true
                break
            }
            current = byType[superclass]
        }
        result
    }
}
