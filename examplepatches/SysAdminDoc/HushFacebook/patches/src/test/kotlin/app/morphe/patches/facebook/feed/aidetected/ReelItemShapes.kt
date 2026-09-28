/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.aidetected

import app.morphe.patches.facebook.feed.GRAPHQL_STORY
import app.morphe.patches.facebook.feed.TREE_JNI
import app.morphe.patches.facebook.feed.treeFieldKey
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/*
 * The shapes the extension's tree reader relies on in Facebook's Reels tab, as the fixture tests
 * hold both builds to them. The patch doesn't search for any of these: the extension finds the
 * holder at run time by what its fields are declared as, and fails open when it finds none. These
 * only pin today's builds, so a build that moves the model or the field shows up in a test run.
 */

/** Kept log literal of Facebook's Reels menu, in the method that decides its "AI info" row. */
internal const val REEL_MENU_GENAI_LOG = "GenAI info NFX action was sent for reel, but the video is not " +
    "self-disclosed nor detected as generated with AI. Will not show in 3-dot menu."

/** Kept literal of the helper that builds the Reels tab's items (VideoHomeMutableDataHelper). */
internal const val MUTABLE_DATA_HELPER = "VideoHomeMutableDataHelper"

private fun ClassDef.instanceFieldTypes(): List<String> =
    fields.filterNot { AccessFlags.STATIC.isSet(it.accessFlags) }.map { it.type }

/** Whether [classDef] is a reel holder: it declares an instance field of [modelType] and one of GraphQLStory. */
internal fun isReelHolder(classDef: ClassDef, modelType: String): Boolean {
    val types = classDef.instanceFieldTypes()
    return modelType in types && GRAPHQL_STORY in types
}

/** Whether [classDef] declares an instance field the typed reader finds: one of [modelType] or GraphQLStory. */
internal fun holdsModelOrStory(classDef: ClassDef, modelType: String): Boolean =
    classDef.instanceFieldTypes().any { it == modelType || it == GRAPHQL_STORY }

private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Method.loads(key: Int) = body().any { (it as? NarrowLiteralInstruction)?.narrowLiteral == key }

private fun Method.callsBooleanReader() = body().any {
    val call = it.call()
    call?.definingClass == TREE_JNI && call.name == TREE_BOOLEAN_READER && call.returnType == "Z" &&
        call.parameterTypes.map { p -> p.toString() } == listOf("I")
}

/**
 * Whether [method] is Facebook's Reels menu decision reading the detected info on the reel's
 * model: static, handed the model and a holder among its parameters, and loading the key of
 * `ai_generated_detected_info`. The flag inside it, `was_detected_as_ai_generated`, is read through
 * `TreeJNI.getBooleanValue` either in the method itself or in one of [helpers], the static
 * `(TreeJNI)Z` methods it calls (577 keeps that read in one).
 */
internal fun readsDetectedInfoOnModel(method: Method, modelType: String, holderType: String, helpers: List<Method>): Boolean {
    if (!AccessFlags.STATIC.isSet(method.accessFlags)) return false
    val parameters = method.parameterTypes.map { it.toString() }
    if (modelType !in parameters || holderType !in parameters) return false
    if (!method.loads(treeFieldKey(DETECTED_INFO_FIELD))) return false
    val flag = treeFieldKey(DETECTED_FLAG)
    if (method.loads(flag) && method.callsBooleanReader()) return true
    val called = method.body().mapNotNull { it.call() }.map { "${it.definingClass}->${it.name}" }.toSet()
    return helpers.any {
        "${it.definingClass}->${it.name}" in called && AccessFlags.STATIC.isSet(it.accessFlags) &&
            it.returnType == "Z" && it.parameterTypes.map { p -> p.toString() } == listOf(TREE_JNI) &&
            it.loads(flag) && it.callsBooleanReader()
    }
}

/** The static `(TreeJNI)Z` methods [method] calls, as references, for a caller to resolve. */
internal fun treeFlagHelperCalls(method: Method): List<MethodReference> = method.body().mapNotNull { it.call() }.filter {
    it.returnType == "Z" && it.parameterTypes.map { p -> p.toString() } == listOf(TREE_JNI)
}.distinctBy { "${it.definingClass}->${it.name}" }

/** The classes whose constructors [method] calls with a [holderType] among the arguments. */
internal fun constructedWith(method: Method, holderType: String): Set<String> = method.body().mapNotNull { it.call() }
    .filter { it.name == "<init>" && holderType in it.parameterTypes.map { p -> p.toString() } }
    .map { it.definingClass }
    .filterNot { it == holderType }
    .toSet()
