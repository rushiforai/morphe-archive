/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.gphotos.patches.menu

import app.loki.patches.universal.AppResources
import app.loki.patches.universal.appResourcesPatch
import app.loki.patches.universal.freeFrom
import app.loki.patches.universal.lokiGlyphPatch
import app.loki.patches.universal.menuPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val ROWS = "Lapp/loki/extension/LokiRows;"
private const val ACCOUNT_DISC = "Lcom/google/android/libraries/onegoogle/accountmenu/SelectedAccountDisc;"
private const val CLICK = "Landroid/view/View\$OnClickListener;"

/**
 * Where Google Photos fills its account menu (the screen behind the profile picture): it handles the menu item that
 * hosts the account disc and builds the menu's rows. Google's OneGoogle library classes keep their names, so the disc
 * anchors it.
 */
private val accountMenu = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/view/MenuItem;"),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type == ACCOUNT_DISC
        } == true
    },
)

private fun MethodReference.smali() =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun FieldReference.smali() = "$definingClass->$name:$type"

private fun Instruction.method() = (this as? ReferenceInstruction)?.reference as? MethodReference

/**
 * "Loki Patches" row in the Google Photos account menu, between "Your data in Google Photos" and "Photos settings",
 * in the same style as those rows, with the teal Loki puzzle piece. Tapping it opens the Loki Patches screen.
 *
 * The row is copied from how Photos builds its own "Photos settings" row (found by its label resource,
 * `og_app_settings`), so it uses the same builder, group and style. Each step checks the code is shaped as expected
 * and refuses to patch otherwise.
 */
internal val photosAccountRowPatch = bytecodePatch {
    dependsOn(menuPatch, lokiGlyphPatch, appResourcesPatch)

    execute {
        val method = accountMenu.method
        val code = method.implementation!!.instructions.toList()

        // The "Photos settings" row starts where its label resource is loaded.
        val label = AppResources.id("string", "og_app_settings")
        val labelAt = code.indexOfFirst { (it as? NarrowLiteralInstruction)?.narrowLiteral == label }
        if (labelAt < 0) throw PatchException("Photos account menu: \"Photos settings\" row not found")

        // Its builder: a no-argument static factory, then setters, then build() and add() to the menu's list.
        val factoryAt = (labelAt until code.size).firstOrNull { index ->
            code[index].opcode == Opcode.INVOKE_STATIC && code[index].method()?.parameterTypes?.isEmpty() == true
        } ?: throw PatchException("Photos account menu: row builder not found")
        val factory = code[factoryAt].method()!!
        val builder = factory.returnType
        val buildAt = (factoryAt + 1 until code.size).firstOrNull { index ->
            val ref = code[index].method()
            code[index].opcode == Opcode.INVOKE_VIRTUAL && ref?.definingClass == builder &&
                ref.parameterTypes.isEmpty() && ref.returnType != "V"
        } ?: throw PatchException("Photos account menu: row build() not found")
        val build = code[buildAt].method()!!
        val addAt = buildAt + 2
        val add = code.getOrNull(addAt)?.method()
        if (code[buildAt + 1].opcode != Opcode.MOVE_RESULT_OBJECT || add == null || add.parameterTypes.size != 1) {
            throw PatchException("Photos account menu: row is not added straight after it is built")
        }
        val list = (code[addAt] as FiveRegisterInstruction).registerC

        // Setters, in the order Photos calls them: view id, icon, label, logging id.
        val intSetters = (factoryAt until buildAt).filter { index ->
            val ref = code[index].method()
            ref?.definingClass == builder && ref.parameterTypes.map { it.toString() } == listOf("I")
        }
        val textSetter = (factoryAt until buildAt).map { code[it].method() }.firstOrNull { ref ->
            ref?.definingClass == builder && ref.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;")
        } ?: throw PatchException("Photos account menu: label setter not found")
        if (intSetters.size < 3) throw PatchException("Photos account menu: expected 3 number setters, found ${intSetters.size}")
        val viewIdSetter = code[intSetters[0]].method()!!
        val iconSetter = code[intSetters[1]].method()!!
        val loggingSetter = code[intSetters[2]].method()!!
        val loggingRegister = (code[intSetters[2]] as FiveRegisterInstruction).registerD
        val loggingId = (intSetters[2] - 1 downTo factoryAt).firstNotNullOfOrNull { index ->
            val instruction = code[index]
            if (instruction is NarrowLiteralInstruction && instruction is OneRegisterInstruction &&
                instruction.registerA == loggingRegister
            ) instruction.narrowLiteral else null
        } ?: throw PatchException("Photos account menu: logging id not found")

        val fields = (factoryAt until buildAt).filter { code[it].opcode == Opcode.IPUT_OBJECT }.map { index ->
            index to ((code[index] as ReferenceInstruction).reference as FieldReference)
        }.filter { (_, field) -> field.definingClass == builder }
        val clickField = fields.firstOrNull { (_, field) -> field.type == CLICK }?.second
            ?: throw PatchException("Photos account menu: click listener field not found")
        // The group style (an enum constant) the settings row is filed under, so the Loki row sits in the same group.
        val style = fields.firstOrNull { (index, field) ->
            field.type != CLICK && code[index - 1].opcode == Opcode.SGET_OBJECT
        }?.let { (index, field) -> ((code[index - 1] as ReferenceInstruction).reference as FieldReference) to field }

        // Insert right after the row before "Photos settings" is added to the same list.
        val previousAdd = (labelAt - 1 downTo 0).firstOrNull { index ->
            val ref = code[index].method()
            code[index].opcode == Opcode.INVOKE_VIRTUAL && ref == add &&
                (code[index] as FiveRegisterInstruction).registerC == list
        } ?: throw PatchException("Photos account menu: no row before \"Photos settings\"")
        val at = previousAdd + 1

        // Two registers Photos overwrites before reading again, low enough for every instruction below.
        val window = code.subList(at, code.size)
        val free = (0..15).filter { it != list && freeFrom(window, listOf(it)) }
        if (free.size < 2) throw PatchException("Photos account menu: no free registers for the Loki row")
        val (row, value) = free

        val styleLines = style?.let { (constant, field) ->
            """
                sget-object v$value, ${constant.smali()}
                iput-object v$value, v$row, ${field.smali()}
            """
        } ?: ""
        method.addInstructions(
            at,
            """
                invoke-static {}, ${factory.smali()}
                move-result-object v$row
                invoke-static {}, $ROWS->viewId()I
                move-result v$value
                invoke-virtual {v$row, v$value}, ${viewIdSetter.smali()}
                invoke-static {}, $ROWS->photosIcon()I
                move-result v$value
                invoke-virtual {v$row, v$value}, ${iconSetter.smali()}
                invoke-static {}, $ROWS->title()Ljava/lang/String;
                move-result-object v$value
                invoke-virtual {v$row, v$value}, ${textSetter.smali()}
                const v$value, $loggingId
                invoke-virtual {v$row, v$value}, ${loggingSetter.smali()}
                invoke-static {}, $ROWS->photosClick()$CLICK
                move-result-object v$value
                iput-object v$value, v$row, ${clickField.smali()}
                $styleLines
                invoke-virtual {v$row}, ${build.smali()}
                move-result-object v$value
                invoke-virtual {v$list, v$value}, ${add.smali()}
            """,
        )
    }
}
