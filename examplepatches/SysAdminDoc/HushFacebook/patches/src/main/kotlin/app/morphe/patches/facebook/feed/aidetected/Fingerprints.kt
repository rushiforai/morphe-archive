/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.aidetected

import app.morphe.patches.facebook.feed.isStoryModelAccessor
import app.morphe.patches.facebook.feed.readsStoryFlag
import app.morphe.patches.facebook.feed.storyModelAccessors
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

/**
 * Kept name. The plugin that draws Facebook's own AI label in a feed post's header. The rule reads
 * the flag this plugin reads, from the model it reads it on.
 */
internal const val GEN_AI_TRANSPARENCY_PLUGIN =
    "Lcom/facebook/feed/plugins/header/subtitle/impl/genaitransparency/GenAiTransparencyPlugin;"

/**
 * The GraphQL names behind the rule, keyed the way StoryModels.kt describes.
 *
 * Read from 573, 577 and 580 (2026-09-25): GraphQLStory has one zero-argument method that asks
 * `getCachedModel` for the field keyed `ai_generated_detected_info` (0xb4f9e684) as the type tagged
 * `XFBAIGeneratedDetectedInfo` (0x70da9d19). It is `A0W()` returning `LX/41R;` in 573,
 * `A0W()` returning `LX/3zX;` in 577 and `A0X()` returning `LX/3zi;` in 580, where 577's `A0X()`
 * is the neighbouring `ai_generated_self_disclosure_info` accessor. GenAiTransparencyPlugin.A01
 * calls it and reads the boolean keyed `was_detected_as_ai_generated` (0x723ea5fe) with
 * `getCachedBoolean` in all three. FroggoMorphePatches' 573 filter pointed there first; its names
 * don't carry over, which is why nothing here writes one down.
 */
internal const val DETECTED_INFO_FIELD = "ai_generated_detected_info"
internal const val DETECTED_INFO_TYPE = "XFBAIGeneratedDetectedInfo"
internal const val DETECTED_FLAG = "was_detected_as_ai_generated"

/** Whether [method] is GraphQLStory's accessor of the detected-AI info. */
internal fun isDetectedInfoAccessor(method: Method): Boolean =
    isStoryModelAccessor(method, DETECTED_INFO_FIELD, DETECTED_INFO_TYPE)

/** The detected-info accessors [story] declares. The patch wants exactly one. */
internal fun detectedInfoAccessors(story: ClassDef): List<Method> =
    storyModelAccessors(story, DETECTED_INFO_FIELD, DETECTED_INFO_TYPE)

/**
 * Whether [method] calls [accessor] and then reads [DETECTED_FLAG] with `getCachedBoolean`. That is
 * how GenAiTransparencyPlugin decides a post carries Facebook's detected-AI label.
 */
internal fun readsDetectedFlag(method: Method, accessor: Method): Boolean =
    readsStoryFlag(method, accessor, DETECTED_FLAG)

/**
 * The creator's own AI label, keyed the same way.
 *
 * Read from 577 and 580 (2026-09-27): GraphQLStory has one zero-argument method that asks
 * `getCachedModel` for the field keyed `ai_generated_self_disclosure_info` (0x73da0c74) as the type
 * tagged `XFBAIGeneratedSelfDisclosureInfo` (0x9213d34e): `A0X()` in 577 and `A0Y()` in 580, both
 * returning the same model class as the detected-info accessor. GenAiTransparencyPlugin.A01 calls it
 * right after the detected one and reads `was_self_disclosed_as_ai_generated` (0xbc6e7b43) with
 * `getCachedBoolean`, and puts the two flags side by side in the label's data class. The header's
 * subtitle decision (580 `LX/25t;->A1t`, 577 `LX/1xW;->A1r`, the GenAI case) shows the label when
 * the self-disclosed flag is true, or when the detected one is and the transparency type isn't
 * PROVENANCE_DETECTED_EDITED; its text is the server's `zero_click_transparency_label`, else
 * Facebook's own "AI content" or "AI info" string. The industry signals (C2PA, IPTC, invisible
 * watermark) are a `gen_ai_provenance_type` list on the detected-info model, so they reach the label
 * only through the detected flag.
 */
internal const val SELF_DISCLOSURE_INFO_FIELD = "ai_generated_self_disclosure_info"
internal const val SELF_DISCLOSURE_INFO_TYPE = "XFBAIGeneratedSelfDisclosureInfo"
internal const val SELF_DISCLOSED_FLAG = "was_self_disclosed_as_ai_generated"

/** Whether [method] is GraphQLStory's accessor of the creator's AI label info. */
internal fun isSelfDisclosureInfoAccessor(method: Method): Boolean =
    isStoryModelAccessor(method, SELF_DISCLOSURE_INFO_FIELD, SELF_DISCLOSURE_INFO_TYPE)

/** The self-disclosure accessors [story] declares. The patch wants exactly one. */
internal fun selfDisclosureInfoAccessors(story: ClassDef): List<Method> =
    storyModelAccessors(story, SELF_DISCLOSURE_INFO_FIELD, SELF_DISCLOSURE_INFO_TYPE)

/**
 * Whether [method] calls [accessor] and then reads [SELF_DISCLOSED_FLAG] with `getCachedBoolean`.
 * That is how GenAiTransparencyPlugin learns the post's creator labelled it as AI.
 */
internal fun readsSelfDisclosedFlag(method: Method, accessor: Method): Boolean =
    readsStoryFlag(method, accessor, SELF_DISCLOSED_FLAG)
