package io.github.bakwudo.uyu.patches.twitch.channelpoints

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import io.github.bakwudo.uyu.patches.twitch.settings.setPatchIncluded
import io.github.bakwudo.uyu.patches.twitch.settings.settingsPatch
import io.github.bakwudo.uyu.patches.twitch.shared.Constants.COMPATIBILITY_TWITCH
import io.github.bakwudo.uyu.patches.twitch.shared.sharedExtensionPatch
import io.github.bakwudo.uyu.patches.twitch.shared.EXTENSION_PACKAGE
import io.github.bakwudo.uyu.patches.util.smaliReference

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/twitch/channelpoints/AutoClaimChannelPointsPatch;"
private const val HELPER_METHOD_NAME = "kizuAutoClaim"

@Suppress("unused")
val autoClaimChannelPointsPatch = bytecodePatch(
    name = "Auto claim channel points",
    description = "Claims Twitch's Channel Points bonus chest automatically on the channel you are watching.",
) {
    compatibleWith(COMPATIBILITY_TWITCH)

    dependsOn(settingsPatch, sharedExtensionPatch)

    execute {
        setPatchIncluded("autoClaimChannelPoints")

        val claimMethod = ClaimCommunityPointsFingerprint.originalMethod
        val provider = ClaimCommunityPointsFingerprint.classDef

        // CommunityPointsModel.getClaim() returns the bonus that can be claimed, or null.
        // The bonus model has a single String field, its id.
        val getClaim = classDefBy(COMMUNITY_POINTS_MODEL).methods.singleOrNull {
            it.name == "getClaim" && it.parameterTypes.isEmpty()
        } ?: throw PatchException("CommunityPointsModel.getClaim not found.")
        val claimType = getClaim.returnType
        val claimIdField = classDefBy(claimType).fields.singleOrNull {
            it.type == "Ljava/lang/String;" && !AccessFlags.STATIC.isSet(it.accessFlags)
        } ?: throw PatchException("Claim id field not found in $claimType.")

        // Helper added to the provider: report each points update to the extension and claim its
        // bonus if the extension says so. Keeping the logic in its own method needs no free
        // registers at the hook.
        provider.methods.add(
            ImmutableMethod(
                provider.type,
                HELPER_METHOD_NAME,
                listOf(
                    ImmutableMethodParameter(provider.type, null, null),
                    ImmutableMethodParameter(COMMUNITY_POINTS_MODEL, null, null),
                ),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(5),
            ).toMutable().apply {
                addInstructionsWithLabels(
                    0,
                    """
                        if-eqz p1, :done
                        invoke-virtual { p1 }, $COMMUNITY_POINTS_MODEL->getClaim()$claimType
                        move-result-object v0
                        if-eqz v0, :done
                        iget-object v1, v0, $claimType->${claimIdField.name}:Ljava/lang/String;
                        if-eqz v1, :done
                        invoke-static { v1 }, $EXTENSION_CLASS->shouldClaim(Ljava/lang/String;)Z
                        move-result v2
                        if-eqz v2, :done
                        const/4 v2, 0x0
                        invoke-virtual { p0, v1, v2 }, ${claimMethod.smaliReference}
                        invoke-static { p0, v1 }, $EXTENSION_CLASS->startPolling(Ljava/lang/Object;Ljava/lang/String;)V
                        :done
                        return-void
                    """,
                )
            },
        )
        val updateFingerprint = communityPointsModelUpdateFingerprint(provider.type)
        updateFingerprint.method.apply {
            val match = updateFingerprint.instructionMatches.singleOrNull()
                ?: throw PatchException(
                    "Kizu Channel Points: expected one CommunityPointsModel store, found " +
                        updateFingerprint.instructionMatches.size + ".",
                )
            val store = match.getInstruction<TwoRegisterInstruction>()
            val modelRegister = store.registerA
            val providerRegister = store.registerB
            if (modelRegister > 15 || providerRegister > 15) {
                throw PatchException("Kizu Channel Points: unexpected model/provider registers.")
            }

            addInstruction(
                match.index + 1,
                "invoke-static { v$providerRegister, v$modelRegister }, " +
                    "${provider.type}->$HELPER_METHOD_NAME(${provider.type}$COMMUNITY_POINTS_MODEL)V",
            )
        }
    }
}
