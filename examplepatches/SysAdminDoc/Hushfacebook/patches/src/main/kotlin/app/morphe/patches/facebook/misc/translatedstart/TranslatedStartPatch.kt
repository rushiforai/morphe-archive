/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.translatedstart

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.extension.freeLocalsAt
import app.morphe.patches.facebook.misc.extension.requireStatusMethod
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val TRANSLATED_START_NAME = "Start on x86 devices"

internal const val SKIP_APP_INITS = "$EXTENSION_PACKAGE/misc/TranslatedStart;->" +
    "skipAppInits(Ljava/util/Set;)Ljava/util/Set;"

@Suppress("unused")
val translatedStartPatch = bytecodePatch(
    name = "Start on x86 devices",
    description = "Keeps Facebook from crashing or freezing as it starts on an x86 device that runs its arm " +
        "code through a translator, such as an emulator or an x86 Chromebook, by skipping the one start-up " +
        "step that breaks there. Phones and tablets with arm chips start as before.",
    default = true,
) {
    category("Fixes")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    dependsOn(facebookExtensionPatch)

    execute {
        requireStatusMethod("translatedStart")
        ApplicationDelegateFingerprint.method.skipMoreAppInits()
        enableStatus("translatedStart")
    }
}

/**
 * Hands the set of start-up tasks Facebook skips to the extension just before the method stores it
 * for the scheduler, and stores what the extension answers instead. The set is the one
 * `sput-object` of a `java.util.Set` after [SKIP_APP_INITS_LOG]. The call copies it into a local up
 * to v15 that nothing reads after it, as an `invoke` names its registers in four bits.
 */
internal fun MutableMethod.skipMoreAppInits() {
    val code = implementation?.instructions?.toList()
        ?: throw PatchException("$TRANSLATED_START_NAME: $definingClass->$name has no body")
    val log = code.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == SKIP_APP_INITS_LOG
    }
    if (log < 0) throw PatchException("$TRANSLATED_START_NAME: $definingClass->$name doesn't log $SKIP_APP_INITS_LOG")
    val stores = code.withIndex().filter { (index, instruction) ->
        index > log && instruction.opcode == Opcode.SPUT_OBJECT &&
            ((instruction as ReferenceInstruction).reference as FieldReference).type == "Ljava/util/Set;"
    }
    if (stores.size != 1) {
        throw PatchException(
            "$TRANSLATED_START_NAME: $definingClass->$name stores ${stores.size} sets after $SKIP_APP_INITS_LOG, expected 1",
        )
    }
    val store = stores.single().index
    val skipped = (code[store] as OneRegisterInstruction).registerA
    val set = freeLocalsAt(TRANSLATED_START_NAME, store, 1).single()
    addInstructions(
        store,
        """
            move-object/from16 v$set, v$skipped
            invoke-static { v$set }, $SKIP_APP_INITS
            move-result-object v$skipped
        """,
    )
}
