/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.actions

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.extension.requireThisIntact
import app.morphe.patches.pinterest.misc.extension.writeStub
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.pinterest.ui.instructions
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.w3c.dom.Element

private const val PATCH = "Download pins"
private const val DOWNLOADS = "$EXTENSION_PACKAGE/actions/PinDownloads;"

/** Title resource of Pinterest's own Download image row in the pin menu. */
internal const val NATIVE_DOWNLOAD_TITLE = "save_to_device"

/** The provider Share file hands a saved video out through, so Android's share sheet can show a frame of it. */
internal const val SHARE_PREVIEW_PROVIDER = "app.hushpinterest.extension.pinterest.actions.SharePreviewProvider"

/** Its authority, after the package name, the way the manifest declares it and the release receipt expects it. */
internal const val SHARE_PREVIEW_AUTHORITY = ".hushpinterest.share"

/**
 * Checks the extension has [SHARE_PREVIEW_PROVIDER] before the manifest names it. Android creates
 * a declared provider before the app starts, so a missing class would crash every launch.
 */
internal val sharePreviewPreflightPatch = bytecodePatch {
    dependsOn(pinterestExtensionPatch)
    execute {
        val previewType = "L" + SHARE_PREVIEW_PROVIDER.replace('.', '/') + ";"
        if (classDefByOrNull(previewType)?.superclass != "Landroid/content/ContentProvider;") {
            throw PatchException("$PATCH: the extension has no share preview provider to declare")
        }
    }
}

/**
 * Declares [SHARE_PREVIEW_PROVIDER]. It isn't exported, so another app reads an address there only
 * through the read grant a share hands it.
 */
internal val sharePreviewProviderPatch = resourcePatch {
    dependsOn(sharePreviewPreflightPatch)
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("$PATCH: AndroidManifest.xml has no application element")
            val packageName = document.documentElement.getAttribute("package")
            if (packageName.isEmpty()) throw PatchException("$PATCH: AndroidManifest.xml names no package")
            val authority = packageName + SHARE_PREVIEW_AUTHORITY
            val providers = document.getElementsByTagName("provider")
            val declared = (0 until providers.length).map { providers.item(it) as Element }
            if (declared.any { it.getAttribute("android:name") == SHARE_PREVIEW_PROVIDER }) return@use
            if (declared.any { provider -> provider.getAttribute("android:authorities").split(';').any { it.trim() == authority } }) {
                throw PatchException("$PATCH: another provider already claims $authority")
            }
            application.appendChild(document.createElement("provider").apply {
                setAttribute("android:name", SHARE_PREVIEW_PROVIDER)
                setAttribute("android:authorities", authority)
                setAttribute("android:exported", "false")
                setAttribute("android:grantUriPermissions", "true")
            })
        }
    }
}

@Suppress("unused")
val downloadPinsPatch = bytecodePatch(
    name = PATCH,
    description = "Adds downloads for a pin, or for several pins you select in a grid. Saves the original image or " +
        "the highest-quality video Pinterest supplies to your phone. When it saves an image, Pinterest's own " +
        "Download image row is hidden. Downloads go to the Download folder. Turn on " +
        "Save in Pinterest's folder to keep them in Pictures/100PINT/Pins with Pinterest's own saves, or use Pick a " +
        "download folder to choose any folder inside Pictures, DCIM, Download or Documents. Starts off. " +
        "Copy image puts an image pin's full-size picture on the clipboard, and Share image sends it through " +
        "Android's share menu. Each has its own switch, also off. " +
        "Save pins you download also saves a pin you download to your profile, and Download pins you save " +
        "also downloads a pin you save. Those two start off as well. " +
        "Turn them on in HushPinterest settings > Pin actions.",
) {
    category("Downloads")
    dependsOn(settingsPatch, pinterestExtensionPatch, sharePreviewProviderPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("downloadPins")
        requireStatusMethod("pinDownloads")
        requireStatusMethod("copyImage")
        requireStatusMethod("shareImage")
        requireStatusMethod("saveAndDownload")
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
        // The event's constructor takes an int in 14.39.0 and an int plus its slide-out flag in 14.40.0.
        val dismiss = presenter.methods.singleOrNull { method ->
            val opcodes = method.implementation?.instructions?.map { it.opcode }?.toList().orEmpty()
            method.returnType == "V" && method.parameterTypes.isEmpty() && AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                opcodes.size in 6..7 && opcodes.first() == Opcode.NEW_INSTANCE &&
                opcodes.subList(1, opcodes.size - 4).all { it == Opcode.CONST_4 } &&
                opcodes.takeLast(4) == listOf(Opcode.INVOKE_DIRECT, Opcode.IGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID)
        } ?: throw PatchException("$PATCH: no unique native presenter dismissal event")
        // Pinterest's own Download image row: its title id goes straight into the layout's row factory,
        // whose result is marked so the extension can fold it when Download pin is in the same menu.
        val layoutInit = layout.methods.singleOrNull { it.name == "<init>" && it.implementation != null }
            ?: throw PatchException("$PATCH: no single native menu layout constructor")
        val initInstructions = layoutInit.implementation!!.instructions.toList()
        val nativeRows = initInstructions.withIndex().mapNotNull { (index, instruction) ->
            val title = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            if (instruction.opcode != Opcode.SGET || title?.name != NATIVE_DOWNLOAD_TITLE || title.type != "I") {
                return@mapNotNull null
            }
            val id = (instruction as OneRegisterInstruction).registerA
            val call = (index + 1 until minOf(index + 8, initInstructions.size)).firstOrNull { next ->
                val candidate = initInstructions[next]
                val factory = (candidate as? ReferenceInstruction)?.reference as? MethodReference
                factory?.definingClass == layout.type && factory.returnType == "Landroid/widget/RelativeLayout;" &&
                    factory.parameterTypes.getOrNull(0)?.toString() == layout.type &&
                    factory.parameterTypes.getOrNull(1)?.toString() == "I" &&
                    when (candidate) {
                        is FiveRegisterInstruction -> candidate.registerD == id
                        is RegisterRangeInstruction -> candidate.startRegister + 1 == id
                        else -> false
                    }
            } ?: return@mapNotNull null
            val result = initInstructions.getOrNull(call + 1)
            if (result?.opcode != Opcode.MOVE_RESULT_OBJECT) return@mapNotNull null
            call + 2 to (result as OneRegisterInstruction).registerA
        }
        val (nativeAt, nativeRegister) = nativeRows.singleOrNull()
            ?: throw PatchException("$PATCH: no unique native Download image row (${nativeRows.size} found)")
        if (mutableClassDefBy(DOWNLOADS).methods.count { it.name == "nativeRow" && AccessFlags.STATIC.isSet(it.accessFlags) } != 1) {
            throw PatchException("$PATCH: missing extension hook nativeRow")
        }
        val sheet = pinSheet(pin)?.let { sheetHooks(it, icon) }
        val saves = saveRoute(pin)
        val bridgeNames = listOf("hushDownloadPin", "hushDownloadMenu", "hushDownloadOrigin", "hushDownloadCloseup", "hushDismissDownload")
        if (menu.methods.any { it.name in bridgeNames }) throw PatchException("$PATCH: download bridges already exist")
        // Resolve every host dependency and verify all stubs before changing host code.
        for (name in listOf("menuPin", "menuView", "menuRow", "menuOrigin", "menuCloseup", "cellPin", "dismissMenu",
            "sheetPin", "sheetView", "sheetOrigin", "sheetCloseup", "sheetRow", "dismissSheet", "attachSheet")) {
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
        layoutInit.addInstructions(nativeAt,
            "invoke-static/range { v$nativeRegister .. v$nativeRegister }, $DOWNLOADS->nativeRow(Landroid/view/View;)V")
        create.addInstructions(assignment + 1, "invoke-static/range { p0 .. p0 }, $DOWNLOADS->attach(Ljava/lang/Object;)V")
        sheet?.let { installSheet(it) }
        enableCapability("pinDownloads")
        saves?.let {
            installSaveRoute(it)
            enableCapability("saveAndDownload")
        }
        // Copy image and Share image are the extension's own rows in the menu Download pins hooks, so they
        // come in with that hook.
        enableCapability("copyImage")
        enableCapability("shareImage")
        enableStatus("downloadPins")
    }
}

/** The sheet's own Download row factory, its native Download image row, and how its presenter closes it. */
private class SheetHooks(
    val sheet: PinSheet,
    val row: Method,
    val icon: String,
    val download: String,
    val presenter: Field,
    val dismiss: Method,
    val nativeAt: Int,
    val nativeRegister: Int,
    val returns: List<Int>,
)

/**
 * Finds what the sheet's hooks need, without changing anything. [icon] is the menu's own icon type,
 * which the sheet's rows share.
 */
private fun BytecodePatchContext.sheetHooks(sheet: PinSheet, icon: String): SheetHooks {
    fun fail(why: String): Nothing = throw PatchException("$PATCH: the pin overflow sheet $why")
    val fragment = sheet.fragment
    val download = classDefBy(icon).fields.single { it.name == "DOWNLOAD" && it.type == icon }.name
    val row = fragment.methods.singleOrNull { method ->
        val types = method.parameterTypes.map(CharSequence::toString)
        method.returnType == "Landroid/widget/RelativeLayout;" && AccessFlags.PUBLIC.isSet(method.accessFlags) &&
            !AccessFlags.STATIC.isSet(method.accessFlags) && types.sorted() == listOf(icon, "Ljava/lang/String;").sorted()
    } ?: fail("has no single row factory taking a title and an icon")
    // The presenter closes the sheet before each of its own actions: the one public no-argument method
    // that reaches the sheet through its view, called most from the presenter's other methods.
    val presenters = fragment.fields.mapNotNull { field ->
        if (!field.type.startsWith("L") || AccessFlags.STATIC.isSet(field.accessFlags)) return@mapNotNull null
        val presenter = classDefByOrNull(field.type) ?: return@mapNotNull null
        val closers = presenter.methods.filter { method ->
            method.returnType == "V" && method.parameterTypes.isEmpty() && AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                !AccessFlags.STATIC.isSet(method.accessFlags) && method.instructions().any {
                    it.opcode == Opcode.CHECK_CAST && ((it as ReferenceInstruction).reference as TypeReference).type == fragment.type
                }
        }.map { closer ->
            closer to presenter.methods.sumOf { caller ->
                caller.instructions().count { instruction ->
                    val called = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    instruction.opcode == Opcode.INVOKE_VIRTUAL && called?.definingClass == presenter.type &&
                        called.name == closer.name && called.parameterTypes.isEmpty() && called.returnType == "V"
                }
            }
        }.filter { it.second >= 3 }.sortedByDescending { it.second }
        val (closer, calls) = closers.firstOrNull() ?: return@mapNotNull null
        if (closers.getOrNull(1)?.second == calls) return@mapNotNull null
        field to closer
    }
    val (presenter, dismiss) = presenters.singleOrNull() ?: fail("has ${presenters.size} presenters that close it")
    if (!AccessFlags.PUBLIC.isSet(presenter.accessFlags)) fail("keeps its presenter private")
    // Pinterest's own Download image row: the title id goes into the sheet's static row factory.
    val built = sheet.build.instructions()
    val natives = built.withIndex().mapNotNull { (index, instruction) ->
        val title = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        if (instruction.opcode != Opcode.SGET || title?.name != NATIVE_DOWNLOAD_TITLE || title.type != "I") return@mapNotNull null
        val id = (instruction as OneRegisterInstruction).registerA
        val call = (index + 1 until minOf(index + 8, built.size)).firstOrNull { next ->
            val candidate = built[next]
            val factory = (candidate as? ReferenceInstruction)?.reference as? MethodReference
            candidate.opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE) &&
                factory?.definingClass == fragment.type && factory.returnType == "Landroid/widget/RelativeLayout;" &&
                factory.parameterTypes.getOrNull(0)?.toString() == fragment.type &&
                factory.parameterTypes.getOrNull(1)?.toString() == "I" &&
                when (candidate) {
                    is FiveRegisterInstruction -> candidate.registerD == id
                    is RegisterRangeInstruction -> candidate.startRegister + 1 == id
                    else -> false
                }
        } ?: return@mapNotNull null
        val result = built.getOrNull(call + 1)
        if (result?.opcode != Opcode.MOVE_RESULT_OBJECT) return@mapNotNull null
        call + 2 to (result as OneRegisterInstruction).registerA
    }
    val (nativeAt, nativeRegister) = natives.singleOrNull() ?: fail("has ${natives.size} native Download image rows")
    // The rows are all in once the method returns, from wherever it returns.
    val returns = built.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
    if (returns.isEmpty()) fail("never finishes building its rows")
    sheet.build.requireThisIntact(PATCH, returns)
    return SheetHooks(sheet, row, icon, download, presenter, dismiss, nativeAt, nativeRegister, returns)
}

/** Writes the sheet's stubs, marks its native Download image row and hands the built sheet to the extension. */
private fun BytecodePatchContext.installSheet(hooks: SheetHooks) = with(hooks) {
    val fragment = sheet.fragment.type
    fun read(name: String, field: FieldReference, load: String, give: String) = writeStub(DOWNLOADS, name, 2, """
        check-cast p0, $fragment
        invoke-virtual { p0 }, $fragment->${sheet.data.name}()${sheet.data.returnType}
        move-result-object v0
        $load v0, v0, ${field.definingClass}->${field.name}:${field.type}
        $give v0
    """)
    read("sheetPin", sheet.pin, "iget-object", "return-object")
    read("sheetOrigin", sheet.origin, "iget-object", "return-object")
    read("sheetCloseup", sheet.closeup, "iget-boolean", "return")
    writeStub(DOWNLOADS, "sheetView", 2, """
        check-cast p0, $fragment
        invoke-virtual { p0 }, $fragment->${sheet.list.name}()${sheet.list.returnType}
        move-result-object v0
        return-object v0
    """)
    val arguments = if (row.parameterTypes.first().toString() == "Ljava/lang/String;") "p0, p1, v0" else "p0, v0, p1"
    writeStub(DOWNLOADS, "sheetRow", 3, """
        check-cast p0, $fragment
        sget-object v0, $icon->$download:$icon
        invoke-virtual { $arguments }, $fragment->${row.name}(${row.parameterTypes.joinToString("")})${row.returnType}
        move-result-object v0
        return-object v0
    """)
    writeStub(DOWNLOADS, "dismissSheet", 2, """
        check-cast p0, $fragment
        iget-object v0, p0, $fragment->${presenter.name}:${presenter.type}
        if-eqz v0, :hush_dismissed
        invoke-virtual { v0 }, ${presenter.type}->${dismiss.name}()V
        :hush_dismissed
        return-void
    """)
    // Highest first, so each index still points at the instruction it was found at.
    val hooks = returns.map { it to "invoke-static/range { p0 .. p0 }, $DOWNLOADS->attachSheet(Ljava/lang/Object;)V" } +
        (nativeAt to "invoke-static/range { v$nativeRegister .. v$nativeRegister }, $DOWNLOADS->nativeRow(Landroid/view/View;)V")
    hooks.sortedByDescending { it.first }.forEach { (at, code) -> sheet.build.addInstructionsAtControlFlowLabel(at, code) }
}
