/*
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 *
 * Built on SysAdminDoc/hushfeed (GPL-3.0).
 */
package app.morphe.patches.telegram.misc.extension

import app.morphe.util.names.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.misc.extension.EXTENSION_CLASS_DESCRIPTOR
import app.morphe.patches.shared.misc.extension.sharedExtensionPatch
import app.morphe.util.superclassChain
import app.morphe.util.names.giveExtensionHostNames
import app.morphe.util.names.origName
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgMutableClassDefByOrNull

/** The application class the manifest names. A manifest name is never obfuscated. */
internal const val TELEGRAM_APPLICATION = "Lorg/telegram/messenger/ApplicationLoaderImpl;"

/**
 * Merges the shared and Telegram extensions and hands them the application context.
 *
 * <p>The context goes in at the start of the application's `onCreate()`, in whichever class of
 * its hierarchy declares one: every process Telegram starts builds this application, and the
 * settings, the pause switch and safe mode all read preferences through that context before any
 * hook asks for a switch.
 */
private val telegramExtension = sharedExtensionPatch(extensionName = "telegram", isYouTubeOrYouTubeMusic = false)

/**
 * Hands the merged extension the build's names for the Telegram classes, fields, methods and
 * resources it reaches by reflection, which R8 renames from 13.2 (see `giveExtensionHostNames`).
 */
internal val extensionHostNamesPatch = bytecodePatch {
    dependsOn(telegramExtension)

    execute {
        giveExtensionHostNames()
    }
}

val telegramExtensionPatch = bytecodePatch {
    dependsOn(telegramExtension, extensionHostNamesPatch)

    execute {
        // The chain starts at the application class itself and stops at the first framework class
        // the APK does not carry.
        val declaring = superclassChain(TELEGRAM_APPLICATION)
            .mapNotNull { type -> tgMutableClassDefByOrNull(type) }
            .firstNotNullOfOrNull { classDef ->
                classDef.methods.singleOrNull { method ->
                    method.origName == "onCreate" && method.parameterTypes.isEmpty() &&
                        method.origReturnType == "V" && method.implementation != null
                }
            } ?: throw PatchException(
                "Neither $TELEGRAM_APPLICATION nor a superclass in the APK declares onCreate()",
            )

        declaring.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS_DESCRIPTOR->setContext(Landroid/content/Context;)V",
        )
    }
}
