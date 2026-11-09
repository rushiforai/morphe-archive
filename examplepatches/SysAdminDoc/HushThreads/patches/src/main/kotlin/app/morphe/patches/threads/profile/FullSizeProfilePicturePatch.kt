/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 454 (2026-11-08).
 */
package app.morphe.patches.threads.profile

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.download.IMAGE_URL
import app.morphe.patches.threads.download.USER
import app.morphe.patches.threads.download.pandoGetter
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.parameterRegister
import app.morphe.patches.threads.misc.extension.requireLocals
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.extension.writeStub
import app.morphe.patches.threads.misc.settings.EXTENSION_ROOT
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH = "Full size profile pictures"
internal const val PROFILE_PICTURE = "$EXTENSION_PACKAGE/profile/ProfilePicture;"
internal const val OPEN = "$PROFILE_PICTURE->open(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Z"
internal const val PROFILE_MODEL = "$EXTENSION_PACKAGE/profile/ProfileModel;"

/**
 * The start of the Compose trace note in Threads' enlarged profile picture. The line number after
 * it moves between releases; an inner lambda's note goes on with `.<anonymous>` instead of the space.
 */
internal const val FOCUSED_PICTURE_NOTE = "com.instagram.barcelona.profile.ui.FocusedProfilePictureScreen ("

internal const val USER_SESSION = "Lcom/instagram/common/session/UserSession;"
internal const val USER_CACHE = "Lcom/instagram/user/model/UserCache;"
internal const val PROFILE_PIC_URL_INFO = "Lcom/instagram/api/schemas/ProfilePicUrlInfo;"
private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
private const val STRING = "Ljava/lang/String;"

/** The stubs in [PROFILE_MODEL] the patch writes, each found before anything changes. */
private val STUBS = listOf("session", "userCache", "cachedUser", "hdPicture", "picture", "username", "hdUrl", "pictureUrl", "dismiss")

/**
 * Threads' enlarged profile picture: [method], its Compose composer at declared parameter
 * [composer], the profile's user id at [userId], the callback that puts the picture away at
 * [dismiss], and [session], the call it reads the signed-in account's session with.
 */
internal class FocusedPicture(
    val method: Method,
    val composer: Int,
    val userId: Int,
    val dismiss: Int,
    val session: MethodReference,
)

/**
 * Opens a profile picture full size instead of Threads' bigger circle.
 *
 * Tapping the picture on a profile makes Threads draw it again, enlarged in a circle over the
 * profile, in one Compose function: it takes the composer, the profile's user id and a callback
 * that puts the circle away, and reads the account's session from the composer to look the user
 * up. First thing in that function, before Compose starts its group, the extension is handed all
 * three. While the switch is on it looks the user up the same way, opens the largest size of the
 * picture in a full screen viewer of its own, and answers true, and the function returns without
 * drawing anything. Closing the viewer runs Threads' callback. Off, or whenever the viewer can't
 * open, it answers false and Threads draws its circle.
 *
 * The extension's [PROFILE_MODEL] stubs get bodies making the same calls Threads makes: the session
 * read, the user cache for that session and its user by id, and the user's picture fields, read by
 * the hash of their names. The function is found by its trace note, and has to take exactly one
 * String, exactly one callback and one composer whose session read it makes once. Anything missing
 * or doubled is refused before anything changes.
 */
@Suppress("unused")
val fullSizeProfilePicturePatch = bytecodePatch(
    name = PATCH,
    description = "Opens a profile picture full size when you tap it on a profile, so you can zoom in and save it, " +
        "instead of Threads' small circle. Starts off. Turn it on in HushThreads settings > Appearance.",
) {
    category("Interface")
    dependsOn(settingsPatch)
    dependsOn(threadsExtensionPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        requireStatusMethod("fullSizeProfilePictures")
        val picture = focusedPicture()
        val writeModel = profileModel(picture)
        val method = mutableClassDefBy(picture.method.definingClass).findMutableMethodOf(picture.method)
        method.requireLocals(PATCH, 3)
        method.addInstructionsWithLabels(
            0,
            """
                move-object/from16 v0, ${method.parameterRegister(picture.composer)}
                move-object/from16 v1, ${method.parameterRegister(picture.userId)}
                move-object/from16 v2, ${method.parameterRegister(picture.dismiss)}
                invoke-static { v0, v1, v2 }, $OPEN
                move-result v0
                if-eqz v0, :threads
                return-void
            """,
            ExternalLabel("threads", method.getInstruction(0)),
        )
        writeModel()
        enableStatus("fullSizeProfilePictures")
    }
}

/** A method's full signature. A Method is a MethodReference too. */
private fun Method.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

internal fun Instruction.isFocusedPictureNote(): Boolean =
    (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) &&
        getReference<StringReference>()?.string?.startsWith(FOCUSED_PICTURE_NOTE) == true

/** A static call answering the account's session from one argument and an int: how Compose code reads it. */
private fun Instruction.readsSession(): MethodReference? {
    if (opcode != Opcode.INVOKE_STATIC && opcode != Opcode.INVOKE_STATIC_RANGE) return null
    val call = getReference<MethodReference>() ?: return null
    val parameters = call.parameterTypes.map { it.toString() }
    return call.takeIf { it.returnType == USER_SESSION && parameters.size == 2 && parameters[1] == "I" }
}

/** Threads' enlarged profile picture: the one static, void method outside the extension carrying its note. */
internal fun BytecodePatchContext.focusedPicture(): FocusedPicture {
    val method = classDefByStrings(FOCUSED_PICTURE_NOTE, StringComparisonType.STARTS_WITH)
        .filterNot { it.type.startsWith(EXTENSION_ROOT) }
        .flatMap { it.methods }
        .distinctBy { it.signature() }
        .filter { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                method.implementation?.instructions?.any { it.isFocusedPictureNote() } == true
        }
        // Read through the mutable copy, so what's checked is what the hook goes into.
        .map { mutableClassDefBy(it.definingClass).findMutableMethodOf(it) }
        .singleOrPatchException("$PATCH: Threads' enlarged profile picture, noted \"$FOCUSED_PICTURE_NOTE\"")
    return method.focusedPictureParts()
}

/** The parameters and the session read of the enlarged picture [this]. Throws unless each is the only one. */
internal fun Method.focusedPictureParts(): FocusedPicture {
    val types = parameterTypes.map { it.toString() }
    fun only(type: String, what: String): Int {
        val at = types.indices.filter { types[it] == type }
        return at.singleOrNull()
            ?: throw PatchException("$PATCH: ${signature()} takes ${at.size} $type parameters, not one for its $what")
    }
    val userId = only(STRING, "user id")
    val dismiss = only(FUNCTION0, "callback")
    val reads = implementation!!.instructions.mapNotNull { it.readsSession() }.distinctBy { it.toString() }
    val session = reads.singleOrNull()
        ?: throw PatchException("$PATCH: ${signature()} reads the account's session through ${reads.size} calls, not one")
    val composer = only(session.parameterTypes[0].toString(), "composer")
    return FocusedPicture(this, composer, userId, dismiss, session)
}

/**
 * Finds what each [PROFILE_MODEL] stub calls and answers the step that writes them all. A stub
 * missing from the extension, or a call missing from the build, refuses here, before the hook goes in.
 */
internal fun BytecodePatchContext.profileModel(picture: FocusedPicture): () -> Unit {
    val stubs = mutableClassDefBy(PROFILE_MODEL).methods
    STUBS.forEach { name ->
        if (stubs.count { it.name == name && AccessFlags.STATIC.isSet(it.accessFlags) } != 1) {
            throw PatchException("$PATCH: $PROFILE_MODEL has no single static $name")
        }
    }
    val cache = classDefBy(USER_CACHE).methods
    val forSession = cache.singleOrNull {
        AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == USER_CACHE &&
            it.parameterTypes.map(Any::toString) == listOf(USER_SESSION)
    } ?: throw PatchException("$PATCH: expected one static method on $USER_CACHE answering the cache for a session")
    val byId = cache.singleOrNull {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == USER &&
            it.parameterTypes.map(Any::toString) == listOf(STRING)
    } ?: throw PatchException("$PATCH: expected one method on $USER_CACHE answering a user for an id")
    val hd = pandoGetter(PATCH, USER, "hd_profile_pic_url_info", PROFILE_PIC_URL_INFO)
    val regular = pandoGetter(PATCH, USER, "profile_pic_url", IMAGE_URL)
    val username = pandoGetter(PATCH, USER, "username", STRING)
    listOf(PROFILE_PIC_URL_INFO, IMAGE_URL).forEach { type ->
        val definition = classDefBy(type)
        if (!AccessFlags.INTERFACE.isSet(definition.accessFlags)) throw PatchException("$PATCH: $type is no longer an interface")
        if (definition.methods.none { it.name == "getUrl" && it.parameterTypes.isEmpty() && it.returnType == STRING }) {
            throw PatchException("$PATCH: $type has no getUrl()")
        }
    }
    val composerType = picture.method.parameterTypes[picture.composer].toString()
    val session = picture.session

    // Each body hands back null for a null argument, and casts anything else, so a wrong type throws
    // into ProfilePicture's catch rather than reaching Threads' code.
    fun call(name: String, receiver: String, invoke: String) = writeStub(PROFILE_MODEL, name, 1, """
        if-eqz p0, :none
        check-cast p0, $receiver
        $invoke
        move-result-object p0
        return-object p0
        :none
        const/4 p0, 0x0
        return-object p0
    """)

    return {
        // The int is the one Threads' own read passes: 1.
        writeStub(PROFILE_MODEL, "session", 2, """
            if-eqz p0, :none
            check-cast p0, $composerType
            const/4 v0, 0x1
            invoke-static { p0, v0 }, $session
            move-result-object p0
            return-object p0
            :none
            const/4 p0, 0x0
            return-object p0
        """)
        call("userCache", USER_SESSION, "invoke-static { p0 }, ${forSession.signature()}")
        writeStub(PROFILE_MODEL, "cachedUser", 2, """
            if-eqz p0, :none
            check-cast p0, $USER_CACHE
            invoke-virtual { p0, p1 }, ${byId.signature()}
            move-result-object p0
            return-object p0
            :none
            const/4 p0, 0x0
            return-object p0
        """)
        call("hdPicture", USER, "invoke-virtual { p0 }, ${hd.signature()}")
        call("picture", USER, "invoke-virtual { p0 }, ${regular.signature()}")
        call("username", USER, "invoke-virtual { p0 }, ${username.signature()}")
        call("hdUrl", PROFILE_PIC_URL_INFO, "invoke-interface { p0 }, $PROFILE_PIC_URL_INFO->getUrl()$STRING")
        call("pictureUrl", IMAGE_URL, "invoke-interface { p0 }, $IMAGE_URL->getUrl()$STRING")
        writeStub(PROFILE_MODEL, "dismiss", 1, """
            if-eqz p0, :none
            check-cast p0, $FUNCTION0
            invoke-interface { p0 }, $FUNCTION0->invoke()Ljava/lang/Object;
            :none
            return-void
        """)
    }
}
