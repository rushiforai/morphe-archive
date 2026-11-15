/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.docscanner.patches.menu

import app.loki.patches.universal.addMenuFlag
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

/** The app this row is written for. Any other app is left exactly as it was. */
private const val PACKAGE = "com.cv.docscanner"

/** `lz5.b()`: builds the app drawer's item list. Version-pinned to 6.9.9. */
private val drawerItems = Fingerprint(
    definingClass = "Llz5;",
    name = "b",
    returnType = "Ljava/util/ArrayList;",
)

/** `kz5.a(View, f3)`: dispatches a drawer click by item identifier. Version-pinned to 6.9.9. */
private val drawerClick = Fingerprint(
    definingClass = "Lkz5;",
    name = "a",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Lf3;"),
)

private const val STRING_RES = "loki_patches_menu"

private val addStringResource = resourcePatch {
    execute {
        if (!isOurApp()) return@execute
        document("res/values/strings.xml").use { document ->
            val root = document.documentElement
            for (i in 0 until root.childNodes.length) {
                val node = root.childNodes.item(i)
                if (node is Element && node.getAttribute("name") == STRING_RES) return@use
            }
            val row = document.createElement("string")
            row.setAttribute("name", STRING_RES)
            row.textContent = "Loki Patches"
            root.appendChild(row)
        }
    }
}

private val drawerFlag = resourcePatch {
    execute {
        if (!isOurApp()) return@execute
        document("AndroidManifest.xml").use { it.addMenuFlag("app.loki.menu.drawer") }
    }
}

/** Whether the app being patched is the one this row was written for. */
private fun app.morphe.patcher.patch.ResourcePatchContext.isOurApp(): Boolean {
    var ours = false
    document("AndroidManifest.xml").use { manifest ->
        ours = manifest.documentElement.getAttribute("package") == PACKAGE
    }
    return ours
}

/**
 * One "Loki Patches" row in the app's own side menu, right under "About us". Internal and unnamed:
 * it ships with the menu and never appears as a choice in Manager, the same way the LinkedIn row is
 * just part of its extension. The row is built and the click handled by DrawerSupport, configured
 * with this build's obfuscated names; a version that renames them only loses the row, never the app.
 */
internal val drawerRowPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        // Configure the helper with this build's obfuscated names, then build the row and add it.
        // The fingerprints below only exist in the app this row was written for.
        drawerItems.matchOrNull()?.method?.let { method ->
            val impl = method.implementation ?: return@let
            val insns = impl.instructions.toList()
            var insert = -1
            for (i in insns.indices) {
                val ref = (insns[i] as? ReferenceInstruction)?.reference as? FieldReference ?: continue
                if (ref.name != "about_us") continue
                for (j in i + 1 until insns.size) {
                    val mref = (insns[j] as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                    if (mref.definingClass == "Ljava/util/ArrayList;" && mref.name == "add") {
                        insert = j + 1
                        break
                    }
                }
                break
            }
            if (insert >= 0) {
                method.addInstructionsWithLabels(
                    insert,
                    """
                        const-string v6, "bn7"
                        sput-object v6, Lapp/loki/extension/DrawerSupport;->itemClass:Ljava/lang/String;
                        const-string v6, "f00"
                        sput-object v6, Lapp/loki/extension/DrawerSupport;->iconClass:Ljava/lang/String;
                        const-string v6, "com.mikepenz.community_material_typeface_library.CommunityMaterial${'$'}Icon3"
                        sput-object v6, Lapp/loki/extension/DrawerSupport;->iconEnumClass:Ljava/lang/String;
                        const-string v6, "cmd_shield_outline"
                        sput-object v6, Lapp/loki/extension/DrawerSupport;->iconEnumValue:Ljava/lang/String;
                        const-string v6, "$STRING_RES"
                        sput-object v6, Lapp/loki/extension/DrawerSupport;->stringRes:Ljava/lang/String;
                        const-string v6, "blue_300"
                        sput-object v6, Lapp/loki/extension/DrawerSupport;->iconRes1:Ljava/lang/String;
                        const-string v6, "white"
                        sput-object v6, Lapp/loki/extension/DrawerSupport;->iconRes2:Ljava/lang/String;
                        invoke-static {}, Lapp/loki/extension/DrawerSupport;->item()Ljava/lang/Object;
                        move-result-object v6
                        if-eqz v6, :loki_row_done
                        invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                        :loki_row_done
                        nop
                    """.trimIndent(),
                )
            }
        }

        // Route clicks on the row (identifier 7331) to the Loki Patches screen.
        drawerClick.matchOrNull()?.method?.addInstructions(
            0,
            """
                invoke-static {v5, v6}, Lapp/loki/extension/DrawerSupport;->clicked(Landroid/view/View;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :loki_click_done
                return-void
                :loki_click_done
                nop
            """.trimIndent(),
        )
    }

    dependsOn(addStringResource)
    dependsOn(drawerFlag)
}
