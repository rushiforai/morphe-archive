/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.facer

import app.fakh.patches.facer.shared.Constants.COMPATIBILITY_FACER_PHONE
import app.fakh.patches.facer.shared.Constants.COMPATIBILITY_FACER_WEAR
import app.fakh.patches.shared.disableProviders
import app.fakh.patches.shared.returnTrue
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch

/**
 * `DomainUserState.LoggedIn.toString()` carries the Kotlin data-class labels for both
 * subscription flags. From its class we reach both `DomainUserState` (superclass) and the
 * `LoggedIn` constructor whose fields callers also read directly.
 */
private val loggedInStateToStringFingerprint = Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("LoggedIn(sessionToken=", ", isUserPremium=", ", isUserPlus="),
)

/** `DomainUserState.LoggedOut.toString()`, used to locate the logged-out subclass. */
private val loggedOutStateToStringFingerprint = Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("LoggedOut(isUserPlus="),
)

/** Wear OS companion `User.toString()`, used to locate the watch user data class. */
private val watchUserToStringFingerprint = Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("User(userId=", ", isPremiumUser=", ", isPlusUser="),
)

/** Legacy SharedPreferences + cache check for all-access / premium state (`pref_is_allaccess`). */
private val legacyAllAccessFingerprint = Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("pref_is_allaccess", "PREMIUM_STATE"),
)

/** `UserInventoryStatus.<init>()` loads cached owned watchfaces; its ownership check sits on the same class. */
private val userInventoryInitFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf("OwnedFaces", "***** ERROR **** Could not load owned faces"),
)

/** Ad SDK content providers that initialize before `Application.onCreate`. */
private val adProvidersManifestPatch = patch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            manifest.disableProviders(
                "com.google.android.gms.ads.MobileAdsInitProvider",
                "com.facebook.ads.AudienceNetworkContentProvider",
            )
        }
    }
}

@Suppress("unused")
val premiumUnlockPatch = patch(
    name = "Premium unlock",
    description = "Unlocks Facer Premium, Facer Plus, and removes ads.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACER_PHONE)
    category("Premium")
    dependsOn(adProvidersManifestPatch)

    execute {
        val loggedInClass = loggedInStateToStringFingerprint.classDef
        val domainUserStateType = loggedInClass.superclass
            ?: throw PatchException("DomainUserState superclass not found on ${loggedInClass.type}")

        var baseFlags = 0
        classDefForEach { classDef ->
            if (classDef.type != domainUserStateType) return@classDefForEach
            mutableClassDefBy(classDef).methods
                .filter { it.parameters.isEmpty() && it.returnType == "Z" && it.implementation != null }
                .forEach {
                    it.returnTrue()
                    baseFlags++
                }
        }
        if (baseFlags != 2) throw PatchException("Expected 2 DomainUserState boolean getters, found $baseFlags")

        val loggedInMutable = mutableClassDefBy(loggedInClass)
        val loggedInInit = loggedInMutable.methods.singleOrNull {
            it.name == "<init>" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "Z", "Ljava/lang/String;", "Z")
        } ?: throw PatchException("DomainUserState.LoggedIn constructor not found")
        loggedInInit.addInstructions(
            0,
            """
                const/4 p2, 0x1
                const/4 p4, 0x1
            """,
        )
        val loggedInPlusGetter = loggedInMutable.methods.singleOrNull {
            it.parameters.isEmpty() && it.returnType == "Z" && it.implementation != null
        } ?: throw PatchException("DomainUserState.LoggedIn isUserPlus override not found")
        loggedInPlusGetter.returnTrue()

        val loggedOutMutable = mutableClassDefBy(loggedOutStateToStringFingerprint.classDef)
        val loggedOutInit = loggedOutMutable.methods.singleOrNull {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf("Z")
        } ?: throw PatchException("DomainUserState.LoggedOut constructor not found")
        loggedOutInit.addInstructions(0, "const/4 p1, 0x1")
        val loggedOutPlusGetter = loggedOutMutable.methods.singleOrNull {
            it.parameters.isEmpty() && it.returnType == "Z" && it.implementation != null
        } ?: throw PatchException("DomainUserState.LoggedOut isUserPlus override not found")
        loggedOutPlusGetter.returnTrue()

        val inventoryClass = mutableClassDefBy(userInventoryInitFingerprint.classDef)
        val isOwnedMethod = inventoryClass.methods.singleOrNull {
            it.returnType == "Z" &&
                it.parameters.size == 2 &&
                it.parameterTypes[1].toString() == "Landroid/content/Context;" &&
                it.implementation != null
        } ?: throw PatchException("UserInventoryStatus ownership check method not found")
        isOwnedMethod.returnTrue()

        legacyAllAccessFingerprint.method.returnTrue()
    }
}

@Suppress("unused")
val premiumUnlockWearPatch = patch(
    name = "Premium unlock (Wear OS)",
    description = "Unlocks Facer Premium and Facer Plus on the Wear OS companion app.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACER_WEAR)
    category("Wear OS")
    dependsOn(adProvidersManifestPatch)

    execute {
        val watchUserMutable = mutableClassDefBy(watchUserToStringFingerprint.classDef)
        val watchUserInit = watchUserMutable.methods.singleOrNull {
            it.name == "<init>" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z", "Z")
        } ?: throw PatchException("Watch User constructor not found")
        watchUserInit.addInstructions(
            0,
            """
                const/4 p3, 0x1
                const/4 p4, 0x1
            """,
        )

        val loggedInWatchMutable = mutableClassDefBy(loggedInStateToStringFingerprint.classDef)
        val loggedInWatchInit = loggedInWatchMutable.methods.singleOrNull {
            it.name == "<init>" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z", "Z")
        } ?: throw PatchException("Watch DomainUserState.LoggedIn constructor not found")
        loggedInWatchInit.addInstructions(
            0,
            """
                const/4 p3, 0x1
                const/4 p4, 0x1
            """,
        )

        legacyAllAccessFingerprint.method.returnTrue()
    }
}
