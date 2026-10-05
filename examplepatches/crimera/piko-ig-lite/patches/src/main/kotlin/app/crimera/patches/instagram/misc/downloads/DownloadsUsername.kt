/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.downloads

import app.crimera.bytecode.Target
import app.crimera.patches.instagram.models.MEDIA_DESCRIPTOR
import app.crimera.patches.instagram.models.PandoField
import app.crimera.patches.instagram.models.PandoModel
import app.crimera.patches.instagram.models.USER_DESCRIPTOR
import app.crimera.patches.instagram.models.readModelValue
import app.crimera.patches.instagram.models.resolvedModelGetter
import app.crimera.patches.instagram.utils.replaceBridgeBody
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException

private const val STRING_DESCRIPTOR = "Ljava/lang/String;"

/** Pando key of the post author on `Media`. */
private const val MEDIA_USER_KEY = "user"

/**
 * Pando field id of `User.username`. The getter decodes its key at runtime, so the string never
 * appears in the dex; the id is the same on every supported release.
 */
private val USERNAME_FIELD = PandoField.FieldId("username", -0xfd6772a)

/**
 * Emits `DownloadUtils.getMediaUsername(media)`: `Media` → author `User` → username, through the
 * lazy model getters, so file names no longer depend on the legacy user-data entity.
 */
context(patchContext: BytecodePatchContext)
internal fun injectMediaUsername() {
    val mediaUser = resolvedModelGetter(PandoModel.MEDIA, PandoField.Key(MEDIA_USER_KEY))
    if (mediaUser.getter.returnType != USER_DESCRIPTOR) {
        throw PatchException("Media \"$MEDIA_USER_KEY\" getter returns ${mediaUser.getter.returnType}, not $USER_DESCRIPTOR")
    }
    val username = resolvedModelGetter(PandoModel.USER, USERNAME_FIELD)
    if (username.getter.returnType != STRING_DESCRIPTOR) {
        throw PatchException("User username getter returns ${username.getter.returnType}, not a String")
    }

    replaceBridgeBody(
        DOWNLOAD_UTILS_DESCRIPTOR,
        "getMediaUsername",
        listOf(OBJECT_DESCRIPTOR),
        STRING_DESCRIPTOR,
        registers = 2,
    ) {
        val value = 0
        val media = 1
        instanceOf(value, media, MEDIA_DESCRIPTOR)
        ifEqz(value, Target.Local("none"))
        checkCast(media, MEDIA_DESCRIPTOR)
        readModelValue(value, media, mediaUser, Target.Local("none"))
        ifEqz(value, Target.Local("none"))
        readModelValue(value, value, username, Target.Local("none"))
        returnObject(value)

        label("none")
        constInt(value, 0)
        returnObject(value)
    }
}
