/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.downloads

import app.crimera.bytecode.Target
import app.crimera.bytecode.insertHook
import app.crimera.bytecode.methodReference
import app.crimera.patches.common.requireExactlyOne
import app.crimera.patches.downloader.downloaderManifestPatch
import app.crimera.patches.instagram.entity.decoder.CURRENT_MEDIA_FIELD
import app.crimera.patches.instagram.entity.decoder.MEDIA_ADD_INFO_CLASS_NAME
import app.crimera.patches.instagram.entity.decoder.decoderEntity
import app.crimera.patches.instagram.entity.mediadata.mediaBridgesPatch
import app.crimera.patches.instagram.misc.extension.sharedExtensionPatch
import app.crimera.patches.instagram.misc.settings.Categories
import app.crimera.patches.instagram.misc.settings.instagramToggle
import app.crimera.patches.settings.settingStrings
import app.crimera.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.crimera.patches.instagram.utils.Constants.DOWNLOAD_DESCRIPTOR
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.all.misc.resources.ResourceType
import app.morphe.patches.all.misc.resources.getResourceId
import app.morphe.patches.all.misc.resources.resourceMappingPatch
import app.morphe.util.getReference
import app.morphe.util.matchSingle
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val OBJECT_DESCRIPTOR = "Ljava/lang/Object;"
internal const val INTEGER_DESCRIPTOR = "Ljava/lang/Integer;"
internal const val USER_SESSION_DESCRIPTOR = "Lcom/instagram/common/session/UserSession;"
internal const val DOWNLOAD_UTILS_DESCRIPTOR = "$DOWNLOAD_DESCRIPTOR/DownloadUtils;"

private const val VIEW_DESCRIPTOR = "Landroid/view/View;"
private const val MEDIA_DESCRIPTOR = "Lcom/instagram/feed/media/Media;"
private const val STRING_DESCRIPTOR = "Ljava/lang/String;"
private const val STRING_EQUALS = "$STRING_DESCRIPTOR->equals($OBJECT_DESCRIPTOR)Z"
private const val ADD_FEED_DOWNLOAD_BUTTON =
    "$DOWNLOAD_UTILS_DESCRIPTOR->addFeedDownloadButton" +
        "($VIEW_DESCRIPTOR$OBJECT_DESCRIPTOR$USER_SESSION_DESCRIPTOR$OBJECT_DESCRIPTOR)V"

/** The UFI renderer selector is only overridden for the main feed module. */
private const val MAIN_FEED_MODULE = "feed_timeline"

/** MobileConfig values the UFI renderer selector switches on. */
private const val LITHO_UFI_VARIANT = "litho"
private const val VIEW_UFI_VARIANT = "view"

internal fun Method.parameterWords(): Int {
    var words = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    parameterTypes.forEach { words += if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    return words
}

internal fun Method.parameterRegisterStart(): Int = (implementation?.registerCount ?: 0) - parameterWords()

/** The parameter block, `this` included, which typed hooks must never use as scratch. */
internal fun Method.parameterBlock(): List<Int> =
    (parameterRegisterStart() until parameterRegisterStart() + parameterWords()).toList()

internal fun Method.registerOfParameter(descriptor: String): Int {
    var register = parameterRegisterStart() + if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    parameterTypes.forEach { type ->
        val value = type.toString()
        if (value == descriptor) return register
        register += if (value == "J" || value == "D") 2 else 1
    }
    throw PatchException("Method $this has no $descriptor parameter")
}

/** Register of the parameter at zero-based [parameterIndex] in the declared parameter list. */
internal fun Method.registerOfParameterIndex(parameterIndex: Int): Int {
    var register = parameterRegisterStart() + if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    parameterTypes.forEachIndexed { index, type ->
        if (index == parameterIndex) return register
        register += if (type.toString() == "J" || type.toString() == "D") 2 else 1
    }
    throw PatchException("Method $this has no parameter index $parameterIndex")
}

internal fun MethodReference.sameSignatureAs(other: MethodReference): Boolean =
    name == other.name &&
        returnType == other.returnType &&
        parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }

internal fun Instruction.methodRef(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

/** Register words an invoke or move instruction reads, in operand order. */
internal fun Instruction.registers(): List<Int> =
    when (this) {
        is FiveRegisterInstruction ->
            listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)

        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is TwoRegisterInstruction -> listOf(registerA, registerB)
        is OneRegisterInstruction -> listOf(registerA)
        else -> emptyList()
    }

/** The resolved bytecode method a fingerprint-free lookup returned, as the mutable copy to patch. */
context(patchContext: BytecodePatchContext)
internal fun MethodReference.toMutable(label: String): MutableMethod =
    requireExactlyOne(
        label,
        patchContext.mutableClassDefBy(definingClass).methods.filter { it.sameSignatureAs(this) },
    )

/** Where the binder reads the `UserSession` from: a field of the binder itself or of one parameter. */
private class UserSessionSource(
    val type: String,
    val register: Int,
    val field: FieldReference,
)

@Suppress("unused")
val downloadsPatch =
    bytecodePatch(
        name = "Downloads",
        description =
            "Adds a download button beside the save icon on feed posts and reels and beside the reply pill on stories. " +
                "Posts with several media open a bottom sheet to pick what to save.",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(
            storyDownloadPatch,
            reelDownloadPatch,
            sharedExtensionPatch,
            mediaBridgesPatch,
            decoderEntity,
            resourceMappingPatch,
            // The shared downloader's folder picker and notification receivers have to be declared in the manifest.
            downloaderManifestPatch,
        )

        instagramToggle(
            id = "instagram.downloads.feed_button",
            category = Categories.DOWNLOADS,
            strings = settingStrings("piko_ig_feed_download_button"),
            order = 200,
            defaultValue = true,
        )
        instagramToggle(
            id = "instagram.downloads.sheet_thumbnails",
            category = Categories.DOWNLOADS,
            strings = settingStrings("piko_ig_download_sheet_thumbnails"),
            order = 500,
            defaultValue = true,
        )
        instagramToggle(
            id = "instagram.downloads.direct",
            category = Categories.DOWNLOADS,
            strings = settingStrings("piko_ig_direct_download"),
            order = 600,
            defaultValue = true,
        )
        instagramToggle(
            id = "instagram.downloads.username_folder",
            category = Categories.DOWNLOADS,
            strings = settingStrings("piko_ig_download_username_folder"),
            order = 700,
            defaultValue = false,
        )

        execute {
            installDownloaderAtStartup()
            val saveButtonId = getResourceId(ResourceType.ID, "row_feed_button_save")
            val rowState = hookFeedRowBinder(saveButtonId)
            injectCurrentMediaIndex(rowState)
            injectMediaUsername()
            val bitmapChain = injectCachedBitmapLookup()
            injectThumbnailMirror(bitmapChain)
            pinMainFeedToViewUfi()
            injectLithoDownloadButton(
                saveButtonId,
                getResourceId(ResourceType.DRAWABLE, "instagram_download_outline_24"),
                rowState.type,
            )
        }
    }

/** The feed row state both UFI renderers receive, and the fields the download reads from it. */
private class FeedRowState(
    val type: String,
    val viewStateField: FieldReference,
)

/**
 * The feed post action row (like / comment / repost / share / save) is a plain view holder whose
 * constructor resolves `row_feed_button_save` with `requireViewById`. Matching that resource literal
 * finds the holder class without depending on obfuscated names; its binder is hooked to hand the
 * extension the row root, `Media`, `UserSession` and row state.
 */
context(patchContext: BytecodePatchContext)
private fun hookFeedRowBinder(saveButtonId: Long): FeedRowState {
    val holderMatch =
        Fingerprint(
            name = "<init>",
            returnType = "V",
            parameters = listOf(VIEW_DESCRIPTOR),
            filters = listOf(literal(saveButtonId)),
        ).matchSingle()
    val holderClass = holderMatch.classDef
    val holderType = holderClass.type

    // The root view is the only field assigned directly from the constructor's `View` parameter.
    val viewRegister = holderMatch.method.registerOfParameter(VIEW_DESCRIPTOR)
    val rootViewField =
        requireExactlyOne(
            "feed UFI root view field in ${holderMatch.method}",
            holderMatch.method.implementation
                ?.instructions
                .orEmpty()
                .mapNotNull { instruction ->
                    if (instruction.opcode != Opcode.IPUT_OBJECT) return@mapNotNull null
                    if ((instruction as TwoRegisterInstruction).registerA != viewRegister) return@mapNotNull null
                    instruction.getReference<FieldReference>()?.takeIf { it.definingClass == holderType }
                }.distinctBy { it.toString() },
        )

    // The feed item state is the holder field type that exposes exactly one Media.
    val stateType =
        requireExactlyOne(
            "feed UFI media state type for $holderType",
            holderClass.fields
                .map { it.type }
                .filter { type ->
                    patchContext.classDefByOrNull(type)?.fields?.count { it.type == MEDIA_DESCRIPTOR } == 1
                }.distinct(),
        )
    val stateClass = patchContext.classDefBy(stateType)
    val mediaField =
        requireExactlyOne("Media field on $stateType", stateClass.fields.filter { it.type == MEDIA_DESCRIPTOR })

    // The state reaches the view state the carousel mutates; its current-media field is the one the
    // overflow-menu handler passes as the current index.
    val viewStateField =
        requireExactlyOne(
            "view state field on $stateType",
            stateClass.fields.filter { it.type == MEDIA_ADD_INFO_CLASS_NAME },
        )

    // The binder method receives both the holder and the media state.
    val bindCandidates = mutableListOf<Method>()
    patchContext.classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            if (method.returnType != "V") return@forEach
            val parameters = method.parameterTypes.map { it.toString() }
            if (holderType in parameters && stateType in parameters) bindCandidates.add(method)
        }
    }
    val bindMethod = requireExactlyOne("feed UFI bind method", bindCandidates)
    val binderClass = patchContext.classDefBy(bindMethod.definingClass)

    // The session lives in a binder field, or comes through a parameter whose type exposes exactly one
    // `UserSession`. Prefer the binder's own field.
    val binderSessionFields = binderClass.fields.filter { it.type == USER_SESSION_DESCRIPTOR }
    val sessionSource =
        if (binderSessionFields.isEmpty()) {
            requireExactlyOne(
                "UserSession source of $bindMethod",
                bindMethod.parameterTypes.mapNotNull { parameter ->
                    val type = parameter.toString()
                    val field =
                        patchContext
                            .classDefByOrNull(type)
                            ?.fields
                            ?.filter { it.type == USER_SESSION_DESCRIPTOR }
                            ?.singleOrNull()
                    field?.let { UserSessionSource(type, bindMethod.registerOfParameter(type), it) }
                },
            )
        } else {
            UserSessionSource(
                binderClass.type,
                bindMethod.parameterRegisterStart(),
                requireExactlyOne("UserSession field on ${binderClass.type}", binderSessionFields),
            )
        }

    val holderRegister = bindMethod.registerOfParameter(holderType)
    val stateRegister = bindMethod.registerOfParameter(stateType)

    bindMethod.toMutable("feed UFI bind method to patch").insertHook(
        index = 0,
        excludedRegisters = bindMethod.parameterBlock(),
        relocateBranchTargets = false,
    ) {
        // 4-bit `iget` cannot address the argument registers of a method with many locals, so
        // every operand is moved into a low scratch register first.
        val rootView = scratchRegister()
        move(rootView, holderRegister, holderType)
        iget(rootView, rootView, rootViewField)

        val state = scratchRegister()
        move(state, stateRegister, stateType)
        val media = scratchRegister()
        iget(media, state, mediaField)

        val userSession = scratchRegister()
        move(userSession, sessionSource.register, sessionSource.type)
        iget(userSession, userSession, sessionSource.field)

        invokeStatic(methodReference(ADD_FEED_DOWNLOAD_BUTTON), rootView, media, userSession, state)
    }

    return FeedRowState(stateType, viewStateField)
}

/**
 * Rebuilds `DownloadUtils.currentMediaIndex` from direct reads of the resolved row state fields, so
 * the download follows a carousel swipe. The compiled stub keeps no local register (its unused
 * argument is reused for the constant), so the body is emitted into a fresh two-register frame:
 * `v0` is the scratch value and `v1` the row state. Any other state falls back to index 0.
 */
context(patchContext: BytecodePatchContext)
private fun injectCurrentMediaIndex(rowState: FeedRowState) {
    val currentMediaField = CURRENT_MEDIA_FIELD
    if (currentMediaField.definingClass != rowState.viewStateField.type || currentMediaField.type != "I") {
        throw PatchException("Current media field $currentMediaField is not an int on ${rowState.viewStateField.type}")
    }

    val utilsClass = patchContext.mutableClassDefBy(DOWNLOAD_UTILS_DESCRIPTOR)
    val stub =
        requireExactlyOne(
            "DownloadUtils.currentMediaIndex",
            utilsClass.methods.filter { method ->
                method.name == "currentMediaIndex" &&
                    method.returnType == "I" &&
                    method.parameterTypes.map { it.toString() } == listOf(OBJECT_DESCRIPTOR) &&
                    AccessFlags.STATIC.isSet(method.accessFlags)
            },
        )
    val accessor =
        ImmutableMethod(
            stub.definingClass,
            stub.name,
            stub.parameters,
            stub.returnType,
            stub.accessFlags,
            null,
            null,
            MutableMethodImplementation(2),
        ).toMutable()
    utilsClass.methods.remove(stub)
    utilsClass.methods.add(accessor)

    val value = 0
    val state = 1
    accessor.insertHook(index = 0, relocateBranchTargets = false) {
        instanceOf(value, state, rowState.type)
        ifEqz(value, Target.Local("fallback"))
        checkCast(state, rowState.type)
        iget(value, state, rowState.viewStateField)
        ifEqz(value, Target.Local("fallback"))
        iget(value, value, currentMediaField)
        returnValue(value)

        label("fallback")
        constInt(value, 0)
        returnValue(value)
    }
}

/**
 * The feed row type decides how the UFI row is rendered: `MEDIA_UFI` (view), `LITHO_MEDIA_UFI` or
 * `COMPOSE_MEDIA_UFI`. Only the view renderer creates the holder [hookFeedRowBinder] hooks, so the
 * main feed is pinned to `view`; other modules keep the original selector result and get the Litho
 * button instead. Both a static and an instance selector are pinned when a release has them.
 */
context(patchContext: BytecodePatchContext)
private fun pinMainFeedToViewUfi() {
    val selectors =
        Fingerprint(
            returnType = INTEGER_DESCRIPTOR,
            strings = listOf(MAIN_FEED_MODULE, LITHO_UFI_VARIANT, VIEW_UFI_VARIANT),
        ).matchAll(1..2)

    // The selector returns the static `Integer` that follows the "view" string constant.
    val viewVariantField =
        requireExactlyOne(
            "view UFI variant field",
            selectors
                .map { selector ->
                    val instructions = selector.method.implementation?.instructions?.toList().orEmpty()
                    // resolver-lint: allow instruction-order raw-first because the selector's switch case is the string followed by its Integer
                    val viewStringIndex =
                        instructions.indexOfFirst { it.getReference<StringReference>()?.string == VIEW_UFI_VARIANT }
                    if (viewStringIndex < 0) throw PatchException("No \"$VIEW_UFI_VARIANT\" variant in UFI selector ${selector.method}")
                    requireExactlyOne(
                        "view UFI variant field in ${selector.method}",
                        instructions
                            .drop(viewStringIndex + 1)
                            .take(8)
                            .mapNotNull { instruction ->
                                if (instruction.opcode != Opcode.SGET_OBJECT) return@mapNotNull null
                                instruction.getReference<FieldReference>()?.takeIf { it.type == INTEGER_DESCRIPTOR }
                            }.distinctBy { it.toString() },
                    )
                }.distinctBy { it.toString() },
        )

    selectors.forEach { selector ->
        val method = selector.method
        val moduleRegister = method.registerOfParameter(STRING_DESCRIPTOR)

        method.insertHook(
            index = 0,
            excludedRegisters = method.parameterBlock(),
            relocateBranchTargets = false,
        ) {
            val expectedModule = scratchRegister()
            constString(expectedModule, MAIN_FEED_MODULE)
            val isMainFeed = scratchRegister()
            move(isMainFeed, moduleRegister, STRING_DESCRIPTOR)
            invokeVirtual(methodReference(STRING_EQUALS), expectedModule, isMainFeed)
            moveResult(isMainFeed, "Z")
            ifEqz(isMainFeed, Target.Original)

            sget(expectedModule, viewVariantField)
            returnObject(expectedModule)
        }
    }
}
