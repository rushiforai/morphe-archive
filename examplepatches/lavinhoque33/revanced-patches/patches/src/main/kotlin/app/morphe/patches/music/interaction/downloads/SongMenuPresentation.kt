/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-11.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.music.interaction.jam.getMutableMethod
import app.morphe.patches.music.interaction.jam.invokeKind
import app.morphe.patches.music.interaction.jam.p0Register
import app.morphe.patches.music.interaction.jam.registerAt
import app.morphe.util.addFreeRegisters
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val MENUS = "Lapp/morphe/extension/music/patches/flyout/SongMenus;"
private const val HOST = $$"Lapp/morphe/extension/music/patches/flyout/SongMenus$Host;"
private const val ITEM = $$"Lapp/morphe/extension/music/patches/flyout/SongMenus$Item;"

internal data class SongMenuPresentation(
    val handler: Method,
    val pivot: Int,
    val menuRegister: Int,
    val menuType: String,
    val presenter: FieldReference,
    val contextFactory: FieldReference,
    val contextGet: MethodReference,
    val show: MethodReference,
)

/** Intercept our endpoint before either stock controller branch, retaining normal presentation for every other menu. */
internal fun BytecodePatchContext.resolveSongMenuPresentation(
    commandType: String,
    menuType: String,
): SongMenuPresentation {
    val endpoint = Fingerprint(custom = { method, _ ->
        method.name == "<clinit>" && method.implementation?.instructions?.any {
            (it as? WideLiteralInstruction)?.wideLiteral == 98_150_882L
        } == true
    }).classDef.type
    val handler = Fingerprint(parameters = listOf(commandType, "Ljava/util/Map;"), returnType = "V",
        custom = { method, _ -> method.implementation?.instructions?.any {
            it.getReference<FieldReference>()?.definingClass == endpoint
        } == true }).match().originalMethod
    val owner = classDefBy(handler.definingClass)
    val code = handler.implementation!!.instructions.toList()
    val dispatch = code.mapNotNull { it.getReference<MethodReference>() }.single {
        it.returnType == "V" && it.parameterTypes.size == 4 && it.parameterTypes[0] == menuType
    }
    val presenter = owner.fields.single { it.type == dispatch.definingClass }
    val show = classDefBy(dispatch.definingClass).methods.single {
        it.returnType == "V" && it.parameterTypes.map { type -> type.toString() } ==
                listOf(menuType, "Landroid/view/View;", "Ljava/lang/Object;", dispatch.parameterTypes[3].toString())
    }
    val contextGet = code.mapNotNull { it.getReference<MethodReference>() }.single {
        it.parameterTypes.isEmpty() && it.returnType == show.parameterTypes[3]
    }
    val contextFactory = owner.fields.single { it.type == contextGet.definingClass }
    val pivot = code.indices.single {
        code[it].getReference<MethodReference>()?.let { call ->
            call.returnType == "Z" && call.parameterTypes == listOf(menuType)
        } == true
    }
    val menu = (code[pivot] as ReferenceInstruction).registerAt(1)!!
    return SongMenuPresentation(handler, pivot, menu, menuType, presenter, contextFactory, contextGet, show)
}

internal fun BytecodePatchContext.installSongMenuPresentation(plan: SongMenuPresentation) {
    val owner = mutableClassDefBy(plan.handler.definingClass)
    owner.interfaces.add(HOST)
    owner.addDownloadsBridge("rvxShowSongMenu", listOf("Landroid/view/View;", "Ljava/lang/Object;"), "V", 7, """
        iget-object v0, p0, ${plan.presenter}
        iget-object v1, p0, ${plan.contextFactory}
        ${invokeKind(plan.contextGet)} {v1}, ${plan.contextGet}
        move-result-object p0
        check-cast p2, $ITEM
        invoke-interface {p2}, $ITEM->rvxSongMenu()Ljava/lang/Object;
        move-result-object v1
        check-cast v1, ${plan.menuType}
        move-object v2, p1
        move-object v3, p2
        ${invokeKind(plan.show)} {v0, v1, v2, v3, p0}, ${plan.show}
        return-void
    """)
    val original = plan.handler.getMutableMethod()
    val registers = original.implementation!!.registerCount
    val receiver = original.p0Register
    val (method, moves) = original.addFreeRegisters(2)
    method.addInstructionsWithLabels(plan.pivot + moves, """
        move-object/from16 v$registers, v$receiver
        move-object/from16 v${registers + 1}, v${plan.menuRegister}
        invoke-static/range {v$registers .. v${registers + 1}}, $MENUS->present(${HOST}Ljava/lang/Object;)Z
        move-result v$registers
        if-eqz v$registers, :rvx_native_menu
        return-void
    """, ExternalLabel("rvx_native_menu", method.getInstruction(plan.pivot + moves)))
}
