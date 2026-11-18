/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.docscanner.patches.menu

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Element

/** The app this row is written for. Any other app is left exactly as it was. */
private const val PACKAGE = "com.cv.docscanner"

/** The app's own "About us" drawer entry; the new row goes directly after it. */
private const val ABOUT_ROW = "about_us"

private const val STRING_RES = "loki_patches_menu"

/** Every reference of one kind in a method's body. */
private fun <T> Method.references(type: Class<T>): List<T> =
    implementation?.instructions
        ?.mapNotNull { (it as? ReferenceInstruction)?.reference }
        ?.filterIsInstance(type)
        .orEmpty()

/** Builds the app drawer's item list: the one no-argument method returning an ArrayList that builds "About us". */
private fun Method.isDrawerBuilder() =
    returnType == "Ljava/util/ArrayList;" && parameterTypes.isEmpty() &&
        references(FieldReference::class.java).any { it.name == ABOUT_ROW }

/**
 * Dispatches a drawer click: `a(View, <item>)`, a two-argument method that opens the app's own screens by class, so it
 * is identified by the classes it starts rather than by its name.
 */
private fun Method.isDrawerClick() =
    returnType == "V" && parameterTypes.size == 2 &&
        parameterTypes[0].toString() == "Landroid/view/View;" &&
        references(TypeReference::class.java).map { it.type }.let { types ->
            "Lcom/cv/docscanner/activity/HelpAndFaqActivity;" in types &&
                "Lcom/cv/docscanner/activity/SettingsNativeActivity;" in types
        }

/** The obfuscated names the row needs, read out of the build being patched. */
private data class RowShape(
    val itemClass: String,
    val iconClass: String,
    val labelMethod: String,
    val iconMethod: String,
    val iconSetter: String,
    val insertAt: Int,
)

/**
 * Reads the "About us" block of the drawer builder: the row instance, the label setter it calls with the string id,
 * the glyph builder that turns an icon enum plus two colours into the row icon, and the setter that puts it there.
 * All of those are renamed on every release, so they are taken from the instructions themselves. One thing is
 * asserted because the injected code names it: the list is in v0. The About us block hands its row to the list and
 * never reads that register again, so the injected code may reuse it.
 */
private fun MutableMethod.rowShape(): RowShape? {
    val impl = implementation ?: return null
    val insns = impl.instructions.toList()

    val about = insns.indexOfFirst { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.name == ABOUT_ROW
    }
    if (about < 0) return null
    val addAt = (about until insns.size).firstOrNull { index ->
        ((insns[index] as? ReferenceInstruction)?.reference as? MethodReference)?.let {
            it.definingClass == "Ljava/util/ArrayList;" && it.name == "add"
        } == true
    } ?: return null
    val add = insns[addAt] as? FiveRegisterInstruction ?: return null
    if (add.registerCount != 2 || add.registerC != 0) return null

    val itemClass = insns.subList(0, about + 1).lastOrNull { it.opcode == Opcode.NEW_INSTANCE }
        ?.let { (it as ReferenceInstruction).reference as TypeReference }
        ?.type
        ?: return null

    val calls = insns.drop(about).mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        .filter { !it.name.startsWith("<") && it.definingClass != "Ljava/util/ArrayList;" }
    val label = calls.firstOrNull { it.parameterTypes.size == 1 && it.parameterTypes[0].toString() == "I" }
        ?: return null
    val glyph = calls.firstOrNull {
        it.parameterTypes.size == 3 && it.parameterTypes[1].toString() == "I" && it.parameterTypes[2].toString() == "I"
    } ?: return null
    val setter = calls.dropWhile { it != glyph }.drop(1)
        .firstOrNull { it.parameterTypes.size == 1 && it.parameterTypes[0].toString() != "I" }
        ?: return null

    return RowShape(
        itemClass = itemClass.removePrefix("L").removeSuffix(";"),
        iconClass = glyph.definingClass.removePrefix("L").removeSuffix(";"),
        labelMethod = label.name,
        iconMethod = glyph.name,
        iconSetter = setter.name,
        insertAt = addAt + 1,
    )
}

/** The first class in the app whose methods satisfy [predicate], with that method made mutable. */
private fun app.morphe.patcher.patch.BytecodePatchContext.findMethod(
    predicate: (Method) -> Boolean,
): Pair<MutableMethod, ClassDef>? {
    var hit: Pair<ClassDef, Method>? = null
    classDefForEach { def ->
        if (hit != null) return@classDefForEach
        def.methods.firstOrNull(predicate)?.let { hit = def to it }
    }
    val (def, method) = hit ?: return null
    val mutable = mutableClassDefBy(def).methods.first {
        it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
    }
    return mutable to def
}

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
        // No menu flag: this row is the way into the menu, not a patch the Patch status page can report on.
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
 * from this build's obfuscated names; a version that renames them only loses the row, never the app.
 */
internal val drawerRowPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        // Shared by every app in the bundle: another app simply has no drawer to extend.
        if (!packageMetadata.packageName.equals(PACKAGE, ignoreCase = true)) return@execute

        // A version whose drawer is built differently (6.8.x, or a future one) only loses this row: the menu still
        // opens from the long-press shortcut, and the patches that depend on the menu must still apply.
        val builder = findMethod { it.isDrawerBuilder() }?.first ?: run {
            println("WARNING: Doc Scanner drawer: no row builder found, the Loki Patches row is skipped")
            return@execute
        }
        val shape = builder.rowShape() ?: run {
            println("WARNING: Doc Scanner drawer: the About us block is not where it was, the row is skipped")
            return@execute
        }
        // Found before anything is added, so a row is never left in the drawer that a tap could not open.
        val click = findMethod { it.isDrawerClick() }?.first ?: run {
            println("WARNING: Doc Scanner drawer: no click dispatcher found, the row is skipped")
            return@execute
        }

        builder.addInstructionsWithLabels(
            shape.insertAt,
            """
                const-string v6, "${shape.itemClass}"
                sput-object v6, Lapp/loki/extension/DrawerSupport;->itemClass:Ljava/lang/String;
                const-string v6, "${shape.iconClass}"
                sput-object v6, Lapp/loki/extension/DrawerSupport;->iconClass:Ljava/lang/String;
                const-string v6, "${shape.labelMethod}"
                sput-object v6, Lapp/loki/extension/DrawerSupport;->labelMethod:Ljava/lang/String;
                const-string v6, "${shape.iconMethod}"
                sput-object v6, Lapp/loki/extension/DrawerSupport;->iconMethod:Ljava/lang/String;
                const-string v6, "${shape.iconSetter}"
                sput-object v6, Lapp/loki/extension/DrawerSupport;->iconSetter:Ljava/lang/String;
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
            """.trimIndent(),
            ExternalLabel("loki_row_done", builder.getInstruction(shape.insertAt)),
        )

        // Route clicks on the row (identifier 7331) to the Loki Patches screen. A 2-parameter instance method with
        // four locals keeps its arguments in v5 and v6.
        click.addInstructionsWithLabels(
            0,
            """
                invoke-static {v5, v6}, Lapp/loki/extension/DrawerSupport;->clicked(Landroid/view/View;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :loki_click_done
                return-void
            """.trimIndent(),
            ExternalLabel("loki_click_done", click.getInstruction(0)),
        )
    }

    dependsOn(addStringResource)
    dependsOn(drawerFlag)
}
