/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.actions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.extension.requireThisIntact
import app.morphe.patches.pinterest.misc.extension.writeStub
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val PATCH = "Download pins"
private const val DOWNLOADS = "$EXTENSION_PACKAGE/actions/PinDownloads;"

@Suppress("unused")
val downloadPinsPatch = bytecodePatch(
    name = PATCH,
    description = "Adds downloads for a pin, or for several pins you select in a grid. Saves the original image or " +
        "the highest-quality video Pinterest supplies to your phone. Starts off. Turn it on in " +
        "HushPinterest settings > Pin actions.",
) {
    category("Downloads")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("downloadPins")
        requireStatusMethod("pinDownloads")
        val menu = pinMenu()
        val pin = pinType()
        val viewField = menu.fields.singleOrNull { it.name == "modalView" }
            ?: throw PatchException("$PATCH: no native menu layout field")
        val presenterField = menu.fields.singleOrNull { it.name == "presenter" }
            ?: throw PatchException("$PATCH: no native menu presenter field")
        val originField = menu.fields.singleOrNull { it.name == "originView" && it.type == "Landroid/view/View;" }
            ?: throw PatchException("$PATCH: no native grid origin view")
        val closeupField = menu.fields.singleOrNull { it.name == "isPinCloseup" && it.type == "Z" }
            ?: throw PatchException("$PATCH: no native closeup flag")
        val cell = Fingerprint(
            name = "getInternalCell", parameters = emptyList(),
            custom = { method, owner -> AccessFlags.INTERFACE.isSet(owner.accessFlags) &&
                owner.methods.any { it.name == "setPin" && it.parameterTypes.map(CharSequence::toString) == listOf(pin, "I") } &&
                method.returnType.startsWith("L") },
        ).methodOrNull ?: throw PatchException("$PATCH: no unique pin grid cell interface")
        val internalCell = classDefByOrNull(cell.returnType)
            ?: throw PatchException("$PATCH: no internal pin cell interface")
        val getter = internalCell.methods.singleOrNull { it.name == "getPin" && it.parameterTypes.isEmpty() && it.returnType == pin }
            ?.takeIf { AccessFlags.INTERFACE.isSet(internalCell.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) }
            ?: throw PatchException("$PATCH: no typed grid pin getter")
        val create = menu.methods.singleOrNull { it.name == "createModalView" && it.implementation != null }
            ?: throw PatchException("$PATCH: no single native menu creation method")
        val assignment = create.implementation!!.instructions.withIndex().filter { (_, instruction) ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            instruction.opcode == Opcode.IPUT_OBJECT && field?.definingClass == PIN_MENU && field.name == viewField.name
        }.singleOrNull()?.index ?: throw PatchException("$PATCH: native menu layout isn't assigned once")
        create.requireThisIntact(PATCH, listOf(assignment + 1))
        val layout = mutableClassDefBy(viewField.type)
        val rows = layout.methods.mapNotNull { method ->
            val types = method.parameterTypes.map { it.toString() }
            if (method.returnType != "Landroid/widget/RelativeLayout;" || types.size != 2 ||
                types.count { it == "Ljava/lang/String;" } != 1 || !AccessFlags.PUBLIC.isSet(method.accessFlags) ||
                AccessFlags.STATIC.isSet(method.accessFlags)) return@mapNotNull null
            val icon = types.single { it != "Ljava/lang/String;" }
            val download = classDefByOrNull(icon)?.fields?.singleOrNull { field ->
                field.name == "DOWNLOAD" && field.type == icon && AccessFlags.STATIC.isSet(field.accessFlags)
            } ?: return@mapNotNull null
            Triple(method, icon, download)
        }
        val (row, icon, download) = rows.singleOrNull() ?: throw PatchException("$PATCH: no unique native Download row factory")
        val presenter = mutableClassDefBy(presenterField.type)
        val dismiss = presenter.methods.singleOrNull { method ->
            method.returnType == "V" && method.parameterTypes.isEmpty() && AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                method.implementation?.instructions?.map { it.opcode }?.toList() == listOf(
                    Opcode.NEW_INSTANCE, Opcode.CONST_4, Opcode.INVOKE_DIRECT, Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID,
                )
        } ?: throw PatchException("$PATCH: no unique native presenter dismissal event")
        val bridgeNames = listOf("hushDownloadPin", "hushDownloadMenu", "hushDownloadOrigin", "hushDownloadCloseup", "hushDismissDownload")
        if (menu.methods.any { it.name in bridgeNames }) throw PatchException("$PATCH: download bridges already exist")
        // Resolve every host dependency and verify all stubs before changing host code.
        for (name in listOf("menuPin", "menuView", "menuRow", "menuOrigin", "menuCloseup", "cellPin", "dismissMenu")) {
            if (mutableClassDefBy(DOWNLOADS).methods.count { it.name == name && AccessFlags.STATIC.isSet(it.accessFlags) } != 1) {
                throw PatchException("$PATCH: missing extension stub $name")
            }
        }
        fun bridge(name: String, result: String, registers: Int, instructions: String) {
            menu.methods.add(ImmutableMethod(
                PIN_MENU, name, emptyList(), result, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                null, null, MutableMethodImplementation(registers),
            ).toMutable().apply { addInstructionsWithLabels(0, instructions) })
        }
        bridge("hushDownloadPin", "Ljava/lang/Object;", 2, """
            iget-object v0, p0, $PIN_MENU->pin:$pin
            return-object v0
        """)
        bridge("hushDownloadMenu", "Landroid/view/ViewGroup;", 2, """
            iget-object v0, p0, $PIN_MENU->${viewField.name}:${viewField.type}
            return-object v0
        """)
        bridge("hushDownloadOrigin", "Landroid/view/View;", 2, """
            iget-object v0, p0, $PIN_MENU->${originField.name}:${originField.type}
            return-object v0
        """)
        bridge("hushDownloadCloseup", "Z", 2, """
            iget-boolean v0, p0, $PIN_MENU->${closeupField.name}:Z
            return v0
        """)
        bridge("hushDismissDownload", "V", 2, """
            iget-object v0, p0, $PIN_MENU->${presenterField.name}:${presenterField.type}
            if-eqz v0, :hush_dismissed
            invoke-virtual { v0 }, ${presenter.type}->${dismiss.name}()V
            :hush_dismissed
            return-void
        """)
        writeStub(DOWNLOADS, "menuPin", 2, """
            check-cast p0, $PIN_MENU
            invoke-virtual { p0 }, $PIN_MENU->hushDownloadPin()Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """)
        writeStub(DOWNLOADS, "menuView", 2, """
            check-cast p0, $PIN_MENU
            invoke-virtual { p0 }, $PIN_MENU->hushDownloadMenu()Landroid/view/ViewGroup;
            move-result-object v0
            return-object v0
        """)
        writeStub(DOWNLOADS, "menuOrigin", 2, """
            check-cast p0, $PIN_MENU
            invoke-virtual { p0 }, $PIN_MENU->hushDownloadOrigin()Landroid/view/View;
            move-result-object v0
            return-object v0
        """)
        writeStub(DOWNLOADS, "menuCloseup", 2, """
            check-cast p0, $PIN_MENU
            invoke-virtual { p0 }, $PIN_MENU->hushDownloadCloseup()Z
            move-result v0
            return v0
        """)
        writeStub(DOWNLOADS, "cellPin", 2, """
            instance-of v0, p0, ${cell.definingClass}
            if-eqz v0, :no_pin
            check-cast p0, ${cell.definingClass}
            invoke-interface { p0 }, ${cell.definingClass}->${cell.name}()${cell.returnType}
            move-result-object v0
            if-eqz v0, :no_pin
            invoke-interface { v0 }, ${getter.definingClass}->${getter.name}()$pin
            move-result-object v0
            return-object v0
            :no_pin
            const/4 v0, 0x0
            return-object v0
        """)
        writeStub(DOWNLOADS, "dismissMenu", 1, """
            check-cast p0, $PIN_MENU
            invoke-virtual { p0 }, $PIN_MENU->hushDismissDownload()V
            return-void
        """)
        val arguments = if (row.parameterTypes.first().toString() == "Ljava/lang/String;") "p0, p1, v0" else "p0, v0, p1"
        writeStub(DOWNLOADS, "menuRow", 3, """
            check-cast p0, ${layout.type}
            sget-object v0, $icon->${download.name}:$icon
            invoke-virtual { $arguments }, ${layout.type}->${row.name}(${row.parameterTypes.joinToString("")})${row.returnType}
            move-result-object v0
            return-object v0
        """)
        create.addInstructions(assignment + 1, "invoke-static/range { p0 .. p0 }, $DOWNLOADS->attach(Ljava/lang/Object;)V")
        enableCapability("pinDownloads")
        enableStatus("downloadPins")
    }
}
