package app.hushmessenger.patches.controls

import app.hushmessenger.patches.MessengerTarget
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Videos in chat heads (#104). Messenger's video player is built from (context, the video view, its config), and the
 * constructor reads one boolean from the config to pick a TextureView over a SurfaceView, which 587 uses on Android 10
 * and newer. On some phones the SurfaceView's separate layer shows black in a chat head and stays on screen after the
 * chat head closes. The hook asks the extension at the constructor's entry, before anything reads the config, and
 * writes its answer back into that boolean.
 */
internal const val CHAT_HEAD_VIDEO = "chat_head_video"
internal const val CHAT_HEAD_VIDEO_HOST = "Lapp/hushmessenger/extension/ChatHeadVideo;"
internal const val CHAT_HEAD_VIDEO_CALL = "$CHAT_HEAD_VIDEO_HOST->textureView(Landroid/content/Context;Z)Z"

/**
 * The player reads the video library's shared default settings, a class Redex leaves unrenamed, and nothing else built
 * from a context, a view and a config does. Its thread name isn't an anchor: the 280 and armv7 families moved it out
 * into a helper.
 */
internal const val PLAYER_SETTINGS = "Lcom/facebook/video/heroplayer/setting/HeroPlayerSetting;"
private const val CONTEXT = "Landroid/content/Context;"
/** The hook's three scratch registers, all locals that nothing has written yet at the constructor's entry. */
private const val SCRATCH = 3

private fun ReferenceInstruction.chatHeadField() = reference as? FieldReference

/**
 * The config's TextureView boolean: the only boolean the constructor reads from its third parameter, tested by the
 * very next instruction. Null when this isn't the player's constructor or it has no room for the hook.
 */
internal fun Method.chatHeadVideoFlag(): FieldReference? {
    if (name != "<init>" || returnType != "V" || AccessFlags.STATIC.isSet(accessFlags)) return null
    val params = parameterTypes.map { it.toString() }
    if (params.size != 3 || params[0] != CONTEXT || !params[2].startsWith("L") || params[2].startsWith("Ljava/")) return null
    val implementation = implementation ?: return null
    if (implementation.registerCount - (params.size + 1) < SCRATCH) return null
    val code = implementation.instructions.toList()
    if (code.none { it.opcode == Opcode.SGET_OBJECT && (it as ReferenceInstruction).chatHeadField()?.let { field ->
            field.definingClass == PLAYER_SETTINGS && field.type == PLAYER_SETTINGS } == true }) return null
    val reads = code.indices.filter { at ->
        code[at].opcode == Opcode.IGET_BOOLEAN && (code[at] as ReferenceInstruction).chatHeadField()?.definingClass == params[2]
    }
    val read = reads.singleOrNull() ?: return null
    val test = code.getOrNull(read + 1) ?: return null
    if (test.opcode != Opcode.IF_EQZ || (test as OneRegisterInstruction).registerA != (code[read] as TwoRegisterInstruction).registerA) return null
    // The config it reads is the parameter itself, or the copy the constructor made of it.
    val config = parameterRegister(3)
    val holder = (code[read] as TwoRegisterInstruction).registerB
    val writes = { register: Int -> (0 until read).filter { code[it].chatHeadWrites(register) } }
    if (writes(config).isNotEmpty()) return null
    if (holder != config) {
        val copy = writes(holder).singleOrNull() ?: return null
        if (code[copy].opcode !in CHAT_HEAD_MOVES || (code[copy] as TwoRegisterInstruction).registerB != config) return null
    }
    return (code[read] as ReferenceInstruction).chatHeadField()
}

private val CHAT_HEAD_MOVES = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)

/** Whether the instruction writes [register], or a wide pair that covers it. */
private fun Instruction.chatHeadWrites(register: Int): Boolean {
    val target = (this as? OneRegisterInstruction)?.registerA ?: return false
    return opcode.setsRegister() && (target == register || (opcode.setsWideRegister() && target + 1 == register))
}

/** The player's constructor, taken only while exactly one method has the shape and the config keeps the boolean writable. */
internal fun findChatHeadVideo(classes: Iterable<ClassDef>): List<Method> {
    val candidates = classes.flatMap { cls -> cls.methods.filter { it.name == "<init>" && it.chatHeadVideoFlag() != null } }
    val player = candidates.singleOrNull() ?: return emptyList()
    val flag = player.chatHeadVideoFlag()!!
    val config = classes.firstOrNull { it.type == flag.definingClass } ?: return emptyList()
    val field = config.fields.singleOrNull { it.name == flag.name && it.type == "Z" } ?: return emptyList()
    val locked = AccessFlags.STATIC.value or AccessFlags.FINAL.value or AccessFlags.PRIVATE.value
    if (field.accessFlags and locked != 0) return emptyList()
    return listOf(player)
}

private fun chatHeadVideoChanged(method: Method): Nothing =
    throw PatchException("Messenger controls: the video player's constructor in ${method.hookId()} no longer matches the tested build")

internal fun Method.validateChatHeadVideo() {
    chatHeadVideoFlag() ?: chatHeadVideoChanged(this)
}

/** At the entry: hand Messenger's choice and the context to the extension, and put its answer back in the config. */
internal fun MutableMethod.injectChatHeadVideo() {
    val flag = chatHeadVideoFlag() ?: chatHeadVideoChanged(this)
    val field = "${flag.definingClass}->${flag.name}:Z"
    addInstructions(0, """
        move-object/from16 v0, p1
        move-object/from16 v1, p3
        iget-boolean v2, v1, $field
        invoke-static {v0, v2}, $CHAT_HEAD_VIDEO_CALL
        move-result v2
        iput-boolean v2, v1, $field
    """.trimIndent())
}

@Suppress("unused")
val chatHeadVideoPatch = bytecodePatch(
    name = "Fix videos in chat heads",
    description = "Draws videos in a chat head like the rest of the chat instead of on a separate layer, which some phones showed as a black box that stayed on screen after the chat head closed. Videos in the app itself are left as they are.",
    default = true,
) {
    category("Fixes")
    compatibleWith(MessengerTarget.COMPATIBILITY)
    dependsOn(settingsExtension)
    execute {
        validateControls(discoveredControls, setOf(CHAT_HEAD_VIDEO))
        val original = discoveredControls.getValue(CHAT_HEAD_VIDEO).single()
        original.validateChatHeadVideo()
        mutableClassDefBy(original.definingClass).methods.single { it.hookId() == original.hookId() }.injectChatHeadVideo()
    }
}
