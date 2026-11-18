// Afterglow adaptation of pinned Morphe v2.0.0; see docs/morphe-compatibility.md.
/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.afterglow.patches.compat.morphe.youtube.layout.buttons.overlay

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.checkCast
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal object OverlayCastButtonVisibilityFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        checkCast("Landroidx/mediarouter/app/MediaRouteButton;"),
        methodCall(
            smali = "Landroid/view/View;->setVisibility(I)V",
            // Afterglow's visibility observer adds two instructions here.
            location = MatchAfterWithin(3)
        ),
        checkCast("Lcom/google/android/libraries/youtube/mdx/mediaroute/entrypoint/MdxEntryPointButton;"),
        methodCall(
            smali = "Landroid/view/View;->setVisibility(I)V",
            location = MatchAfterWithin(3)
        ),
        literal(11208L)
    )
)

internal object CastButtonPlayerFeatureFlagFingerprint : Fingerprint(
    filters = listOf(
        literal(45690091)
    )
)

internal object CastButtonActionFeatureFlagFingerprint : Fingerprint(
    filters = listOf(
        literal(45690090)
    )
)

