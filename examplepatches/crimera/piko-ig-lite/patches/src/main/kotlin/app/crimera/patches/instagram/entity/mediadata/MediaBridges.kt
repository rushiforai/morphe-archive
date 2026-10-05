/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.entity.mediadata

import app.crimera.bytecode.Block
import app.crimera.bytecode.Target
import app.crimera.patches.common.isAssignableTo
import app.crimera.patches.common.requireExactlyOne
import app.crimera.patches.instagram.models.MEDIA_DESCRIPTOR
import app.crimera.patches.instagram.models.ModelGetter
import app.crimera.patches.instagram.models.PandoField
import app.crimera.patches.instagram.models.PandoModel
import app.crimera.patches.instagram.models.readModelValue
import app.crimera.patches.instagram.models.resolvedModelGetter
import app.crimera.patches.instagram.utils.Constants
import app.crimera.patches.instagram.utils.replaceBridgeBody
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val MEDIA_BRIDGE_DESCRIPTOR = "${Constants.ENTITY_CLASS}/MediaBridge;"
private const val OBJECT_DESCRIPTOR = "Ljava/lang/Object;"
private const val STRING_DESCRIPTOR = "Ljava/lang/String;"
private const val LIST_DESCRIPTOR = "Ljava/util/List;"
private const val IMAGE_INFO_DESCRIPTOR = "Lcom/instagram/model/mediasize/ImageInfo;"

/** Pando keys of the `Media` getters the download path reads. */
private const val VIDEO_VERSIONS_KEY = "video_versions"
private const val CAROUSEL_MEDIA_KEY = "carousel_media"
private const val IMAGE_VERSIONS_KEY = "image_versions2"

/**
 * The video version contract has lived in more than one package across releases. Each candidate is
 * looked up by descriptor, so an unknown package fails the patch instead of linking a missing type.
 */
private val VIDEO_VERSION_INTERFACES =
    listOf(
        "Lcom/instagram/api/schemas/VideoVersionIntf;",
        "Lcom/instagram/model/mediasize/VideoVersionIntf;",
    )

private const val NONE = "none"
private const val VALUE = 0
private const val ARGUMENT = 1

val mediaBridgesPatch =
    bytecodePatch(
        description = "Fills the media bridge stubs with direct reads of the release's Media model",
    ) {
        execute { injectMediaBridges() }
    }

/**
 * Replaces the placeholder bodies of `MediaBridge` with direct calls into the release's `Media`
 * model, so the download path resolves each member at patch time and never reflects at runtime.
 *
 * Every member is identified by behavior and checked by type: the list getters by the Pando key they
 * decode and their `List` return type, the id and video flag by the call sites they have in stable
 * anchors, each with its owner, parameters and return type asserted. A shape that does not match
 * fails the patch with the candidates instead of leaving a placeholder behind.
 */
context(patchContext: BytecodePatchContext)
internal fun injectMediaBridges() {
    val videoVersions = resolvedModelGetter(PandoModel.MEDIA, PandoField.Key(VIDEO_VERSIONS_KEY), LIST_DESCRIPTOR)
    val carouselMedia = resolvedModelGetter(PandoModel.MEDIA, PandoField.Key(CAROUSEL_MEDIA_KEY), LIST_DESCRIPTOR)
    val imageInfo = resolvedModelGetter(PandoModel.MEDIA, PandoField.Key(IMAGE_VERSIONS_KEY), IMAGE_INFO_DESCRIPTOR)
    val imageList = imageInfoListMethod()
    val imageListOnInterface = AccessFlags.INTERFACE.isSet(patchContext.classDefBy(imageList.definingClass).accessFlags)
    val isVideo = mediaMethodAfterAnchor(AslSessionRelatedFingerprint, "video flag", "Z")
    val mediaPkId = mediaMethodAfterAnchor(FanClubContentPreviewInteractorImplFingerprint, "media id", STRING_DESCRIPTOR)
    val videoUrl = videoVersionUrlMethod()

    bridge("videoVersions", LIST_DESCRIPTOR) { readMediaList(videoVersions) }
    bridge("carouselMedia", LIST_DESCRIPTOR) { readMediaList(carouselMedia) }
    bridge("imageVariants", LIST_DESCRIPTOR) {
        guardMedia()
        readModelValue(VALUE, ARGUMENT, imageInfo, Target.Local(NONE))
        ifEqz(VALUE, Target.Local(NONE))
        if (imageListOnInterface) invokeInterface(imageList, VALUE) else invokeVirtual(imageList, VALUE)
        moveResult(VALUE, LIST_DESCRIPTOR)
        returnObject(VALUE)
        absentObject()
    }
    bridge("isVideo", "Z") {
        guardMedia()
        invokeVirtual(isVideo, ARGUMENT)
        moveResult(VALUE, "Z")
        returnValue(VALUE)
        label(NONE)
        constInt(VALUE, 0)
        returnValue(VALUE)
    }
    bridge("mediaPkId", STRING_DESCRIPTOR) {
        guardMedia()
        invokeVirtual(mediaPkId, ARGUMENT)
        moveResult(VALUE, STRING_DESCRIPTOR)
        returnObject(VALUE)
        absentObject()
    }
    bridge("videoUrl", STRING_DESCRIPTOR) {
        instanceOf(VALUE, ARGUMENT, videoUrl.definingClass)
        ifEqz(VALUE, Target.Local(NONE))
        checkCast(ARGUMENT, videoUrl.definingClass)
        invokeInterface(videoUrl, ARGUMENT)
        moveResult(VALUE, STRING_DESCRIPTOR)
        returnObject(VALUE)
        absentObject()
    }
}

context(patchContext: BytecodePatchContext)
private fun bridge(
    name: String,
    returnType: String,
    body: Block.() -> Unit,
) = replaceBridgeBody(MEDIA_BRIDGE_DESCRIPTOR, name, listOf(OBJECT_DESCRIPTOR), returnType, registers = 2, body = body)

/** Returns to `none` when the argument is not a `Media`, otherwise narrows it for the reads that follow. */
private fun Block.guardMedia() {
    instanceOf(VALUE, ARGUMENT, MEDIA_DESCRIPTOR)
    ifEqz(VALUE, Target.Local(NONE))
    checkCast(ARGUMENT, MEDIA_DESCRIPTOR)
}

private fun Block.readMediaList(getter: ModelGetter) {
    guardMedia()
    readModelValue(VALUE, ARGUMENT, getter, Target.Local(NONE))
    returnObject(VALUE)
    absentObject()
}

/** The shared tail of an object bridge: a missing value is null. */
private fun Block.absentObject() {
    label(NONE)
    constInt(VALUE, 0)
    returnObject(VALUE)
}

/**
 * `ImageInfo` exposes its variants through one no-argument `List` accessor that `Media` calls. It is
 * found from those call sites and must be the only one.
 */
context(patchContext: BytecodePatchContext)
private fun imageInfoListMethod(): MethodReference =
    requireExactlyOne(
        "ImageInfo variants accessor called from Media",
        patchContext
            .classDefBy(MEDIA_DESCRIPTOR)
            .methods
            .flatMap { method -> method.implementation?.instructions?.toList().orEmpty() }
            .mapNotNull { instruction -> instruction.getReference<MethodReference>() }
            .filter { reference ->
                reference.definingClass == IMAGE_INFO_DESCRIPTOR &&
                    reference.parameterTypes.isEmpty() &&
                    patchContext.isAssignableTo(reference.returnType, LIST_DESCRIPTOR)
            }.map { reference -> ImmutableMethodReference(reference.definingClass, reference.name, reference.parameterTypes, reference.returnType) }
            .distinctBy { it.toString() },
    )

/**
 * The `Media` method called right after the second anchor string of [fingerprint]. Its owner,
 * parameters and return type are asserted, because the call is found by position next to a stable
 * string and only the type check proves it is the member the extension expects.
 */
context(patchContext: BytecodePatchContext)
private fun mediaMethodAfterAnchor(
    fingerprint: Fingerprint,
    label: String,
    returnType: String,
): MethodReference {
    val method = fingerprint.method
    // resolver-lint: allow instruction-order raw-index because the second anchor string sits right before the call.
    val anchorIndex = fingerprint.stringMatches[1].index
    val reference =
        method.getInstruction(method.indexOfFirstInstruction(anchorIndex, Opcode.INVOKE_VIRTUAL)).getReference<MethodReference>()
            ?: throw PatchException("No $label call after the anchor string in $method")
    if (reference.definingClass != MEDIA_DESCRIPTOR ||
        reference.parameterTypes.isNotEmpty() ||
        reference.returnType != returnType
    ) {
        throw PatchException("$label call $reference in $method is not a no-argument Media method returning $returnType")
    }
    return ImmutableMethodReference(reference.definingClass, reference.name, reference.parameterTypes, reference.returnType)
}

/** `VideoVersionIntf.getUrl()`: the one interface the Pando and plain video versions share. */
context(patchContext: BytecodePatchContext)
private fun videoVersionUrlMethod(): MethodReference {
    val owner =
        requireExactlyOne(
            "video version interface",
            VIDEO_VERSION_INTERFACES.mapNotNull { descriptor -> patchContext.classDefByOrNull(descriptor) },
        )
    if (!AccessFlags.INTERFACE.isSet(owner.accessFlags)) throw PatchException("${owner.type} is not an interface")
    val getUrl =
        requireExactlyOne(
            "getUrl on ${owner.type}",
            owner.methods.filter { method ->
                method.name == "getUrl" && method.parameterTypes.isEmpty() && method.returnType == STRING_DESCRIPTOR
            },
        )
    return ImmutableMethodReference(getUrl.definingClass, getUrl.name, getUrl.parameterTypes, getUrl.returnType)
}
