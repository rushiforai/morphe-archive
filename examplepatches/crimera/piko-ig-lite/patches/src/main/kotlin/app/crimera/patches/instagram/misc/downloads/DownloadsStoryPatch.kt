/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.downloads

import app.crimera.bytecode.insertHook
import app.crimera.bytecode.methodReference
import app.crimera.patches.common.requireExactlyOne
import app.crimera.patches.instagram.misc.extension.sharedExtensionPatch
import app.crimera.patches.instagram.misc.settings.Categories
import app.crimera.patches.instagram.misc.settings.instagramToggle
import app.crimera.patches.settings.settingStrings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.resources.ResourceType
import app.morphe.patches.all.misc.resources.getResourceId
import app.morphe.patches.all.misc.resources.resourceMappingPatch
import app.morphe.util.getReference
import app.morphe.util.matchSingle
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31i
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val VIEW_DESCRIPTOR = "Landroid/view/View;"
private const val MEDIA_DESCRIPTOR = "Lcom/instagram/feed/media/Media;"
private const val REEL_ITEM_DESCRIPTOR = "Lcom/instagram/model/reels/ReelItem;"
private const val ADD_STORY_DOWNLOAD_BUTTON =
    "$DOWNLOAD_UTILS_DESCRIPTOR->addStoryDownloadButton" +
        "($VIEW_DESCRIPTOR$OBJECT_DESCRIPTOR$USER_SESSION_DESCRIPTOR)V"

/** The icon row to the right of the "Send message" pill: like, comment and share live in it. */
private const val STORY_BUTTONS_CONTAINER_ID = "toolbar_buttons_container"

/**
 * Story download button. The story viewer footer is not Litho: its heart / comment / share icons are
 * plain views owned by one toolbar view holder, so a view can be added to the icon row directly.
 *
 * Every obfuscated member is resolved by behavior:
 *  - the holder is the constructor that resolves `toolbar_buttons_container`; the field it stores the
 *    row in names the container,
 *  - the binder is the one static method that receives the holder together with the story `ReelItem`
 *    and the `UserSession`, so the hook never needs to know the viewer class,
 *  - the story `Media` is the field the zero-argument `Media` getter of `ReelItem` reads.
 */
@Suppress("unused")
val storyDownloadPatch =
    bytecodePatch(
        description = "Adds a download button to the icon row beside the story reply pill.",
    ) {
        dependsOn(sharedExtensionPatch, resourceMappingPatch)

        instagramToggle(
            id = "instagram.downloads.story_button",
            category = Categories.DOWNLOADS,
            strings = settingStrings("piko_ig_story_download_button"),
            order = 300,
            defaultValue = true,
        )

        execute {
            hookStoryToolbarBinder(getResourceId(ResourceType.ID, STORY_BUTTONS_CONTAINER_ID))
        }
    }

context(patchContext: BytecodePatchContext)
private fun hookStoryToolbarBinder(buttonsContainerId: Long) {
    val holderMatch =
        Fingerprint(
            name = "<init>",
            returnType = "V",
            filters = listOf(literal(buttonsContainerId)),
        ).matchSingle()
    val holderType = holderMatch.classDef.type
    val containerField = storyButtonsContainerField(holderMatch.method, holderType, buttonsContainerId)
    val mediaField = reelItemMediaField()

    // The binder is the only method that takes the holder, the story and the session together.
    val bindCandidates = mutableListOf<Method>()
    patchContext.classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            if (method.returnType != "V") return@forEach
            val parameters = method.parameterTypes.map { it.toString() }
            if (holderType in parameters && REEL_ITEM_DESCRIPTOR in parameters && USER_SESSION_DESCRIPTOR in parameters) {
                bindCandidates.add(method)
            }
        }
    }
    // The binder delegates to sibling helpers with a subset of the same parameters, so the entry
    // point is the candidate no other candidate calls.
    val calledByCandidates =
        bindCandidates.flatMap { candidate ->
            candidate.implementation?.instructions?.toList().orEmpty().mapNotNull { it.methodRef() }
        }
    val bindMethod =
        requireExactlyOne(
            "story toolbar bind method for $holderType",
            bindCandidates.filter { candidate -> calledByCandidates.none { it.sameSignatureAs(candidate) } },
        )

    val holderRegister = bindMethod.registerOfParameter(holderType)
    val reelItemRegister = bindMethod.registerOfParameter(REEL_ITEM_DESCRIPTOR)
    val sessionRegister = bindMethod.registerOfParameter(USER_SESSION_DESCRIPTOR)

    bindMethod.toMutable("story toolbar bind method to patch").insertHook(
        index = 0,
        excludedRegisters = bindMethod.parameterBlock(),
        relocateBranchTargets = false,
    ) {
        // The binder keeps its arguments in high registers, which 4-bit `iget` and `invoke` cannot
        // address, so every operand is moved into a low scratch register first.
        val container = scratchRegister()
        move(container, holderRegister, holderType)
        iget(container, container, containerField)

        val media = scratchRegister()
        move(media, reelItemRegister, REEL_ITEM_DESCRIPTOR)
        iget(media, media, mediaField)

        val userSession = scratchRegister()
        move(userSession, sessionRegister, USER_SESSION_DESCRIPTOR)

        invokeStatic(methodReference(ADD_STORY_DOWNLOAD_BUTTON), container, media, userSession)
    }
}

/** The holder field the constructor stores the buttons container in, right after resolving its id. */
private fun storyButtonsContainerField(
    constructor: Method,
    holderType: String,
    buttonsContainerId: Long,
): FieldReference {
    val instructions = constructor.implementation?.instructions?.toList().orEmpty()
    // resolver-lint: allow instruction-order raw-first because the constructor resolves the container once, then stores it
    val idIndex = instructions.indexOfFirst { it is Instruction31i && it.wideLiteral == buttonsContainerId }
    if (idIndex < 0) throw PatchException("No buttons container literal in $constructor")

    // `const id; invoke requireViewById; move-result-object; [check-cast;] iput-object`.
    return requireExactlyOne(
        "story buttons container field in $constructor",
        instructions
            .drop(idIndex + 1)
            .take(5)
            .takeWhile { it.opcode != Opcode.CONST }
            .mapNotNull { instruction ->
                if (instruction.opcode != Opcode.IPUT_OBJECT) return@mapNotNull null
                instruction.getReference<FieldReference>()?.takeIf {
                    it.definingClass == holderType && it.type == VIEW_DESCRIPTOR
                }
            }.distinctBy { it.toString() },
    )
}

/**
 * The story `Media` field of a `ReelItem`. Every zero-argument `Media` getter of the class (the checked
 * one that throws on null and the plain interface one) reads it, so the field they agree on is
 * returned and the extension null-checks it instead of risking the throwing getter.
 */
context(patchContext: BytecodePatchContext)
private fun reelItemMediaField(): FieldReference {
    val getters =
        patchContext.classDefBy(REEL_ITEM_DESCRIPTOR).methods.filter {
            it.parameterTypes.isEmpty() && it.returnType == MEDIA_DESCRIPTOR
        }
    if (getters.isEmpty()) throw PatchException("No zero-argument Media getter on $REEL_ITEM_DESCRIPTOR")
    return requireExactlyOne(
        "Media field read by the ReelItem media getters $getters",
        getters
            .flatMap { getter -> getter.implementation?.instructions?.toList().orEmpty() }
            .mapNotNull { instruction ->
                if (instruction.opcode != Opcode.IGET_OBJECT) return@mapNotNull null
                instruction.getReference<FieldReference>()?.takeIf {
                    it.definingClass == REEL_ITEM_DESCRIPTOR && it.type == MEDIA_DESCRIPTOR
                }
            }.distinctBy { it.toString() },
    )
}
