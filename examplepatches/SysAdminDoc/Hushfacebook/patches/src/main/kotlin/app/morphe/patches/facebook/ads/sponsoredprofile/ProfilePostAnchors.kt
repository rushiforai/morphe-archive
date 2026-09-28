/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredprofile

import app.morphe.patches.facebook.feed.holdsString
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Where a post on a profile's timeline is drawn, and how Facebook itself tells an ad there from
 * the profile's own posts, on the 577 and 580 builds.
 *
 * Every post on a profile or Page timeline is drawn by one Litho component, which names itself
 * "TimelineStoryComponent" and keeps the timeline unit it draws in a field typed as the feed unit
 * interface GraphQLStory implements. For a GraphQLStory its render method asks the story for its
 * `sponsored_data` model (key 0xf81382f0, the Java hashCode of the name, as a `SponsoredData`, type
 * tag 0x1456568f) and tags the row "sponsored_timeline_stories_test_key" when there is one and
 * "timeline_stories_test_key" when there isn't. A story carries `sponsored_data` only when it's
 * delivered as an ad, so that is Facebook's own "this post is an ad" on a timeline, and it's the
 * one method holding the sponsored tag in either build.
 *
 * The render method already answers no component for a unit it won't draw (a fan hub row whose
 * gate is off), which leaves no row behind, so answering none for an ad does the same.
 *
 * Read from 577 and 580 (2026-09-27): the component is `LX/Anc;` on 577 and `LX/AHs;` on 580, its
 * render method `A1N` and `A1F`, the unit field `A03` of `LX/2LO;` and `LX/3Te;` (the first
 * interface GraphQLStory declares on each), and the story's accessor `A0S` and `A0T`. None of
 * those names is used here.
 */
internal const val PATCH = "Hide sponsored profile posts"

/** Kept literals. The test tags the render method puts on an ad's row and on any other post's. */
internal const val SPONSORED_TEST_KEY = "sponsored_timeline_stories_test_key"
internal const val ORGANIC_TEST_KEY = "timeline_stories_test_key"

/** Kept literal. The name the component gives itself. */
internal const val COMPONENT_NAME = "TimelineStoryComponent"

/** The story's field an ad carries, and its GraphQL type. */
internal const val SPONSORED_DATA_FIELD = "sponsored_data"
internal const val SPONSORED_DATA_TYPE = "SponsoredData"

/**
 * Whether [method] is the timeline story component's render method: an instance method with a
 * body, answering an object, that holds both test tags and the component's name.
 */
internal fun isTimelineStoryRender(method: Method): Boolean =
    method.implementation != null && !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.returnType.startsWith("L") && holdsString(method, SPONSORED_TEST_KEY) &&
        holdsString(method, ORGANIC_TEST_KEY) && holdsString(method, COMPONENT_NAME)

/**
 * The instance fields of [component] whose type is one of [storyTypes], the interfaces
 * GraphQLStory implements: where the component keeps the unit it draws. The patch wants exactly one.
 */
internal fun unitFields(component: ClassDef, storyTypes: Set<String>): List<Field> =
    component.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type in storyTypes }

/** Whether [method] reads [field] of its own class with `iget-object`. */
internal fun readsField(method: Method, field: Field): Boolean =
    method.implementation?.instructions?.any { instruction ->
        if (instruction.opcode != Opcode.IGET_OBJECT) return@any false
        val read = (instruction as ReferenceInstruction).reference as FieldReference
        read.definingClass == field.definingClass && read.name == field.name && read.type == field.type
    } == true
