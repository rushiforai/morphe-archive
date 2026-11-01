/*
 * Forked from https://github.com/SysAdminDoc/HushGram at 539b6467 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.threads.download

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** Instagram's post model, which Threads carries and which keeps its name. */
internal const val MEDIA = "Lcom/instagram/feed/media/Media;"
internal const val USER = "Lcom/instagram/user/model/User;"
internal const val VIDEO_VERSION = "Lcom/instagram/api/schemas/VideoVersionIntf;"
internal const val PANDO_VIDEO_VERSION = "Lcom/instagram/api/schemas/ImmutablePandoVideoVersion;"

/** A picture's sizes, and the tree-backed class that reads them. */
internal const val IMAGE_INFO = "Lcom/instagram/model/mediasize/ImageInfo;"
internal const val PANDO_IMAGE_INFO = "Lcom/instagram/model/mediasize/ImmutablePandoImageInfo;"

/** One size of a picture. Its getters keep their names. */
internal const val IMAGE_URL = "Lcom/instagram/common/typedurl/ImageUrl;"

/** The extension's bridges to the media model, whose bodies [mediaBridges] and [imageBridges] write. */
internal const val INSTAGRAM_MEDIA = "$EXTENSION_PACKAGE/download/InstagramMedia;"

/**
 * The getter on [type] for the model field [field]: the one method taking nothing and answering
 * [returns] that loads the field's key. The models read a field from the tree the server sent by
 * the Java hash of its name, so a getter holds that hash as a constant however the release
 * shortened the getter's own name. None, or two, stop the patch naming [patch].
 */
internal fun BytecodePatchContext.pandoGetter(patch: String, type: String, field: String, returns: String): Method {
    val key = field.hashCode()
    val getters = classDefBy(type).methods.filter { method ->
        method.parameterTypes.isEmpty() && method.returnType == returns && !AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.implementation?.instructions?.any { it.loadsLiteral(key) } == true
    }
    return getters.singleOrNull() ?: throw PatchException(
        "$patch: expected one getter on $type answering $returns for $field, found " +
            if (getters.isEmpty()) "none" else getters.joinToString { it.name },
    )
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.loadsLiteral(value: Int): Boolean =
    (opcode == Opcode.CONST || opcode == Opcode.CONST_16 || opcode == Opcode.CONST_HIGH16 || opcode == Opcode.CONST_4) &&
        (this as NarrowLiteralInstruction).narrowLiteral == value

/**
 * One bridge: the extension method [name], and the call [call] its body makes on the argument
 * cast to [receiver]. [primitive] when the call answers an int rather than an object.
 */
private class Bridge(val name: String, val receiver: String, val call: String, val primitive: Boolean = false)

/**
 * Finds what the body of each of the extension's InstagramMedia bridges calls, and answers the
 * step that writes them: the argument cast to the model's type and handed to the getter that reads
 * the field, found by [pandoGetter] or, for the media's id, by its kept name. Everything is found
 * here, so a build where one is missing stops the patch naming [patch] before anything changes.
 *
 * Each body uses its parameter register alone, so the stub's own register count doesn't matter,
 * and goes in first, ahead of the stub's own `return null`, which is then never reached.
 */
internal fun BytecodePatchContext.mediaBridges(patch: String): () -> Unit {
    val videoVersions = pandoGetter(patch, MEDIA, "video_versions", "Ljava/util/List;")
    val dashManifest = pandoGetter(patch, MEDIA, "video_dash_manifest", "Ljava/lang/String;")
    val owner = pandoGetter(patch, MEDIA, "user", USER)
    val takenAt = pandoGetter(patch, MEDIA, "taken_at", "Ljava/lang/Long;")
    val carousel = pandoGetter(patch, MEDIA, "carousel_media", "Ljava/util/List;")
    val username = pandoGetter(patch, USER, "username", "Ljava/lang/String;")
    val mediaId = classDefBy(MEDIA).methods.singleOrNull {
        it.name == "getId" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
    } ?: throw PatchException("$patch: $MEDIA has no getId()")
    // A version comes as either of two classes, so it's read through their interface, by the name
    // the tree-backed class gives each getter.
    fun version(field: String, returns: String) = throughInterface(patch, VIDEO_VERSION, PANDO_VIDEO_VERSION, field, returns)

    return bridgeWriter(patch, listOf(
        Bridge("videoVersions", MEDIA, virtual(videoVersions)),
        Bridge("dashManifest", MEDIA, virtual(dashManifest)),
        Bridge("mediaId", MEDIA, virtual(mediaId)),
        Bridge("owner", MEDIA, virtual(owner)),
        Bridge("takenAt", MEDIA, virtual(takenAt)),
        Bridge("carouselMedia", MEDIA, virtual(carousel)),
        Bridge("username", USER, virtual(username)),
        Bridge("versionUrl", VIDEO_VERSION, version("url", "Ljava/lang/String;")),
        Bridge("versionWidth", VIDEO_VERSION, version("width", "Ljava/lang/Integer;")),
        Bridge("versionHeight", VIDEO_VERSION, version("height", "Ljava/lang/Integer;")),
    ))
}

/**
 * The same for a picture's bridges: a Media's sizes, the candidates among them, and each
 * candidate's address and size, read through the interface every candidate implements.
 */
internal fun BytecodePatchContext.imageBridges(patch: String): () -> Unit {
    val versions = pandoGetter(patch, MEDIA, "image_versions2", IMAGE_INFO)
    val candidates = throughInterface(patch, IMAGE_INFO, PANDO_IMAGE_INFO, "candidates", "Ljava/util/List;")
    val candidate = anInterface(patch, IMAGE_URL).methods
    fun kept(name: String, returns: String): String {
        if (candidate.none { it.name == name && it.parameterTypes.isEmpty() && it.returnType == returns }) {
            throw PatchException("$patch: $IMAGE_URL has no $name()$returns")
        }
        return "invoke-interface {p0}, $IMAGE_URL->$name()$returns"
    }
    return bridgeWriter(patch, listOf(
        Bridge("imageVersions", MEDIA, virtual(versions)),
        Bridge("imageCandidates", IMAGE_INFO, candidates),
        Bridge("candidateUrl", IMAGE_URL, kept("getUrl", "Ljava/lang/String;")),
        Bridge("candidateWidth", IMAGE_URL, kept("getWidth", "I"), primitive = true),
        Bridge("candidateHeight", IMAGE_URL, kept("getHeight", "I"), primitive = true),
    ))
}

/**
 * The same for the posts a Threads post shows in place of media of its own: a linked Instagram post,
 * and the post it attaches, reposts or quotes. These getters are shortened on an interface with no
 * tree-backed key of their own to search for, so they're read off the method that writes a post
 * back out as JSON, which loads each field just before it names it: a field and the plain getter
 * answering it on the same data class, and the interface that class implements declaring that getter.
 * The linked post and the share info have to come off the interface [MEDIA]'s text post info answers,
 * and the three shared posts off the interface the share info answers.
 */
internal fun BytecodePatchContext.linkedPostBridges(patch: String): () -> Unit {
    val writer = classDefByStrings(LINKED_INLINE_MEDIA, StringComparisonType.EQUALS).flatMap { it.methods }
        .singleOrNull { it.writesLinkedPosts() }
        ?: throw PatchException("$patch: expected one method that writes $LINKED_POST_KEYS")
    val info = classDefBy(MEDIA).methods.filter { method ->
        method.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType.startsWith("L") &&
            method.implementation?.instructions?.any { it.loadsLiteral(TEXT_POST_INFO.hashCode()) } == true
    }.singleOrNull() ?: throw PatchException("$patch: expected one getter on $MEDIA for $TEXT_POST_INFO")

    fun getter(key: String, onInterface: String): Method {
        val field = writer.fieldWrittenAs(key)
            ?: throw PatchException("$patch: expected a field read and tested just before $key is written")
        val holder = classDefBy(field.definingClass)
        val method = holder.methods.singleOrNull { candidate ->
            candidate.parameterTypes.isEmpty() && candidate.returnType == field.type &&
                candidate.implementation?.instructions?.toList()?.let { body ->
                    body.size == 2 && body[0].opcode == Opcode.IGET_OBJECT && body[1].opcode == Opcode.RETURN_OBJECT &&
                        ((body[0] as ReferenceInstruction).reference as FieldReference).name == field.name
                } == true
        } ?: throw PatchException("$patch: expected one getter on ${holder.type} for $key, ${field.name}")
        val declaring = holder.interfaces.filter { type ->
            classDefByOrNull(type)?.methods?.any { it.name == method.name && it.parameterTypes.isEmpty() && it.returnType == method.returnType } == true
        }.singleOrNull() ?: throw PatchException("$patch: expected one interface of ${holder.type} declaring ${method.name}, the getter for $key")
        if (declaring != onInterface) {
            throw PatchException("$patch: the getter for $key is on $declaring, not $onInterface")
        }
        return classDefBy(declaring).methods.first { it.name == method.name && it.parameterTypes.isEmpty() && it.returnType == method.returnType }
    }

    val infoType = anInterface(patch, info.returnType).type
    val linked = getter(LINKED_INLINE_MEDIA, infoType)
    val share = getter(SHARE_INFO, infoType)
    val shareType = anInterface(patch, share.returnType).type
    fun post(key: String) = getter(key, shareType).also {
        if (it.returnType != MEDIA) throw PatchException("$patch: the getter for $key answers ${it.returnType}, not $MEDIA")
    }
    if (linked.returnType != MEDIA) throw PatchException("$patch: the getter for $LINKED_INLINE_MEDIA answers ${linked.returnType}, not $MEDIA")
    fun through(getter: Method) = "invoke-interface {p0}, ${getter.definingClass}->${getter.name}()${getter.returnType}"

    return bridgeWriter(patch, listOf(
        Bridge("textPostInfo", MEDIA, virtual(info)),
        Bridge("linkedInlineMedia", infoType, through(linked)),
        Bridge("shareInfo", infoType, through(share)),
        Bridge("quotedAttachmentPost", shareType, through(post(QUOTED_ATTACHMENT_POST))),
        Bridge("repostedPost", shareType, through(post(REPOSTED_POST))),
        Bridge("quotedPost", shareType, through(post(QUOTED_POST))),
    ))
}

private const val TEXT_POST_INFO = "text_post_app_info"
private const val LINKED_INLINE_MEDIA = "linked_inline_media"
private const val SHARE_INFO = "share_info"
private const val QUOTED_ATTACHMENT_POST = "quoted_attachment_post"
private const val REPOSTED_POST = "reposted_post"
private const val QUOTED_POST = "quoted_post"
private val LINKED_POST_KEYS = listOf(LINKED_INLINE_MEDIA, SHARE_INFO, QUOTED_ATTACHMENT_POST, REPOSTED_POST, QUOTED_POST)

/** Whether this method writes a post's linked posts out as JSON, naming each of their keys once. */
internal fun Method.writesLinkedPosts() = LINKED_POST_KEYS.all { key -> implementation?.instructions?.count { it.isString(key) } == 1 }

/** The fields a method that [writesLinkedPosts] reads for them, on the build's data classes. */
internal fun Method.linkedPostFields() = LINKED_POST_KEYS.mapNotNull { fieldWrittenAs(it) }

/** The field this method loads and tests for null just before it names [key]: `iget-object vA; if-eqz vA; const-string`. */
private fun Method.fieldWrittenAs(key: String): FieldReference? {
    val code = implementation!!.instructions.toList()
    val named = code.indexOfFirst { it.isString(key) }
    if (named < 2 || code[named - 2].opcode != Opcode.IGET_OBJECT || code[named - 1].opcode != Opcode.IF_EQZ) return null
    if ((code[named - 2] as TwoRegisterInstruction).registerA != (code[named - 1] as OneRegisterInstruction).registerA) return null
    return (code[named - 2] as ReferenceInstruction).reference as FieldReference
}

private fun Instruction.isString(value: String) =
    (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) &&
        ((this as ReferenceInstruction).reference as StringReference).string == value

private fun virtual(getter: Method) = "invoke-virtual {p0}, ${getter.definingClass}->${getter.name}()${getter.returnType}"

/**
 * The call to the getter for [field] through [type], an interface, by the name [pando], the
 * tree-backed class implementing it, gives the getter. The interface must declare it.
 */
private fun BytecodePatchContext.throughInterface(patch: String, type: String, pando: String, field: String, returns: String): String {
    val getter = pandoGetter(patch, pando, field, returns)
    if (anInterface(patch, type).methods.none { it.name == getter.name && it.parameterTypes.isEmpty() && it.returnType == returns }) {
        throw PatchException("$patch: $type doesn't declare ${getter.name}, the getter for $field")
    }
    return "invoke-interface {p0}, $type->${getter.name}()$returns"
}

/** The class [type], which the bridges call through invoke-interface, so it has to be an interface. */
private fun BytecodePatchContext.anInterface(patch: String, type: String) = classDefBy(type).also {
    if (!AccessFlags.INTERFACE.isSet(it.accessFlags)) throw PatchException("$patch: $type is no longer an interface")
}

/**
 * Finds each bridge's stub, and answers the step that writes its body. A stub written already is
 * left as it is.
 */
private fun BytecodePatchContext.bridgeWriter(patch: String, bridges: List<Bridge>): () -> Unit {
    val stubs = mutableClassDefBy(INSTAGRAM_MEDIA).methods
    val found = bridges.associateWith { bridge ->
        stubs.singleOrNull {
            it.name == bridge.name && AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.parameterTypes.map(Any::toString) == listOf("Ljava/lang/Object;")
        } ?: throw PatchException("$patch: $INSTAGRAM_MEDIA has no static ${bridge.name}(Object)")
    }
    return {
        found.forEach { (bridge, stub) ->
            if (stub.implementation!!.instructions.first().opcode == Opcode.CHECK_CAST) return@forEach
            stub.addInstructions(
                0,
                if (bridge.primitive) {
                    """
                        check-cast p0, ${bridge.receiver}
                        ${bridge.call}
                        move-result p0
                        return p0
                    """
                } else {
                    """
                        check-cast p0, ${bridge.receiver}
                        ${bridge.call}
                        move-result-object p0
                        return-object p0
                    """
                },
            )
        }
    }
}
