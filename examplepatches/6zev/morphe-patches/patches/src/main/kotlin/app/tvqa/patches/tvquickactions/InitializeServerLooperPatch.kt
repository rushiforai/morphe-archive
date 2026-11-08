/*
 * Patches for tvQuickActions Pro.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.tvqa.patches.tvquickactions

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.tvqa.patches.shared.Constants.TVQUICKACTIONS_3_8
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SERVER_CLASS = "Ldev/vodik7/tvquickactions/server/Server;"
private const val LOOPER_CLASS = "Landroid/os/Looper;"

/**
 * The ADB server's entry point calls Looper.prepare() unconditionally. When app_process has
 * already prepared the main thread's Looper, that throws before the server coroutine starts;
 * Server.main then misreports the exception as a port-15000 conflict and exits.
 *
 * Replacing Looper.prepare() with invoke-static { }, Landroid/os/Looper;->myLooper()Landroid/os/Looper;
 * preserves the method signature and return type expected by subsequent instructions (like moving to sMainLooper),
 * preventing VerifyError while effectively neutralizing the prepare() call when a Looper already exists.
 */
@Suppress("unused")
val initializeServerLooperPatch = bytecodePatch(
    name = "Initialize ADB server Looper",
    description = "Neutralizes the redundant Looper.prepare() call from the ADB server main entry point.",
    default = true
) {
    compatibleWith(TVQUICKACTIONS_3_8)

    execute {
        val server = mutableClassDefBy(SERVER_CLASS)
        val main = server.methods.firstOrNull { method ->
            method.name == "main" && method.returnType.toString() == "V" &&
                method.parameterTypes.map { it.toString() } == listOf("[Ljava/lang/String;")
        } ?: throw PatchException("Could not find Server.main(String[])")

        val instructions = main.implementation?.instructions?.toList()
            ?: throw PatchException("Server.main(String[]) has no body")
        val prepareIndex = instructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == LOOPER_CLASS && reference.name == "prepare" &&
                reference.returnType == "V" && reference.parameterTypes.isEmpty()
        }
        if (prepareIndex < 0) throw PatchException("Could not find Looper.prepare() in Server.main")

        main.replaceInstruction(prepareIndex, "invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;")
    }
}
