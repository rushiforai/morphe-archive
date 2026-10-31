/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.morphe.patches.shared.layout.sponsorblock

import app.morphe.patches.shared.misc.settings.preference.BasePreference

// EBPatcher: extracted unchanged from Morphe v1.48.0 for Music-only dependency closure.

private const val SEGMENT_CATEGORY_PREFERENCE_TAG =
    "app.morphe.extension.shared.sponsorblock.objects.SegmentCategoryPreference"

fun categoryPreference(settingKey: String): BasePreference =
    object : BasePreference(settingKey, null, null, null, null, null, SEGMENT_CATEGORY_PREFERENCE_TAG) {}
