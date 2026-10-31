package app.local.patches.curve

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.*
import app.morphe.patcher.util.matchSingle
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val COPY = "Lapp/local/extension/curve/RemoveCringe;"
private val removeCringeResources = resourcePatch {
    execute {
        val stream = checkNotNull(object {}.javaClass.getResourceAsStream("/curve/remove_cringe.json"))
        stream.use { get("assets/morphe_remove_cringe.json", false).writeBytes(it.readBytes()) }
    }
}

@Suppress("unused")
val removeCringePatch = bytecodePatch(
    name = "Remove Cringe",
    description = "Plain feature names and copy in English, German, Spanish, French, Italian, Lithuanian and Norwegian. Adds an optional switch in Patches. Keeps Go Back in Time, Magic link, Fronted and Flex.",
    default = false
) {
    compatibleWith(Compatibility(
        name = "Curve Pay", packageName = "com.imaginecurve.curve.prd",
        apkFileType = ApkFileType.APKM, appIconColor = 0x1C1C1C,
        targets = listOf(AppTarget(version = "5.63.0"))
    ))
    dependsOn(patchesMenuPatch, removeCringeResources)
    execute {
        Fingerprint(definingClass = COPY, name = "isIncluded", parameters = emptyList(), returnType = "Z", isStatic = true)
            .matchSingle().method.returnEarly(true)
        val classes = mutableListOf<ClassDef>()
        classDefForEach { classes.add(it) }
        val parents = classes.associate { it.type to it.superclass }
        val roots = setOf("Landroid/content/res/Resources;", "Landroid/content/Context;",
            "Landroid/content/res/TypedArray;", "Landroid/widget/TextView;", "Landroidx/fragment/app/Fragment;")
        fun root(type: String): String? {
            var current: String? = type
            while (current != null) {
                if (current in roots) return current
                current = parents[current] ?: when (current) {
                    "Landroid/app/Activity;", "Landroid/app/Application;", "Landroid/content/ContextWrapper;",
                    "Landroid/view/ContextThemeWrapper;", "Landroid/app/Service;" -> "Landroid/content/Context;"
                    "Landroid/widget/Button;", "Landroid/widget/EditText;", "Landroid/widget/CompoundButton;" -> "Landroid/widget/TextView;"
                    else -> null
                }
            }
            return null
        }
        var hooked = 0
        for (clazz in classes) {
            // Extension calls must reach the originals, including when the runtime switch is off.
            if (clazz.type.startsWith("Lapp/local/extension/")) continue
            for (method in clazz.methods) {
                val instructions = method.implementation?.instructions?.toList() ?: continue
                val edits = instructions.withIndex().mapNotNull { (index, instruction) ->
                    if (instruction.opcode !in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)) return@mapNotNull null
                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
                    if (reference.name !in setOf("getString", "getText", "setText")) return@mapNotNull null
                    val owner = root(reference.definingClass) ?: return@mapNotNull null
                    val params = reference.parameterTypes.map { it.toString() }
                    val valid = when {
                        owner == "Landroid/widget/TextView;" -> reference.name == "setText" && reference.returnType == "V" &&
                            (params == listOf("I") || params == listOf("I", "Landroid/widget/TextView\$BufferType;"))
                        reference.name == "getText" -> reference.returnType == "Ljava/lang/CharSequence;" && params == listOf("I")
                        reference.name == "getString" -> reference.returnType == "Ljava/lang/String;" &&
                            (params == listOf("I") || owner != "Landroid/content/res/TypedArray;" && params == listOf("I", "[Ljava/lang/Object;"))
                        else -> false
                    }
                    if (!valid) return@mapNotNull null
                    val target = ImmutableMethodReference(COPY, reference.name, listOf(owner) + params, reference.returnType)
                    val replacement = when (instruction) {
                        is FiveRegisterInstruction -> BuilderInstruction35c(Opcode.INVOKE_STATIC, instruction.registerCount,
                            instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF, instruction.registerG, target)
                        is RegisterRangeInstruction -> BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, instruction.startRegister, instruction.registerCount, target)
                        else -> error("Unsupported string call in $method")
                    }
                    index to replacement
                }
                if (edits.isEmpty()) continue
                val mutable = mutableClassDefBy(clazz).methods.single {
                    it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
                }
                for ((index, replacement) in edits) mutable.implementation!!.replaceInstruction(index, replacement)
                hooked += edits.size
            }
        }
        check(hooked > 0) { "No resource readers found" }
        val title = Fingerprint(definingClass = "Lcom/curve/launchpad/model/LaunchpadItem\$Button;",
            name = "getTitle", returnType = "Ljava/lang/String;", parameters = emptyList(), isStatic = false).matchSingle().method
        val returns = title.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        check(returns.size == 1)
        val register = (returns.single().value as OneRegisterInstruction).registerA
        title.addInstructions(returns.single().index, """
            invoke-static/range {v$register .. v$register}, $COPY->title(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$register
        """)
    }
}
