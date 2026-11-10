/*
 * Forked from Hushfacebook (https://github.com/SysAdminDoc/Hushfacebook, GPL-3.0),
 * ads/sponsoredprofile. Copyright 2026 Hushfacebook contributors.
 * Modified for facebook-morphe-patches, 2026: always on; the sponsored_data check is a static helper
 * added to GraphQLStory instead of an extension stub.
 */
package app.fbpatches.patches.facebook.ads.profile

import app.fbpatches.patches.facebook.shared.GRAPHQL_STORY
import app.fbpatches.patches.facebook.shared.IS_SPONSORED_STORY
import app.fbpatches.patches.facebook.shared.addIsSponsoredStoryHelper
import app.fbpatches.patches.facebook.shared.callsMethod
import app.fbpatches.patches.facebook.shared.holdsString
import app.fbpatches.patches.facebook.shared.mutableMethodOf
import app.fbpatches.patches.facebook.shared.parameterRegister
import app.fbpatches.patches.facebook.shared.requireLocals
import app.fbpatches.patches.facebook.shared.sponsoredDataAccessor
import app.fbpatches.patches.shared.Constants.COMPATIBILITY_FACEBOOK
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/*
 * Every post on a profile or Page timeline is drawn by one Litho component named
 * "TimelineStoryComponent". Its render method asks the story for sponsored_data and tags the row
 * "sponsored_timeline_stories_test_key" when there is one. It already answers no component for a
 * row it won't draw, which leaves no gap, so answering none for an ad does the same.
 *
 * Up to 584 the unit is a field of the component; 585 makes the component stateless and passes the
 * unit as a render parameter typed as a GraphQLStory interface.
 */
private const val PATCH = "Hide sponsored profile posts"
private const val SPONSORED_TEST_KEY = "sponsored_timeline_stories_test_key"
private const val ORGANIC_TEST_KEY = "timeline_stories_test_key"
private const val COMPONENT_NAME = "TimelineStoryComponent"

private sealed interface StoryUnit {
    class InField(val field: Field) : StoryUnit
    class InParameter(val index: Int) : StoryUnit
}

@Suppress("unused")
val hideSponsoredProfilePostsPatch = bytecodePatch(
    name = "Hide sponsored profile posts",
    description = "Removes the ads between posts on someone's profile or a Page.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACEBOOK)

    execute {
        val renders = classDefByStrings(SPONSORED_TEST_KEY, StringComparisonType.EQUALS)
            .flatMap { classDef -> classDef.methods.filter { holdsString(it, SPONSORED_TEST_KEY) } }
        val render = renders.singleOrNull()
            ?: throw PatchException("$PATCH: expected one method holding \"$SPONSORED_TEST_KEY\", found ${renders.size}")
        if (render.implementation == null || AccessFlags.STATIC.isSet(render.accessFlags) ||
            !render.returnType.startsWith("L") || !holdsString(render, ORGANIC_TEST_KEY) ||
            !holdsString(render, COMPONENT_NAME)
        ) {
            throw PatchException("$PATCH: ${render.definingClass}->${render.name} isn't the $COMPONENT_NAME render method")
        }
        if (!callsMethod(render, sponsoredDataAccessor())) {
            throw PatchException("$PATCH: ${render.definingClass}->${render.name} no longer asks the story for sponsored_data")
        }

        val unit = unitOf(render)
        addIsSponsoredStoryHelper()
        mutableMethodOf(render).skipSponsoredStories(unit)
    }
}

private fun BytecodePatchContext.storyInterfaces(): Set<String> {
    val found = mutableSetOf<String>()
    val pending = ArrayDeque<String>()
    var type: String? = GRAPHQL_STORY
    while (type != null) {
        val classDef = classDefByOrNull(type) ?: break
        pending += classDef.interfaces
        type = classDef.superclass
    }
    while (pending.isNotEmpty()) {
        val next = pending.removeFirst()
        if (found.add(next)) classDefByOrNull(next)?.let { pending += it.interfaces }
    }
    return found
}

private fun BytecodePatchContext.unitOf(render: Method): StoryUnit {
    val interfaces = storyInterfaces()
    val component = classDefBy(render.definingClass)
    val fields = component.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type in interfaces }
    val parameters = render.parameterTypes.withIndex().filter { it.value.toString() in interfaces }.map { it.index }
    if (fields.size + parameters.size != 1) {
        throw PatchException(
            "$PATCH: expected the unit in one field of ${component.type} or one parameter of ${render.name}, " +
                "found ${fields.size} fields and ${parameters.size} parameters",
        )
    }
    val field = fields.singleOrNull() ?: return StoryUnit.InParameter(parameters.single())
    val reads = render.implementation?.instructions?.any { instruction ->
        if (instruction.opcode != Opcode.IGET_OBJECT) return@any false
        val read = (instruction as ReferenceInstruction).reference as FieldReference
        read.definingClass == field.definingClass && read.name == field.name && read.type == field.type
    } == true
    if (!reads) throw PatchException("$PATCH: ${render.name} doesn't read ${component.type}->${field.name}")
    return StoryUnit.InField(field)
}

/** First thing in the render method: answer no component for a sponsored story. v0 is free at index 0. */
private fun MutableMethod.skipSponsoredStories(unit: StoryUnit) {
    val load = when (unit) {
        is StoryUnit.InField -> {
            val field = unit.field
            "move-object/from16 v0, p0\niget-object v0, v0, ${field.definingClass}->${field.name}:${field.type}"
        }
        is StoryUnit.InParameter -> "move-object/from16 v0, ${parameterRegister(unit.index)}"
    }
    requireLocals(PATCH, 1)
    addInstructionsWithLabels(
        0,
        """
            $load
            invoke-static { v0 }, $IS_SPONSORED_STORY
            move-result v0
            if-eqz v0, :render
            const/4 v0, 0x0
            return-object v0
        """,
        ExternalLabel("render", getInstruction(0)),
    )
}
