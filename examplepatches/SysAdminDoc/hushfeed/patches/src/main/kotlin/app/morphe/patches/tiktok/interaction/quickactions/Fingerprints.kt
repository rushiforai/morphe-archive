/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.patches.tiktok.interaction.quickactions

import app.morphe.patcher.Fingerprint

internal object QuickCommentBindFingerprint : Fingerprint(
    definingClass = QUICK_COMMENT_ASSEM,
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    custom = { method, classDef ->
        classDef.fields.singleOrNull { field -> field.type == QUICK_COMMENT_ROW }?.let { row ->
            method.quickCommentVisibilityWrites(row).size >= 2
        } == true
    },
)

internal object LongPressRepostGateFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/feed/assem/digg/VideoDiggAssem;",
    returnType = "Z",
    parameters = listOf("Landroid/view/View;"),
    strings = listOf(
        "Long press detected on digg button for aweme: ",
        "long_press_like_panel",
    ),
)
