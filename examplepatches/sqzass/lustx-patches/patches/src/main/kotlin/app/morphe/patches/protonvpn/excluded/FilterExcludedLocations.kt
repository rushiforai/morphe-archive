/*
 * Copyright 2026 sqzass.
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 */

package app.morphe.patches.protonvpn.excluded

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.protonvpn.shared.helpers.injectProfilesInfrastructure
import app.morphe.patches.shared.misc.smali.addStaticMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val SERVER_MANAGER = "Lcom/protonvpn/android/utils/ServerManager;"

private object ServerManagerFZingerprint : Fingerprint(
    definingClass = SERVER_MANAGER,
    name = "f",
    returnType = "Ljava/util/List;",
    parameters = listOf("Z"),
)

private object ServerManagerMZingerprint : Fingerprint(
    definingClass = SERVER_MANAGER,
    name = "m",
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
)

internal fun filterExcludedLocations() {
    injectAlwaysCountryFilter()

    val fWrapped = wrapListReturns(ServerManagerFZingerprint.match().method, "f(Z)")
    val mWrapped = wrapListReturns(ServerManagerMZingerprint.match().method, "m()")

    println(
        "[protonvpn] excluded: always-filter wrapped f(Z)=$fWrapped m()=$mWrapped",
    )
}

private fun injectAlwaysCountryFilter() {
    injectProfilesInfrastructure()

    val sm = mutableClassDefBy(SERVER_MANAGER)
    if (sm.methods.any { it.name == "hxLustxFilterCountries" }) return

    sm.addStaticMethod(
        "hxLustxFilterCountries",
        listOf("Ljava/util/List;"),
        "Ljava/util/List;",
        6,
        """
            new-instance v0, Ljava/util/ArrayList;

            invoke-interface { p0 }, Ljava/util/List;->size()I
            move-result v1
            invoke-direct { v0, v1 }, Ljava/util/ArrayList;-><init>(I)V

            invoke-interface { p0 }, Ljava/util/List;->iterator()Ljava/util/Iterator;
            move-result-object v1

            :loop
            invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
            move-result v2
            if-eqz v2, :done

            invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v2

            invoke-static { v2 }, $SERVER_MANAGER->hxHasFreeServer(Ljava/lang/Object;)Z
            move-result v3
            if-eqz v3, :loop

            invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            goto :loop

            :done
            return-object v0
        """.trimIndent(),
    )
}

private fun wrapListReturns(
    method: MutableMethod,
    label: String,
): Int {
    val insns = method.instructions.toList()
    val returns = insns.indices.filter { insns[it].opcode == Opcode.RETURN_OBJECT }

    if (returns.isEmpty()) {
        throw PatchException("ProtonVPN: no return-object in ServerManager.$label")
    }

    var wrapped = 0

    for (returnIndex in returns.sortedDescending()) {
        val prev = insns[returnIndex - 1]

        val listReg = when (prev.opcode) {
            Opcode.IGET_OBJECT -> (prev as TwoRegisterInstruction).registerA
            Opcode.MOVE_RESULT_OBJECT -> (prev as OneRegisterInstruction).registerA
            else -> continue
        }

        method.addInstruction(
            returnIndex,
            "invoke-static { v$listReg }, $SERVER_MANAGER->hxLustxFilterCountries(Ljava/util/List;)Ljava/util/List;",
        )
        method.addInstruction(returnIndex + 1, "move-result-object v$listReg")
        wrapped++
    }

    println("[protonvpn] excluded: wrapped $wrapped return(s) in ServerManager.$label")

    return wrapped
}
