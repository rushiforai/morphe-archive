/*
 * Forked from https://github.com/SysAdminDoc/HushGram at 539b6467 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.threads.download

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction

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
