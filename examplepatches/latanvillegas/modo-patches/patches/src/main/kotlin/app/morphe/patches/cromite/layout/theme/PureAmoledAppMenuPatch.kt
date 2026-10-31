package app.morphe.patches.cromite.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.VariableRegisterInstruction
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.Opcode
import org.w3c.dom.Element
import org.w3c.dom.Node

/**
 * Partial source reconstruction from PureAmoledAppMenuPatchKt.class (1.50.0).
 * Restores the original resource allowlists and bytecode fingerprint anchors.
 * The original eight-anchor bytecode mutations still require reconstruction.
 */
private val appMenuVisibleSurfaceFingerprint = Fingerprint(
    filters = listOf(
        methodCall("Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V", Opcode.INVOKE_VIRTUAL),
        methodCall("Lf50;->b(Landroid/view/ContextThemeWrapper;Z)Landroid/view/ViewGroup;", Opcode.INVOKE_STATIC),
        methodCall("Ldr7;->e(Landroid/content/Context;ILjava/lang/String;)Landroid/util/TypedValue;", Opcode.INVOKE_STATIC),
        methodCall("Lis7;->f(Landroid/content/Context;Landroid/util/TypedValue;)I", Opcode.INVOKE_STATIC),
        methodCall("Landroid/graphics/drawable/Drawable;->setTint(I)V", Opcode.INVOKE_VIRTUAL),
        methodCall("Landroid/graphics/drawable/Drawable;->setTintMode(Landroid/graphics/PorterDuff\$Mode;)V", Opcode.INVOKE_VIRTUAL),
        methodCall("Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V", Opcode.INVOKE_VIRTUAL),
        methodCall("Landroid/view/View;->findViewById(I)Landroid/view/View;", Opcode.INVOKE_VIRTUAL),
    ),
)

// Verified from Cromite 153.0.8010.37 original Smali, phase-4 extraction.
// Lx50.l builds the PopupWindow and assigns its actual content root (v7).
private val appMenuPopupContentFingerprint = Fingerprint(
    definingClass = "Lx50;",
    name = "l",
    returnType = "V",
    parameters = listOf(
        "Landroid/view/ContextThemeWrapper;",
        "Landroid/view/View;",
        "Z",
        "Ljava/lang/Integer;",
        "Landroid/graphics/Rect;",
        "Z",
        "Z",
    ),
)

// Verified Cromite submenu route: Lx50.b creates its own view root via Lf50.b.
private val appMenuSubmenuFingerprint = Fingerprint(
    definingClass = "Lx50;",
    name = "b",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/util/List;", "Landroid/view/View;", "Lh75;", "Ll75;"),
)

private val appMenuSubmenuRootCall =
    methodCall("Lf50;->b(Landroid/view/ContextThemeWrapper;Z)Landroid/view/ViewGroup;", Opcode.INVOKE_STATIC)

private val appMenuSetPopupContentCall =
    methodCall("Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V", Opcode.INVOKE_VIRTUAL)

private val appMenuColorFiles = setOf(
    "menu_item_bg_color.xml",
    "menu_item_bg_color_baseline.xml",
    "menu_item_bg_color_dark_baseline.xml",
    "menu_bg_color.xml",
    "menu_bg_color_baseline.xml",
    "menu_bg_color_dark_baseline.xml",
    "list_menu_background_color.xml",
    "list_menu_background_tint.xml",
    "mtrl_popupmenu_overlay_color.xml",
)

private val appMenuDrawableFiles = setOf(
    "list_menu_background.xml",
    "menu_bg_tinted.xml",
)

private val appMenuResourceNames = appMenuColorFiles.map { it.removeSuffix(".xml") }.toSet()

private val pureAmoledAppMenuResourcesPatch = resourcePatch(
    name = "AMOLED - App menu resources",
    description = "Restore original AppMenu resource colors and drawable tinting.",
) {
    compatibleWith("org.cromite.cromite"("153.0.8010.37"))
    val browserTheme = recoveredBrowserThemeOption

    execute {
        val color = when (browserTheme.value ?: "device") {
            "device" -> return@execute
            "black" -> "#FF000000"
            "white" -> "#FFFFFFFF"
            else -> return@execute
        }
        var changed = 0
        val directories = get("res").listFiles()?.filter { it.isDirectory }.orEmpty()

        directories.filter { it.name.startsWith("color") || it.name.startsWith("drawable") }
            .forEach { directory ->
                val allowlist = if (directory.name.startsWith("color")) appMenuColorFiles else appMenuDrawableFiles
                allowlist.forEach { filename ->
                    val path = "res/${directory.name}/$filename"
                    if (!get(path).isFile) return@forEach
                    document(path).use { xml ->
                        val elements = xml.getElementsByTagName("*")
                        for (i in 0 until elements.length) {
                            val element = elements.item(i) as? Element ?: continue
                            val attrs = element.attributes
                            for (j in 0 until attrs.length) {
                                val attr = attrs.item(j)
                                if (attr.nodeName == "color" || attr.nodeName.endsWith(":color") ||
                                    attr.nodeName == "tint" || attr.nodeName.endsWith(":tint")
                                ) {
                                    attr.nodeValue = color
                                    changed++
                                }
                            }
                            if (element.childNodes.length == 1 &&
                                element.firstChild?.nodeType == Node.TEXT_NODE &&
                                element.textContent.trim().startsWith("#")
                            ) {
                                element.textContent = color
                                changed++
                            }
                        }
                    }
                }
            }

        directories.filter { it.name.startsWith("values") }.forEach { directory ->
            directory.listFiles()?.filter { it.isFile && it.extension == "xml" }.orEmpty().forEach { file ->
                document("res/${directory.name}/${file.name}").use { xml ->
                    val elements = xml.getElementsByTagName("*")
                    for (i in 0 until elements.length) {
                        val element = elements.item(i) as? Element ?: continue
                        if (element.getAttribute("name") !in appMenuResourceNames) continue
                        if (element.tagName == "color" ||
                            (element.tagName == "item" && element.getAttribute("type") == "color")
                        ) {
                            element.textContent = color
                            changed++
                        }
                    }
                }
            }
        }
        check(changed > 0) {
            "AMOLED AppMenu: no verified resources found in Cromite 153.0.8010.37"
        }
    }
}

/**
 * The original patch depends on the resource patch and additionally modifies
 * eight bytecode sites. Do not report bytecode recovery as complete until
 * those original mutations have been reconstructed and tested.
 */
@Suppress("unused")
val pureAmoledAppMenuPatch = bytecodePatch(
    name = "AMOLED - App menu",
    description = "Restores native AppMenu resources and three verified bytecode injections.",
) {
    compatibleWith("org.cromite.cromite"("153.0.8010.37"))
    dependsOn(pureAmoledAppMenuResourcesPatch, cromiteAmoledBrightnessPatch)
    execute {
        val matches = appMenuVisibleSurfaceFingerprint.instructionMatches
        check(matches.size == 8) {
            "AMOLED AppMenu: original eight bytecode anchors were not found."
        }
        val indices = matches.map { it.index }
        check(indices.zipWithNext().all { (a, b) -> a < b }) {
            "AMOLED AppMenu: structural anchors are out of order."
        }

        // The popup content root is independent of the PopupWindow's
        // transparent background. Color the content, not the outer window.
        val popupMethod = appMenuPopupContentFingerprint.method
        val popupIndices = popupMethod.implementation!!.instructions.withIndex()
            .filter { (_, instruction) ->
                instruction is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
                    instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    (instruction.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference)
                        ?.toString() == "Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V"
            }.map { it.index }
        check(popupIndices.size == 1) {
            "AMOLED AppMenu popup: expected one verified setContentView, found ${popupIndices.size}"
        }
        val popupCall = popupMethod.getInstruction(popupIndices.single()) as? FiveRegisterInstruction
            ?: error("AMOLED AppMenu popup: unexpected invoke encoding")
        check(popupCall.registerCount == 2) {
            "AMOLED AppMenu popup: expected PopupWindow and content view"
        }
        popupMethod.addInstructions(
            popupIndices.single() + 1,
            "invoke-static {v${popupCall.registerD}}, " +
                "Lapp/morphe/extension/cromite/amoled/AmoledBrightnessController;->applyNativeMenuSurface(Landroid/view/View;)V",
        )

        // The 'More tools' submenu is constructed in Lx50.b, not Lx50.l.
        // Its separate Lf50.b ViewGroup must be recolored before Lym receives it.
        val submenu = appMenuSubmenuFingerprint.method
        val submenuCalls = submenu.implementation!!.instructions.withIndex()
            .filter { (_, instruction) ->
                instruction is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
                    instruction.opcode == Opcode.INVOKE_STATIC &&
                    (instruction.reference as? com.android.tools.smali.dexlib2.iface.reference.MethodReference)
                        ?.toString() == "Lf50;->b(Landroid/view/ContextThemeWrapper;Z)Landroid/view/ViewGroup;"
            }.map { it.index }
        check(submenuCalls.size == 1) {
            "AMOLED AppMenu submenu: expected one Lf50.b root; found ${submenuCalls.size}"
        }
        val submenuResultIndex = submenuCalls.single() + 1
        val submenuResult = submenu.getInstruction(submenuResultIndex) as? OneRegisterInstruction
            ?: error("AMOLED AppMenu submenu: missing root result register")
        check(submenuResult.opcode == Opcode.MOVE_RESULT_OBJECT) {
            "AMOLED AppMenu submenu: Lf50.b must return a ViewGroup"
        }
        submenu.addInstructions(
            submenuResultIndex + 1,
            "invoke-static {v${submenuResult.registerA}}, " +
                "Lapp/morphe/extension/cromite/amoled/AmoledBrightnessController;->applyNativeMenuSurface(Landroid/view/View;)V",
        )

        // Original class: fourth and fifth matches are Drawable.setTint(I)
        // and Drawable.setTintMode(PorterDuff.Mode). Both are two-register invokes.
        val method = appMenuVisibleSurfaceFingerprint.method
        val tintIndex = indices[4]
        val tintModeIndex = indices[5]
        val tintCall = method.getInstruction(tintIndex)
        val modeCall = method.getInstruction(tintModeIndex)
        check(
            tintCall.opcode == Opcode.INVOKE_VIRTUAL &&
                tintCall is FiveRegisterInstruction &&
                (tintCall as VariableRegisterInstruction).registerCount == 2 &&
                modeCall.opcode == Opcode.INVOKE_VIRTUAL &&
                modeCall is FiveRegisterInstruction &&
                (modeCall as VariableRegisterInstruction).registerCount == 2
        ) {
            "AMOLED AppMenu: Drawable tint/mode structure differs from original DEX."
        }
        val colorRegister = (tintCall as FiveRegisterInstruction).registerD
        val modeRegister = (modeCall as FiveRegisterInstruction).registerD

        // Preserve the exact order and insertion offsets from the compiled original.
        // The native theme is resolved at runtime; never bake the old Morphe
        // browserTheme option into menu icon tint.
        val tintSmali = """
            invoke-static {v1}, Lapp/morphe/extension/cromite/amoled/AmoledBrightnessController;->resolvedPureThemeForeground(Landroid/content/Context;)I
            move-result v$colorRegister
        """.trimIndent()
        method.addInstructions(tintIndex, tintSmali)
        val offset = 2
        method.addInstructions(
            tintModeIndex + offset,
            "sget-object v$modeRegister, Landroid/graphics/PorterDuff\$Mode;->SRC_IN:Landroid/graphics/PorterDuff\$Mode;",
        )

        // Third original injection: app_menu_content_container lookup after findViewById.
        // The compiled original checks ID 2130772225 and inserts at anchor + offset + 2.
        val findIndex = indices[7] + offset + 1
        val idInstruction = method.getInstruction(findIndex - 1)
        val findInstruction = method.getInstruction(findIndex)
        val viewResult = method.getInstruction(findIndex + 1)
        check(
            idInstruction is OneRegisterInstruction &&
                idInstruction is WideLiteralInstruction &&
                idInstruction.wideLiteral == 2130772225L &&
                findInstruction.opcode == Opcode.INVOKE_VIRTUAL &&
                findInstruction is FiveRegisterInstruction &&
                (findInstruction as VariableRegisterInstruction).registerCount == 2 &&
                findInstruction.registerD == idInstruction.registerA &&
                viewResult.opcode == Opcode.MOVE_RESULT_OBJECT &&
                viewResult is OneRegisterInstruction
        ) {
            "AMOLED AppMenu: app_menu_content_container lookup differs from verified DEX."
        }
        val scratch = (idInstruction as OneRegisterInstruction).registerA
        val view = (viewResult as OneRegisterInstruction).registerA
        // Use the verified app_menu_content_container, not a global UI traversal.
        // This preserves register types and updates the text foreground as well.
        method.addInstructions(
            findIndex + 2,
            "invoke-static {v$view}, " +
                "Lapp/morphe/extension/cromite/amoled/AmoledBrightnessController;->applyNativeMenuSurface(Landroid/view/View;)V",
        )
    }
}
