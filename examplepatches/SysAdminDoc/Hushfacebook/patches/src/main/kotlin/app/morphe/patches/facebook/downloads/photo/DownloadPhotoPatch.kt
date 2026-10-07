/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.downloads.photo

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities

/**
 * Offers Save photo on every photo the viewer opens and saves it through Hushfacebook. See
 * PhotoSaveAnchors.kt for where the hooks go, and the extension's PhotoSave for what they do.
 */
@Suppress("unused")
val downloadPhotoPatch = bytecodePatch(
    // The README table check reads this literal; PHOTO_PATCH carries the same text for the messages.
    name = "Download any photo",
    description = "Shows Save photo on every photo you open, even where the poster turned saving off, and saves " +
        "the biggest size where your downloads go. Its switch is under Downloads.",
    default = true,
) {
    category("Downloads")
    dependsOn(settingsPatch, facebookExtensionPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        unlockPhotoSave()
        enableStatus("photoDownload")
    }
}

/** Puts the switch on every photo-menu read of `can_viewer_download` and wraps Save photo's action. */
internal fun BytecodePatchContext.unlockPhotoSave() {
    val gated = mutableListOf<Pair<String, String>>()
    val actions = mutableListOf<Pair<String, String>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_CLASSES)) return@classDefForEach
        classDef.methods.forEach { method ->
            if (photoDownloadGates(method).isNotEmpty()) gated += classDef.type to method.name
            if (isSavePhotoAction(method)) actions += classDef.type to method.name
        }
    }
    if (gated.isEmpty()) throw PatchException("$PHOTO_PATCH: found no photo menu reading can_viewer_download")
    val (owner, name) = actions.singleOrNull()
        ?: throw PatchException("$PHOTO_PATCH: expected one $SAVE_PHOTO_ACTION, found ${actions.size}")

    gated.distinct().forEach { (type, method) ->
        mutableClassDefBy(type).methods.filter { it.name == method }.forEach { mutable ->
            // From the last gate back, so an insert doesn't move the ones still to come.
            photoDownloadGates(mutable).sortedDescending().forEach(mutable::answerGateWithTheSwitch)
        }
    }
    mutableClassDefBy(owner).methods.single { it.name == name && isSavePhotoAction(it) }.wrapSaveAction()
}
