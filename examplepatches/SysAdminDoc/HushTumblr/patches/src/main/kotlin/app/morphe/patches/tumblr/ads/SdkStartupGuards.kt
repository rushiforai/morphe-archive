/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.localRegisterCount
import app.morphe.patches.tumblr.misc.extension.patchLog
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

internal const val SDK_STARTUP = "$EXTENSION_PACKAGE/privacy/SdkStartup;"

private const val CONTEXT = "Landroid/content/Context;"

/**
 * One SDK's launch entry, [target] written `Lclass;->name(params)result`, and the extension method
 * asked in front of it. A hook answering a boolean takes the provider (`p0`) and, on true, makes
 * the target return that true at once. A hook answering a context takes the target's first
 * parameter, the context (`p1`, or `p0` in a static method), and, on null, makes the target
 * return at once (null for an initializer). A [fallback], a static method with no parameters
 * that returns the target's own result type, is what the target returns instead on null.
 */
internal data class StartupGuard(val target: String, val hook: String, val fallback: String? = null)

/**
 * The ad SDKs' launch entries. Most start from Tumblr's manifest, before its application's
 * onCreate. Audience Network and Google Mobile Ads are also started by Tumblr's own CoreApp (and,
 * for Audience Network, again by its privacy callback and its ad adapters), so each is guarded at
 * the SDK's own start method that every one of those paths goes through. Audience Network also
 * loads its code for a bidder token, a mediation setting or an ad, and that load writes its
 * preference files, so its loader hands out the SDK's own do-nothing fallback instead: the one AN
 * uses when its code can't load, which answers an empty token and reports every ad as unfilled.
 */
internal val AD_SDK_STARTUP_GUARDS = listOf(
    StartupGuard(
        "Lcom/facebook/ads/internal/dynamicloading/DynamicLoaderFactory;->initialize($CONTEXT" +
            "Lcom/facebook/ads/internal/settings/MultithreadedBundleWrapper;" +
            "Lcom/facebook/ads/AudienceNetworkAds\$InitListener;Z)V",
        "$SDK_STARTUP->audienceNetwork($CONTEXT)$CONTEXT",
    ),
    StartupGuard(
        "Lcom/facebook/ads/internal/dynamicloading/DynamicLoaderFactory;->doMakeLoader(${CONTEXT}Z)" +
            "Lcom/facebook/ads/internal/dynamicloading/DynamicLoader;",
        "$SDK_STARTUP->audienceNetwork($CONTEXT)$CONTEXT",
        "Lcom/facebook/ads/internal/dynamicloading/DynamicLoaderFallback;->makeFallbackLoader()" +
            "Lcom/facebook/ads/internal/dynamicloading/DynamicLoader;",
    ),
    StartupGuard(
        "Lcom/google/android/gms/ads/MobileAdsInitProvider;->attachInfo($CONTEXT" +
            "Landroid/content/pm/ProviderInfo;)V",
        "$SDK_STARTUP->mobileAds($CONTEXT)$CONTEXT",
    ),
    StartupGuard(
        "Lcom/google/android/gms/ads/MobileAds;->initialize($CONTEXT" +
            "Lcom/google/android/gms/ads/initialization/OnInitializationCompleteListener;)V",
        "$SDK_STARTUP->mobileAds($CONTEXT)$CONTEXT",
    ),
    StartupGuard(
        "Lcom/vungle/ads/VungleProvider;->onCreate()Z",
        "$SDK_STARTUP->vungle(Landroid/content/ContentProvider;)Z",
    ),
    StartupGuard(
        "Lcom/tumblr/startup/NimbusStartupInitializer;->create($CONTEXT)Ljava/lang/Object;",
        "$SDK_STARTUP->nimbus($CONTEXT)$CONTEXT",
    ),
)

/** LiveRamp's identity SDK, which starts the same way. */
internal val LIVERAMP_STARTUP_GUARDS = listOf(
    StartupGuard(
        "Lcom/liveramp/ats/LRInitProvider;->onCreate()Z",
        "$SDK_STARTUP->liveRamp(Landroid/content/ContentProvider;)Z",
    ),
)

/**
 * Puts each guard's question in front of its target's first instruction. A build without one of
 * the SDK classes skips that guard: the SDK can't start from a class that isn't there. A class
 * that is there in a shape the guard doesn't fit leaves every target untouched and answers false,
 * so the patch records no capability and the rest of the switch still works. Throws only when the
 * extension lacks a hook.
 */
internal fun BytecodePatchContext.guardStartups(patch: String, guards: List<StartupGuard>): Boolean {
    guards.forEach { requireExtensionHook(patch, it.hook) }

    val planned = mutableListOf<Pair<StartupGuard, String>>()
    for (guard in guards) {
        val type = guard.target.substringBefore("->")
        val signature = guard.target.substringAfter("->")
        val owner = classDefByOrNull(type)
        if (owner == null) {
            patchLog.info("$patch: this build has no $type, so it has nothing to start")
            continue
        }
        val method = owner.methods.singleOrNull { it.signature() == signature }
        val smali = method?.takeIf { guard.fallback == null || fallbackFits(guard.fallback, type, it) }
            ?.let { guardSmali(it, guard.hook, guard.fallback) }
        if (smali == null) {
            patchLog.warning(
                "$patch: ${guard.target} isn't in a shape its launch guard fits, so no SDK launch is guarded",
            )
            return false
        }
        planned += guard to smali
    }

    for ((guard, smali) in planned) {
        val signature = guard.target.substringAfter("->")
        val method = mutableClassDefBy(guard.target.substringBefore("->")).methods.single { it.signature() == signature }
        method.addInstructionsWithLabels(0, smali, ExternalLabel("hush_launch", method.getInstruction(0)))
    }
    return true
}

private fun Method.signature(): String = "$name(${parameterTypes.joinToString("")})$returnType"

/**
 * Whether [fallback] is a static method with no parameters, returning [method]'s object result
 * type, that [owner]'s code may call: private in [owner] itself, otherwise in the same package,
 * or public on a public class. The guard hands the result out with move-result-object, so a
 * void or primitive result never fits.
 */
private fun BytecodePatchContext.fallbackFits(fallback: String, owner: String, method: Method): Boolean {
    val type = fallback.substringBefore("->")
    val found = classDefByOrNull(type) ?: return false
    val target = found.methods.singleOrNull { it.signature() == fallback.substringAfter("->") } ?: return false
    val reachable = when {
        AccessFlags.PRIVATE.isSet(target.accessFlags) -> type == owner
        type.substringBeforeLast('/') == owner.substringBeforeLast('/') -> true
        else -> AccessFlags.PUBLIC.isSet(found.accessFlags) && AccessFlags.PUBLIC.isSet(target.accessFlags)
    }
    val objectResult = method.returnType.startsWith("L") || method.returnType.startsWith("[")
    return target.isStatic() && target.parameterTypes.isEmpty() && objectResult &&
        target.returnType == method.returnType && reachable
}

/** The guard's code for [method], or null when the method's shape doesn't fit [hook]. */
private fun guardSmali(method: Method, hook: String, fallback: String?): String? {
    val implementation = method.implementation ?: return null
    if (implementation.instructions.none()) return null
    // The first register after the locals: the provider or initializer itself, or a static
    // method's first parameter.
    val self = method.localRegisterCount()
    return when {
        hook.endsWith(")Z") -> {
            if (method.isStatic() || method.returnType != "Z" || self < 1 || self > 15) return null
            """
                invoke-static {p0}, $hook
                move-result v0
                if-eqz v0, :hush_launch
                return v0
            """
        }
        hook.endsWith(")$CONTEXT") -> {
            val context = if (method.isStatic()) "p0" else "p1"
            val register = if (method.isStatic()) self else self + 1
            if (method.parameterTypes.firstOrNull()?.toString() != CONTEXT || register > 15) return null
            val exit = when {
                fallback != null -> "invoke-static {}, $fallback\nmove-result-object $context\nreturn-object $context"
                method.returnType == "V" -> "return-void"
                method.returnType.startsWith("L") || method.returnType.startsWith("[") -> "return-object $context"
                else -> return null
            }
            """
                invoke-static {$context}, $hook
                move-result-object $context
                if-nez $context, :hush_launch
                $exit
            """
        }
        else -> null
    }?.takeIf { fallback == null || hook.endsWith(")$CONTEXT") }
}
