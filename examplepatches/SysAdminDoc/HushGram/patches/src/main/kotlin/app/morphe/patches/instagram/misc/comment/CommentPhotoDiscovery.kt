/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.comment

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.instagram.download.INSTAGRAM_MEDIA
import app.morphe.patches.instagram.download.MEDIA
import app.morphe.patches.instagram.download.imageBridges
import app.morphe.patches.instagram.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val PHOTO_PATCH = "Save comment photo"
internal const val PHOTO_NATIVE = "$EXTENSION_PACKAGE/comment/CommentPhotoNative;"
internal const val PHOTO_ROW = "$EXTENSION_PACKAGE/comment/PhotoRow;"
internal const val COMMENT_PHOTO = "$EXTENSION_PACKAGE/comment/CommentPhoto;"
/** The comment's own attached media, as the server names it. Its parent post is media_info. */
internal const val COMMENT_MEDIA_KEY = "media_comment_info"
internal const val SAVE_ACTION = "SaveMedia"

/**
 * The calls the photo bridge makes on the selected comment, each a public getter proved to read the
 * comment's own media_comment_info, never its parent post, and the PHOTO kind's value.
 */
internal data class CommentPhotoPlan(
    val surface: CommentSurface, val gif: MethodReference, val info: MethodReference, val media: MethodReference,
    val kind: MethodReference, val mediaGif: MethodReference, val photo: Int, val icon: Int, val label: Int,
    val images: () -> Unit,
)

internal fun BytecodePatchContext.findCommentPhoto(): CommentPhotoPlan = discovering(PHOTO_PATCH) {
    val classes = classPool()
    val surface = commentSurface(classes)
    val readers = mutableMapOf<String, JsonReads>()
    fun jsonApi(input: String) = readers.getOrPut(input) { jsonReads(input, classes) }
    for (type in listOf(PHOTO_NATIVE, PHOTO_ROW, COMMENT_PHOTO, INSTAGRAM_MEDIA)) {
        if (type !in classes) refuse("missing extension boundary $type")
    }
    fun clazz(type: String) = classes[type] ?: refuse("missing native class $type")
    fun methods() = classes.values.asSequence().flatMap { it.methods.asSequence() }
    val selected = clazz(surface.selectedType)
    requirePublicField(selected, surface.rawField)
    val raw = clazz(surface.raw)
    requirePublic(raw)
    val pando = clazz(surface.pando)

    // The selected comment keeps the raw comment its conversion was handed.
    val converter = methods().filter { method -> method.returnType == selected.type &&
        method.parameters().count { it == raw.type } == 1 && method.code().any { instruction ->
            instruction.call()?.let { it.name == "<init>" && it.definingClass == selected.type } == true }
    }.toList().one("selected-comment conversion from the raw comment")
    val kept = constructorField(converter, null, selected.type, classes, valueType = raw.type,
        incoming = parameterRegister(converter, converter.parameters().indexOf(raw.type)), what = "raw comment")
    if (kept.toString() != surface.rawField.toString()) refuse("selected comment keeps a different raw comment")

    // Its own media, read through the interface both of the raw comment's classes implement.
    val treeInfo = hashGetter(pando, COMMENT_MEDIA_KEY, null)
    val info = raw.methods.filter { it.matches(treeInfo) && AccessFlags.ABSTRACT.isSet(it.accessFlags) }
        .one("raw comment's $COMMENT_MEDIA_KEY getter")
    val infoType = clazz(info.returnType)
    if (!AccessFlags.INTERFACE.isSet(infoType.accessFlags)) refuse("$COMMENT_MEDIA_KEY is no longer an interface")
    requirePublic(infoType)
    val parsedRaw = classes.values.filter { raw.type in it.interfaces && !treeBacked(it, classes) }
        .one("comment's parsed model")
    val parsedInfo = parsedTextField(parsedRaw.methods.filter { it.matches(info) }.one("parsed $COMMENT_MEDIA_KEY getter"),
        parsedRaw.type, info.returnType)
    val commentParser = methods().filter { method -> method.name == "unsafeParseFromJson" &&
        method.returnType in setOf(OBJECT, parsedRaw.type) && COMMENT_MEDIA_KEY in method.strings() &&
        method.code().any { it.call()?.let { call -> call.name == "<init>" && call.definingClass == parsedRaw.type } == true }
    }.toList().one("comment parser")
    val infoModels = classes.values.filter { infoType.type in it.interfaces }
    val infoParsed = infoModels.filter { !treeBacked(it, classes) }.one("parsed $COMMENT_MEDIA_KEY model")
    val infoTree = infoModels.filter { treeBacked(it, classes) }.one("tree-backed $COMMENT_MEDIA_KEY model")
    val infoParser = methods().filter { method -> method.name == "unsafeParseFromJson" &&
        method.returnType in setOf(OBJECT, infoParsed.type) && "media" in method.strings() &&
        method.code().any { it.call()?.let { call -> call.name == "<init>" && call.definingClass == infoParsed.type } == true }
    }.toList().one("$COMMENT_MEDIA_KEY parser")
    val commentRead = parserKeyedRead(commentParser, COMMENT_MEDIA_KEY, classes, jsonApi(parserInput(commentParser)),
        valueParser = infoParser.definingClass)
    if (constructorField(commentParser, commentRead + 1, parsedRaw.type, classes, allowAbsent = true,
            valueType = infoType.type, what = COMMENT_MEDIA_KEY).toString() != parsedInfo.toString()) {
        refuse("parsed $COMMENT_MEDIA_KEY does not reach its getter")
    }

    // The media inside it, parsed from its "media" key or read from the tree's "media" field.
    val media = infoType.methods.filter { it.parameterTypes.isEmpty() && it.returnType == MEDIA }
        .one("$COMMENT_MEDIA_KEY media getter")
    val parsedMedia = parsedTextField(infoParsed.methods.filter { it.matches(media) }.one("parsed media getter"),
        infoParsed.type, MEDIA)
    val mediaRead = parserKeyedRead(infoParser, "media", classes, jsonApi(parserInput(infoParser)), returns = MEDIA)
    if (constructorField(infoParser, mediaRead + 1, infoParsed.type, classes, allowAbsent = true, valueType = MEDIA,
            what = "comment media").toString() != parsedMedia.toString()) refuse("parsed comment media does not reach its getter")
    val treeMedia = parsedTextField(infoTree.methods.filter { it.matches(media) }.one("tree media getter"), infoTree.type, MEDIA)
    val stores = methods().filter { method -> method.code().any { it.opcode in fieldWrites && it.field()?.toString() == treeMedia.toString() } }.toList()
    if (stores.isEmpty() || stores.any { it.definingClass != infoTree.type || !it.loads("media".hashCode()) }) {
        refuse("tree comment media is stored from something other than its media field")
    }

    // GIFs and anything that isn't a still photo get no row.
    val gif = raw.methods.filter { it.parameterTypes.isEmpty() && it.returnType == GIPHY && AccessFlags.ABSTRACT.isSet(it.accessFlags) }
        .one("raw comment's GIF getter")
    if (!gif.matches(hashGetter(pando, "giphy_media_info", GIPHY))) refuse("raw comment's GIF getter reads another field")
    val mediaType = clazz(MEDIA)
    requirePublic(mediaType)
    val kind = hashGetter(mediaType, "media_type", INTEGER)
    val mediaGif = hashGetter(mediaType, "giphy_media_info", GIPHY)
    for (getter in listOf(kind, mediaGif)) if (!getter.publicInstance()) refuse("media getter ${getter.name} isn't public")
    val photo = photoKind(mediaType, classes)

    // Instagram's own Save action, beside Copy in the same native action family.
    val family = clazz(surface.copyAction).superclass ?: refuse("native CopyText has no action family")
    val save = classes.values.filter { type -> type.superclass == family && type.methods.any {
        it.name == "toString" && it.parameterTypes.isEmpty() && it.returnType == STRING && nativeActionName(it, classes) == SAVE_ACTION
    } }.one("native $SAVE_ACTION action")
    val (icon, label) = actionResources(save, classes)

    validateCommentHook()
    stub(PHOTO_NATIVE, "photoMedia", listOf(OBJECT), OBJECT)
    validateActionRow(PHOTO_ROW, PHOTO_NATIVE)
    val images = imageBridges(PHOTO_PATCH)
    CommentPhotoPlan(surface, gif, info, media, kind, mediaGif, photo, icon, label, images)
}

/** Only called after discovery and every accessibility/register/stub check succeeded. */
internal fun BytecodePatchContext.applyCommentPhoto(plan: CommentPhotoPlan) = discovering(PHOTO_PATCH) {
    val bridge = stub(PHOTO_NATIVE, "photoMedia", listOf(OBJECT), OBJECT)
    val surface = plan.surface
    applyCommentHook(surface)
    // Each step that finds nothing, a GIF, or another kind ends at the unsupported return.
    replace(bridge, 4, """
        instance-of v0, p0, ${surface.selectedType}
        if-eqz v0, :unsupported
        check-cast p0, ${surface.selectedType}
        iget-object v0, p0, ${surface.rawField}
        if-eqz v0, :unsupported
        invoke-interface { v0 }, ${plan.gif}
        move-result-object v1
        if-nez v1, :unsupported
        invoke-interface { v0 }, ${plan.info}
        move-result-object v0
        if-eqz v0, :unsupported
        invoke-interface { v0 }, ${plan.media}
        move-result-object v0
        if-eqz v0, :unsupported
        invoke-virtual { v0 }, ${plan.kind}
        move-result-object v1
        if-eqz v1, :unsupported
        invoke-virtual { v1 }, $INTEGER->intValue()I
        move-result v1
        const v2, ${plan.photo}
        if-ne v1, v2, :unsupported
        invoke-virtual { v0 }, ${plan.mediaGif}
        move-result-object v1
        if-nez v1, :unsupported
        return-object v0
        :unsupported
        const/4 v0, 0x0
        return-object v0
    """)
    applyActionRow(surface, PHOTO_ROW, PHOTO_NATIVE, plan.icon, plan.label)
    plan.images()
}

private val fieldWrites = setOf(Opcode.IPUT_OBJECT, Opcode.SPUT_OBJECT)

/** The register holding [method]'s parameter at [index]. */
private fun parameterRegister(method: Method, index: Int): Int {
    if (index < 0) refuse("${method.name} lost its parameter")
    val sizes = method.parameters().map { if (it == "J" || it == "D") 2 else 1 }
    return method.implementation!!.registerCount - sizes.sum() + sizes.take(index).sum()
}

private fun Method.loads(literal: Int) = code().any {
    it.opcode in setOf(Opcode.CONST, Opcode.CONST_16, Opcode.CONST_HIGH16, Opcode.CONST_4) &&
        (it as NarrowLiteralInstruction).narrowLiteral == literal
}

/** The one getter on [type] for the tree field [field], held as the hash of its name. */
private fun hashGetter(type: ClassDef, field: String, returns: String?): Method =
    type.methods.filter { method -> method.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(method.accessFlags) &&
        (returns == null || method.returnType == returns) && method.loads(field.hashCode())
    }.one("$field getter on ${type.type}")

/**
 * The media kind meaning a still photo: the enum the media's media_type reads are mapped through,
 * whose PHOTO constant is built, on a path with no branch, with a constant its constructor keeps.
 */
private fun photoKind(media: ClassDef, classes: Map<String, ClassDef>): Int {
    val kinds = media.methods.filter { it.loads("media_type".hashCode()) }.flatMap { method ->
        method.code().filter { it.opcode == Opcode.INVOKE_STATIC }.mapNotNull { it.call() }
            .filter { it.parameters() == listOf(INTEGER) }.mapNotNull { classes[it.returnType] }
    }.distinctBy { it.type }.filter { type -> AccessFlags.ENUM.isSet(type.accessFlags) &&
        type.methods.any { it.name == "<clinit>" && "PHOTO" in it.strings() } }
    val kind = kinds.one("media kind enum")
    val init = kind.methods.filter { it.name == "<clinit>" }.one("media kind initializer")
    val code = init.code()
    val nameAt = code.indices.filter { (code[it].reference() as? StringReference)?.string == "PHOTO" }.one("PHOTO kind label")
    val name = (code[nameAt] as OneRegisterInstruction).registerA
    val constructorAt = (nameAt + 1 until code.size).firstOrNull { at ->
        code[at].call()?.let { it.definingClass == kind.type && it.name == "<init>" } == true
    } ?: refuse("PHOTO kind is never built")
    if (code.take(constructorAt).any { it is OffsetInstruction || it is SwitchPayload }) refuse("PHOTO kind is built on a branch")
    val call = code[constructorAt].call()!!
    val arguments = code[constructorAt].arguments()
    if (call.parameters() != listOf(STRING, "I", "I") || arguments[1] != name ||
        code.subList(nameAt + 1, constructorAt).any { it.writes(name) }) refuse("PHOTO isn't the kind's name")
    val value = init.constantBefore(constructorAt, arguments[3]) ?: refuse("PHOTO kind has no constant value")
    val constructor = kind.methods.filter { it.matches(call) && it.name == "<init>" }.one("media kind constructor")
    val body = constructor.code()
    val self = constructor.implementation!!.registerCount - 4
    val stored = body.getOrNull(1)
    if (body.size != 3 || body[0].call()?.toString() != "Ljava/lang/Enum;-><init>(${STRING}I)V" ||
        body[0].arguments() != listOf(self, self + 1, self + 2) || stored?.opcode != Opcode.IPUT ||
        (stored as TwoRegisterInstruction).registerA != self + 3 || stored.registerB != self ||
        stored.field()?.definingClass != kind.type || body[2].opcode != Opcode.RETURN_VOID) {
        refuse("media kind no longer keeps its value")
    }
    if (value <= 0) refuse("PHOTO kind value $value is invalid")
    return value
}

/**
 * A native action's name as its toString answers it: a constant, or a constant looked up in the
 * app's shared string pool, a static switch from each key straight to a returned constant.
 */
internal fun nativeActionName(method: Method, classes: Map<String, ClassDef>): String? {
    val code = method.code()
    fun returned(at: Int): String? {
        val load = code.getOrNull(at) ?: return null
        val back = code.getOrNull(at + 1) ?: return null
        val string = (load.reference() as? StringReference)?.string ?: return null
        return string.takeIf { back.opcode == Opcode.RETURN_OBJECT &&
            (back as OneRegisterInstruction).registerA == (load as OneRegisterInstruction).registerA }
    }
    if (code.size == 2) return returned(0)
    if (code.size != 4 || code[1].opcode != Opcode.INVOKE_STATIC || code[2].opcode != Opcode.MOVE_RESULT_OBJECT ||
        code[3].opcode != Opcode.RETURN_OBJECT) return null
    val key = code[0] as? NarrowLiteralInstruction ?: return null
    val register = (code[0] as OneRegisterInstruction).registerA
    val call = code[1].call()!!
    if (call.parameters() != listOf("I") || call.returnType != STRING || code[1].arguments() != listOf(register) ||
        (code[2] as OneRegisterInstruction).registerA != (code[3] as OneRegisterInstruction).registerA) return null
    val pool = classes[call.definingClass]?.methods?.singleOrNull {
        it.matches(call) && AccessFlags.STATIC.isSet(it.accessFlags)
    } ?: return null
    return pooledString(pool, key.narrowLiteral)
}

private fun pooledString(pool: Method, key: Int): String? {
    val code = pool.code()
    val switch = code.firstOrNull() ?: return null
    if (switch.opcode !in setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH) ||
        (switch as OneRegisterInstruction).registerA != pool.implementation!!.registerCount - 1) return null
    val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
    fun at(address: Int) = addresses.indexOf(address).takeIf { it in code.indices }
    val payload = at((switch as OffsetInstruction).codeOffset)?.let { code[it] as? SwitchPayload } ?: return null
    val target = payload.switchElements.singleOrNull { it.key == key }?.offset ?: return null
    val load = at(target) ?: return null
    val string = (code[load].reference() as? StringReference)?.string ?: return null
    val back = code.getOrNull(load + 1) ?: return null
    return string.takeIf { back.opcode == Opcode.RETURN_OBJECT &&
        (back as OneRegisterInstruction).registerA == (code[load] as OneRegisterInstruction).registerA }
}
