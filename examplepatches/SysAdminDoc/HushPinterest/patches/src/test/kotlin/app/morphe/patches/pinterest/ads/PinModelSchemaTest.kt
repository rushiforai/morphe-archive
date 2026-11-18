/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ads

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.AnnotationVisibility
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableAnnotation
import com.android.tools.smali.dexlib2.immutable.ImmutableAnnotationElement
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue
import org.junit.Assert.assertEquals
import org.junit.Test

/**
 * The pin model check that FeedFixtureTest runs on the real build, here on synthetic models, so
 * each way it fails is seen with its message. The JSON annotation gets a made-up class name: only
 * its `value` element identifies it, as in Pinterest's renamed builds.
 */
class PinModelSchemaTest {
    private val pinFields = linkedMapOf(
        "id" to "Ljava/lang/String;",
        "images" to "Ljava/util/Map;",
        "is_promoted" to "Ljava/lang/Boolean;",
        "is_third_party_ad" to "Ljava/lang/Boolean;",
        "pin_promotion_id_reformatted" to "Ljava/lang/String;",
        "campaign_id_reformatted" to "Ljava/lang/String;",
        "ai_disclosures" to "Ljava/util/List;",
        "digital_media_source_type" to "Lfixture/Pin\$SourceType;",
        "digital_media_source_type_label" to "Ljava/lang/String;",
        "is_eligible_for_pdp" to "Ljava/lang/Boolean;",
        "is_video" to "Ljava/lang/Boolean;",
        "videos" to "Lfixture/Videos;",
        "story_pin_data" to "Lfixture/StoryData;",
        "grid_title" to "Ljava/lang/String;",
    )

    /** A board that also has an id, images and one ad flag, the way Pinterest's do. */
    private val board = model("Lfixture/Board;", mapOf("id" to "Ljava/lang/String;", "images" to "Ljava/util/Map;", "is_promoted" to "Ljava/lang/Boolean;"))

    /** The models a pin's videos and story_pin_data point at, with an id like Pinterest's video model. */
    private val videos = model("Lfixture/Videos;", mapOf("id" to "Ljava/lang/String;", "video_list" to "Ljava/util/Map;"))
    private val storyPages = mapOf("pages" to "Ljava/util/List;", "pages_preview" to "Ljava/util/List;")
    private val storyData = model("Lfixture/StoryData;", storyPages + mapOf("total_video_duration" to "Ljava/lang/String;", "page_count" to "Ljava/lang/Integer;"))

    private fun model(type: String, json: Map<String, String>, visibility: Int = AnnotationVisibility.RUNTIME, flags: Int = AccessFlags.PUBLIC.value): ClassDef =
        ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null,
            json.entries.mapIndexed { index, (name, fieldType) ->
                val annotation = ImmutableAnnotation(visibility, "Lfixture/Json;", setOf(ImmutableAnnotationElement("value", ImmutableStringEncodedValue(name))))
                ImmutableField(type, "f$index", fieldType, flags, null, setOf(annotation), null)
            }, null)

    private fun problems(vararg models: ClassDef) = pinSchemaProblems(models.associate { it.type to serializedFields(it) })

    @Test
    fun `the pin is told from other id and image models and passes with boxed or primitive flags`() {
        assertEquals(emptyList<String>(), problems(board, videos, storyData, model("Lfixture/Pin;", pinFields)))
        assertEquals(emptyList<String>(), problems(board, videos, storyData, model("Lfixture/Pin;", pinFields + ("is_promoted" to "Z") + ("is_video" to "Z"))))
    }

    @Test
    fun `a dropped or retyped field fails on its key and the type it needs`() {
        assertEquals(listOf("Lfixture/Pin; has no field named is_third_party_ad (expected Ljava/lang/Boolean; or Z)"),
            problems(board, videos, storyData, model("Lfixture/Pin;", pinFields - "is_third_party_ad")))
        assertEquals(listOf("Lfixture/Pin; field ai_disclosures is Ljava/lang/String;, expected Ljava/util/List;",
            "Lfixture/Pin; field is_eligible_for_pdp is I, expected Ljava/lang/Boolean; or Z"),
            problems(board, videos, storyData, model("Lfixture/Pin;", pinFields + ("ai_disclosures" to "Ljava/lang/String;") + ("is_eligible_for_pdp" to "I"))))
        assertEquals(listOf("Lfixture/Pin; field digital_media_source_type is I, expected an object",
            "Lfixture/Pin; has no field named digital_media_source_type_label (expected Ljava/lang/String;)"),
            problems(board, videos, storyData, model("Lfixture/Pin;", pinFields + ("digital_media_source_type" to "I") - "digital_media_source_type_label")))
        assertEquals(listOf("Lfixture/Pin; field is_video is Ljava/lang/String;, expected Ljava/lang/Boolean; or Z",
            "Lfixture/Pin; has no field named story_pin_data (expected an object)"),
            problems(board, videos, storyData, model("Lfixture/Pin;", pinFields + ("is_video" to "Ljava/lang/String;") - "story_pin_data")))
    }

    // Filter feed reads one field inside each of two nested models, so those are held to the same check.
    @Test
    fun `a nested video field that's dropped, retyped or behind an unknown model fails on the nested key`() {
        assertEquals(listOf("Lfixture/Videos; (Lfixture/Pin;'s videos) field video_list is Ljava/util/List;, expected Ljava/util/Map;",
            "Lfixture/StoryData; (Lfixture/Pin;'s story_pin_data) has no field named total_video_duration (expected Ljava/lang/String;)"),
            problems(board, model("Lfixture/Videos;", mapOf("video_list" to "Ljava/util/List;")),
                model("Lfixture/StoryData;", storyPages + mapOf("page_count" to "Ljava/lang/Integer;")), model("Lfixture/Pin;", pinFields)))
        assertEquals(listOf("Lfixture/Pin; field videos is Lfixture/Videos;, which isn't a model with JSON names"),
            problems(board, storyData, model("Lfixture/Pin;", pinFields)))
        assertEquals(listOf("Lfixture/StoryData; (Lfixture/Pin;'s story_pin_data) has no field named pages (expected Ljava/util/List;)",
            "Lfixture/StoryData; (Lfixture/Pin;'s story_pin_data) field pages_preview is Ljava/lang/String;, expected Ljava/util/List;"),
            problems(board, videos, model("Lfixture/StoryData;", mapOf("total_video_duration" to "Ljava/lang/String;", "pages_preview" to "Ljava/lang/String;")),
                model("Lfixture/Pin;", pinFields)))
    }

    @Test
    fun `names the extension can't read at run time don't count`() {
        val all = "is_promoted (expected Ljava/lang/Boolean; or Z), is_third_party_ad (expected Ljava/lang/Boolean; or Z), " +
            "pin_promotion_id_reformatted (expected Ljava/lang/String;), campaign_id_reformatted (expected Ljava/lang/String;), " +
            "ai_disclosures (expected Ljava/util/List;), digital_media_source_type (expected an object), " +
            "digital_media_source_type_label (expected Ljava/lang/String;), is_eligible_for_pdp (expected Ljava/lang/Boolean; or Z), " +
            "is_video (expected Ljava/lang/Boolean; or Z), videos (expected an object), story_pin_data (expected an object), " +
            "grid_title (expected Ljava/lang/String;)"
        assertEquals(listOf("no model with a serialized id and images carries any of $all"),
            problems(model("Lfixture/Pin;", pinFields, visibility = AnnotationVisibility.BUILD)))
        assertEquals(listOf("no model with a serialized id and images carries any of $all"),
            problems(model("Lfixture/Pin;", pinFields, flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)))
    }

    @Test
    fun `two equally likely pins are refused rather than guessed between`() {
        assertEquals(listOf("the pin model is ambiguous: Lfixture/Pin;, Lfixture/Story; each carry 12 of " +
            "[is_promoted, is_third_party_ad, pin_promotion_id_reformatted, campaign_id_reformatted, ai_disclosures, " +
            "digital_media_source_type, digital_media_source_type_label, is_eligible_for_pdp, is_video, videos, story_pin_data, grid_title]"),
            problems(board, videos, storyData, model("Lfixture/Story;", pinFields), model("Lfixture/Pin;", pinFields)))
    }
}
