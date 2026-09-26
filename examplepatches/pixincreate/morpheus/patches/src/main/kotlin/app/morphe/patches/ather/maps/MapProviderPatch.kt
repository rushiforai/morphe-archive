/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.ather.maps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val MAP_PROVIDER = "Lcom/ather/maps/a0;"
private const val MAP_PROVIDER_USECASE = "Lcom/ather/maps/usecase/b;"
private const val MAP_PREF = "Lapp/morphe/ather/MapPref;"

private const val BASIC_SCOOTER_INFO = "Lcom/ather/common/datastore/models/BasicScooterInfo;"
private const val SCOOTER_SHADOW = "Lcom/ather/common/datastore/models/ScooterShadow;"

/**
 * Matches the provider lookup for the scooter selected in the session.
 *
 * ```
 * public final a(): a0
 * ```
 */
internal object SelectedScooterMapProviderFingerprint : Fingerprint(
    definingClass = MAP_PROVIDER_USECASE,
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = MAP_PROVIDER,
    parameters = emptyList(),
)

/**
 * Matches the provider lookup the map factory uses.
 *
 * ```
 * public final b(BasicScooterInfo): a0
 * ```
 */
internal object BasicScooterMapProviderFingerprint : Fingerprint(
    definingClass = MAP_PROVIDER_USECASE,
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = MAP_PROVIDER,
    parameters = listOf(BASIC_SCOOTER_INFO),
)

/**
 * Matches the provider lookup that reads the scooter shadow.
 *
 * ```
 * public final c(ScooterShadow): a0
 * ```
 */
internal object ScooterShadowMapProviderFingerprint : Fingerprint(
    definingClass = MAP_PROVIDER_USECASE,
    name = "c",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = MAP_PROVIDER,
    parameters = listOf(SCOOTER_SHADOW),
)

/**
 * Honours the map provider chosen in the Morphe settings row.
 *
 * The app resolves a map provider from the scooter model and returns it straight away.
 * Google Maps needs Google Play services, and Mappls (Ather's own provider) needs a licence
 * tied to Ather's signing certificate, so neither works in a re-signed build on a phone
 * without Play services. The patch passes every resolved provider through `MapPref.apply`,
 * which returns the forced provider when the user picked one and otherwise swaps the two
 * unusable providers for OpenStreetMap.
 *
 * Equivalent smali (verified against 13.5.0, versionCode 321), inserted before the return of
 * each lookup:
 * ```
 * invoke-static {p0}, Lapp/morphe/ather/MapPref;->apply(Lcom/ather/maps/a0;)Lcom/ather/maps/a0;
 * move-result-object p0
 * ```
 */
@Suppress("unused")
val mapProviderPatch = bytecodePatch(
    name = "Map provider",
    description = "Uses the map provider chosen in the Morphe settings row and falls back to " +
        "OpenStreetMap when Google Maps or Mappls cannot load.",
) {
    compatibleWith("com.athermobileapp")

    extendWith("extensions/ather.mpe")

    execute {
        listOf(
            SelectedScooterMapProviderFingerprint,
            BasicScooterMapProviderFingerprint,
            ScooterShadowMapProviderFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.applyMapPreference()
        }
    }
}

/**
 * Passes the resolved map provider through [MapPref.apply] before it is returned.
 */
private fun MutableMethod.applyMapPreference() {
    val body = implementation ?: throw IllegalStateException(
        "Map provider lookup has no body to patch.",
    )

    val returnIndex = body.instructions.indexOfLast { instruction ->
        instruction.opcode == Opcode.RETURN_OBJECT
    }
    if (returnIndex < 0) {
        throw IllegalStateException("Map provider lookup does not return a provider.")
    }

    addInstructions(
        returnIndex,
        """
            invoke-static {p0}, $MAP_PREF->apply($MAP_PROVIDER)$MAP_PROVIDER
            move-result-object p0
        """.trimIndent(),
    )
}
