/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.tasker.patches.license

import app.loki.patches.universal.addMenuFlag
import app.loki.patches.universal.menuPatch
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.tasker.patches.menu.taskerMenuRowPatch
import app.tasker.patches.shared.Constants.COMPATIBILITY_TASKER
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference

/** Real class name, verified: the Kotlin file keeps its name, only the licence classes are renamed. */
private const val CONTEXT_EXT = "Lcom/joaomgcd/taskerm/util/ExtensionsContextKt;"

/** Tells the Loki Patches screen this patch ran; the status page and the Premium page read it. */
private val flag = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { it.addMenuFlag("app.loki.menu.premium") }
    }
}

@Suppress("unused")
val unlockTaskerPatch = bytecodePatch(
    name = "Unlock Tasker",
    description = "Unlocks all of Tasker's paid features with no trial timer, even offline. Buy Tasker if you rely on it.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TASKER)
    dependsOn(flag)
    dependsOn(menuPatch)
    dependsOn(taskerMenuRowPatch)

    execute {
        // The licence broker carries its own log line in the branch this patch routes to, which pins the class
        // even though the broker's own names are renamed every release.
        var brokerType: String? = null
        classDefForEach { classDef ->
            if (brokerType != null) return@classDefForEach
            val licensed = classDef.methods.any { method ->
                method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                        "Licensed unconditionally: "
                } == true
            }
            if (licensed) brokerType = classDef.type
        }
        val brokerType2 = brokerType ?: throw PatchException("Tasker: the licence broker was not found")

        var decision: Method? = null
        classDefForEach { classDef ->
            if (classDef.type != brokerType2 || decision != null) return@classDefForEach
            decision = classDef.methods.firstOrNull { method ->
                method.returnType.endsWith("Single;") && method.implementation?.instructions?.any {
                    val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
                    it.opcode == Opcode.INVOKE_STATIC && ref != null &&
                        ref.definingClass == CONTEXT_EXT && ref.returnType == "Z" &&
                        ref.parameterTypes.map { type -> type.toString() } == listOf("Landroid/content/Context;")
                } == true
            }
        }
        val method = decision ?: throw PatchException("Tasker: the licence decision was not found")

        val instructions = method.implementation!!.instructions.toList()
        val call = instructions.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            it.opcode == Opcode.INVOKE_STATIC && ref != null &&
                ref.definingClass == CONTEXT_EXT && ref.returnType == "Z" &&
                ref.parameterTypes.map { type -> type.toString() } == listOf("Landroid/content/Context;")
        }
        require(call >= 0) { "Tasker: the package-name test was not found in the licence decision" }

        val result = instructions[call + 1]
        require(result.opcode == Opcode.MOVE_RESULT) { "Tasker: the package-name test is not followed by its result" }

        val brokerDef = brokerType2
        mutableClassDefBy(classDefOf(brokerDef)).methods.first { it.name == method.name }
            .replaceInstruction(call + 1, "const/4 v${(result as OneRegisterInstruction).registerA}, 0x1")

        // 1b. The same test is asked in a second licence path: the startup check that decides whether to show the
        // "Trial Over" dialog (nt.x$a.p in this build), which then reads the real status and blocks. Every method
        // that builds a licence result and asks the test gets the same answer. Only Single-returning methods are
        // touched; the unrelated callers (the helper that picks a custom notification icon, which crashed when
        // this was forced globally) keep their real answer.
        var answered = 0
        classDefForEach { classDef ->
            classDef.methods.forEach { candidate ->
                val candidateBody = candidate.implementation?.instructions?.toList() ?: return@forEach
                if (!candidate.returnType.endsWith("Single;")) return@forEach

                var patched = false
                candidateBody.forEachIndexed { index, instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    if (instruction.opcode != Opcode.INVOKE_STATIC || ref == null) return@forEachIndexed
                    if (ref.definingClass != CONTEXT_EXT || ref.returnType != "Z") return@forEachIndexed
                    if (ref.parameterTypes.map { type -> type.toString() } != listOf("Landroid/content/Context;")) {
                        return@forEachIndexed
                    }
                    val answer = candidateBody.getOrNull(index + 1) ?: return@forEachIndexed
                    if (answer.opcode != Opcode.MOVE_RESULT) return@forEachIndexed

                    mutableClassDefBy(classDef).methods.first {
                        it.name == candidate.name && it.parameterTypes == candidate.parameterTypes
                    }.replaceInstruction(
                        index + 1,
                        "const/4 v${(answer as OneRegisterInstruction).registerA}, 0x1",
                    )
                    answered++
                    patched = true
                }
            }
        }
        require(answered > 0) { "Tasker: no licence check asks the package-name test any more" }

        // 2. Force the cached status: every gate reads that object first, including the dialog that says
        // "Trial Over", so the decision above is not enough on its own.
        var readerType: String? = null
        var reader: Method? = null
        classDefForEach { classDef ->
            if (classDef.type != brokerDef || reader != null) return@classDefForEach
            reader = classDef.methods.firstOrNull { m ->
                m.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "Cached status: "
                } == true
            }
            if (reader != null) readerType = classDef.type
        }
        val readerMethod = reader ?: throw PatchException("Tasker: the cached-status reader was not found")

        val readerBody = readerMethod.implementation!!.instructions.toList()
        val ctorIndex = readerBody.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            it.opcode == Opcode.INVOKE_DIRECT_RANGE && ref != null &&
                ref.definingClass == STATUS_HOLDER && ref.name == "<init>"
        }
        require(ctorIndex >= 0) { "Tasker: the cached status is never constructed" }

        // <init>(Z, Object, l3, I, k) invoked on `this`: slot 0 is `this`, then the boolean, then the status.
        val statusRegister = (readerBody[ctorIndex] as RegisterRangeInstruction).startRegister + 2

        // The status argument is loaded by the move-object just above the constructor call; replace that load
        // with the Licensed constant. Built through dexlib2 so no smali text has to parse.
        val statusLoad = (ctorIndex - 1 downTo 0).firstOrNull {
            val instruction = readerBody[it]
            instruction.opcode == Opcode.MOVE_OBJECT &&
                (instruction as OneRegisterInstruction).registerA == statusRegister
        } ?: throw PatchException("Tasker: the cached status is not loaded into its argument")

        val licensed = BuilderInstruction21c(
            Opcode.SGET_OBJECT,
            statusRegister,
            ImmutableFieldReference(LICENSE_STATUS, "Licensed", LICENSE_STATUS),
        )

        mutableClassDefBy(classDefOf(readerType!!)).methods.first { it.name == readerMethod.name }
            .replaceInstruction(statusLoad, licensed)
    }
}

private const val STATUS_HOLDER = "Lcom/joaomgcd/taskerm/util/wg;"
private const val LICENSE_STATUS = "Lcom/joaomgcd/taskerm/licensing/LicenseStatus;"

private fun BytecodePatchContext.classDefOf(type: String): ClassDef {
    var found: ClassDef? = null
    classDefForEach { if (it.type == type) found = it }
    return found ?: throw PatchException("Tasker: class $type disappeared")
}
