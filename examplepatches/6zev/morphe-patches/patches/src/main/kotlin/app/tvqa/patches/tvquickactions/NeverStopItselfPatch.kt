/*
 * Patches for tvQuickActions Pro.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.tvqa.patches.tvquickactions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.registersUsed
import app.tvqa.patches.shared.Constants.TVQUICKACTIONS
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** The app's own package. Every "stop an app" action builds a shell command around one. */
private const val OWN_PACKAGE = "dev.vodik7.tvquickactions"

/** The action the service answers to when it is asked to run a command over ADB. */
private const val RUN_COMMAND = "$OWN_PACKAGE.RUN_COMMAND"

/**
 * The part of every command that stops the app: `am force-stop` followed by the package. Every
 * place that stops an app builds `am force-stop <package>`, so this substring identifies a command
 * that targets the app itself - whether it stops the app alone, or, as the restart action does,
 * follows the stop with a start.
 */
private const val STOP_COMMAND = "am force-stop $OWN_PACKAGE"

/** The broadcast the receiver answers to when its "stop recent apps" action runs. */
private const val STOP_RECENT_APPS = "$OWN_PACKAGE.STOP_RECENT_APPS"

private const val ADB_SERVICE = "Ldev/vodik7/tvquickactions/services/AdbLibService;"
private const val SHELL_HELPER = "Ldev/vodik7/tvquickactions/util/K;"
private const val STRING = "Ljava/lang/String;"
private const val STREAM = "LV3/j;"
private const val RECENT_APPS_LIST = "Ljava/util/concurrent/CopyOnWriteArrayList;"

/**
 * "Stop recent apps" stops every app in the recents list, and the app is in that list itself. With
 * an ADB connection up - which is exactly what makes the command work at all - the action stops
 * the app that issued it: it restarts, the action runs again, and the app loops every few seconds.
 *
 * Three things are patched, because the app stops apps by three routes:
 *
 * - Every built-in route ends in `am force-stop <package>` handed to AdbLibService, which runs it
 *   over ADB. The command runner drops a command that stops the app's own package, so no action -
 *   Stop recent apps, Restart app, Force stop app, or a button mapped to one - can stop the app.
 * - A custom "ADB command" action does not use AdbLibService: it goes through the shell helper
 *   `util.K.K`, which talks to the ADB connection directly. That helper drops the same command,
 *   and logs it, because an action can build the command from variables and only the resolved
 *   string is known there.
 * - When ADB is not in use the same action instead calls `killBackgroundProcesses` for each app in
 *   the recents list. The app is taken out of that list as well.
 *
 * The app only excludes the *foreground* app, and only when "Don't kill foreground app" is on, so
 * that preference is not enough on its own: a trigger that fires while the app is in the
 * background, or a stale foreground package, still lets the app stop itself.
 */
@Suppress("unused")
val neverStopItselfPatch = bytecodePatch(
    name = "Never stop itself",
    description = "Keeps the app from stopping its own package. Stop recent apps, Restart app and " +
            "Force stop app all end in `am force-stop <package>` run over ADB, and the app is in " +
            "the recents list it works from, so once an ADB connection is up the app stops " +
            "itself, restarts, and loops every few seconds. The app only skips the foreground " +
            "app, and only when the matching preference is enabled, so this covers what the " +
            "preference does not. Custom ADB command actions are covered too, and such a " +
            "command is logged under the TVQA-GUARD tag before it is dropped.",
    default = true
) {
    compatibleWith(TVQUICKACTIONS)

    execute {
        blockOwnStopCommand()
        blockOwnStopInShellHelpers()
        blockOwnPackageInRecentApps()
    }
}

/**
 * Drops a command that stops the app's own package before it reaches the shell.
 *
 * Every place that stops an app hands its command to this one method, so guarding it here covers
 * all of them at once.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.blockOwnStopCommand() {
    val service = mutableClassDefBy(ADB_SERVICE)

    val startCommand = service.methods.firstOrNull { it.name == "onStartCommand" }
        ?: throw PatchException("Could not find AdbLibService.onStartCommand")

    val instructions = startCommand.implementation?.instructions?.toList()
        ?: throw PatchException("AdbLibService.onStartCommand has no body")

    val actionIndex = instructions.indexOfFirst { it.stringConstant() == RUN_COMMAND }
    if (actionIndex < 0) throw PatchException("Could not find the run command action")

    // The request is handed to the method that runs it locally: the one place a command reaches
    // the shell.
    val runner = instructions.drop(actionIndex).asSequence()
        .mapNotNull { it.methodCall() }
        .firstOrNull { call ->
            call.definingClass == ADB_SERVICE && call.returnType == "V" &&
                call.parameterTypes.map { it.toString() } == listOf(STRING)
        }
        ?: throw PatchException("Could not find where AdbLibService runs a command")

    val run = service.methods.firstOrNull { method ->
        method.name == runner.name && method.returnType.toString() == runner.returnType &&
            method.parameterTypes.map { it.toString() } ==
            runner.parameterTypes.map { it.toString() }
    } ?: throw PatchException("Could not find the command runner")

    val implementation = run.implementation
        ?: throw PatchException("The command runner has no body")

    // The last register is the command. v0 is a local, and the body's first instruction
    // overwrites it, so it is free to compare with.
    val command = implementation.registerCount - 1
    if (command < 2) throw PatchException("The command runner has no register to compare in")

    run.addInstructions(
        0,
        """
            const-string v0, "$STOP_COMMAND"
            invoke-virtual {v$command, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :tvqa_run
            return-void
            :tvqa_run
        """.trimIndent()
    )
}

/**
 * Drops a command that stops the app's own package in the shell helper the app uses for custom
 * "ADB command" actions, and records it under the `TVQA-GUARD` tag.
 *
 * That helper (`util.K.K`) opens the ADB shell itself instead of handing the command to
 * AdbLibService, so the guard there never sees such a command. It also runs after the app has
 * substituted the `{...}` variables of the action, which is the only point at which the command
 * that will run is known. `AdbLibService.t` is the same shell entry point for callers that use it
 * directly, and is covered for the same reason.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.blockOwnStopInShellHelpers() {
    dropOwnStopCommands(
        owner = SHELL_HELPER,
        name = "K",
        parameters = listOf("Landroid/content/Context;", STRING),
        isStatic = true,
        tag = "TVQA-GUARD/K.K",
    )
    dropOwnStopCommands(
        owner = ADB_SERVICE,
        name = "t",
        parameters = listOf(STRING),
        isStatic = false,
        tag = "TVQA-GUARD/AdbLibService.t",
    )
}

/**
 * Prepends the guard to a method that turns a command into a shell stream: a command that names
 * the app's own package after `am force-stop` is logged and answered with no stream, which every
 * caller already treats as "the shell is not available".
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.dropOwnStopCommands(
    owner: String,
    name: String,
    parameters: List<String>,
    isStatic: Boolean,
    tag: String,
) {
    val classDef = mutableClassDefBy(owner)
    val method = classDef.methods.firstOrNull { method ->
        method.name == name &&
            method.returnType.toString() == STREAM &&
            method.parameterTypes.map { it.toString() } == parameters
    } ?: throw PatchException("Could not find $owner->$name")

    val implementation = method.implementation
        ?: throw PatchException("$owner->$name has no body")

    // v0 is a local for both methods (the command is the last register, the parameters are at the
    // top of the frame), and the body's first instruction overwrites it, so it is free to use.
    val parameterCount = parameters.size + if (isStatic) 0 else 1
    if (implementation.registerCount - parameterCount < 1) {
        throw PatchException("$owner->$name has no local register to compare in")
    }

    val command = implementation.registerCount - 1

    method.addInstructions(
        0,
        """
            const-string v0, "$STOP_COMMAND"
            invoke-virtual {v$command, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
            move-result v0
            if-eqz v0, :tvqa_guard
            const-string v0, "$tag"
            invoke-static {v0, v$command}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
            const/4 v0, 0x0
            return-object v0
            :tvqa_guard
        """.trimIndent()
    )
}

/**
 * Takes the app out of the list of recent apps its own "stop recent apps" action works from, which
 * is the route the action takes when ADB is not in use.
 */
private fun app.morphe.patcher.patch.BytecodePatchContext.blockOwnPackageInRecentApps() {
    val receiver = classDefByStrings(STOP_RECENT_APPS).firstOrNull()
        ?: throw PatchException("Could not find the recent apps receiver")

    val stopRecentApps = mutableClassDefBy(receiver.type).methods.firstOrNull { method ->
        method.implementation?.instructions?.any { instruction ->
            instruction.stringConstant() == STOP_RECENT_APPS
        } == true
    } ?: throw PatchException("Could not find the code that stops recent apps")

    val implementation = stopRecentApps.implementation
        ?: throw PatchException("The recent apps code has no body")

    val instructions = implementation.instructions.toList()
    val actionIndex = instructions.indexOfFirst { it.stringConstant() == STOP_RECENT_APPS }

    // The list of apps to stop is built, the app itself is filtered out of it, and then it is
    // iterated. The package is removed from the list just before that iteration.
    val iteration = instructions.withIndex().firstOrNull { (index, instruction) ->
        index > actionIndex && (instruction.methodCall()?.let {
            it.name == "iterator" && it.definingClass == RECENT_APPS_LIST
        } == true)
    } ?: throw PatchException("Could not find where the recent apps are iterated")

    val list = iteration.value.registersUsed.firstOrNull()
        ?: throw PatchException("Could not find the register holding the recent apps")

    // The register the iteration call does not use, which the code before it has finished with:
    // it held the collection the previous call removed, and is overwritten by the move-result
    // below in the original code path anyway.
    val scratch = if (list == 3) 4 else 3
    if (scratch >= implementation.registerCount) {
        throw PatchException("Could not find a register to remove the app with")
    }

    stopRecentApps.addInstructions(
        iteration.index,
        """
            const-string v$scratch, "$OWN_PACKAGE"
            invoke-virtual {v$list, v$scratch}, $RECENT_APPS_LIST->remove(Ljava/lang/Object;)Z
            move-result v$scratch
        """.trimIndent()
    )
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.stringConstant() =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.methodCall() =
    (this as? ReferenceInstruction)?.reference as? MethodReference
