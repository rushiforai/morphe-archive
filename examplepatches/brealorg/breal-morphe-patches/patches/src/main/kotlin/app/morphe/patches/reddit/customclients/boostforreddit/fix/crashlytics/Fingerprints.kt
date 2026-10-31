/*
 * Modifications Copyright 2026 brealorg.
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.patches.reddit.customclients.boostforreddit.fix.crashlytics

import app.morphe.patcher.Fingerprint

internal val boostApplicationOnCreateFingerprint = Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lcom/rubenmayayo/reddit/MyApplication;" &&
            method.name == "onCreate"
    }
)
