/*
 * Copyright 2026 sqzass.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this source.
 *
 * Inlines profile-specific helpers from hxreborn's FreeServerLocations.java.
 * Requires injectFreeServerInfrastructure() to have run first.
 */

package app.morphe.patches.protonvpn.shared.helpers

import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patches.protonvpn.shared.anchors.findPropertyField
import app.morphe.patches.protonvpn.shared.fingerprints.ProfileViewItemToStringFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.SERVER_MANAGER
import app.morphe.patches.shared.misc.smali.addStaticMethod

internal fun injectProfilesInfrastructure() {
    val sm = mutableClassDefBy(SERVER_MANAGER)

    // Idempotent guard: check for the sentinel method
    if (sm.methods.any { it.name == "hxProfileTypesForAccount" }) return

    val availabilityField = findPropertyField(ProfileViewItemToStringFingerprint, "availability")
    val profileItemType = ProfileViewItemToStringFingerprint.originalClassDef.type

    // hxHasFreeServer(Object) → Z — 5 registers (v0-v3, p0)
    sm.addStaticMethod(
        "hxHasFreeServer",
        listOf("Ljava/lang/Object;"),
        "Z",
        5,
        """
            invoke-static { p0 }, ${SERVER_MANAGER}->hxServerList(Ljava/lang/Object;)Ljava/util/List;
            move-result-object v0

            invoke-interface { v0 }, Ljava/util/List;->iterator()Ljava/util/Iterator;
            move-result-object v1
            :goto_outer
            invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
            move-result v2
            if-eqz v2, :end_outer

            invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v2

            invoke-static { v2 }, ${SERVER_MANAGER}->hxIsFreeServer(Ljava/lang/Object;)Z
            move-result v3
            if-eqz v3, :goto_outer

            const/4 v3, 0x1
            return v3

            :end_outer
            const/4 v3, 0x0
            return v3
        """,
    )

    // hxCountriesForAccount(List) → List — 6 registers
    sm.addStaticMethod(
        "hxCountriesForAccount",
        listOf("Ljava/util/List;"),
        "Ljava/util/List;",
        6,
        """
            sget-boolean v0, ${SERVER_MANAGER}->hxSignedIn:Z
            if-nez v0, :return_orig

            new-instance v1, Ljava/util/ArrayList;
            invoke-interface { p0 }, Ljava/util/List;->size()I
            move-result v2
            invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(I)V

            invoke-interface { p0 }, Ljava/util/List;->iterator()Ljava/util/Iterator;
            move-result-object v2
            :goto_outer
            invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
            move-result v3
            if-eqz v3, :end_outer

            invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v3

            invoke-static { v3 }, ${SERVER_MANAGER}->hxHasFreeServer(Ljava/lang/Object;)Z
            move-result v4
            if-eqz v4, :goto_outer

            invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            goto :goto_outer

            :end_outer
            return-object v1

            :return_orig
            return-object p0
        """,
    )

    // hxServersForAccount(List) → List — 6 registers
    sm.addStaticMethod(
        "hxServersForAccount",
        listOf("Ljava/util/List;"),
        "Ljava/util/List;",
        6,
        """
            sget-boolean v0, ${SERVER_MANAGER}->hxSignedIn:Z
            if-nez v0, :return_orig

            new-instance v1, Ljava/util/ArrayList;
            invoke-interface { p0 }, Ljava/util/List;->size()I
            move-result v2
            invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(I)V

            invoke-interface { p0 }, Ljava/util/List;->iterator()Ljava/util/Iterator;
            move-result-object v2
            :goto_outer
            invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
            move-result v3
            if-eqz v3, :end_outer

            invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v3

            invoke-static { v3 }, ${SERVER_MANAGER}->hxIsFreeServer(Ljava/lang/Object;)Z
            move-result v4
            if-eqz v4, :goto_outer

            invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            goto :goto_outer

            :end_outer
            return-object v1

            :return_orig
            return-object p0
        """,
    )

    // hxProfilesForAccount(List) → List — 7 registers
    sm.addStaticMethod(
        "hxProfilesForAccount",
        listOf("Ljava/util/List;"),
        "Ljava/util/List;",
        7,
        """
            sget-boolean v0, ${SERVER_MANAGER}->hxSignedIn:Z
            if-nez v0, :return_orig

            new-instance v1, Ljava/util/ArrayList;
            invoke-interface { p0 }, Ljava/util/List;->size()I
            move-result v2
            invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(I)V

            invoke-interface { p0 }, Ljava/util/List;->iterator()Ljava/util/Iterator;
            move-result-object v2
            :goto_outer
            invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
            move-result v3
            if-eqz v3, :end_outer

            invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v3

            check-cast v3, $profileItemType
            iget-object v4, v3, $profileItemType->${availabilityField.name}:${availabilityField.type}
            check-cast v4, Ljava/lang/Enum;
            invoke-virtual { v4 }, Ljava/lang/Enum;->name()Ljava/lang/String;
            move-result-object v4
            const-string v5, "UNAVAILABLE_PLAN"
            invoke-virtual { v5, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v5
            if-nez v5, :goto_outer

            invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            goto :goto_outer

            :end_outer
            return-object v1

            :return_orig
            return-object p0
        """,
    )

    // hxProfileTypesForAccount(List) → List — 7 registers
    sm.addStaticMethod(
        "hxProfileTypesForAccount",
        listOf("Ljava/util/List;"),
        "Ljava/util/List;",
        7,
        """
            sget-boolean v0, ${SERVER_MANAGER}->hxSignedIn:Z
            if-nez v0, :return_orig

            new-instance v1, Ljava/util/ArrayList;
            const/4 v2, 0x1
            invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(I)V

            invoke-interface { p0 }, Ljava/util/List;->iterator()Ljava/util/Iterator;
            move-result-object v2
            :goto_outer
            invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
            move-result v3
            if-eqz v3, :end_outer

            invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v3

            check-cast v3, Ljava/lang/Enum;
            invoke-virtual { v3 }, Ljava/lang/Enum;->name()Ljava/lang/String;
            move-result-object v4
            const-string v5, "Standard"
            invoke-virtual { v5, v4 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v4
            if-eqz v4, :goto_outer

            invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            goto :goto_outer

            :end_outer
            return-object v1

            :return_orig
            return-object p0
        """,
    )
}
