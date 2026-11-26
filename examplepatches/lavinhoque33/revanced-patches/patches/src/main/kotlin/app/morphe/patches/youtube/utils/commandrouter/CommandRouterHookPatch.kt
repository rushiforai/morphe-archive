/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/4148
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 *
 * Modified by lavinhoque33, 2026-11-25.
 */

package app.morphe.patches.youtube.utils.commandrouter

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.misc.bridge.addBridge
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.util.Utils.printWarn

private const val EXTENSION_CLASS = "Lapp/morphe/extension/youtube/patches/CommandRouterPatch;"
private const val EXTENSION_COMMAND_ROUTER_INTERFACE =
    $$"Lapp/morphe/extension/youtube/patches/CommandRouterPatch$CommandRouter;"

internal var commandRouterHookInstalled = false
    private set

/**
 * Hooks the command router of each activity, so the extension can run commands
 * the same as the commands of server responses.
 */
internal val commandRouterHookPatch = bytecodePatch(
    description = "Hooks the command router of each activity so the extension can run commands."
) {
    dependsOn(sharedExtensionPatch)

    execute {
        commandRouterHookInstalled = false
        val constructor = CommandRouterConstructorFingerprint.matchOrNull()
        val executeCommandMethod = CommandRouterExecuteCommandFingerprint.matchOrNull()?.method
        if (constructor == null || executeCommandMethod == null) {
            printWarn("Native command router is not supported: activity router hook not found.")
            return@execute
        }

        val commandClass = executeCommandMethod.parameterTypes.first().toString()
        val parseCommand = try {
            parseProtoInstructions(commandClass, bytes = "p1", result = "v0", registry = "v1")
        } catch (exception: PatchException) {
            printWarn("Native command router is not supported: ${exception.message}")
            return@execute
        }

        constructor.classDef.apply {
            interfaces.add(EXTENSION_COMMAND_ROUTER_INTERFACE)
            addBridge(
                "patch_executeCommand", listOf("[B", "Ljava/util/Map;"), "V", 5,
                """
                    $parseCommand
                    check-cast v0, $commandClass
                    invoke-virtual { p0, v0, p2 }, $executeCommandMethod
                    return-void
                """
            )
        }

        // Right after the super constructor, before the activity register can be reused.
        constructor.method.addInstruction(
            constructor.instructionMatches.first().index + 1,
            "invoke-static { p0, p1 }, $EXTENSION_CLASS->" +
                    "setCommandRouter(${EXTENSION_COMMAND_ROUTER_INTERFACE}Landroid/app/Activity;)V"
        )
        commandRouterHookInstalled = true
    }
}
