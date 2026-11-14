package semicoloncolonel.mobilestream.patches.truthsocial.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.truthsocial.shared.Constants
import semicoloncolonel.mobilestream.patches.truthsocial.shared.modelConstructor
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

// Truth Social 1.28.3. Two buttons save media: "Save image" in a post's
// menu, and in the media viewer's dialog. Both receive the URL of the media
// on screen, which for a video is the video's own file. The app saves only
// pictures. MediaSaver names the button "Save video" for a video, and saves
// the file with Android's download manager instead.
//
//   1. The "Save image" text (found by its resource ID, read from the app's
//      resource table) goes through MediaSaver.label.
//   2. The functions that build each button pass their URL to
//      MediaSaver.remember: the post menu's saveImageCallback and the media
//      viewer's ImageDialogMenu, found by their trace names.
//   3. Each button's save function, in the same class, takes the scope, a
//      state, the Context, the URL, and a callback. After it resets its
//      state, MediaSaver.saveVideo saves a video and the function returns.
//
// Videos open in the full-screen player instead. Its Playback Controls
// sheet has a Video Quality row, which the app hides for these videos:
//
//   4. FullscreenVideoActivity.onCreate passes the activity to
//      MediaSaver.rememberPlayer. Its "videoUrl" extra is in fact the media
//      attachment's ID, so the MediaAttachment constructor passes each
//      attachment's ID and URL to MediaSaver.rememberMedia first.
//   5. The sheet's rows lambda (found by its trace name) takes the speed
//      flag, the speed click, the quality flag, and the quality click. For
//      a video that can be saved, the quality flag is turned on and the
//      click is replaced by MediaSaver.playerClick, and the row's text (the
//      video_quality string) goes through MediaSaver.playerLabel.
private const val MEDIA_SAVER = "Lsemicoloncolonel/mobilestream/extension/truthsocial/MediaSaver;"
private val BUTTON_BUILDERS = listOf(
    "com.truthsocial.app.features.timeline.bottomsheet.saveImageCallback (",
    "com.truthsocial.app.common.components.component.media.ImageDialogMenu (",
)

private var saveImageId = -1
private var videoQualityId = -1
private const val PLAYER_ROWS = "com.truthsocial.app.features.video.bottomsheet.VideoSettingsBottomSheet.<anonymous>.<anonymous> ("

private val saveImageResourcePatch = resourcePatch {
    execute {
        document("res/values/public.xml").use { document ->
            val entries = document.getElementsByTagName("public")
            for (i in 0 until entries.length) {
                val entry = entries.item(i) as Element
                if (entry.getAttribute("type") != "string") continue
                when (entry.getAttribute("name")) {
                    "save_image" -> saveImageId = java.lang.Long.decode(entry.getAttribute("id")).toInt()
                    "video_quality" -> videoQualityId = java.lang.Long.decode(entry.getAttribute("id")).toInt()
                }
            }
        }
        if (saveImageId == -1 || videoQualityId == -1) throw PatchException("Save strings not found")
    }
}

private fun Method.traceNames() = implementation?.instructions
    ?.filter { it.opcode == Opcode.CONST_STRING }
    ?.map { ((it as ReferenceInstruction).reference as StringReference).string }
    .orEmpty()

private fun Method.isSaveFunction() =
    parameterTypes.size == 5 &&
        parameterTypes[2].toString() == "Landroid/content/Context;" &&
        parameterTypes[3].toString() == "Ljava/lang/String;" &&
        implementation?.instructions?.any {
            it.opcode == Opcode.NEW_INSTANCE &&
                ((it as ReferenceInstruction).reference as TypeReference).type.isNotEmpty()
        } == true

// The register of parameter [index], not counting an instance method's p0.
// Parameters are the last registers, and none of these is wide.
private fun MutableMethod.parameterRegister(index: Int): Int =
    implementation!!.registerCount - parameterTypes.size + index

@Suppress("unused")
val saveVideosPatch = bytecodePatch(
    name = "Save videos",
    description = "Lets the Save button save videos too, and names it \"Save video\" for a video.",
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(saveImageResourcePatch)

    extendWith("extensions/extension.mpe")

    execute {
        // 1. The button text.
        val labels = forEachMatchingMethod({ true }, { method ->
            method.implementation?.instructions?.any {
                it.opcode == Opcode.CONST && (it as NarrowLiteralInstruction).narrowLiteral == saveImageId
            } == true
        }) { method ->
            val instructions = method.implementation!!.instructions.toList()
            instructions.indices.reversed().filter {
                instructions[it].opcode == Opcode.CONST &&
                    (instructions[it] as NarrowLiteralInstruction).narrowLiteral == saveImageId
            }.forEach { constIndex ->
                val resultIndex = (constIndex + 1 until instructions.size)
                    .first { instructions[it].opcode == Opcode.MOVE_RESULT_OBJECT }
                val register = (instructions[resultIndex] as OneRegisterInstruction).registerA
                val after = if (instructions.getOrNull(resultIndex + 1)?.opcode == Opcode.CHECK_CAST) resultIndex + 2 else resultIndex + 1
                method.addInstructions(
                    after,
                    """
                        invoke-static/range { v$register .. v$register }, $MEDIA_SAVER->label(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v$register
                    """.trimIndent(),
                )
            }
        }
        if (labels < 2) throw PatchException("Save image buttons not all found ($labels)")

        // 2 and 3.
        val builderClasses = mutableSetOf<String>()
        val builders = forEachMatchingMethod({ true }, { method ->
            method.parameterTypes.firstOrNull()?.toString() == "Ljava/lang/String;" &&
                method.traceNames().any { name -> BUTTON_BUILDERS.any { name.startsWith(it) } }
        }) { method ->
            builderClasses += method.definingClass
            val url = method.parameterRegister(0)
            method.addInstructions(0, "invoke-static/range { v$url .. v$url }, $MEDIA_SAVER->remember(Ljava/lang/String;)V")
        }
        if (builders < 2) throw PatchException("Save button builders not all found ($builders)")

        val savers = forEachMatchingMethod({ it.type in builderClasses }, { it.isSaveFunction() }) { method ->
            val context = method.parameterRegister(2)
            val firstCall = method.implementation!!.instructions.indexOfFirst { it.opcode == Opcode.INVOKE_STATIC }
            val resume = method.getInstruction(firstCall + 1)
            val done = if (method.returnType == "V") {
                "return-void"
            } else {
                val unit = method.implementation!!.instructions.firstNotNullOfOrNull {
                    if (it.opcode != Opcode.SGET_OBJECT) return@firstNotNullOfOrNull null
                    ((it as ReferenceInstruction).reference as com.android.tools.smali.dexlib2.iface.reference.FieldReference)
                        .takeIf { field -> field.type == method.returnType && field.definingClass == method.returnType }
                } ?: throw PatchException("Unit not found in the save function")
                "sget-object v0, ${unit.definingClass}->${unit.name}:${unit.type}\nreturn-object v0"
            }
            method.addInstructionsWithLabels(
                firstCall + 1,
                """
                    invoke-static/range { v$context .. v${context + 1} }, $MEDIA_SAVER->saveVideo(Landroid/content/Context;Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :keep
                    $done
                """.trimIndent(),
                ExternalLabel("keep", resume),
            )
        }
        if (savers < 2) throw PatchException("Save functions not all found ($savers)")

        // 4.
        val players = forEachMatchingMethod(
            { it.type == "Lcom/truthsocial/app/features/video/fullscreen/FullscreenVideoActivity;" },
            { it.name == "onCreate" && it.parameterTypes.map { p -> p.toString() } == listOf("Landroid/os/Bundle;") },
        ) { method ->
            val activity = method.implementation!!.registerCount - 2
            method.addInstructions(
                0,
                "invoke-static/range { v$activity .. v$activity }, $MEDIA_SAVER->rememberPlayer(Landroid/app/Activity;)V",
            )
        }
        if (players != 1) throw PatchException("Full-screen player not found")

        modelConstructor("Lcom/truthsocial/core/data/models/MediaAttachment;").apply {
            val names = parameters.map { parameter ->
                parameter.annotations.firstNotNullOfOrNull { annotation ->
                    (annotation.elements.firstOrNull { it.name == "name" }?.value as? StringEncodedValue)?.value
                }
            }
            val id = names.indexOf("id")
            val url = names.indexOf("url")
            if (id < 0 || url < 0 || parameterTypes.any { it.toString() == "J" || it.toString() == "D" }) {
                throw PatchException("Media attachment ID and URL not found")
            }
            // The constructor has one spare register, so the parameters are
            // passed as they are.
            val idRegister = parameterRegister(id)
            val urlRegister = parameterRegister(url)
            if (idRegister > 15 || urlRegister > 15) throw PatchException("Media attachment registers out of range")
            addInstructions(
                0,
                "invoke-static { v$idRegister, v$urlRegister }, $MEDIA_SAVER->rememberMedia(Ljava/lang/String;Ljava/lang/String;)V",
            )
        }

        // 5.
        val rows = forEachMatchingMethod({ true }, { method ->
            method.parameterTypes.size >= 5 &&
                method.parameterTypes[0].toString() == "Z" && method.parameterTypes[2].toString() == "Z" &&
                method.traceNames().any { it.startsWith(PLAYER_ROWS) }
        }) { method ->
            val instructions = method.implementation!!.instructions.toList()
            val constIndex = instructions.indexOfFirst {
                it.opcode == Opcode.CONST && (it as NarrowLiteralInstruction).narrowLiteral == videoQualityId
            }
            if (constIndex < 0) throw PatchException("Video Quality text not found")
            val resultIndex = (constIndex + 1 until instructions.size)
                .first { instructions[it].opcode == Opcode.MOVE_RESULT_OBJECT }
            val text = (instructions[resultIndex] as OneRegisterInstruction).registerA
            method.addInstructions(
                resultIndex + 1,
                """
                    invoke-static/range { v$text .. v$text }, $MEDIA_SAVER->playerLabel(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$text
                """.trimIndent(),
            )

            val flag = method.parameterRegister(2)
            val click = method.parameterRegister(3)
            val clickType = method.parameterTypes[3].toString()
            method.addInstructions(
                0,
                """
                    invoke-static { }, $MEDIA_SAVER->canSavePlayerVideo()Z
                    move-result v0
                    or-int v$flag, v$flag, v0
                    invoke-static/range { v$click .. v$click }, $MEDIA_SAVER->playerClick(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$click
                    check-cast v$click, $clickType
                """.trimIndent(),
            )
        }
        if (rows != 1) throw PatchException("Playback Controls rows not found ($rows)")
    }
}
