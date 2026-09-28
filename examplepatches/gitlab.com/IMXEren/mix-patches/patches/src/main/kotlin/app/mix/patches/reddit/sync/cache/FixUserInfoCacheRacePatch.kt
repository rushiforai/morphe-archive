/*
 * Copyright 2026 IMXEren.
 * https://gitlab.com/IMXEren/mix-patches
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.patches.reddit.sync.cache

import app.mix.patches.reddit.sync.shared.Constants.COMPATIBILITY_SYNC
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

@Suppress("unused")
val fixUserInfoCacheRacePatch = bytecodePatch(
    name = "Fix random crash",
    description = "Fixes an occasional crash while browsing Reddit.",
) {
    compatibleWith(COMPATIBILITY_SYNC)

    execute {
        val requestClass = oauthHasGoldResponseFingerprint.originalClassDef
        val cacheKeyMethod = ImmutableMethod(
            requestClass.type,
            "getCacheKey",
            emptyList(),
            "Ljava/lang/String;",
            AccessFlags.PUBLIC.value,
            emptySet(),
            emptySet(),
            MutableMethodImplementation(2),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                invoke-super {v1}, Lcom/android/volley/Request;->getCacheKey()Ljava/lang/String;
                move-result-object v0
                const-string v1, "#has_gold"
                invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v0
                return-object v0
                """,
            )
        }

        mutableClassDefBy(requestClass).methods.add(cacheKeyMethod)
    }
}
