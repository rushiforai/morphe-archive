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
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

/**
 * The JSON name on a field's Gson annotation, the way the extension's ModelFields finds it: the
 * annotation's own class is renamed in every build, so it's known by its `value` element, and only
 * an annotation kept for run time is one the extension can read.
 */
internal fun Field.json(): String? = annotations.filter { it.visibility == AnnotationVisibility.RUNTIME }
    .flatMap { it.elements }.firstNotNullOfOrNull { if (it.name == "value") (it.value as? StringEncodedValue)?.value else null }

/** [model]'s instance fields that have a JSON name, by that name, to their declared types. */
internal fun serializedFields(model: ClassDef): Map<String, String> {
    val found = mutableMapOf<String, String>()
    for (field in model.fields) {
        if (AccessFlags.STATIC.isSet(field.accessFlags)) continue
        val name = field.json() ?: continue
        found.putIfAbsent(name, field.type)
    }
    return found
}

private val BOOLEAN = listOf("Ljava/lang/Boolean;", "Z")
private val TEXT = listOf("Ljava/lang/String;")
private val ENTRIES = listOf("Ljava/util/List;")
private val MAP = listOf("Ljava/util/Map;")

/** Any object type, for `isSet` on a field whose class is renamed in every build (an enum, say). */
private val OBJECT = listOf("an object")

/**
 * The pin fields Hide ads, Hide AI-labeled pins, Hide shopping and Filter feed filter on, with the
 * declared types ModelFields can use for each: `isTrue` compares with Boolean.TRUE, which a
 * primitive boolean boxes to as well, `hasText` needs a String, `hasEntries` a List and `isSet`
 * (or a read into a nested model) any object.
 */
internal val PIN_FILTER_FIELDS: Map<String, List<String>> = linkedMapOf(
    "is_promoted" to BOOLEAN,
    "is_third_party_ad" to BOOLEAN,
    "pin_promotion_id_reformatted" to TEXT,
    "campaign_id_reformatted" to TEXT,
    "ai_disclosures" to ENTRIES,
    "digital_media_source_type" to OBJECT,
    "digital_media_source_type_label" to TEXT,
    "is_eligible_for_pdp" to BOOLEAN,
    "is_video" to BOOLEAN,
    "videos" to OBJECT,
    "story_pin_data" to OBJECT,
    // How PinWords tells a pin from other models, for the AI words and video filters.
    "grid_title" to TEXT,
)

/**
 * The fields read inside a pin's nested models, each with the pin field that holds the model:
 * VideoPins wants a Map for `video_list` and a String for `total_video_duration`, and Download pin
 * walks the Lists in `pages` and `pages_preview` for an idea pin's video.
 */
internal val NESTED_FILTER_FIELDS: List<Triple<String, String, List<String>>> = listOf(
    Triple("videos", "video_list", MAP),
    Triple("story_pin_data", "total_video_duration", TEXT),
    Triple("story_pin_data", "pages", ENTRIES),
    Triple("story_pin_data", "pages_preview", ENTRIES),
)

private fun fits(type: String, types: List<String>) = type in types || (types === OBJECT && type.startsWith("L"))

private fun expected(key: String) = "$key (expected ${PIN_FILTER_FIELDS.getValue(key).joinToString(" or ")})"

/**
 * The pin model's type among [models], told from other id and image models as [pinSchemaProblems]
 * tells it, or null when none or more than one qualifies.
 */
internal fun pinModel(models: Map<String, Map<String, String>>): String? {
    val carried = models.filterValues { "id" in it && "images" in it }
        .mapValues { (_, fields) -> PIN_FILTER_FIELDS.keys.count { it in fields } }
    val most = carried.values.maxOrNull() ?: 0
    return if (most == 0) null else carried.filterValues { it == most }.keys.singleOrNull()
}

/**
 * Each way the pin model among [models] (class type to its [serializedFields]) fails
 * [PIN_FILTER_FIELDS], naming the key and the type expected; empty when it holds. Boards, users and
 * stories carry a serialized `id` and `images` too, so the pin is the one of those that carries
 * the most of the filtered fields. A single renamed or retyped field still finds it and fails on
 * that field, instead of on the class going missing.
 */
internal fun pinSchemaProblems(models: Map<String, Map<String, String>>): List<String> {
    val shaped = models.filterValues { "id" in it && "images" in it }
    val carried = shaped.mapValues { (_, fields) -> PIN_FILTER_FIELDS.keys.count { it in fields } }
    val most = carried.values.maxOrNull() ?: 0
    if (most == 0) {
        return listOf("no model with a serialized id and images carries any of " +
            PIN_FILTER_FIELDS.keys.joinToString { expected(it) })
    }
    val pins = carried.filterValues { it == most }.keys.sorted()
    if (pins.size > 1) return listOf("the pin model is ambiguous: ${pins.joinToString()} each carry $most of ${PIN_FILTER_FIELDS.keys}")
    val pin = pins.single()
    val fields = shaped.getValue(pin)
    val own = PIN_FILTER_FIELDS.mapNotNull { (key, types) ->
        val type = fields[key]
        when {
            type == null -> "$pin has no field named ${expected(key)}"
            !fits(type, types) -> "$pin field $key is $type, expected ${types.joinToString(" or ")}"
            else -> null
        }
    }
    // A missing or retyped holder field already failed above, so only a model that's there is read.
    val nested = NESTED_FILTER_FIELDS.mapNotNull { (holder, key, types) ->
        val model = fields[holder]?.takeIf { it.startsWith("L") } ?: return@mapNotNull null
        val type = models[model]?.get(key)
        when {
            models[model] == null -> "$pin field $holder is $model, which isn't a model with JSON names"
            type == null -> "$model ($pin's $holder) has no field named $key (expected ${types.joinToString(" or ")})"
            !fits(type, types) -> "$model ($pin's $holder) field $key is $type, expected ${types.joinToString(" or ")}"
            else -> null
        }
    }
    return own + nested
}
