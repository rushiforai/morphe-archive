/*
 * Copyright 2026 sqzass.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Inlines hxreborn's FreeServerLocations.resolve* / itemsVisibleToTier helpers
 * into ServerManager (same approach as the other *Host.kt files).
 */

package app.morphe.patches.protonvpn.shared.helpers

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patches.protonvpn.shared.fingerprints.SERVER_MANAGER
import app.morphe.patches.protonvpn.shared.fingerprints.serverGroupItemStateFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.tierParameterIndex
import app.morphe.patches.shared.misc.smali.addStaticMethod
import com.android.tools.smali.dexlib2.AccessFlags

internal fun injectFreeServerUIFilters() {
    val sm = mutableClassDefBy(SERVER_MANAGER)

    if (sm.methods.any { it.name == "hxItemsVisibleToTier" }) return

    // hxResolveFilterButtons(List) → List — 2 registers (v0, p0)
    sm.addStaticMethod(
        "hxResolveFilterButtons",
        listOf("Ljava/util/List;"),
        "Ljava/util/List;",
        2,
        """
            invoke-static { }, ${SERVER_MANAGER}->hxIsSignedIn()Z
            move-result v0
            if-eqz v0, :return_orig
            invoke-static { }, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object v0
            return-object v0
            :return_orig
            return-object p0
        """,
    )

    // hxResolveSelectedFilter(Object) → Object — 3 registers (v0, v1, p0)
    sm.addStaticMethod(
        "hxResolveSelectedFilter",
        listOf("Ljava/lang/Object;"),
        "Ljava/lang/Object;",
        3,
        """
            invoke-static { }, ${SERVER_MANAGER}->hxIsSignedIn()Z
            move-result v0
            if-eqz v0, :return_orig
            if-eqz p0, :return_orig
            check-cast p0, Ljava/lang/Enum;
            invoke-virtual { p0 }, Ljava/lang/Enum;->getDeclaringClass()Ljava/lang/Class;
            move-result-object v0
            const-string v1, "All"
            invoke-static { v0, v1 }, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;
            move-result-object v0
            return-object v0
            :return_orig
            return-object p0
        """,
    )

    // Resolve item type + tier getter (same as in FreeServerHost)
    val tierFp = serverGroupItemStateFingerprint()
    val tierIndex = tierFp.originalMethod.tierParameterIndex()
    if (tierIndex <= 0) throw PatchException("Integer tier param not at index > 0")
    val itemType = tierFp.originalMethod.parameterTypes[tierIndex - 1].toString()
    val tierGetter = mutableClassDefBy(itemType).methods.single {
        AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
            it.returnType == "I" &&
            it.parameterTypes.isEmpty()
    }

    // hxItemsVisibleToTier(List, Integer) → List — 7 registers (v0-v4, p0, p1)
    sm.addStaticMethod(
        "hxItemsVisibleToTier",
        listOf("Ljava/util/List;", "Ljava/lang/Integer;"),
        "Ljava/util/List;",
        7,
        """
            if-eqz p1, :return_orig
            invoke-virtual { p1 }, Ljava/lang/Integer;->intValue()I
            move-result v0
            if-nez v0, :return_orig

            new-instance v1, Ljava/util/ArrayList;
            invoke-interface { p0 }, Ljava/util/List;->size()I
            move-result v2
            invoke-direct { v1, v2 }, Ljava/util/ArrayList;-><init>(I)V

            invoke-interface { p0 }, Ljava/util/List;->iterator()Ljava/util/Iterator;
            move-result-object v2
            :loop
            invoke-interface { v2 }, Ljava/util/Iterator;->hasNext()Z
            move-result v3
            if-eqz v3, :end

            invoke-interface { v2 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v3

            check-cast v3, $itemType
            invoke-virtual { v3 }, $itemType->${tierGetter.name}()I
            move-result v4
            if-nez v4, :loop

            invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            goto :loop

            :end
            return-object v1

            :return_orig
            return-object p0
        """,
    )
}
