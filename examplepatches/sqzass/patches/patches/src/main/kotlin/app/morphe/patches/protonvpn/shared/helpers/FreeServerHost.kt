/*
 * Copyright 2026 sqzass.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Inlines hxreborn's FreeAccount helpers into ServerManager.
 * Idempotent: safe to call from multiple patches.
 */

package app.morphe.patches.protonvpn.shared.helpers

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patches.protonvpn.shared.anchors.VpnUserIsFreeUserFingerprint
import app.morphe.patches.protonvpn.shared.anchors.vpnUserType
import app.morphe.patches.protonvpn.shared.fingerprints.SERVER
import app.morphe.patches.protonvpn.shared.fingerprints.SERVER_MANAGER
import app.morphe.patches.protonvpn.shared.fingerprints.UserInfoInvalidateFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.UserInfoToStringFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.serverGroupItemStateFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.tierParameterIndex
import app.morphe.patches.protonvpn.shared.fingerprints.userInfoUpdateFingerprint
import app.morphe.patches.protonvpn.shared.restrictions.freeServerMethod
import app.morphe.patches.shared.misc.smali.addStaticMethod
import app.morphe.patches.shared.misc.smali.descriptor
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableField

private const val SIGNED_IN_FIELD = "hxSignedIn"

internal fun injectFreeServerInfrastructure() {
    val sm = mutableClassDefBy(SERVER_MANAGER)

    // Idempotent: if infrastructure already installed (by another patch or a prior call), skip.
    if (sm.fields.any { it.name == SIGNED_IN_FIELD }) return

    sm.fields.add(
        ImmutableField(
            sm.type,
            SIGNED_IN_FIELD,
            "Z",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value or AccessFlags.VOLATILE.value,
            null,
            null,
            null,
        ).toMutable(),
    )

    val userInfoType = UserInfoToStringFingerprint.originalClassDef.type
    val userInfoClass = mutableClassDefBy(userInfoType)
    val vpnUserField = userInfoClass.fields.single {
        it.type == vpnUserType && !AccessFlags.STATIC.isSet(it.accessFlags)
    }
    val isFreeUser = VpnUserIsFreeUserFingerprint.originalMethod

    // hxOnUserInfoChanged(Object) — 3 registers
    sm.addStaticMethod(
        "hxOnUserInfoChanged",
        listOf("Ljava/lang/Object;"),
        "V",
        3,
        """
            if-eqz p0, :signed_out
            check-cast p0, $userInfoType
            iget-object v0, p0, $userInfoType->${vpnUserField.name}:${vpnUserField.type}
            if-eqz v0, :signed_out
            invoke-virtual { v0 }, ${descriptor(isFreeUser)}
            move-result v1
            sput-boolean v1, ${SERVER_MANAGER}->$SIGNED_IN_FIELD:Z
            return-void
            :signed_out
            const/4 v1, 0x0
            sput-boolean v1, ${SERVER_MANAGER}->$SIGNED_IN_FIELD:Z
            return-void
        """,
    )

    // hxOnUserInfoInvalidated() — 1 register
    sm.addStaticMethod(
        "hxOnUserInfoInvalidated",
        emptyList(),
        "V",
        1,
        """
            const/4 v0, 0x0
            sput-boolean v0, ${SERVER_MANAGER}->$SIGNED_IN_FIELD:Z
            return-void
        """,
    )

    // hxIsSignedIn() → Z — 1 register
    sm.addStaticMethod(
        "hxIsSignedIn",
        emptyList(),
        "Z",
        1,
        """
            sget-boolean v0, ${SERVER_MANAGER}->$SIGNED_IN_FIELD:Z
            return v0
        """,
    )

    // hxShouldExcludeServer(Z) → Z — 2 registers
    sm.addStaticMethod(
        "hxShouldExcludeServer",
        listOf("Z"),
        "Z",
        2,
        """
            invoke-static { }, ${SERVER_MANAGER}->hxIsSignedIn()Z
            move-result v0
            xor-int/2addr v0, p0
            return v0
        """,
    )

    // hxIsFreeServer(Object) → Z — 2 registers
    val freeServer = freeServerMethod
    sm.addStaticMethod(
        "hxIsFreeServer",
        listOf("Ljava/lang/Object;"),
        "Z",
        2,
        """
            check-cast p0, $SERVER
            invoke-virtual { p0 }, ${descriptor(freeServer)}
            move-result v0
            return v0
        """,
    )

    // Resolve tier getter for hxTierForAvailabilityCheck
    val tierFp = serverGroupItemStateFingerprint()
    val tierIndex = tierFp.originalMethod.tierParameterIndex()
    if (tierIndex <= 0) throw PatchException("Integer tier param not at index > 0")
    val itemType = tierFp.originalMethod.parameterTypes[tierIndex - 1].toString()
    val tierGetter = mutableClassDefBy(itemType).methods.single {
        AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
            it.returnType == "I" &&
            it.parameterTypes.isEmpty()
    }

    // hxTierForAvailabilityCheck(Object, Integer) → Integer — 4 registers
    sm.addStaticMethod(
        "hxTierForAvailabilityCheck",
        listOf("Ljava/lang/Object;", "Ljava/lang/Integer;"),
        "Ljava/lang/Integer;",
        4,
        """
            if-eqz p1, :return_tier
            invoke-virtual { p1 }, Ljava/lang/Integer;->intValue()I
            move-result v0
            if-nez v0, :return_tier
            check-cast p0, $itemType
            invoke-virtual { p0 }, $itemType->${tierGetter.name}()I
            move-result v1
            if-nez v1, :return_tier
            const/4 v1, 0x1
            invoke-static { v1 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
            move-result-object v1
            return-object v1
            :return_tier
            return-object p1
        """,
    )

    // Wire userInfo update → hxOnUserInfoChanged
    userInfoUpdateFingerprint().match().run {
        method.addInstruction(
            instructionMatches.last().index,
            "invoke-static { p1 }, ${SERVER_MANAGER}->hxOnUserInfoChanged(Ljava/lang/Object;)V",
        )
    }

    // Wire userInfo invalidate → hxOnUserInfoInvalidated
    UserInfoInvalidateFingerprint.method.addInstruction(
        0,
        "invoke-static { }, ${SERVER_MANAGER}->hxOnUserInfoInvalidated()V",
    )
}
