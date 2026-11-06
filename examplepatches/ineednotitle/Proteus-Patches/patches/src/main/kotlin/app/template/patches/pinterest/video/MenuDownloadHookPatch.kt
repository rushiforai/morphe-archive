// Adapted from archivesteak/Quest Pinterest patches (GPL-3.0).
package app.template.patches.pinterest.video

import app.template.patches.pinterest.video.EXTENSION_PACKAGE
import app.template.patches.pinterest.video.pinClass
import app.template.patches.pinterest.video.pinModelPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val MENU_DOWNLOAD_CLASS = "$EXTENSION_PACKAGE/MenuDownloadPatch;"

/** Parameters of the app's image download, which gets a callback that closes the menu. */
private val APP_DOWNLOAD_PARAMETERS = listOf(
    "Landroid/content/Context;",
    "Landroid/app/Activity;",
    "Lkotlin/jvm/functions/Function1;",
    "Lkotlin/jvm/functions/Function0;",
)

/**
 * Lets patches handle taps on "Download image" in the Pin menu, for example to save a video instead.
 * The app's own image download then only closes the menu.
 */
internal val menuDownloadHookPatch = bytecodePatch {
    dependsOn(pinModelPatch)

    extendWith("extensions/extension.mpe")

    execute {
        val appDownloads = mutableMapOf<String, MethodReference>()
        var hookedHandlers = 0

        DownloadImageClickFingerprint.matchAll().forEach { match ->
            // The menu presenters keep the Pin the menu was opened for.
            val pinField = match.originalClassDef.fields.singleOrNull { it.type == pinClass.type }
                ?: return@forEach

            match.originalMethod.implementation!!.instructions
                .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                .filter { it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == APP_DOWNLOAD_PARAMETERS }
                .forEach { appDownloads["${it.definingClass}->${it.name}"] = it }

            val method = match.method
            val impl = method.implementation ?: throw PatchException("Pinterest download handler has no code")
            if (AccessFlags.STATIC.isSet(method.accessFlags) || method.parameterTypes.size != 2 ||
                impl.registerCount <= method.parameterTypes.size + 1
            ) throw PatchException("Pinterest download handler needs a local register")
            // iget-object has 4-bit operands. Copy high p0/p1 registers into locals
            // rather than accidentally truncating an obfuscated method's parameter window.
            val contextRegister = if (impl.registerCount - 2 <= 15) "p1" else "v1"
            if (contextRegister == "v1" && impl.registerCount - method.parameterTypes.size - 1 < 2)
                throw PatchException("Pinterest download handler needs two local registers")
            val copyContext = if (contextRegister == "v1") "move-object/from16 v1, p1" else ""
            method.addInstructionsWithLabels(
                0,
                """
                    move-object/from16 v0, p0
                    iget-object v0, v0, ${match.originalClassDef.type}->${pinField.name}:${pinField.type}
                    $copyContext
                    invoke-static { $contextRegister, v0 }, $MENU_DOWNLOAD_CLASS->onDownloadClick(Landroid/content/Context;Ljava/lang/Object;)V
                """
            )
            hookedHandlers++
        }
        if (hookedHandlers == 0) throw PatchException("No download click handler holds a Pin")
        if (appDownloads.isEmpty()) throw PatchException("App image download not found")

        appDownloads.values.forEach { download ->
            mutableClassDefBy(download.definingClass).methods.single {
                it.name == download.name && it.parameterTypes.map(CharSequence::toString) == APP_DOWNLOAD_PARAMETERS
            }.apply {
                if (AccessFlags.STATIC.isSet(accessFlags) || implementation!!.registerCount <= parameters.size + 1) {
                    throw PatchException("Unexpected app image download $definingClass->$name")
                }

                // p4 is the callback that closes the menu.
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-static/range { p4 .. p4 }, $MENU_DOWNLOAD_CLASS->onAppDownload(Ljava/lang/Object;)Z
                        move-result v0
                        if-eqz v0, :app_download
                        return-void
                    """,
                    ExternalLabel("app_download", getInstruction(0))
                )
            }
        }
    }
}
