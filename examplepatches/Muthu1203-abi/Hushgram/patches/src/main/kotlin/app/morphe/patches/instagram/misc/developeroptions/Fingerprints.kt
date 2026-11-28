/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 * Adapted for HushGram. See NOTICE for GPLv3 §7(b) attribution terms.
 */
package app.morphe.patches.instagram.misc.developeroptions

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/** Instagram's home-tab long-click handler. */
internal object HomeIconOnClickListenerFingerprint : Fingerprint(
    name = "onLongClick",
    strings = listOf("click", "activity"),
)

/** FragmentNavigator transition implementation method. */
internal object FragmentNavigatorTransitionFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/Integer;"),
    strings = listOf("FragmentNavigator.transitionInternal", "FragmentNavigator", "Fragment is null when attempting transition"),
)

/** The internal developer-options opener, identified by its error toast key. */
internal object DeveloperOptionCallWithCallableFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.FINAL, AccessFlags.PUBLIC),
    strings = listOf("debug_options_error"),
)
