package app.template.patches.gospellibrary

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_GOSPEL_LIBRARY

// Inserts "invoke-static/range {p0 .. p0}, <extension>->name(<type>)V" at the start of an instance
// method. Built by hand because inline smali compilation fails on some parameter lists, and
// the range form has no 4-bit register limit.
private fun MutableMethod.callExtensionWithThis(name: String, thisType: String) {
    val impl = implementation!!
    val paramRegisters = 1 + parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    val thisRegister = impl.registerCount - paramRegisters
    impl.addInstruction(
        0,
        BuilderInstruction3rc(
            Opcode.INVOKE_STATIC_RANGE,
            thisRegister,
            1,
            ImmutableMethodReference(
                "Lapp/template/extension/gospellibrary/FullscreenPatch;",
                name,
                listOf(thisType),
                "V"
            )
        )
    )
}

@Suppress("unused")
val fullscreenPatch = bytecodePatch(
    name = "Force fullscreen",
    description = "Hides the status and navigation bars and draws into the display cutout area " +
        "on every screen, including reading mode.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GOSPEL_LIBRARY)

    extendWith("extensions/extension.mpe")

    execute {
        val parentOf = HashMap<String, String>()
        classDefForEach { c -> c.superclass?.let { parentOf[c.type] = it } }

        fun descendsFrom(type: String, root: String): Boolean {
            var t: String? = type
            var depth = 0
            while (t != null && depth++ < 64) {
                if (t == root) return true
                t = parentOf[t]
            }
            return false
        }

        // Hooks every onCreate with the given parameters in classes descending from root.
        // The extension ignores repeated calls, so hooking several levels of a chain is safe.
        fun hook(root: String, parameters: List<String>, name: String, thisType: String): Int {
            var count = 0
            for (type in parentOf.keys.filter { descendsFrom(it, root) }) {
                val hasMethod = classDefBy(type).methods.any {
                    it.name == "onCreate" && it.returnType == "V" &&
                        it.parameterTypes.map(CharSequence::toString) == parameters &&
                        it.implementation != null
                }
                if (!hasMethod) continue

                mutableClassDefBy(type).methods.first {
                    it.name == "onCreate" && it.returnType == "V" &&
                        it.parameterTypes.map(CharSequence::toString) == parameters &&
                        it.implementation != null
                }.callExtensionWithThis(name, thisType)
                count++
            }
            return count
        }

        val applicationHooks = hook(
            "Landroid/app/Application;",
            emptyList(),
            "register",
            "Landroid/app/Application;"
        )

        // Activity hook is the fallback when the app's Application class has no onCreate.
        // Reading mode runs in an Activity, so this also covers it directly.
        val activityHooks = hook(
            "Landroid/app/Activity;",
            listOf("Landroid/os/Bundle;"),
            "onActivityCreate",
            "Landroid/app/Activity;"
        )

        if (applicationHooks + activityHooks == 0) {
            throw PatchException("No Application or Activity onCreate found")
        }
    }
}
