/*
 * Adapted from Hushfacebook (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0),
 * feed/StoryModels.kt. Copyright 2026 Hushfacebook contributors.
 * Modified for facebook-morphe-patches, 2026.
 */
package app.fbpatches.patches.facebook.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.security.MessageDigest

/** Kept name. The feed's story model. */
internal const val GRAPHQL_STORY = "Lcom/facebook/graphql/model/GraphQLStory;"

/** Kept name. Every tree-backed GraphQL model, with the cached field readers. */
internal const val BASE_MODEL_WITH_TREE = "Lcom/facebook/graphql/modelutil/BaseModelWithTree;"

/** How Facebook's tree models key a field: the String.hashCode() of its GraphQL name. */
internal fun treeFieldKey(name: String): Int = name.hashCode()

/** How Facebook's tree models tag a GraphQL type: the first four bytes of the MD5 of its name. */
internal fun treeTypeTag(name: String): Int {
    val digest = MessageDigest.getInstance("MD5").digest(name.toByteArray(Charsets.UTF_8))
    return ((digest[0].toInt() and 0xff) shl 24) or ((digest[1].toInt() and 0xff) shl 16) or
        ((digest[2].toInt() and 0xff) shl 8) or (digest[3].toInt() and 0xff)
}

internal fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

internal fun Instruction.methodReference(): MethodReference? =
    (this as? ReferenceInstruction)?.reference as? MethodReference

internal fun Instruction.literal(): Int? = (this as? NarrowLiteralInstruction)?.narrowLiteral

private fun MethodReference.isTreeCall(name: String, parameters: List<String>): Boolean =
    definingClass == BASE_MODEL_WITH_TREE && this.name == name &&
        parameterTypes.map { it.toString() } == parameters

/**
 * Whether [method] is [owner]'s accessor of the model held under [field], of GraphQL type [type]:
 * public, no arguments, returning an object, asking getCachedModel for that field key and type tag.
 */
internal fun isModelAccessor(method: Method, owner: String, field: String, type: String): Boolean {
    if (method.definingClass != owner || method.parameterTypes.isNotEmpty()) return false
    if (!AccessFlags.PUBLIC.isSet(method.accessFlags) || AccessFlags.STATIC.isSet(method.accessFlags)) return false
    if (method.returnType.length < 3 || !method.returnType.startsWith("L")) return false
    val body = method.body()
    return body.any { it.literal() == treeFieldKey(field) } &&
        body.any { it.literal() == treeTypeTag(type) } &&
        body.any { it.methodReference()?.isTreeCall("getCachedModel", listOf("I", "Ljava/lang/Class;", "I")) == true }
}

/** Every accessor [owner] declares of the model under [field] as [type]. */
internal fun modelAccessors(owner: ClassDef, field: String, type: String): List<Method> =
    owner.methods.filter { isModelAccessor(it, owner.type, field, type) }

/** Whether [method] calls [target]. */
internal fun callsMethod(method: Method, target: Method): Boolean = method.body().any { instruction ->
    val call = instruction.methodReference() ?: return@any false
    call.definingClass == target.definingClass && call.name == target.name &&
        call.returnType == target.returnType &&
        call.parameterTypes.map { it.toString() } == target.parameterTypes.map { it.toString() }
}

/** Fills the extension stub [stubClass]->[stubName](Object)Object with a call of [accessor] on the argument. */
internal fun BytecodePatchContext.fillStoryModelStub(stubClass: String, stubName: String, accessor: Method) {
    if (accessor.parameterTypes.isNotEmpty() || AccessFlags.STATIC.isSet(accessor.accessFlags) ||
        !accessor.returnType.startsWith("L")
    ) {
        throw PatchException("${accessor.definingClass}->${accessor.name} isn't an accessor $stubName can call")
    }
    val stub = mutableClassDefBy(stubClass).methods.singleOrNull {
        it.name == stubName && AccessFlags.STATIC.isSet(it.accessFlags) &&
            it.returnType == "Ljava/lang/Object;" &&
            it.parameterTypes.map { type -> type.toString() } == listOf("Ljava/lang/Object;")
    } ?: throw PatchException("$stubClass has no static Object $stubName(Object)")
    val host = accessor.definingClass
    stub.addInstructions(
        0,
        """
            check-cast p0, $host
            invoke-virtual { p0 }, $host->${accessor.name}()${accessor.returnType}
            move-result-object p0
            return-object p0
        """,
    )
}

/** The static helper added to GraphQLStory: whether an object is a story carrying sponsored_data. */
internal const val IS_SPONSORED_HELPER = "fbpatchesIsSponsored"
internal const val IS_SPONSORED_STORY = "$GRAPHQL_STORY->$IS_SPONSORED_HELPER(Ljava/lang/Object;)Z"

/** The one GraphQLStory accessor of `sponsored_data` as `SponsoredData`. */
internal fun BytecodePatchContext.sponsoredDataAccessor(): Method {
    val accessors = modelAccessors(classDefBy(GRAPHQL_STORY), "sponsored_data", "SponsoredData")
    return accessors.singleOrNull() ?: throw PatchException(
        "GraphQLStory has ${accessors.size} accessors of sponsored_data as SponsoredData, expected one",
    )
}

/**
 * Adds [IS_SPONSORED_STORY] to GraphQLStory unless it's there already: true for a GraphQLStory whose
 * sponsored_data model is set, which Facebook only sets on a story delivered as an ad.
 */
internal fun BytecodePatchContext.addIsSponsoredStoryHelper() {
    val story = mutableClassDefBy(GRAPHQL_STORY)
    if (story.methods.any { it.name == IS_SPONSORED_HELPER }) return
    val accessor = sponsoredDataAccessor()
    story.methods.add(
        ImmutableMethod(
            GRAPHQL_STORY,
            IS_SPONSORED_HELPER,
            listOf(ImmutableMethodParameter("Ljava/lang/Object;", null, null)),
            "Z",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(2),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    instance-of v0, p0, $GRAPHQL_STORY
                    if-eqz v0, :no
                    check-cast p0, $GRAPHQL_STORY
                    invoke-virtual { p0 }, $GRAPHQL_STORY->${accessor.name}()${accessor.returnType}
                    move-result-object v0
                    if-eqz v0, :no
                    const/4 v0, 0x1
                    return v0
                    :no
                    const/4 v0, 0x0
                    return v0
                """,
            )
        },
    )
}
