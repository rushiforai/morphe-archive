package app.template.patches.caltopo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.template.patches.shared.Constants.CALTOPO_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.shared.ensureRegisters

// CalTopo renders its map UI in a WebView served by an embedded request handler, and
// both the native screens and the web UI read the account tier from one place: the
// FeatureGroup resolved for the signed in UserAccount. The group id normally comes
// from the server ("featuresId") or is derived from the subscription plan name, and
// a missing account resolves to "free". Replacing the three resolvers below with a
// constant tier unlocks every client enforced gate: offline layer downloads, the 3D
// view, travel plan statistics, custom icons, parcel measurement, elevation in
// exports and the restricted overlays menu. Tiles for restricted layers and the
// packaged offline downloads are still produced by caltopo.com, which applies its own
// account check, so those stay subject to the server.

private const val USER_ACCOUNT = "Lorg/sarsoft/common/model/UserAccount;"
private const val FEATURE_GROUP = "Lorg/sarsoft/common/model/FeatureGroup;"

private val FEATURE_GROUP_IDS = mapOf(
    "Desktop" to "desktop",
    "Pro" to "pro",
    "Mobile" to "mobile",
    "Small team" to "team-small",
)

val ComputedFeatureGroupIdFingerprint = Fingerprint(
    definingClass = USER_ACCOUNT,
    name = "getComputedFeatureGroupId",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

val ComputedTeamFeatureGroupIdFingerprint = Fingerprint(
    definingClass = USER_ACCOUNT,
    name = "getComputedTeamFeatureGroupId",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

val FeatureGroupForAccountFingerprint = Fingerprint(
    definingClass = FEATURE_GROUP,
    name = "get",
    returnType = FEATURE_GROUP,
    parameters = listOf(USER_ACCOUNT),
)

@Suppress("unused")
val caltopoUnlockPatch = bytecodePatch(
    name = "Unlock Desktop features",
    description = "Resolves the CalTopo account to the Desktop feature tier on the device, " +
        "which enables the client gated features: offline layer downloads for every tier, " +
        "the 3D view, travel plan statistics, custom icons, parcel measurement and " +
        "elevation in exports. Works with or without a signed in account. Restricted " +
        "layer tiles and packaged offline downloads are still produced by the CalTopo " +
        "server, which applies its own account check.",
    default = true,
) {
    compatibleWith(CALTOPO_COMPATIBILITY)

    val featureGroupId by stringOption(
        key = "featureGroupId",
        default = "desktop",
        values = FEATURE_GROUP_IDS,
        title = "Feature tier",
        description = "CalTopo feature group id to resolve the account to. Desktop is the " +
            "highest personal tier.",
        required = true,
    )

    execute {
        val tier = featureGroupId?.trim()?.takeIf { it.isNotEmpty() }
            ?: throw PatchException("The feature tier option must not be empty")
        if (!tier.matches(Regex("[a-z0-9-]+"))) {
            throw PatchException("Invalid feature group id: $tier")
        }

        listOf(ComputedFeatureGroupIdFingerprint, ComputedTeamFeatureGroupIdFingerprint).forEach { fingerprint ->
            fingerprint.method.apply {
                ensureRegisters(2)
                clearBody()
                addInstructions(
                    0,
                    """
                    const-string v0, "$tier"
                    return-object v0
                    """.trimIndent(),
                )
            }
        }

        // Covers a null account, which otherwise resolves to the free tier.
        FeatureGroupForAccountFingerprint.method.apply {
            ensureRegisters(2)
            clearBody()
            addInstructions(
                0,
                """
                const-string v0, "$tier"
                invoke-static {v0}, $FEATURE_GROUP->get(Ljava/lang/String;)$FEATURE_GROUP
                move-result-object v0
                return-object v0
                """.trimIndent(),
            )
        }
    }
}
