// Adapted from archivesteak/Quest Pinterest patches (GPL-3.0).
package app.template.patches.pinterest.video

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef

internal const val EXTENSION_PACKAGE = "Lapp/template/extension/pinterest"
private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/PinModel;"

internal lateinit var pinClass: ClassDef
    private set

/**
 * Implements the extension's accessors for the obfuscated Pin model,
 * so extension code can read Pins without knowing their class or getter names.
 *
 * The compiler may give an extension stub no registers besides its parameters,
 * so implementations only use parameter registers.
 */
val pinModelPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        pinClass = modelClassWithJsonFields("pinner", "images", "videos", "created_at")
        val videosGetter = pinClass.getterOf(pinClass.fieldWithJsonName("videos"))
        val videoClass = classDefBy(videosGetter.returnType)
        val videoListField = videoClass.fieldWithJsonName("video_list")
        val videoListGetter = videoClass.getterOf(videoListField)
        val videoEncodingClass = classDefBy(videoListField.mapValueType)
        val videoUrlGetter = videoEncodingClass.getterOf(videoEncodingClass.fieldWithJsonName("url"))

        // Idea Pins have their videos in their pages, either in a video block or as the page's video.
        val storyPinField = pinClass.fieldWithJsonName("story_pin_data")
        val storyPinGetter = pinClass.getterOf(storyPinField)
        val storyPinClass = classDefBy(storyPinField.type)
        val pagesField = storyPinClass.fieldWithJsonName("pages")
        val pagesGetter = storyPinClass.getterOf(pagesField)
        val pagesPreviewGetter = storyPinClass.getterOf(storyPinClass.fieldWithJsonName("pages_preview"))

        val pageClass = classDefBy(pagesField.listElementType)
        val pageVideoField = pageClass.fieldWithJsonName("video")
        val pageVideoGetter = pageClass.getterOf(pageVideoField)
        val blocksField = pageClass.fieldWithJsonName("blocks")
        val blocksGetter = pageClass.getterOf(blocksField)

        val storyVideoClass = classDefBy(pageVideoField.type)
        val storyVideoListField = storyVideoClass.fieldWithJsonName("video_list")
        val storyVideoListGetter = storyVideoClass.getterOf(storyVideoListField)
        if (storyVideoListField.mapValueType != videoEncodingClass.type) {
            throw PatchException("Idea Pin videos have a different encoding class")
        }

        // Blocks are wrappers with a field for each kind of block.
        val blockClass = classDefBy(blocksField.listElementType)
        val (videoBlockField, videoBlockClass) = blockClass.fields
            .filter { it.type.startsWith(MODEL_PACKAGE) }
            .map { it to classDefBy(it.type) }
            .singleOrNull { (_, classDef) -> classDef.fields.any { it.jsonName == "video" && it.type == storyVideoClass.type } }
            ?: throw PatchException("Idea Pin video block not found")
        val videoBlockVideoGetter = videoBlockClass.getterOf(videoBlockClass.fieldWithJsonName("video"))
        if (!AccessFlags.PUBLIC.isSet(videoBlockField.accessFlags)) {
            throw PatchException("Pinterest video block field is not accessible to the extension")
        }
        listOf(pinClass, videoClass, videoEncodingClass, storyPinClass, pageClass, storyVideoClass, blockClass, videoBlockClass)
            .forEach { if (!AccessFlags.PUBLIC.isSet(it.accessFlags)) throw PatchException("Pinterest model ${it.type} is not public") }

        val extensionMethods = mutableClassDefBy(EXTENSION_CLASS).methods
        fun implement(name: String, smali: String) =
            extensionMethods.single { it.name == name }.addInstructionsWithLabels(0, smali)

        implement(
            "getVideoList",
            """
                check-cast p0, ${pinClass.type}
                invoke-virtual { p0 }, ${videosGetter.smaliReference}
                move-result-object p0
                if-eqz p0, :no_video
                invoke-virtual { p0 }, ${videoListGetter.smaliReference}
                move-result-object p0
                :no_video
                return-object p0
            """
        )
        implement(
            "getStoryPages",
            """
                check-cast p0, ${pinClass.type}
                invoke-virtual { p0 }, ${storyPinGetter.smaliReference}
                move-result-object p0
                if-eqz p0, :no_story
                invoke-virtual { p0 }, ${pagesGetter.smaliReference}
                move-result-object p0
                :no_story
                return-object p0
            """
        )
        implement(
            "getStoryPagesPreview",
            """
                check-cast p0, ${pinClass.type}
                invoke-virtual { p0 }, ${storyPinGetter.smaliReference}
                move-result-object p0
                if-eqz p0, :no_story
                invoke-virtual { p0 }, ${pagesPreviewGetter.smaliReference}
                move-result-object p0
                :no_story
                return-object p0
            """
        )
        implement(
            "getPageBlocks",
            """
                check-cast p0, ${pageClass.type}
                invoke-virtual { p0 }, ${blocksGetter.smaliReference}
                move-result-object p0
                return-object p0
            """
        )
        implement(
            "getPageVideoList",
            """
                check-cast p0, ${pageClass.type}
                invoke-virtual { p0 }, ${pageVideoGetter.smaliReference}
                move-result-object p0
                if-eqz p0, :no_video
                invoke-virtual { p0 }, ${storyVideoListGetter.smaliReference}
                move-result-object p0
                :no_video
                return-object p0
            """
        )
        implement(
            "getBlockVideoList",
            """
                check-cast p0, ${blockClass.type}
                iget-object p0, p0, ${blockClass.type}->${videoBlockField.name}:${videoBlockField.type}
                if-eqz p0, :no_video
                invoke-virtual { p0 }, ${videoBlockVideoGetter.smaliReference}
                move-result-object p0
                if-eqz p0, :no_video
                invoke-virtual { p0 }, ${storyVideoListGetter.smaliReference}
                move-result-object p0
                :no_video
                return-object p0
            """
        )
        implement(
            "getVideoUrl",
            """
                check-cast p0, ${videoEncodingClass.type}
                invoke-virtual { p0 }, ${videoUrlGetter.smaliReference}
                move-result-object p0
                return-object p0
            """
        )
    }
}
