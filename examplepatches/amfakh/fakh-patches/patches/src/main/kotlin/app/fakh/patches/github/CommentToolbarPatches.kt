/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.fakh.patches.github.shared.Constants.ADD_COLLAPSIBLE_SECTION
import app.fakh.patches.github.shared.Constants.ADD_TABLE
import app.fakh.patches.shared.register
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method

private const val TOOLBAR_EXTENSION = "Lapp/fakh/extension/github/CommentToolbar;"
private const val TOOLBAR_VIEW = "Lcom/github/android/views/MarkdownBarView;"
private const val CLASS = "Ljava/lang/Class;"
private const val STRING = "Ljava/lang/String;"

/**
 * Adds the buttons' labels, and a table icon as large as the toolbar's other icons: the app's is a 16 dp one that
 * fills its square.
 */
private val commentToolbarResourcePatch = patch {
    execute {
        document("res/values/strings.xml").use { document ->
            mapOf(
                "fakh_markdown_details" to "Add a collapsible section",
                "fakh_markdown_table" to "Add a table",
            ).forEach { (name, text) ->
                document.documentElement.appendChild(
                    document.createElement("string").apply {
                        setAttribute("name", name)
                        textContent = text
                    },
                )
            }
        }
        resourceFile("res/drawable/fakh_table_24.xml").apply { parentFile.mkdirs() }.writeText(
            """<?xml version="1.0" encoding="utf-8"?>
<vector xmlns:android="http://schemas.android.com/apk/res/android" android:width="24dp" android:height="24dp"
    android:viewportWidth="24" android:viewportHeight="24">
    <path android:fillColor="#ff000000" android:fillType="evenOdd" android:pathData="M4.75,3H19.25C20.22,3 21,3.78 21,4.75V19.25C21,20.22 20.22,21 19.25,21H4.75C3.78,21 3,20.22 3,19.25V4.75C3,3.78 3.78,3 4.75,3ZM4.5,4.5V8.25H8.25V4.5ZM9.75,4.5V8.25H19.5V4.5ZM4.5,9.75V19.5H8.25V9.75ZM9.75,9.75V19.5H19.5V9.75Z" />
</vector>
""",
        )
    }
}

/** Whether a method has the shape of the Compose toolbar: a modifier, fourteen actions, a flag and the composer. */
private fun Method.isToolbar(): Boolean {
    val types = parameterTypes.map(CharSequence::toString)
    return returnType == "V" && accessFlags and AccessFlags.STATIC.value != 0 && types.size == 20 &&
        types.subList(1, 15).distinct().size == 1 && types[15] == "Z" && types.takeLast(3) == listOf("I", "I", "I")
}

/** Has both markdown toolbars ask the extension for the buttons that are switched on. */
private val commentToolbarPatch = patch {
    dependsOn(githubSettingsPatch, commentToolbarResourcePatch)
    extendWith("extensions/extension.mpe")

    execute {
        val toolbars = mutableListOf<Method>()
        classDefForEach { classDef -> toolbars += classDef.methods.filter { it.isToolbar() } }
        val toolbar = toolbars.singleOrNull() ?: throw PatchException("Compose toolbar: not found once")
        val click = toolbar.parameterTypes[1].toString()
        val composer = toolbar.parameterTypes[16].toString()
        val button = classDefByOrNull(toolbar.definingClass)!!.methods.singleOrNull {
            val types = it.parameterTypes.map(CharSequence::toString)
            types.size == 6 && types.take(5) == listOf("I", "I", "I", click, composer)
        } ?: throw PatchException("Compose toolbar: the method that draws a button not found")

        // The toolbar hands its list a function of one argument, the list's scope, which adds one item per button.
        val list = toolbar.instructions.mapNotNull { it.method }.filter { it.name == "<init>" && "Z" in it.types }
            .mapNotNull { call ->
                classDefByOrNull(call.definingClass)?.methods?.singleOrNull {
                    it.name != "<init>" && it.parameterTypes.size == 1
                }
            }.singleOrNull() ?: throw PatchException("Compose toolbar: the list of buttons not found")
        val items = mutableClassDefBy(list.definingClass).methods.single {
            it.name == list.name && it.parameterTypes.size == 1
        }
        val code = items.instructions
        // Each item: its content wrapped in a composable function, then added to the scope.
        val add = code.mapNotNull { it.method }.lastOrNull { it.parameterTypes.size == 4 && it.returnType == "V" }
            ?: throw PatchException("Compose toolbar: the call that adds an item not found")
        val wrap = code.mapNotNull { it.method }
            .lastOrNull { it.name == "<init>" && it.types == listOf("Ljava/lang/Object;", "Z", "I") }
            ?: throw PatchException("Compose toolbar: the composable wrapper not found")
        val content = add.types[2]
        // The method ends by loading Unit and returning it.
        val end = code.indices.last { code[it].opcode == Opcode.SGET_OBJECT }
        // The plain addInstructions loses the targets of jumps within the added code.
        items.addInstructionsWithLabels(
            end,
            """
                const-class v0, $content
                const-class v1, $click
                const-class v2, ${toolbar.definingClass}
                const-string v3, "${button.name}"
                invoke-static { v0, v1, v2, v3 }, $TOOLBAR_EXTENSION->items($CLASS$CLASS$CLASS$STRING)[Ljava/lang/Object;
                move-result-object v0
                const/4 v1, 0x0
                :next
                array-length v2, v0
                if-ge v1, v2, :done
                aget-object v2, v0, v1
                new-instance v3, ${wrap.definingClass}
                const/4 v4, 0x1
                const v5, 0x66616b00
                add-int v5, v5, v1
                invoke-direct { v3, v2, v4, v5 }, ${wrap.smali}
                const/4 v2, 0x0
                const/4 v4, 0x3
                invoke-static { p1, v2, v3, v4 }, ${add.smali}
                add-int/lit8 v1, v1, 0x1
                goto :next
                :done
                nop
            """,
        )

        // The toolbar of views gets its buttons once the screen listens to it.
        val listen = mutableClassDefBy(TOOLBAR_VIEW).methods.singleOrNull { it.name == "setOnItemSelectedListener" }
            ?: throw PatchException("Markdown toolbar: its listener setter not found")
        listen.addInstruction(0, "invoke-static/range { p0 .. p0 }, $TOOLBAR_EXTENSION->attach(Landroid/view/View;)V")
    }
}

@Suppress("unused")
val addCollapsibleSectionPatch = patch(
    name = "Add collapsible section",
    description = "Adds a button to the markdown toolbars that puts a collapsible <details> section around the " +
        "selected text.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(commentToolbarPatch)

    execute { register(ADD_COLLAPSIBLE_SECTION) }
}

@Suppress("unused")
val addTablePatch = patch(
    name = "Add table",
    description = "Adds a button to the markdown toolbars that inserts a markdown table template around the " +
        "selected text.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(commentToolbarPatch)

    execute { register(ADD_TABLE) }
}
