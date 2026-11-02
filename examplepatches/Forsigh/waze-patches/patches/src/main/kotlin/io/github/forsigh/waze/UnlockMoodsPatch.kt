package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE

/**
 * Unlock the driver-mood picker.
 *
 * WHAT WAZE GATES (measured on 5.25.0.1, `com/waze/MoodManager`):
 *
 *  1. `canSetMood(Context, String)Z` decides whether a mood may be set. It checks `isBaby()`, then
 *     compares the requested mood name against one string resource, and - for the beta list - reads
 *     `ConfigValues.CONFIG_VALUE_MOODS_BETA_ENABLED`. That config read happens *only here* in this class,
 *     so returning true makes the eligibility, beta and name checks all moot in one edit.
 *  2. `isBaby()Z` returns a field; the mood screen uses it to hide moods from "baby" (new-driver) accounts.
 *  3. `refreshMoodsList()V` asks the native catalogue twice:
 *         const/4 v0, 0x1 / const/4 v1, 0x0
 *         invoke-direct {p0, v1, v0}, getDefaultMoodListNTV(ZZ)
 *         invoke-direct {p0, v1, v1}, getCustomMoodListNTV(ZZ)
 *     Upstream's reading, kept here: the first flag of each call selects whether special/hidden entries
 *     are included, the second controls sorting. Forcing v1 = 1 asks for the unfiltered list.
 *
 * 5.25.90.900 renamed all three levers inside the same class: canSetMood -> t(), refreshMoodsList ->
 * r(), and the Java isBaby() is gone - the native value is read inline in p() and handed to the sync
 * payload (Lcom/waze/fu) as its boolean constructor argument, so the flag is overwritten right after
 * the isBabyNTV() move-result instead. Resolution goes through [resolveAnchor] with the older shape
 * first (AnchorOps.kt carries the ordering rule).
 *
 * This patch unlocks what is *already in the app*: moods in the local catalogue, including the ones the
 * picker hides. It does not invent artwork - a mood whose images Waze has never downloaded renders blank -
 * and it does not grant editor permissions or fetch campaigns.
 *
 * Mood images come from the skin assets (`CONFIG_VALUE_USER_MOOD_ASSET_TIMESTAMP` tracks them), so this
 * depends on [skinRefreshPatch]: without the versionCode refresh, a device that has already run Waze would
 * keep drawing its extracted copies.
 *
 * Ported from aaayd/waze-custom-patches (GPLv3, `DriverIconsPatch.kt`) - see `CREDITS.md`.
 * Re-anchored against this build: their finder matched a `(Context, String) -> Z` method by three mood-name
 * strings, which does not exist here (the same method compares against a string *resource* instead), so the
 * anchors are pinned by class, name and signature and the registers were read off this smali.
 */
private const val MOOD_MANAGER = "Lcom/waze/MoodManager;"

internal val MoodEligibilityFingerprint = Fingerprint(
    definingClass = MOOD_MANAGER,
    name = "canSetMood",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    returnType = "Z",
)

/** 5.25.90.900: canSetMood re-lettered to t() (same signature, reads the same config key). */
internal val MoodEligibilityV2Fingerprint = Fingerprint(
    definingClass = MOOD_MANAGER,
    name = "t",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    returnType = "Z",
)

/** 5.26.90.901: canSetMood re-lettered again, t() -> v() (same signature and same string resource). */
internal val MoodEligibilityV3Fingerprint = Fingerprint(
    definingClass = MOOD_MANAGER,
    name = "v",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    returnType = "Z",
)

internal val BabyGateFingerprint = Fingerprint(
    definingClass = MOOD_MANAGER,
    name = "isBaby",
    parameters = listOf(),
    returnType = "Z",
)

/** 5.25.90.900: the Java isBaby() is gone; p() reads the native flag for the sync payload. */
internal val MoodSyncV2Fingerprint = Fingerprint(
    definingClass = MOOD_MANAGER,
    name = "p",
    parameters = listOf(),
    returnType = "V",
)

/**
 * 5.26.90.901: the sync payload builder kept its body but took the letter r(), which on older
 * builds means the catalogue refresh. Pinned by the native call it makes, not by its name, so the
 * two cannot be confused again.
 */
internal val MoodSyncV3Fingerprint = Fingerprint(
    definingClass = MOOD_MANAGER,
    parameters = listOf(),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = MOOD_MANAGER,
            name = "isBabyNTV",
            returnType = "Z",
        ),
    ),
)

internal val MoodCatalogueFingerprint = Fingerprint(
    definingClass = MOOD_MANAGER,
    name = "refreshMoodsList",
    parameters = listOf(),
    returnType = "V",
)

/** 5.25.90.900: refreshMoodsList re-lettered to r() (same native-catalogue call pattern). */
internal val MoodCatalogueV2Fingerprint = Fingerprint(
    definingClass = MOOD_MANAGER,
    name = "r",
    parameters = listOf(),
    returnType = "V",
)

/**
 * 5.26.90.901: the catalogue refresh took the letter t(). Anchored by the native list call rather
 * than by name, and tried before the name-based shapes, so the two builds cannot be swapped.
 */
internal val MoodCatalogueByListCallFingerprint = Fingerprint(
    definingClass = MOOD_MANAGER,
    parameters = listOf(),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = MOOD_MANAGER,
            name = "getDefaultMoodListNTV",
            returnType = "[Lcom/waze/Mood;",
        ),
    ),
)

/** Same anchor for builds whose catalogue only asks for the custom list. */
internal val MoodCatalogueByCustomListFingerprint = Fingerprint(
    definingClass = MOOD_MANAGER,
    parameters = listOf(),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = MOOD_MANAGER,
            name = "getCustomMoodListNTV",
            returnType = "[Lcom/waze/Mood;",
        ),
    ),
)

@Suppress("unused")
val unlockMoodsPatch = bytecodePatch(
    name = "Unlock driver moods",
    description = "Unlocks all moods on the device.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)
    category("Driving & Voice")
    dependsOn(skinRefreshPatch)
    execute {
        val canSet = resolveAnchor(
            "mood eligibility", MoodEligibilityFingerprint, MoodEligibilityV2Fingerprint,
            MoodEligibilityV3Fingerprint,
        )
        canSet.addInstructions(0, "const/4 v0, 0x1\n\nreturn v0\n")

        val babyGate = boundMethodOrNull(BabyGateFingerprint)
        if (babyGate != null) {
            babyGate.addInstructions(0, "const/4 p0, 0x0\n\nreturn p0\n")
            println("unlockMoodsPatch: baby gate (isBaby) forced off")
        } else {
            // 5.25.90.900: no Java gate to force. p() reads isBabyNTV() and passes the result as
            // the boolean argument of the Lcom/waze/fu sync payload, so overwrite it right after
            // the move-result - every downstream consumer (m/n/o field writers) sees "not baby".
            val sync = resolveAnchor(
                "mood sync", MoodSyncV3Fingerprint, MoodSyncV2Fingerprint,
            )
            val syncInstructions = sync.implementation?.instructions?.toList()
                ?: throw PatchException("unlockMoodsPatch: p() has no implementation")
            val callIndex = syncInstructions.withIndex().firstOrNull { (_, instruction) ->
                instruction.opcode == Opcode.INVOKE_DIRECT &&
                    instruction is ReferenceInstruction &&
                    (instruction.reference as? MethodReference)?.let { ref ->
                        ref.definingClass == MOOD_MANAGER && ref.name == "isBabyNTV"
                    } == true
            }?.index
                ?: throw PatchException("unlockMoodsPatch: p() no longer reads isBabyNTV - refusing to guess")
            val moved = syncInstructions.getOrNull(callIndex + 1)
            if (moved == null || moved.opcode != Opcode.MOVE_RESULT || moved !is OneRegisterInstruction) {
                throw PatchException("unlockMoodsPatch: unexpected shape after isBabyNTV() - refusing to guess")
            }
            sync.addInstructions(callIndex + 2, "const/4 v${moved.registerA}, 0x0")
            println("unlockMoodsPatch: baby flag overwritten at its source (p() -> sync payload)")
        }

        val refresh = resolveAnchor(
            "mood catalogue", MoodCatalogueByListCallFingerprint, MoodCatalogueByCustomListFingerprint,
            MoodCatalogueFingerprint, MoodCatalogueV2Fingerprint,
        )
        val instructions = refresh.implementation?.instructions?.toList()
            ?: throw PatchException("unlockMoodsPatch: refreshMoodsList() has no implementation")
        val sites = instructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.INVOKE_DIRECT &&
                instruction is ReferenceInstruction &&
                (instruction.reference as? MethodReference)?.let { ref ->
                    ref.definingClass == MOOD_MANAGER &&
                        ref.name in setOf("getDefaultMoodListNTV", "getCustomMoodListNTV") &&
                        ref.parameterTypes.map(CharSequence::toString) == listOf("Z", "Z")
                } == true
        }.map { it.index }
        if (sites.size != 2) {
            throw PatchException(
                "unlockMoodsPatch: expected the two native mood-catalogue calls, found ${sites.size} - " +
                    "refusing to report the picker as unlocked"
            )
        }
        // Descending: inserting at a later site first keeps the earlier indexes valid.
        for (site in sites.sortedDescending()) {
            refresh.addInstructions(site, "const/4 v1, 0x1\n")
        }
        println("unlockMoodsPatch: mood eligibility, baby gate and ${sites.size} catalogue filters opened")
    }
}
