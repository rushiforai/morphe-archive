/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed.suggested

import app.morphe.patches.facebook.feed.holdsString
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Where the "People you may know" carousel on your own profile comes from, on the 577 and 580
 * builds.
 *
 * Facebook draws a profile as a list of Litho sections under one root section, which names itself
 * "ProfileSection". Only when the profile's id is the viewer's (the profile root's check reads the
 * kept `profileId` and `viewerId` fields), and a server-side switch agrees, does the root add a
 * section that names itself "ProfilePeopleYouMayKnowSection": straight after the header, or inside
 * one named "ProfilePeopleYouMayKnowBelowIntrocardSection" that holds nothing else. That section's
 * children builder draws the suggestions the root already fetched, or adds a section that fetches
 * them and draws them when they arrive. Either way it draws one row: the title with its close
 * button, the cards in a horizontal scroll (PeopleYouMayKnowHScrollComponent, friending location
 * PYMK_TIMELINE) and the See all link, which opens the list for PYMK_SELF_PROFILE_SEE_ALL. No
 * other section builds that row.
 *
 * A section hands its children back as a Children object, and the section framework's
 * setChildren takes an empty one, or none, as no rows. The builder already hands back an empty
 * one when it has nothing to fetch, so answering an empty one for the switch leaves no gap and no
 * divider, and the profile's header, friends and posts are built as before.
 *
 * Kept names this leans on: the section's name, which its constructor hands to the section base
 * class; the base class's getLogTag() and setChildren(Children); and Children's getChildren().
 * Read from 577 and 580 (2026-09-27): the section is `LX/IXo;` on 577 and `LX/MCI;` on 580, its
 * children builder `A3Y` and `A1S`, Children `LX/2em;` and `LX/2hJ;`. None of those names is
 * used here.
 *
 * [PROFILE_PYMK_SECTION] is the kept literal: the name the carousel's section gives itself.
 */
internal const val PROFILE_PYMK_SECTION = "ProfilePeopleYouMayKnowSection"

/** The section base class's kept getter of a section's name, which the extension reads. */
internal const val LOG_TAG = "getLogTag"

/** The section base class's kept setter of a section's children. */
internal const val SET_CHILDREN = "setChildren"

/** Children's kept getter of the list it holds. */
internal const val GET_CHILDREN = "getChildren"

private const val STRING = "Ljava/lang/String;"

private val DIRECT_INVOKES = setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE)

private fun Method.parameters(): List<String> = parameterTypes.map(Any::toString)

private fun Method.isInstanceWithBody(): Boolean =
    implementation != null && !AccessFlags.STATIC.isSet(accessFlags) && !AccessFlags.ABSTRACT.isSet(accessFlags)

/**
 * A section's children builder: an instance method with a body that takes the section's context
 * and hands back an object. A constructor answers void, so it's never one.
 */
internal fun isChildrenBuilder(method: Method): Boolean =
    method.isInstanceWithBody() && method.parameterTypes.size == 1 &&
        method.parameters().single().startsWith("L") && method.returnType.startsWith("L")

/** The children builders of [section] that load [PROFILE_PYMK_SECTION]. The patch wants exactly one. */
internal fun profileSuggestionBuilders(section: ClassDef): List<Method> =
    section.methods.filter { isChildrenBuilder(it) && holdsString(it, PROFILE_PYMK_SECTION) }

/**
 * Whether a constructor of [section] loads [PROFILE_PYMK_SECTION] and hands a string to its
 * superclass's `(String)` constructor: the name the section base class keeps and getLogTag()
 * answers.
 */
internal fun namesItself(section: ClassDef): Boolean = section.methods.any { method ->
    method.name == "<init>" && holdsString(method, PROFILE_PYMK_SECTION) &&
        method.implementation?.instructions?.any { instruction ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            instruction.opcode in DIRECT_INVOKES && call != null && call.definingClass == section.superclass &&
                call.name == "<init>" && call.parameterTypes.map(Any::toString) == listOf(STRING)
        } == true
}

/**
 * Whether [base] is a section base class whose children are [children]: it declares the kept
 * getLogTag() answering a string, with a body, and setChildren taking [children].
 */
internal fun isSectionBase(base: ClassDef, children: String): Boolean =
    base.methods.any {
        it.name == LOG_TAG && it.parameterTypes.isEmpty() && it.returnType == STRING && it.isInstanceWithBody()
    } && base.methods.any {
        it.name == SET_CHILDREN && it.parameters() == listOf(children) && it.returnType == "V" &&
            !AccessFlags.STATIC.isSet(it.accessFlags)
    }

/**
 * Whether the patch can make an empty [children] the way Facebook does: a class that can be
 * instantiated, with a public constructor taking nothing and the kept getChildren() answering a
 * list.
 */
internal fun isChildrenList(children: ClassDef): Boolean =
    !AccessFlags.ABSTRACT.isSet(children.accessFlags) && !AccessFlags.INTERFACE.isSet(children.accessFlags) &&
        children.methods.any {
            it.name == "<init>" && it.parameterTypes.isEmpty() && AccessFlags.PUBLIC.isSet(it.accessFlags)
        } && children.methods.any {
            it.name == GET_CHILDREN && it.parameterTypes.isEmpty() && it.returnType == "Ljava/util/List;"
        }
