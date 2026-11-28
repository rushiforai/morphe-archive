package dev.srwi.gintype.patches.gboard.features.customholdpopups

import app.morphe.patcher.patch.resourcePatch
import dev.srwi.gintype.patches.gboard.shared.applyFeatureMarker
import dev.srwi.gintype.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardCustomHoldPopupsFeatureMarkerPatch = resourcePatch(
    description = "Marks Custom Hold Popups patch availability in AndroidManifest metadata and adds the popup edit icon.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        val drawableFile = get("res/drawable/$CUSTOM_HOLD_POPUPS_EDIT_DRAWABLE_NAME.xml")
        drawableFile.parentFile?.mkdirs()
        drawableFile.writeText(CUSTOM_HOLD_POPUPS_EDIT_DRAWABLE_XML)
    }

    finalize {
        applyFeatureMarker(CUSTOM_HOLD_POPUPS_FEATURE_MARKER_NAME)
    }
}

internal const val CUSTOM_HOLD_POPUPS_FEATURE_MARKER_NAME =
    "dev.srwi.gintype.feature.custom_hold_popups"

private const val CUSTOM_HOLD_POPUPS_EDIT_DRAWABLE_NAME = "gboard_custom_hold_popups_edit"

private const val CUSTOM_HOLD_POPUPS_EDIT_DRAWABLE_XML = """<?xml version="1.0" encoding="utf-8"?>
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="20dp"
    android:height="20dp"
    android:viewportWidth="24"
    android:viewportHeight="24">
    <path
        android:fillColor="#FF757575"
        android:pathData="M3,17.25V21h3.75L17.81,9.94l-3.75,-3.75L3,17.25zM20.71,7.04c0.39,-0.39 0.39,-1.02 0,-1.41l-2.34,-2.34c-0.39,-0.39 -1.02,-0.39 -1.41,0l-1.83,1.83 3.75,3.75 1.83,-1.83z" />
</vector>
"""
