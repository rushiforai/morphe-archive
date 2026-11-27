package app.hushmessenger.patches.controls

import app.hushmessenger.patches.MessengerTarget
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
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
 * chat head closes, and on a Huawei it did the same in the chat itself. The hook asks the extension at the
 * constructor's entry, before anything reads the config, and writes its answer back into that boolean.
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

/**
 * Videos sent in a chat (#104). 588 plays those through Messenger's newer player, which never reaches the constructor
 * above. That player gets its drawing surface from one of two static siblings, both taking (VideoPlayerParams, the
 * player, its config): one returns a SurfaceView controller behind an interface, the other a controller holding a
 * TextureView that implements the same interface, which Messenger itself uses when it reuses a TextureView. The hook
 * sends the SurfaceView one to its sibling while the extension says so.
 */
internal const val GROOT_TEXTURE = "groot_texture_view"
internal const val GROOT_TEXTURE_CALL = "$CHAT_HEAD_VIDEO_HOST->grootTextureView()Z"
/** Unrenamed by Redex, like the player settings class. */
internal const val VIDEO_PLAYER_PARAMS = "Lcom/facebook/video/engine/api/VideoPlayerParams;"
private const val TEXTURE_VIEW = "Landroid/view/TextureView;"

private fun Method.grootParams() = parameterTypes.map { it.toString() }

/** The class's static (VideoPlayerParams, the class itself, a config) methods with code. */
private fun ClassDef.grootMakers(): List<Method> = methods.filter { method ->
    val params = method.grootParams()
    AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation != null && params.size == 3 &&
        params[0] == VIDEO_PLAYER_PARAMS && params[1] == type && params[2].startsWith("L") && !params[2].startsWith("Ljava/")
}

/**
 * The sibling that makes the TextureView controller for [surface]: the class's other maker with the same parameters and
 * a different return type, while there's exactly one.
 */
internal fun ClassDef.grootTextureSibling(surface: Method): Method? =
    grootMakers().filter { it.name != surface.name && it.grootParams() == surface.grootParams() && it.returnType != surface.returnType }
        .singleOrNull()

/**
 * The SurfaceView maker, taken only while exactly one class has the pair: the maker returns an interface, its sibling
 * returns a class that implements it and holds a TextureView, and the maker has a register of its own for the hook.
 */
internal fun findGrootTexture(classes: Iterable<ClassDef>): List<Method> {
    val owners = classes.filter { it.grootMakers().size >= 2 }
    if (owners.isEmpty()) return emptyList()
    val types = classes.associateBy { it.type }
    val makers = owners.flatMap { owner ->
        owner.grootMakers().filter { surface ->
            val texture = owner.grootTextureSibling(surface) ?: return@filter false
            val face = types[surface.returnType] ?: return@filter false
            val made = types[texture.returnType] ?: return@filter false
            AccessFlags.INTERFACE.isSet(face.accessFlags) && surface.returnType in made.interfaces &&
                made.fields.any { it.type == TEXTURE_VIEW && !AccessFlags.STATIC.isSet(it.accessFlags) } &&
                surface.implementation!!.registerCount > 3
        }
    }
    return listOfNotNull(makers.singleOrNull())
}

private fun grootTextureChanged(method: Method): Nothing =
    throw PatchException("Messenger controls: the video player's SurfaceView maker in ${method.hookId()} no longer matches the tested build")

/** The sibling to call, or a refusal when [owner] no longer has the shape the finder took. */
internal fun Method.validateGrootTexture(owner: ClassDef): Method {
    if (owner.grootMakers().none { it.name == name && it.grootParams() == grootParams() }) grootTextureChanged(this)
    if ((implementation?.registerCount ?: 0) <= 3) grootTextureChanged(this)
    return owner.grootTextureSibling(this) ?: grootTextureChanged(this)
}

/** At the entry: while the extension says so, return what the TextureView sibling makes, from the same three arguments. */
internal fun MutableMethod.injectGrootTexture(texture: Method) {
    addInstructionsWithLabels(
        0,
        """
            invoke-static {}, $GROOT_TEXTURE_CALL
            move-result v0
            if-eqz v0, :groot_stock
            invoke-static/range {p0 .. p2}, ${texture.hookId()}
            move-result-object v0
            return-object v0
        """.trimIndent(),
        ExternalLabel("groot_stock", getInstruction(0)),
    )
}

@Suppress("unused")
val chatHeadVideoPatch = patch(
    name = "Fix videos in chat heads",
    description = "Draws videos in a chat head like the rest of the chat instead of on a separate layer, which some phones showed as a black box that stayed on screen after the chat head closed. On the Huawei and Honor phones where that layer also leaves a box behind in the chat itself, every video is drawn this way.",
    default = true,
) {
    category("Fixes")
    compatibleWith(MessengerTarget.COMPATIBILITY)
    dependsOn(settingsExtension)
    execute {
        validateControls(discoveredControls, setOf(CHAT_HEAD_VIDEO, GROOT_TEXTURE))
        val original = discoveredControls.getValue(CHAT_HEAD_VIDEO).single()
        original.validateChatHeadVideo()
        mutableClassDefBy(original.definingClass).methods.single { it.hookId() == original.hookId() }.injectChatHeadVideo()
        val surface = discoveredControls.getValue(GROOT_TEXTURE).single()
        val owner = mutableClassDefBy(surface.definingClass)
        val texture = surface.validateGrootTexture(owner)
        owner.methods.single { it.hookId() == surface.hookId() }.injectGrootTexture(texture)
    }
}
