/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.patches.tiktok.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.settings.settingsPatch
import app.morphe.patches.tiktok.shared.requireLocals
import app.morphe.util.getReference
import app.morphe.util.implementationOrPatchException
import app.morphe.util.numberOfParameterRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val VIDEO = "Lcom/ss/android/ugc/aweme/feed/model/Video;"
private const val URL = "Lcom/ss/android/ugc/aweme/base/model/UrlModel;"
private const val EXTENSION = "Lapp/morphe/extension/tiktok/download/"
private const val VIEW = "Landroid/view/View;"

/**
 * The captured receiver, which R8 puts in the listener's one Object field.
 *
 * <p>It is called `l0` on 46.2.3, 46.7.3 and 46.8.3, and that name was written into the injected
 * smali. The class holds exactly one Object field on all three, so it is read rather than named.
 */
/**
 * The one object the listener captured, whatever it is typed as. A merged listener group up to
 * 46.8.3 keeps it as `l0:Object` beside the `$t:I` that picks the body; the listener class of
 * its own that 46.9.3 leaves this one as keeps it as the assem's own type. The extension takes
 * an Object either way.
 */
private fun MutableClass.avatarCaptureField(): Field =
    fields.singleOrNull { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type.startsWith("L") }
        ?: throw PatchException(
            "Advanced downloads: $type does not hold exactly one captured object.",
        )

internal fun MutableMethod.interceptProfileAvatarLongPress(capture: Field) {
    check(isAvatarLongPressShape(definingClass) && returnType == "V") {
        "Advanced downloads: unexpected avatar callback signature."
    }
    requireLocals("Advanced downloads", 1)
    check(implementationOrPatchException("Advanced downloads").registerCount <= 16) {
        "Advanced downloads: avatar callback registers no longer fit the native gesture hook."
    }
    // p0 is the listener whichever shape it has: the group instance handed to a static body, or
    // `this` on an ordinary onClick. p1 is the view in both.
    addInstructionsWithLabels(0, """
        iget-object v0, p0, ${capture.definingClass}->${capture.name}:${capture.type}
        invoke-static { v0, p1 }, ${EXTENSION}ProfileAvatarSaver;->onAvatarLongPress(Ljava/lang/Object;Landroid/view/View;)Z
        move-result v0
        if-eqz v0, :native_avatar_hold
        return-void
    """, ExternalLabel("native_avatar_hold", getInstruction(0)))
}

private object DownloadAddressFingerprint : Fingerprint(
    definingClass = VIDEO, name = "getDownloadAddr", parameters = emptyList(), returnType = URL,
)
private object CleanDownloadAddressFingerprint : Fingerprint(
    definingClass = VIDEO, name = "getDownloadNoWatermarkAddr", parameters = emptyList(), returnType = URL,
)
/**
 * Legacy profile fetch. Modern avatar gestures resolve the user from their own component.
 */
private object ProfileUserResponseFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/profile/UserResponse;",
    name = "getUser",
    parameters = emptyList(),
    returnType = "Lcom/ss/android/ugc/aweme/profile/model/User;",
)

/**
 * Older header insertion callback. Modern avatar gestures have separate native listeners below.
 */
private object ProfileAvatarBindFingerprint : Fingerprint(
    definingClass = "/ProfileHeaderAvatarBaseComponent;",
    parameters = listOf("I", "Landroid/view/View;", "Ljava/lang/String;"),
    returnType = "V",
    // p2 is the View only on an instance method; on a static one it would be the String.
    custom = { method, _ -> method.accessFlags and AccessFlags.STATIC.value == 0 },
)

/**
 * Both avatar press-and-hold handlers are a static `(theListener, View)V` on the synthetic
 * click-listener class R8 builds for the profile header.
 *
 * <p>Everything that named them drifts. The class was `LY/ACListenerS198S0100000_24;` on 46.2.3,
 * `LY/ACListenerS165S0100000_24;` on 46.7.3 and `LY/ACListenerS158S0100000_25;` on 46.8.3, and
 * the two methods went from `onClick$43`/`onClick$46` to `onClick$117`/`onClick$120` and then to
 * `onClick$76`/`onClick$79`. The serial numbers are R8's own counters.
 *
 * <p>What holds is the pair of strings each one reports its gesture with. Exactly two methods of
 * this shape carry `long_press` and `long_hold_head` on all three builds, they are always on the
 * same class, and only the one for the viewer's own profile also carries `photo` and `video`.
 */
/**
 * The listener body, whichever way R8 shaped it. Up to 46.8.3 the click listeners of one
 * screen are merged into a group class and each body is a static `(group, View)V` taking its
 * own instance first; 46.9.3 leaves the own-profile one as an ordinary `onClick(View)V` on a
 * class of its own while the other-profile one stays in a group. Both read the captured assem
 * out of `p0` and take the view as `p1`, which is all the hook asks of them.
 */
private fun Method.isAvatarLongPressShape(owner: String): Boolean {
    val parameters = parameterTypes.map(CharSequence::toString)
    return if (AccessFlags.STATIC.isSet(accessFlags)) parameters == listOf(owner, VIEW)
    else parameters == listOf(VIEW)
}

private fun Method.isAvatarLongPressHandler(classDef: ClassDef) =
    returnType == "V" && isAvatarLongPressShape(classDef.type)

/**
 * Whether any string constant of the method contains [value].
 *
 * <p>Containment, not equality, because that is what the fingerprint `strings` filter does: it
 * takes a constant that *contains* the literal it wants. An exact test here would let a build
 * that renamed `photo` to something with `photo` inside it satisfy the own-profile fingerprint
 * and this exclusion at once, and both fingerprints would then land on the same method.
 */
private fun Method.containsString(value: String) =
    implementation?.instructions?.any {
        it.getReference<StringReference>()?.string?.contains(value) == true
    } == true

private object OwnProfileAvatarLongPressFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("long_press", "long_hold_head", "photo", "video"),
    custom = { method, classDef -> method.isAvatarLongPressHandler(classDef) },
)

private object OtherProfileAvatarLongPressFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("long_press", "long_hold_head"),
    custom = { method, classDef ->
        method.isAvatarLongPressHandler(classDef) && !method.containsString("photo")
    },
)

private const val AWEME = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"
private const val STORY_PLAY_AREA = "/StoryImmersivePlayAreaComponent;"

/** The story's own view, which is what a press and hold lands on. */
private object StoryPlayAreaViewFingerprint : Fingerprint(
    definingClass = STORY_PLAY_AREA,
    name = "onViewCreated",
    parameters = listOf("Landroid/view/View;"),
    returnType = "V",
)

/**
 * The play area is handed a story and the position it belongs to. Two methods take that shape,
 * both obfuscated, and both are hooked. The component is passed along with the story because the
 * viewer binds the pages either side of the one on screen: without knowing which play area was
 * told, a press would save whichever story was bound last.
 */
private object StoryPlayAreaBindFingerprint : Fingerprint(
    definingClass = STORY_PLAY_AREA,
    parameters = listOf("I", AWEME),
    returnType = "V",
    custom = { method, _ -> method.accessFlags and AccessFlags.STATIC.value == 0 },
)

/** The two concrete page bind methods named by [StoryPlayAreaBindFingerprint]'s contract. */
internal fun requireStoryBindMethods(matches: Iterable<MutableMethod>): List<MutableMethod> {
    val signatureMatches = matches.toList()
    if (signatureMatches.size != 2) {
        throw PatchException(
            "Advanced downloads: expected exactly two StoryImmersivePlayAreaComponent bind " +
                "methods taking (Int, Aweme), found ${signatureMatches.size}.",
        )
    }
    val bodyless = signatureMatches.filter { it.implementation == null }
    if (bodyless.isNotEmpty()) {
        throw PatchException(
            "Advanced downloads: ${bodyless.size} of the two story bind methods has no " +
                "implementation to hook.",
        )
    }
    return signatureMatches
}

private object StartDownloadFingerprint : Fingerprint(
    strings = listOf("download_method", "download_action"),
    parameters = listOf("Lcom/ss/android/ugc/aweme/feed/model/Aweme;", "Landroid/content/Context;", "I", "Ljava/lang/String;", "Z", "Lcom/ss/android/ugc/aweme/sharer/model/SharePackage;"),
    returnType = "V",
)

@Suppress("unused")
val advancedDownloadsPatch = bytecodePatch(
    name = "Advanced downloads",
    description = "Adds download quality choices, saves Photo Mode images directly from their source URLs, keeps a video's sound as its own audio file, and saves a profile picture or a story from a long press. Switch: Hushfeed settings > Downloads.",
    default = false,
) {
    compatibleWith(*AppCompatibilities.tiktok4623())
    dependsOn(settingsPatch, sharedExtensionPatch)
    execute {
        listOf(DownloadAddressFingerprint, CleanDownloadAddressFingerprint).forEach { fingerprint ->
            fingerprint.method.apply {
                requireLocals("Advanced downloads", 1)
                addInstructionsWithLabels(0, """
                    invoke-static/range { p0 .. p0 }, ${EXTENSION}QualitySelector;->download(Ljava/lang/Object;)$URL
                    move-result-object v0
                    if-eqz v0, :original
                    return-object v0
                """, ExternalLabel("original", getInstruction(0)))
            }
        }
        StartDownloadFingerprint.method.apply {
            requireLocals("Advanced downloads", 1)
            addInstructionsWithLabels(0, """
                invoke-static/range { p1 .. p2 }, ${EXTENSION}OriginalPhotos;->start(Ljava/lang/Object;Landroid/content/Context;)Z
                move-result v0
                if-eqz v0, :original
                return-void
            """, ExternalLabel("original", getInstruction(0)))
        }
        ProfileUserResponseFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, ${EXTENSION}ProfileAvatarSaver;->" +
                "recordProfileResponse(Ljava/lang/Object;)V",
        )
        ProfileAvatarBindFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p2 .. p2 }, ${EXTENSION}ProfileAvatarSaver;->" +
                "attachAvatar(Landroid/view/View;)V",
        )
        val avatarHandlers = listOf(
            OwnProfileAvatarLongPressFingerprint,
            OtherProfileAvatarLongPressFingerprint,
        ).map { it.method }
        val firstAvatarHandler = avatarHandlers.firstOrNull()
            ?: throw PatchException("Advanced downloads: no profile avatar hold handler resolved.")
        // One fingerprint is the other's strings plus two, so a build that blurred the two apart
        // would have them both land here and one gesture would go unhooked with nothing said.
        if (avatarHandlers.distinctBy { "${it.definingClass}->${it.name}" }.size != avatarHandlers.size) {
            throw PatchException(
                "Advanced downloads: both profile avatar handlers resolved to " +
                    "${firstAvatarHandler.definingClass}->${firstAvatarHandler.name}.",
            )
        }
        avatarHandlers.forEach { handler ->
            handler.interceptProfileAvatarLongPress(
                mutableClassDefBy(handler.definingClass).avatarCaptureField(),
            )
        }

        StoryPlayAreaViewFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p1 }, ${EXTENSION}StoryDownloads;->" +
                "attachPlayArea(Ljava/lang/Object;Landroid/view/View;)V",
        )
        requireStoryBindMethods(StoryPlayAreaBindFingerprint.matchAll().map { it.method })
            .forEach { method ->
                method.addInstruction(
                    0,
                    "invoke-static/range { p0 .. p2 }, ${EXTENSION}StoryDownloads;->" +
                        "recordStory(Ljava/lang/Object;ILjava/lang/Object;)V",
                )
            }

        resolveStoryLongPressTimer().interceptStoryLongPress()

        SettingsStatusLoadFingerprint.method.addInstruction(0,
            "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableAdvancedDownloads()V")
    }
}
