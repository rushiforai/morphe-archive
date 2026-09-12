/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.patches.tiktok.interaction.resume

import app.morphe.patcher.Fingerprint
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val FEED_PROGRESS_CONFIG_DESCRIPTOR =
    "Lcom/ss/android/ugc/aweme/feed/experiment/FeedPlayProgressContinueConfig;"

internal object FeedProgressContinueGateFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = emptyList(),
    custom = { method, _ ->
        method.name == "invoke" &&
            method.implementation?.instructions?.any { instruction ->
                instruction.getReference<FieldReference>()?.let { reference ->
                    reference.definingClass == FEED_PROGRESS_CONFIG_DESCRIPTOR &&
                        reference.name == "enable" &&
                        reference.type == "I"
                } == true
            } == true
    },
)
