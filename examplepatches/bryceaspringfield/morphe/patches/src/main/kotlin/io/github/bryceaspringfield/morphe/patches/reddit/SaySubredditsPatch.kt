package io.github.bryceaspringfield.morphe.patches.reddit

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import io.github.bryceaspringfield.morphe.patches.reddit.Constants.COMPATIBILITY_REDDIT
import java.util.logging.Logger

private const val SUBREDDITS_CLASS = "Lio/github/bryceaspringfield/morphe/extension/reddit/Subreddits;"
private const val RESOURCES = "Landroid/content/res/Resources;"
private const val CONTEXT = "Landroid/content/Context;"
private val subredditsLogger = Logger.getLogger("SaySubredditsPatch")

/** The framework's Context classes; an app class extending one of these reads strings as a Context. */
private val FRAMEWORK_CONTEXTS = setOf(
    CONTEXT, "Landroid/content/ContextWrapper;", "Landroid/view/ContextThemeWrapper;", "Landroid/app/Activity;",
    "Landroid/app/Application;", "Landroid/app/Service;", "Landroid/app/IntentService;",
)

/** Resources' text readers, by name and parameters, each with its return type. */
private val RESOURCE_READERS = mapOf(
    "getString(I)" to "Ljava/lang/String;",
    "getString(I[Ljava/lang/Object;)" to "Ljava/lang/String;",
    "getText(I)" to "Ljava/lang/CharSequence;",
    "getQuantityString(II)" to "Ljava/lang/String;",
    "getQuantityString(II[Ljava/lang/Object;)" to "Ljava/lang/String;",
    "getQuantityText(II)" to "Ljava/lang/CharSequence;",
    "getStringArray(I)" to "[Ljava/lang/String;",
)

/** Context's text readers. */
private val CONTEXT_READERS = mapOf(
    "getString(I)" to "Ljava/lang/String;",
    "getString(I[Ljava/lang/Object;)" to "Ljava/lang/String;",
    "getText(I)" to "Ljava/lang/CharSequence;",
)

/** Leaves a flag among the app's resources, which tells the extension to show the switch. */
private val saySubredditsFlagPatch = resourcePatch {
    execute {
        // A new values entry gets no resource ID from the patcher, while a new raw file does.
        get("res/raw/morphe_say_subreddits.txt", copy = false).apply { parentFile.mkdirs() }.writeText("on\n")
    }
}

@Suppress("unused")
val saySubredditsPatch = bytecodePatch(
    name = "Say subreddits",
    description = "Adds a switch, off until turned on in Settings > Morphe, which renames communities to subreddits " +
            "throughout Reddit's own text, in English and Spanish, and in the keyword filter's settings. " +
            "",
    default = true,
) {
    compatibleWith(COMPATIBILITY_REDDIT)
    dependsOn(keywordFilterSettingsPatch, saySubredditsFlagPatch)

    execute {
        // Every app class extending a framework Context, found through the superclasses the app's own dex files hold.
        val superclasses = HashMap<String, String?>()
        classDefForEach { superclasses[it.type] = it.superclass }
        val contexts = HashSet(FRAMEWORK_CONTEXTS)
        superclasses.keys.forEach { type ->
            val seen = ArrayList<String>()
            var current: String? = type
            while (current != null && current !in contexts && current in superclasses) {
                seen.add(current)
                current = superclasses[current]
            }
            if (current in contexts) contexts.addAll(seen)
        }

        /** The extension method replacing a call, or null when the call reads no string resource. */
        fun replacement(instruction: Instruction): ImmutableMethodReference? {
            if (instruction.opcode != Opcode.INVOKE_VIRTUAL && instruction.opcode != Opcode.INVOKE_VIRTUAL_RANGE) return null
            val method = instruction.getReference<MethodReference>() ?: return null
            val receiver = when (method.definingClass) {
                RESOURCES -> RESOURCES
                in contexts -> CONTEXT
                else -> return null
            }
            val key = method.name + "(" + method.parameterTypes.joinToString("") + ")"
            val returns = (if (receiver == RESOURCES) RESOURCE_READERS else CONTEXT_READERS)[key] ?: return null
            if (method.returnType != returns) return null
            return ImmutableMethodReference(SUBREDDITS_CLASS, method.name, listOf(receiver) + method.parameterTypes.map { it.toString() }, returns)
        }

        val found = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lio/github/bryceaspringfield/")) return@classDefForEach
            if (classDef.methods.any { m -> m.implementation?.instructions?.any { replacement(it) != null } == true }) found.add(classDef)
        }
        var replaced = 0
        found.forEach { classDef ->
            mutableClassDefBy(classDef).methods.forEach { method ->
                if (method.implementation == null) return@forEach
                method.instructions.toList().forEachIndexed { index, instruction ->
                    val target = replacement(instruction) ?: return@forEachIndexed
                    if (instruction is RegisterRangeInstruction) {
                        method.replaceInstruction(index, BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE,
                            instruction.startRegister, instruction.registerCount, target))
                    } else {
                        val call = instruction as FiveRegisterInstruction
                        method.replaceInstruction(index, BuilderInstruction35c(Opcode.INVOKE_STATIC, call.registerCount,
                            call.registerC, call.registerD, call.registerE, call.registerF, call.registerG, target))
                    }
                    replaced++
                }
            }
        }
        if (replaced == 0) subredditsLogger.warning("Could not find Reddit's string reads; Say subreddits renames only the filter's text")
        else subredditsLogger.info("Say subreddits: routed $replaced string reads in ${found.size} classes")
    }
}
