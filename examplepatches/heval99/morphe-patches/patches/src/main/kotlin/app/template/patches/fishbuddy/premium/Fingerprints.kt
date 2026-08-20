package app.template.patches.fishbuddy.premium

import app.morphe.patcher.Fingerprint

// User.hasPremium()Z is FishBuddy's premium gate. Reads the server-populated
// `roles` HashMap for the "premium" key and returns its boolean value. Called
// from feature gates across the app (GroupCreateViewModel and obfuscated
// view models c5, t4, vp/t). Forcing it true unlocks premium features
// regardless of the server-side RevenueCat entitlement state.
//
// Class name (no.fishbuddy.app.data.models.User) and method name (hasPremium)
// are un-obfuscated and stable across versions.
object UserHasPremiumFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.type == "Lno/fishbuddy/app/data/models/User;" &&
                method.name == "hasPremium" &&
                method.returnType == "Z" &&
                method.parameters.isEmpty()
    }
)