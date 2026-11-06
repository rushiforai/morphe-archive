package com.feurstagram.patches.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.util.MethodUtil
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.feurstagram.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import com.feurstagram.patches.shared.Constants.EXTENSION

private const val SETTINGS_CLASS = "Lcom/feurstagram/extension/Settings;"

private fun fieldType(instruction: Any?): String? =
    ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.type

private const val DECOR_VIEW = "Landroid/view/Window;->getDecorView()Landroid/view/View;"

// The main tab-bar binder is an obfuscated class whose constructor takes the
// tab-bar root View, pulls the tab_bar ViewGroup child out of it and stashes it
// in a field, alongside a sibling View field. We match that shape rather than
// the obfuscated names, which Instagram reshuffles between releases.
private fun isBinderShape(method: Method, classDef: ClassDef): Boolean =
    classDef.type.startsWith("LX/") && method.name == "<init>" &&
        method.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/View;") &&
        method.implementation?.instructions?.let { instructions ->
            var hasViewGroupField = false
            var hasViewField = false
            for (instruction in instructions) {
                if (instruction.opcode == Opcode.IPUT_OBJECT) {
                    when (fieldType(instruction)) {
                        "Landroid/view/ViewGroup;" -> hasViewGroupField = true
                        "Landroid/view/View;" -> hasViewField = true
                    }
                }
            }
            hasViewGroupField && hasViewField
        } == true

/**
 * The tab-bar binder's constructor. Several view holders share its shape (six on 454), and
 * which one a shape-only match picks differs between builds: one 454 build hooked a list row,
 * so the tab hiders and the settings long-press worked only while that row was on screen.
 * The binder is the one Instagram builds straight from the activity's decor view.
 */
internal fun BytecodePatchContext.tabBarBinder(): MutableMethod {
    val fromDecor = mutableSetOf<String>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            val insns = method.implementation?.instructions?.toList() ?: return@forEach
            insns.forEachIndexed { i, insn ->
                if (insn.getReference<MethodReference>()?.toString() != DECOR_VIEW) return@forEachIndexed
                val ctor = insns.subList(i + 1, minOf(insns.size, i + 6))
                    .firstOrNull { it.opcode == Opcode.INVOKE_DIRECT }
                    ?.getReference<MethodReference>()
                if (ctor?.name == "<init>") fromDecor += ctor.definingClass
            }
        }
    }
    val matches = mutableListOf<Pair<ClassDef, Method>>()
    classDefForEach { classDef ->
        if (classDef.type !in fromDecor) return@classDefForEach
        classDef.methods.filter { isBinderShape(it, classDef) }.forEach { matches += classDef to it }
    }
    val (classDef, method) = matches.singleOrNull()
        ?: throw PatchException("Tab-bar binder: expected one match, found ${matches.map { it.first.type }}")
    return mutableClassDefBy(classDef).methods.first { MethodUtil.methodSignaturesMatch(it, method) }
}

@Suppress("unused")
val settingsEntryPointPatch = bytecodePatch(
    name = "Settings entry point",
    description = "Opens the Oxbow settings on a long-press of the Home tab, " +
        "and installs the surface hiders and update check.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    extendWith(EXTENSION)

    execute {
        tabBarBinder().apply {
            // The value stored into the ViewGroup field is the tab_bar root; it's
            // a stable handle into the window, from which the watcher attaches the
            // long-press settings listener to the Home tab and installs the hiders.
            val tabBarStore = instructions.first {
                it.opcode == Opcode.IPUT_OBJECT && fieldType(it) == "Landroid/view/ViewGroup;"
            }
            val tabBarRegister = (tabBarStore as TwoRegisterInstruction).registerA

            addInstructions(
                tabBarStore.location.index + 1,
                "invoke-static { v$tabBarRegister }, " +
                    "$SETTINGS_CLASS->installHomeTabWatcher(Landroid/view/ViewGroup;)V",
            )
        }
    }
}
