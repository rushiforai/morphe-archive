/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredprofile

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.facebook.feed.GRAPHQL_STORY
import app.morphe.patches.facebook.feed.fillStoryModelStub
import app.morphe.patches.facebook.feed.methodsHolding
import app.morphe.patches.facebook.feed.reels.callsMethod
import app.morphe.patches.facebook.feed.storyModelAccessors
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.extension.requireLocals
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method

/** The extension class that judges a timeline unit, and the stub this patch fills in. */
internal const val PROFILE_AD_FILTER = "$EXTENSION_PACKAGE/ads/ProfileAdFilter;"
internal const val HIDE = "$PROFILE_AD_FILTER->hide(Ljava/lang/Object;)Z"
internal const val SPONSORED_DATA_STUB = "sponsoredData"

/** What the patch found: the render method, the field holding the unit, and the story's accessor. */
internal class TimelineStory(val render: Method, val unit: Field, val sponsoredData: Method)

/**
 * Leaves an ad out of a profile's timeline: the timeline story component answers no component for
 * a story that carries `sponsored_data`, as it already does for a row it won't draw. See
 * ProfilePostAnchors.kt for how the component and Facebook's own ad test are found. The profile's
 * own posts, and every other row of the profile, are drawn as before.
 */
@Suppress("unused")
val hideSponsoredProfilePostsPatch = bytecodePatch(
    name = "Hide sponsored profile posts",
    description = "Removes the ads between the posts on someone's profile or a Page. The profile's own posts stay.",
    default = true,
) {
    category("Ads")
    dependsOn(settingsPatch)
    dependsOn(facebookExtensionPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val story = timelineStory()
        fillStoryModelStub(PROFILE_AD_FILTER, SPONSORED_DATA_STUB, story.sponsoredData)
        mutableClassDefBy(story.render.definingClass).methods.single {
            it.name == story.render.name && it.returnType == story.render.returnType &&
                it.parameterTypes.map(Any::toString) == story.render.parameterTypes.map(Any::toString)
        }.skipSponsoredStories(story.unit)
        enableStatus("sponsoredProfilePosts")
    }
}

/**
 * The timeline story component's render method, held to the evidence the rule rests on: it's the
 * one method holding both test tags and the component's name, it asks the story for
 * `sponsored_data` through the one accessor GraphQLStory declares for it, and its class keeps the
 * unit in one field typed as an interface GraphQLStory implements, which the render method reads.
 */
internal fun BytecodePatchContext.timelineStory(): TimelineStory {
    val renders = classDefByStrings(SPONSORED_TEST_KEY, StringComparisonType.EQUALS)
        .flatMap { methodsHolding(it, SPONSORED_TEST_KEY) }
    if (renders.size != 1) {
        throw PatchException(
            "$PATCH: expected one method holding \"$SPONSORED_TEST_KEY\", found " +
                renders.joinToString { "${it.definingClass}->${it.name}" }.ifEmpty { "none" },
        )
    }
    val render = renders.single()
    if (!isTimelineStoryRender(render)) {
        throw PatchException(
            "$PATCH: ${render.definingClass}->${render.name} isn't the $COMPONENT_NAME render method: it should be an " +
                "instance method answering an object that holds \"$ORGANIC_TEST_KEY\" and \"$COMPONENT_NAME\" too",
        )
    }

    val story = classDefBy(GRAPHQL_STORY)
    val accessors = storyModelAccessors(story, SPONSORED_DATA_FIELD, SPONSORED_DATA_TYPE)
    val accessor = accessors.singleOrNull() ?: throw PatchException(
        "$PATCH: GraphQLStory has ${accessors.size} accessors of $SPONSORED_DATA_FIELD as $SPONSORED_DATA_TYPE, expected one",
    )
    if (!callsMethod(render, accessor)) {
        throw PatchException(
            "$PATCH: ${render.definingClass}->${render.name} no longer asks the story for $SPONSORED_DATA_FIELD " +
                "through GraphQLStory->${accessor.name}()",
        )
    }

    val component = classDefBy(render.definingClass)
    val fields = unitFields(component, storyInterfaces())
    val field = fields.singleOrNull() ?: throw PatchException(
        "$PATCH: ${component.type} has ${fields.size} fields typed as an interface of GraphQLStory, expected one: " +
            fields.joinToString { it.name },
    )
    if (!readsField(render, field)) {
        throw PatchException("$PATCH: ${render.definingClass}->${render.name} doesn't read ${component.type}->${field.name}")
    }
    return TimelineStory(render, field, accessor)
}

/** Every interface GraphQLStory implements, through its superclasses and the interfaces' own. */
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

/**
 * First thing in the render method: hand the extension the unit this row draws, and answer no
 * component when it says the row goes. Otherwise the render method runs from its first
 * instruction. v0 is free at index 0; `this` is copied down into it because `iget-object` names
 * its registers in four bits.
 */
internal fun MutableMethod.skipSponsoredStories(unit: Field) {
    if (unit.definingClass != definingClass || AccessFlags.STATIC.isSet(accessFlags)) {
        throw PatchException("$PATCH: $definingClass->$name can't read ${unit.definingClass}->${unit.name} from this")
    }
    requireLocals(PATCH, 1)
    addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, p0
            iget-object v0, v0, ${unit.definingClass}->${unit.name}:${unit.type}
            invoke-static { v0 }, $HIDE
            move-result v0
            if-eqz v0, :render
            const/4 v0, 0x0
            return-object v0
        """,
        ExternalLabel("render", getInstruction(0)),
    )
}
