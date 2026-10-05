/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.entity.mediadata

import app.morphe.patcher.Fingerprint

// The Media mapper that spells the "is_video" key. The call after its second anchor string is the video
// flag getter; MediaBridges asserts that call's owner, parameters and return type.
internal object AslSessionRelatedFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("asl_session_id", "is_video", "is_carousel"),
)

// The call after its second anchor string is the Media id getter; MediaBridges asserts its type.
internal object FanClubContentPreviewInteractorImplFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/fanclub/preview/impl/FanClubContentPreviewInteractorImpl;",
    strings = listOf("subscription_exclusive_content_public_preview_select", "creator_igid"),
)
