package com.rov3r.patches.vsco

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

private const val EXTENSION_CLASS =
    "Lcom/rov3r/extension/vsco/DownloadPostsPatch;"
private const val SETTINGS_EXTENSION_CLASS =
    "Lcom/rov3r/extension/vsco/PatchSettings;"
private const val PROFILE_EXTENSION_CLASS =
    "Lcom/rov3r/extension/vsco/ProfilePhotoPatch;"

private const val DOWNLOAD_VIEW =
    "com.rov3r.extension.vsco.MorpheDownloadButton"
private const val INITIALIZER_VIEW =
    "com.rov3r.extension.vsco.PatchInitializerView"

private fun insertBeforeViewWithId(xml: String, id: String, view: String): String {
    val idMatch = Regex("android:id\\s*=\\s*\"@\\+?id/$id\"").find(xml)
        ?: error("Could not find @$id in VSCO layout")
    val viewStart = xml.lastIndexOf('<', idMatch.range.first)
    check(viewStart >= 0) { "Could not locate the start of @$id" }
    return xml.substring(0, viewStart) + view + "\n    " + xml.substring(viewStart)
}

private fun insertAfterViewWithId(xml: String, id: String, view: String): String {
    val idMatch = Regex("android:id\\s*=\\s*\"@\\+?id/$id\"").find(xml)
        ?: error("Could not find @$id in VSCO layout")
    val viewEnd = xml.indexOf("/>", idMatch.range.last) + 2
    check(viewEnd > 1) { "Could not locate the end of @$id" }
    return xml.substring(0, viewEnd) + "\n" + view + xml.substring(viewEnd)
}

private fun addFeedDownloadButton(
    xml: String,
    favoriteId: String,
    buttonId: String
): String {
    if (xml.contains("@+id/$buttonId")) return xml
    val spacerConstraint = Regex(
        "(app:layout_constraint(?:Right_toLeftOf|End_toStartOf))" +
            "\\s*=\\s*\"@\\+?id/$favoriteId\""
    )
    val constraintName = spacerConstraint.find(xml)?.groupValues?.get(1)
        ?: error("Could not find the feed spacer before @$favoriteId")
    val rewired = spacerConstraint.replaceFirst(
        xml,
        "$constraintName=\"@id/$buttonId\""
    )
    val button = """
        <$DOWNLOAD_VIEW
            android:id="@+id/$buttonId"
            android:layout_width="@dimen/media_inline_icon_wrapper"
            android:layout_height="@dimen/media_inline_icon_wrapper"
            android:layout_marginRight="@dimen/ds_dimen_xs"
            android:background="@android:color/transparent"
            android:contentDescription="Download post"
            android:padding="10dp"
            android:scaleType="centerInside"
            android:src="@drawable/morphe_vsco_download"
            app:layout_constraintBottom_toBottomOf="@id/$favoriteId"
            $constraintName="@id/$favoriteId"
            app:layout_constraintTop_toTopOf="@id/$favoriteId"/>
    """.trimIndent()
    return insertBeforeViewWithId(rewired, favoriteId, button)
}

private fun addDetailDownloadButton(xml: String): String {
    val buttonId = "morphe_vsco_detail_download_button"
    if (xml.contains("@+id/$buttonId")) return xml
    val button = """
                <$DOWNLOAD_VIEW
                    android:id="@+id/$buttonId"
                    android:layout_width="@dimen/header_icon_wrapper"
                    android:layout_height="@dimen/header_icon_wrapper"
                    android:background="@android:color/transparent"
                    android:contentDescription="Download post"
                    android:padding="18dp"
                    android:scaleType="centerInside"
                    android:src="@drawable/morphe_vsco_download"/>
    """.trimIndent()
    return insertAfterViewWithId(xml, "detail_view_forward_button", button)
}

private fun addPreferenceInitializer(xml: String, targetId: String): String {
    if (xml.contains("<$INITIALIZER_VIEW")) return xml
    val marker = """
        <$INITIALIZER_VIEW
            android:layout_width="0dp"
            android:layout_height="0dp"/>
    """.trimIndent()
    return insertBeforeViewWithId(xml, targetId, marker)
}

/** Installs the media-action icons consumed by the injected extension. */
private val downloadIconResourcePatch = resourcePatch {
    execute {
        get("res/drawable/morphe_vsco_download.xml", copy = false).writeText(
            """
            <?xml version="1.0" encoding="utf-8"?>
            <vector xmlns:android="http://schemas.android.com/apk/res/android"
                android:width="24dp"
                android:height="24dp"
                android:viewportWidth="24"
                android:viewportHeight="24">
                <path
                    android:fillColor="@color/ds_color_primary"
                    android:fillType="evenOdd"
                    android:pathData="M5,18L5,21L19,21L19,18L21,18L21,23L3,23L3,18L5,18ZM13,1L13,14.168L17.293,9.876L18.707,11.29L12,17.997L5.293,11.29L6.707,9.876L11,14.168L11,1L13,1Z" />
            </vector>
            """.trimIndent()
        )
        get("res/drawable/morphe_vsco_copy.xml", copy = false).writeText(
            """
            <?xml version="1.0" encoding="utf-8"?>
            <vector xmlns:android="http://schemas.android.com/apk/res/android"
                android:width="24dp"
                android:height="24dp"
                android:viewportWidth="24"
                android:viewportHeight="24">
                <path
                    android:fillColor="@color/ds_color_primary"
                    android:pathData="M16,1L4,1C2.9,1 2,1.9 2,3L2,17L4,17L4,3L16,3L16,1ZM19,5L8,5C6.9,5 6,5.9 6,7L6,21C6,22.1 6.9,23 8,23L19,23C20.1,23 21,22.1 21,21L21,7C21,5.9 20.1,5 19,5ZM19,21L8,21L8,7L19,7L19,21Z" />
            </vector>
            """.trimIndent()
        )
        get("res/drawable/morphe_vsco_share.xml", copy = false).writeText(
            """
            <?xml version="1.0" encoding="utf-8"?>
            <vector xmlns:android="http://schemas.android.com/apk/res/android"
                android:width="24dp"
                android:height="24dp"
                android:viewportWidth="24"
                android:viewportHeight="24">
                <path
                    android:fillColor="@color/ds_color_primary"
                    android:pathData="M18,16.08C17.24,16.08 16.56,16.38 16.04,16.85L8.91,12.7C8.96,12.47 9,12.24 9,12C9,11.76 8.96,11.53 8.91,11.3L15.96,7.19C16.5,7.69 17.21,8 18,8C19.66,8 21,6.66 21,5C21,3.34 19.66,2 18,2C16.34,2 15,3.34 15,5C15,5.24 15.04,5.47 15.09,5.7L8.04,9.81C7.5,9.31 6.79,9 6,9C4.34,9 3,10.34 3,12C3,13.66 4.34,15 6,15C6.79,15 7.5,14.69 8.04,14.19L15.16,18.35C15.11,18.56 15.08,18.78 15.08,19C15.08,20.61 16.39,21.92 18,21.92C19.61,21.92 20.92,20.61 20.92,19C20.92,17.39 19.61,16.08 18,16.08Z" />
            </vector>
            """.trimIndent()
        )

        fun patchRequiredLayout(path: String, transform: (String) -> String) {
            val layout = get(path, copy = false)
            val original = layout.readText()
            val updated = transform(original)
            check(updated != original || original.contains(DOWNLOAD_VIEW)) {
                "No pre-render changes were applied to $path"
            }
            layout.writeText(updated)
        }

        fun patchOptionalLayout(
            path: String,
            targetId: String
        ) {
            val layout = get(path, copy = false)
            val original = layout.readText()
            if (!original.contains("@+id/$targetId")
                && !original.contains("@id/$targetId")) {
                return
            }
            layout.writeText(addPreferenceInitializer(original, targetId))
        }

        patchRequiredLayout("res/layout/image_model_item_with_interactions.xml") {
            addFeedDownloadButton(
                it,
                "image_item_favorite_button",
                "morphe_vsco_feed_image_download_button"
            )
        }
        patchRequiredLayout("res/layout/video_model_item_with_interactions.xml") {
            addFeedDownloadButton(
                it,
                "video_item_favorite_button",
                "morphe_vsco_feed_video_download_button"
            )
        }
        patchRequiredLayout("res/layout/media_detail_view.xml", ::addDetailDownloadButton)
        patchRequiredLayout("res/layout/video_detail_view.xml", ::addDetailDownloadButton)

        mapOf(
            "res/layout/user_profile_info_header_card.xml" to "user_profile_follow_button",
            "res/layout/personal_profile_info_header_card.xml" to "member_badge",
            "res/layout/search.xml" to "suggested_users",
            "res/layout/suggested_users_carousel_feed_view.xml" to "suggested_users_carousel",
            "res/layout/suggestions_from_follow.xml" to "suggestions_from_follow_list",
            "res/layout/edit_image.xml" to "edit_upsell_banner",
            "res/layout/edit_video.xml" to "edit_upsell_banner",
            "res/layout/edit_upsell_banner.xml" to "upsell_banner_cta_button",
            "res/layout/preset_promo_feed_item.xml" to "preset_promo_button",
            "res/layout/recipes_carousel_view.xml" to "recipes",
            "res/layout/recipes_manager_layout.xml" to "recipes_manager_upsell_layout",
            "res/layout/studio_upsell_first_publish.xml" to "studio_upsell_background",
            "res/layout/free_trial_ending_dialog.xml" to "btn_start_membership",
            "res/layout/video_detail_view.xml" to "video_view",
            "res/layout/global_menu.xml" to "member_hub"
        ).forEach { (path, targetId) -> patchOptionalLayout(path, targetId) }

        val globalMenu = get("res/layout/global_menu.xml", copy = false)
        var globalMenuXml = globalMenu.readText()
        if (!globalMenuXml.contains("@+id/morphe_patch_settings")) {
            val settingsId = Regex(
                "android:id\\s*=\\s*\"@\\+?id/settings\""
            )
            val settingsText = Regex(
                "android:text\\s*=\\s*\"@string/global_menu_settings\""
            )
            val topConstraint = Regex(
                "app:layout_constraintTop_toBottomOf\\s*=\\s*\"[^\"]+\""
            )
            val settingsIdMatch = settingsId.find(globalMenuXml)
            val settingsIdIndex = settingsIdMatch?.range?.first ?: -1
            val settingsStartIndex = globalMenuXml.lastIndexOf('<', settingsIdIndex)
            val settingsEndIndex = globalMenuXml.indexOf("/>", settingsIdIndex)
            check(
                settingsIdIndex >= 0 &&
                    settingsStartIndex >= 0 &&
                    settingsEndIndex >= 0
            ) {
                "Could not find VSCO's Settings menu entry"
            }
            val settingsEntry = globalMenuXml.substring(
                settingsStartIndex,
                settingsEndIndex + 2
            )
            check(settingsText.containsMatchIn(settingsEntry)) {
                "Could not find VSCO's Settings menu text"
            }
            check(topConstraint.containsMatchIn(settingsEntry)) {
                "Could not find VSCO's Settings menu constraint"
            }

            val patchSettingsEntry = settingsEntry
                .replaceFirst(
                    settingsId,
                    "android:id=\"@+id/morphe_patch_settings\""
                )
                .replaceFirst(settingsText, "android:text=\"Patch Settings\"")
                .replace(Regex("\\s+android:tag\\s*=\\s*\"[^\"]*\""), "")
            val rewiredSettingsEntry = settingsEntry.replaceFirst(
                topConstraint,
                "app:layout_constraintTop_toBottomOf=\"@id/morphe_patch_settings\""
            )
            globalMenuXml = globalMenuXml.substring(0, settingsStartIndex) +
                patchSettingsEntry + "\n" +
                rewiredSettingsEntry +
                globalMenuXml.substring(settingsEndIndex + 2)
            globalMenu.writeText(globalMenuXml)
        }
    }
}

@Suppress("unused")
val downloadPostsPatch = bytecodePatch(
    name = "Download posts",
    description = "Adds configurable original-quality downloads, profile tools, feed cleanup, media controls, and privacy options.",
    default = true
) {
    compatibleWith(VSCO_COMPATIBILITY)
    dependsOn(downloadIconResourcePatch)
    extendWith("extensions/vsco.mpe")

    execute {
        SetUpImageFingerprint.method.addInstruction(
            0,
            "invoke-static { p1 }, $EXTENSION_CLASS->setCurrentModel(Ljava/lang/Object;)V"
        )

        SetupListenersFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $EXTENSION_CLASS->attachDownloadButton(Landroid/view/View;)V"
        )

        ShowImageMenuFingerprint.method.addInstruction(
            0,
            "invoke-static { p0, p1 }, $EXTENSION_CLASS->attachOverflowActions(Landroid/view/View;Ljava/lang/Object;)V"
        )

        LithiumActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static { p0 }, $SETTINGS_EXTENSION_CLASS->install(Landroid/app/Activity;)V"
        )
        ProfileHeaderImageFingerprint.method.addInstruction(
            0,
            "invoke-static { p1, p2 }, $PROFILE_EXTENSION_CLASS->bindHeader(Ljava/lang/Object;Ljava/lang/Object;)V"
        )
        ProfileSpacesHeaderImageFingerprint.method.addInstruction(
            0,
            "invoke-static { p0, p1 }, $PROFILE_EXTENSION_CLASS->bindSpacesHeader(Ljava/lang/Object;Ljava/lang/Object;)V"
        )
    }
}
