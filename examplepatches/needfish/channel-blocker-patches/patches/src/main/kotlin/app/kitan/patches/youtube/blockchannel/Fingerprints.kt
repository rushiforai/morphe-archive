/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * ContextualMenuItemBuilderFingerprint / ContextualMenuItemBuilderOnClickFingerprint
 * ported from MorpheApp/morphe-patches (layout/hide/general/Fingerprints.kt),
 * which hard forked ReVanced. See the upstream NOTICE file for GPLv3 Section 7
 * terms that apply to this code.
 *
 * Modified by kitan for the Channel blocker add-on bundle.
 */

package app.kitan.patches.youtube.blockchannel

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.checkCast
import app.morphe.patcher.methodCall
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * The class that builds the contextual (three-dot) flyout menu item views.
 */
internal object ContextualMenuItemBuilderFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL, AccessFlags.SYNTHETIC),
    returnType = "V",
    parameters = listOf("L", "L"),
    filters = listOf(
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            returnType = "Ljava/lang/CharSequence;",
        ),
        checkCast(
            type = "Landroid/widget/TextView;",
            location = MatchAfterWithin(3),
        ),
        methodCall(
            smali = "Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V",
            location = MatchAfterWithin(5),
        ),
        methodCall(
            opcode = Opcode.INVOKE_STATIC,
            returnType = "I",
            location = MatchAfterWithin(7),
        ),
        resourceLiteral(ResourceType.ATTR, "ytTextPrimary"),
    )
)

/**
 * The click handler of the contextual flyout menu items.
 */
internal object ContextualMenuItemBuilderOnClickFingerprint : Fingerprint(
    classFingerprint = ContextualMenuItemBuilderFingerprint,
    name = "onClick",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
)
