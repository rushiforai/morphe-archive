/*
 * Copyright 2026 sqzass.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Injects an ExcludedLocations-style helper (hxreborn's extension class, inlined) into
 * ServerManager. Alternative to building a full extension module.
 */

package app.morphe.patches.protonvpn.shared.helpers

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patches.protonvpn.shared.anchors.VpnUserIsFreeUserFingerprint
import app.morphe.patches.protonvpn.shared.anchors.propertyGetter
import app.morphe.patches.protonvpn.shared.fingerprints.ExcludedLocationsConstructorFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.ExcludedLocationsToStringFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.SERVER
import app.morphe.patches.protonvpn.shared.fingerprints.SERVER_MANAGER
import app.morphe.patches.protonvpn.shared.fingerprints.VpnCountryConstructorFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.VpnCountryToStringFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.bestServerForConnectIntentCallFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.randomServerFingerprint
import app.morphe.patches.protonvpn.shared.fingerprints.serverIsExcludedFingerprint
import app.morphe.patches.shared.misc.smali.addStaticMethod
import app.morphe.patches.shared.misc.smali.descriptor
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField

private const val FIELD_NAME = "hxLatestExcludedLocations"

internal fun injectExcludedLocationsHelper() {
    val sm = mutableClassDefBy(SERVER_MANAGER)

    if (sm.fields.any { it.name == FIELD_NAME }) {
        throw PatchException(
            "$SERVER_MANAGER already has $FIELD_NAME — ExcludedLocations helper injected twice",
        )
    }

    sm.fields.add(
        ImmutableField(
            sm.type,
            FIELD_NAME,
            "Ljava/lang/Object;",
            AccessFlags.PRIVATE.value or AccessFlags.STATIC.value or AccessFlags.VOLATILE.value,
            null,
            null,
            null,
        ).toMutable(),
    )

    val isFreeUser = VpnUserIsFreeUserFingerprint.originalMethod
    val serverListGetter = propertyGetter(VpnCountryToStringFingerprint, "serverList")
    val flagGetter = propertyGetter(VpnCountryToStringFingerprint, "flag")
    val countryCtor = VpnCountryConstructorFingerprint.originalMethod
    val serverIsExcluded = serverIsExcludedFingerprint().originalMethod
    val excludedLocationsType = ExcludedLocationsToStringFingerprint.originalClassDef.type

    // hxOnExcludedLocationsCreated(Object) — 1 register (p0)
    sm.addStaticMethod(
        "hxOnExcludedLocationsCreated",
        listOf("Ljava/lang/Object;"),
        "V",
        1,
        """
            sput-object p0, ${SERVER_MANAGER}->$FIELD_NAME:Ljava/lang/Object;
            return-void
        """,
    )

    // hxIsFreeUser(Object) → Z — 2 registers (v0, p0)
    sm.addStaticMethod(
        "hxIsFreeUser",
        listOf("Ljava/lang/Object;"),
        "Z",
        2,
        """
            check-cast p0, ${isFreeUser.definingClass}
            invoke-virtual { p0 }, ${descriptor(isFreeUser)}
            move-result v0
            return v0
        """,
    )

    // hxServerList(Object) → List — 2 registers (v0, p0)
    sm.addStaticMethod(
        "hxServerList",
        listOf("Ljava/lang/Object;"),
        "Ljava/util/List;",
        2,
        """
            check-cast p0, ${serverListGetter.definingClass}
            invoke-virtual { p0 }, ${descriptor(serverListGetter)}
            move-result-object v0
            return-object v0
        """,
    )

    // hxIsExcluded(Object, Object) → Z — 3 registers (v0, p0, p1)
    sm.addStaticMethod(
        "hxIsExcluded",
        listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
        "Z",
        3,
        """
            check-cast p0, $SERVER
            check-cast p1, $excludedLocationsType
            invoke-static { p0, p1 }, ${descriptor(serverIsExcluded)}
            move-result v0
            return v0
        """,
    )

    // hxCopyWithServers(Object, List) → Object — 4 registers (v0, v1, p0, p1)
    sm.addStaticMethod(
        "hxCopyWithServers",
        listOf("Ljava/lang/Object;", "Ljava/util/List;"),
        "Ljava/lang/Object;",
        4,
        """
            check-cast p0, ${flagGetter.definingClass}
            invoke-virtual { p0 }, ${descriptor(flagGetter)}
            move-result-object v1
            new-instance v0, ${countryCtor.definingClass}
            invoke-direct { v0, v1, p1 }, ${descriptor(countryCtor)}
            return-object v0
        """,
    )

    // hxCountriesWithoutExcludedServers(List) → List — 11 registers (v0-v9, p0)
    sm.addStaticMethod(
        "hxCountriesWithoutExcludedServers",
        listOf("Ljava/util/List;"),
        "Ljava/util/List;",
        11,
        """
            sget-object v0, ${SERVER_MANAGER}->$FIELD_NAME:Ljava/lang/Object;
            if-nez v0, :early_return

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

            invoke-static { v3 }, ${SERVER_MANAGER}->hxServerList(Ljava/lang/Object;)Ljava/util/List;
            move-result-object v4

            new-instance v5, Ljava/util/ArrayList;
            invoke-interface { v4 }, Ljava/util/List;->size()I
            move-result v6
            invoke-direct { v5, v6 }, Ljava/util/ArrayList;-><init>(I)V

            invoke-interface { v4 }, Ljava/util/List;->iterator()Ljava/util/Iterator;
            move-result-object v6
            :goto_inner
            invoke-interface { v6 }, Ljava/util/Iterator;->hasNext()Z
            move-result v7
            if-eqz v7, :end_inner

            invoke-interface { v6 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v7

            invoke-static { v7, v0 }, ${SERVER_MANAGER}->hxIsExcluded(Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v8
            if-nez v8, :goto_inner

            invoke-virtual { v5, v7 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            goto :goto_inner

            :end_inner
            invoke-virtual { v5 }, Ljava/util/ArrayList;->size()I
            move-result v8
            invoke-interface { v4 }, Ljava/util/List;->size()I
            move-result v9
            if-ne v8, v9, :add_country
            if-eqz v8, :goto_outer

            invoke-static { v3, v5 }, ${SERVER_MANAGER}->hxCopyWithServers(Ljava/lang/Object;Ljava/util/List;)Ljava/lang/Object;
            move-result-object v3

            :add_country
            invoke-virtual { v1, v3 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            goto :goto_outer

            :end_outer
            return-object v1

            :early_return
            return-object p0
        """,
    )

    // hxServerUnlessExcludedForFreeUser(Object, Object, Object) → Object — 4 regs (v0, p0-p2)
    sm.addStaticMethod(
        "hxServerUnlessExcludedForFreeUser",
        listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
        "Ljava/lang/Object;",
        4,
        """
            if-eqz p0, :return_server
            if-eqz p1, :return_server
            invoke-static { p1 }, ${SERVER_MANAGER}->hxIsFreeUser(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :return_server
            invoke-static { p0, p2 }, ${SERVER_MANAGER}->hxIsExcluded(Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v0
            if-nez v0, :return_server
            const/4 v0, 0x0
            return-object v0
            :return_server
            return-object p0
        """,
    )

    // Wire ExcludedLocations constructor → hxOnExcludedLocationsCreated
    ExcludedLocationsConstructorFingerprint.match().run {
        val returnVoid = instructionMatches.first()
        val paramSize = method.parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 }
        val thisRegister = method.implementation!!.registerCount - paramSize - 1
        val overwrite = method.instructions.toList().take(returnVoid.index).withIndex()
            .find { (_, insn) ->
                insn is OneRegisterInstruction &&
                    insn.opcode.setsRegister() &&
                    insn.registerA == thisRegister
            }
        if (overwrite != null) {
            throw PatchException("`this` overwritten at ${overwrite.index} in $method")
        }
        method.addInstructions(
            returnVoid.index,
            "invoke-static { p0 }, ${SERVER_MANAGER}->hxOnExcludedLocationsCreated(Ljava/lang/Object;)V",
        )
    }

    // Wire random-server list → hxCountriesWithoutExcludedServers
    randomServerFingerprint().match().run {
        val countriesResult = instructionMatches[1]
        val countries = countriesResult.getInstruction<OneRegisterInstruction>().registerA
        method.addInstructions(
            countriesResult.index + 1,
            """
                invoke-static { v$countries }, ${SERVER_MANAGER}->hxCountriesWithoutExcludedServers(Ljava/util/List;)Ljava/util/List;
                move-result-object v$countries
            """,
        )
    }
}

internal fun wireBestServerExclusionCheck() {
    bestServerForConnectIntentCallFingerprint().match().run {
        val bestServerCall = instructionMatches[0]
        val bestServerResult = instructionMatches[1]
        val arguments = bestServerCall.instruction as? RegisterRangeInstruction
            ?: throw PatchException("Best server call is not a range call in $method")
        val server = bestServerResult.getInstruction<OneRegisterInstruction>().registerA
        val vpnUser = arguments.startRegister + 2
        val excludedLocations = arguments.startRegister + 5
        if (maxOf(server, vpnUser, excludedLocations) > 15) {
            throw PatchException("Best server registers do not fit a non-range invoke in $method")
        }
        method.addInstructions(
            bestServerResult.index + 1,
            """
                invoke-static { v$server, v$vpnUser, v$excludedLocations }, ${SERVER_MANAGER}->hxServerUnlessExcludedForFreeUser(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$server
                check-cast v$server, $SERVER
            """,
        )
    }
}
