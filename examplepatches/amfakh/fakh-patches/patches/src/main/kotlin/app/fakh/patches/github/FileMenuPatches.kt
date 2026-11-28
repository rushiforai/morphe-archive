/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.fakh.patches.github.shared.Constants.FILE_DOWNLOAD_MENU
import app.fakh.patches.github.shared.Constants.DOWNLOAD_LOCATION
import app.fakh.patches.github.shared.Constants.HTML_PREVIEW_MENU
import app.fakh.patches.shared.register
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val FILE_FRAGMENT = "Lcom/github/android/repository/file/RepositoryFileFragment;"
private const val FILE_MENU = "Lapp/fakh/extension/github/FileMenu;"
private const val MENU = "Landroid/view/Menu;"

/**
 * Has the file screen hand its menu to the extension, with a context and the address of the file on the web. The
 * screen builds the address for its Share item; the three calls that lead to it are copied from there.
 */
private val fileMenuPatch = bytecodePatch {
    dependsOn(apiTokenPatch)
    extendWith("extensions/extension.mpe")

    execute {
        val fragment = mutableClassDefBy(FILE_FRAGMENT)
        val createMenu = fragment.methods.singleOrNull {
            it.parameterTypes.map(CharSequence::toString) == listOf(MENU, "Landroid/view/MenuInflater;")
        } ?: throw PatchException("File menu: the method that creates it not found")
        val calls = createMenu.instructions.mapNotNull { it.method }.filter { it.parameterTypes.isEmpty() }
        val context = calls.firstOrNull { it.returnType == "Landroid/content/Context;" }
            ?: throw PatchException("File menu: the screen's context not found")
        val model = calls.firstOrNull { it.definingClass == FILE_FRAGMENT && it.returnType.startsWith("L") }
            ?: throw PatchException("File menu: the view model not found")
        // The view model's one method that joins the host, owner, repository, branch and path into an address.
        val address = classDefByOrNull(model.returnType)?.methods?.singleOrNull { method ->
            method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/String;" &&
                method.instructions.any {
                    it.opcode == Opcode.INVOKE_STATIC && it.method?.parameterTypes?.size == 5
                }
        } ?: throw PatchException("File menu: the file's address not found")

        fragment.methods.add(
            ImmutableMethod(
                FILE_FRAGMENT,
                "fakhFileMenu",
                listOf(ImmutableMethodParameter(MENU, null, null)),
                "V",
                AccessFlags.PUBLIC.value,
                null,
                null,
                MutableMethodImplementation(4),
            ).toMutable().apply {
                addInstructions(
                    0,
                    """
                        invoke-virtual { p0 }, ${context.smali}
                        move-result-object v0
                        invoke-virtual { p0 }, ${model.smali}
                        move-result-object v1
                        invoke-virtual { v1 }, ${model.returnType}->${address.name}()Ljava/lang/String;
                        move-result-object v1
                        invoke-static { p1, v0, v1 }, $FILE_MENU->add(${MENU}Landroid/content/Context;Ljava/lang/String;)V
                        return-void
                    """,
                )
            },
        )

        val inflateAt = createMenu.instructions.indexOfFirst { it.method?.name == "inflate" }
        if (inflateAt < 0) throw PatchException("File menu: the inflate call not found")
        createMenu.addInstruction(inflateAt + 1, "invoke-virtual { p0, p1 }, $FILE_FRAGMENT->fakhFileMenu($MENU)V")
    }
}

@Suppress("unused")
val addFileDownloadMenuPatch = patch(
    name = "Add download menu to every file",
    description = "Adds Download to the menu of an open file, which saves it with the system download manager.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch, fileMenuPatch)

    execute {
        register(FILE_DOWNLOAD_MENU, DOWNLOAD_LOCATION)
    }
}

@Suppress("unused")
val addHtmlPreviewMenuPatch = patch(
    name = "Add Preview menu to HTML files",
    description = "Adds Preview to the menu of an HTML file, which shows the page with the repository's styles and " +
        "images. Scripts stay off until you allow them.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch, fileMenuPatch)

    execute {
        register(HTML_PREVIEW_MENU)
    }
}
