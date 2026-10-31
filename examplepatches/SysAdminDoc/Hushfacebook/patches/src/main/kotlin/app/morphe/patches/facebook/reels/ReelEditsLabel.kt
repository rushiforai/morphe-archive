/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.util.classDefForEachReferencing
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

/*
 * "Made with Edits" under a reel's caption (#314). Read from 585, 2026-10-30, arm64; the obfuscated
 * names here are for reviewers, the code never writes one down.
 *
 * - The line under the caption is one of three components a factory (LX/09dx;->A00) picks by a
 *   number a helper (LX/09dy;->A00) works out from the video. A video whose tree has
 *   is_made_with_edits_app true gets 1, and the factory builds LX/0cA4;.
 * - That component's render reads the same flag again and draws string 0x7f14289e when it's true.
 *   Otherwise it returns null, which draws nothing. The hook answers null first thing.
 * - The chips under a reel are a list of their own (XFBFBShortsEditsAppAttribution is one the chips
 *   switch already hides), so the chip filter never saw this line. It goes with the same switch.
 * - The other two readers of the flag are static helpers, not renders.
 */

internal const val HIDE_EDITS_LABEL = "$EXTENSION_PACKAGE/reels/ReelDeclutter;->hideEditsLabel()Z"

/** The video flag the line is drawn for. Its tree key is the name's String.hashCode(). */
internal val MADE_WITH_EDITS = "is_made_with_edits_app".hashCode()

private const val PATCH = "Clean up Reels"

/**
 * Whether [method] is the "Made with Edits" line's render: a Litho `render`, an instance method of one
 * argument with an object back, that reads [MADE_WITH_EDITS] and only that through TreeJNI.getBooleanValue.
 */
internal fun isEditsLabelRender(method: Method): Boolean {
    if (method.name != RENDER || AccessFlags.STATIC.isSet(method.accessFlags) || method.parameterTypes.size != 1 ||
        !method.returnType.startsWith("L")
    ) return false
    val reads = treeBooleanReads(method)
    return reads.isNotEmpty() && reads.all { it.keys == setOf(MADE_WITH_EDITS) }
}

/** The line's render asks the extension first thing and answers null, Facebook's own answer for any other video. */
internal fun BytecodePatchContext.hideEditsLabel() {
    val renders = mutableListOf<Pair<String, Method>>()
    classDefForEachReferencing(names = listOf("getBooleanValue")) { classDef ->
        if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEachReferencing
        classDef.methods.filter(::isEditsLabelRender).mapTo(renders) { classDef.type to it }
    }
    val (owner, render) = renders.singleOrNull()
        ?: throw PatchException("$PATCH: expected one render reading only is_made_with_edits_app, found ${renders.size}")
    mutableClassDefBy(owner).methods.single {
        it.name == render.name && it.parameterTypes.map(CharSequence::toString) == render.parameterTypes.map(CharSequence::toString)
    }.returnNullWhen(HIDE_EDITS_LABEL)
}
