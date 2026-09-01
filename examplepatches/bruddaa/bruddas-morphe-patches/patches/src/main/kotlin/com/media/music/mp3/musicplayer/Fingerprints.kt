package com.media.music.mp3.musicplayer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object RemoveAdsMethodFingerprint : Fingerprint(
    returnType = "I",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        // Looks for the exact SharedPreferences key in the method
        string("pref_key_remove_ads")
    )
)