package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * Ask before a call on every call button (#172). The top bar's two seams ([HIDE_CALL_BAR]) see an everyday chat's
 * buttons, but 587 also lists call buttons where neither seam walks: a business chat's catalog bar and the New message
 * screen. Every call button comes out of one of two builders, audio and video, each wrapping the button it built in the
 * bar's call wrapper and returning it. The hook hands that wrapper to the extension right before the return, so the tap
 * asks first wherever Messenger then puts the button. The seams find those buttons already asking and leave them be.
 */
internal const val CALL_BUTTON_BUILT = "call_button_built"
internal const val CALL_CONFIRM_BUILT = "Lapp/hushmessenger/extension/CallConfirm;->built(Ljava/lang/Object;)V"

/**
 * The register a call button builder returns its wrapper in: the method's only return, of a new instance of its declared
 * return type made right before it, which nothing branches to. Null for any other method.
 */
internal fun Method.callButtonReturn(): Int? {
    val wrapper = returnType
    if (!wrapper.startsWith("L") || wrapper.startsWith("Ljava/") || wrapper.startsWith("Landroid/")) return null
    val code = implementation?.instructions?.toList() ?: return null
    val at = code.indices.filter { code[it].opcode == Opcode.RETURN_OBJECT }.singleOrNull() ?: return null
    if (at < 2) return null
    val register = (code[at] as OneRegisterInstruction).registerA
    val made = code[at - 2]
    if (made.opcode != Opcode.NEW_INSTANCE || (made as OneRegisterInstruction).registerA != register ||
        ((made as ReferenceInstruction).reference as? TypeReference)?.type != wrapper) return null
    val init = code[at - 1]
    val constructor = (init as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    if (init.opcode != Opcode.INVOKE_DIRECT || (init as FiveRegisterInstruction).registerC != register ||
        constructor.definingClass != wrapper || constructor.name != "<init>" || constructor.parameterTypes.isEmpty()) return null
    if (at in jumpTargets()) return null
    return register
}

/** The one everyday call tag the builder gives its button, as a literal or through a string table, else null. */
internal fun Method.callButtonTag(tables: Map<String, Map<Int, String>>): String? {
    val code = implementation?.instructions?.toList() ?: return null
    return MARK_READ_CALL_TAGS.filter { code.indexOfAnchor(it, tables) >= 0 }.singleOrNull()
}

/** The base type the wrapper's constructor takes the built button as, its first parameter. */
private fun Method.callButtonBase(): String {
    val code = implementation!!.instructions.toList()
    val init = code[code.indexOfFirst { it.opcode == Opcode.RETURN_OBJECT } - 1]
    return ((init as ReferenceInstruction).reference as MethodReference).parameterTypes.first().toString()
}

/**
 * The audio and video call button builders: a button for a chat (a thread key) in the chat's colors (a Mig scheme),
 * tagged as one of the two everyday call buttons and returned in its wrapper. Taken only while there is exactly one of
 * each, both returning the same wrapper, which extends the abstract button base its constructor takes first: the shape
 * the extension looks inside for the tag and the tap listeners.
 */
internal fun findCallButtonBuilt(classes: Iterable<ClassDef>, tables: Map<String, Map<Int, String>> = activeStringTables): List<Method> {
    val builders = classes.flatMap { cls ->
        cls.methods.filter { method ->
            method.parameterTypes.map { it.toString() }.let { THREAD_KEY_TYPE in it && MIG_SCHEME in it } &&
                method.callButtonReturn() != null && method.callButtonTag(tables) != null
        }
    }.groupBy { it.callButtonTag(tables)!! }
    val audio = builders["audio_call_button"]?.singleOrNull() ?: return emptyList()
    val video = builders["video_call_button"]?.singleOrNull() ?: return emptyList()
    if (audio.returnType != video.returnType || audio.callButtonBase() != video.callButtonBase()) return emptyList()
    val wrapper = classes.firstOrNull { it.type == audio.returnType } ?: return emptyList()
    val base = classes.firstOrNull { it.type == audio.callButtonBase() } ?: return emptyList()
    if (wrapper.superclass != base.type || !AccessFlags.ABSTRACT.isSet(base.accessFlags) || AccessFlags.INTERFACE.isSet(base.accessFlags)) return emptyList()
    return listOf(audio, video)
}

private fun callButtonBuiltChanged(method: Method): Nothing =
    throw PatchException("Messenger controls: the call button builder ${method.hookId()} no longer matches the tested build")

internal fun Method.validateCallButtonBuilt() {
    callButtonReturn() ?: callButtonBuiltChanged(this)
}

/** Right before the return: the wrapper goes to the extension, which hands nothing back, so no register changes. */
internal fun MutableMethod.injectCallButtonBuilt() {
    val register = callButtonReturn() ?: callButtonBuiltChanged(this)
    val at = implementation!!.instructions.indexOfFirst { it.opcode == Opcode.RETURN_OBJECT }
    addInstructions(at, "invoke-static/range {v$register .. v$register}, $CALL_CONFIRM_BUILT")
}
