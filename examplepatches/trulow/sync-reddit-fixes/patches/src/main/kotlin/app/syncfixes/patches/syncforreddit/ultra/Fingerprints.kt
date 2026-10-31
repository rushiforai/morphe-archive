/*
 * Ported from KingOfPoptart/patcheddit (https://github.com/KingOfPoptart/patcheddit), which adapted it
 * from humzakh/HK-Morphe-Patches (https://github.com/humzakh/HK-Morphe-Patches), GPLv3.
 */
package app.syncfixes.patches.syncforreddit.ultra

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Sync's UltraHelper keeps its source file name, so methods are matched within it. Obfuscated names
 * differ between Sync and Sync Pro (uc/b and fc/b).
 */
private const val ULTRA_HELPER_SOURCE = "UltraHelper.java"

/** Whether the signed-in account has Sync Ultra. */
internal object UltraHelperFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("UltraHelper"),
    custom = { _, classDef -> classDef.sourceFile == ULTRA_HELPER_SOURCE },
)

/** Display name of the account's Sync Ultra subscription. */
internal object SyncUltraSubTypeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    strings = listOf("Sync Ultra Monthly", "Sync Ultra Yearly", "Sync Ultra lifetime"),
    custom = { _, classDef -> classDef.sourceFile == ULTRA_HELPER_SOURCE },
)

/** Whether the account's Sync Ultra subscription is the lifetime one. */
internal object UltraLifetimeFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("ultra_lifetime"),
    custom = { _, classDef -> classDef.sourceFile == ULTRA_HELPER_SOURCE },
)
