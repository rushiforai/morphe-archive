package app.xfeedcleanup.patches.x

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.getReference
import app.morphe.util.returnEarly
import app.morphe.util.getFreeRegisterProvider
import app.morphe.util.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val MEDIA_MENU = "Lapp/xfeedcleanup/extension/x/MediaLinkMenu;"

private object VideoDownloaderActionFingerprint : Fingerprint(
    definingClass = "Lcom/twitter/downloader/",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    strings = listOf("getString(...)", "isUseSnackbar"),
)

private object MediaOptionsStateFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("PostOptionsState(showOptionsDialog="),
)
private object MediaOptionGroupFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("OptionGroup(postActions="),
)
private object MediaOptionSelectionFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("DidSelectOption(option="),
)
private object MediaOptionsPresenterFingerprint : Fingerprint(
    name = "<init>",
    strings = listOf("DefaultPostOptionsPresenter"),
)
private object MediaMainActivityFingerprint : Fingerprint(
    definingClass = "Lcom/x/android/main/MainActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
)
private class MenuHelperFingerprint(name: String) : Fingerprint(definingClass = MEDIA_MENU, name = name)

private fun String.javaClassName() = removePrefix("L").removeSuffix(";").replace('/', '.')

/**
 * Exposes the direct original-size photo and highest-bitrate MP4 URLs in the post options.
 * Uses a distinct extension class, so the upstream add-on's settings and hooks are untouched.
 */
@Suppress("unused")
val copyMediaUrlPatch = bytecodePatch(
    name = "Copy media URL",
    description = "Copies direct photo, video, and GIF URLs from a post's options menu.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(recommendationFilterPatch)

    execute {
        val actionType = MediaOptionSelectionFingerprint.classDef.fields.single().type
        MenuHelperFingerprint("actionClass").method.returnEarly(actionType.javaClassName())
        MenuHelperFingerprint("groupClass").method.returnEarly(
            MediaOptionGroupFingerprint.classDef.type.javaClassName()
        )

        MediaMainActivityFingerprint.method.addInstructions(
            0,
            "invoke-static { p0 }, $MEDIA_MENU->setActivity(Landroid/app/Activity;)V",
        )

        // Hook the same native downloader entry as Piko's verified video menu.
        // Unlike its unconditional override, fall back to X's original save
        // implementation if the expected media URL or activity is unavailable.
        VideoDownloaderActionFingerprint.method.apply {
            val insertionIndex = indexOfFirstInstruction(Opcode.IF_EQZ) + 1
            if (insertionIndex <= 0 || insertionIndex >= instructions.size) {
                throw PatchException("Video downloader guard was not found")
            }
            val free = getFreeRegisterProvider(insertionIndex, 1).getFreeRegister()
            addInstructionsWithLabels(
                insertionIndex,
                """
                invoke-static { p0, p1 }, $MEDIA_MENU->handleVideoDownload(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v$free
                if-eqz v$free, :originalVideoDownload
                return-void
                """,
                ExternalLabel("originalVideoDownload", getInstruction(insertionIndex)),
            )
        }

        mutableClassDefBy(MediaOptionsStateFingerprint.classDef).methods.single { method ->
            method.name == "<init>" && method.parameterTypes.firstOrNull() == "Z" &&
                method.parameterTypes.getOrNull(2) == "Ljava/util/List;" &&
                method.parameterTypes.getOrNull(3) == "Ljava/util/Map;"
        }.addInstructions(
            0,
            """
            invoke-static { p1, p3 }, $MEDIA_MENU->options(ZLjava/util/List;)Ljava/util/List;
            move-result-object p3
            invoke-static { p1, p4 }, $MEDIA_MENU->labels(ZLjava/util/Map;)Ljava/util/Map;
            move-result-object p4
            """,
        )

        val handler = MediaOptionsPresenterFingerprint.classDef
        val presenterField = handler.fields.single { field ->
            classDefByOrNull(field.type)?.fields?.let { fields ->
                fields.any { it.type == "Landroid/content/Context;" } &&
                    fields.any { it.type.startsWith("Lcom/x/models/timelines/items/") }
            } == true
        }
        val presenter = classDefBy(presenterField.type)
        val contextField = presenter.fields.first { it.type == "Landroid/content/Context;" }
        val postField = presenter.fields.first { it.type.startsWith("Lcom/x/models/timelines/items/") }

        mutableClassDefBy(handler).methods.single { method ->
            method.name == "invoke" &&
                method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;")
        }.apply {
            val visibility = instructions.firstNotNullOfOrNull { instruction ->
                instruction.getReference<FieldReference>()?.takeIf {
                    instruction.opcode == Opcode.IGET_OBJECT &&
                        it.definingClass == handler.type &&
                        it.type == "Landroidx/compose/runtime/l1;"
                }
            } ?: throw PatchException("Post options handler visibility was not found")

            addInstructionsWithLabels(
                0,
                """
                move-object/from16 v0, p0
                iget-object v1, v0, ${handler.type}->${presenterField.name}:${presenterField.type}
                iget-object v2, v1, ${presenter.type}->${contextField.name}:Landroid/content/Context;
                iget-object v1, v1, ${presenter.type}->${postField.name}:${postField.type}
                move-object/from16 v3, p1
                invoke-static { v2, v1, v3 }, $MEDIA_MENU->onOption(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v1
                if-eqz v1, :original
                iget-object v1, v0, $visibility
                sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                invoke-interface { v1, v2 }, Landroidx/compose/runtime/l1;->setValue(Ljava/lang/Object;)V
                sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;
                return-object v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }
    }
}
