package app.tgseed.patches.symfonium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.tgseed.patches.shared.Constants.COMPATIBILITY_SYMFONIUM
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Stops the app from intermittently replacing the requested screen with the "This beta version
 * has expired" update wall.
 *
 * The state -> screen mapper is randomising on purpose. Recovered structure:
 *
 *     a(state):
 *         v0 = licenceManager.f()          // non-zero "needs attention" code, 0 = unset
 *         if (v0 == 0) goto normal
 *         v0 = Random.nextInt(0, 10)       // the singleton is java.util.Random backed
 *         if (v0 != 4) goto normal
 *         return providerFor(ExpiredBeta)  // hijacks the navigation, ~1 in 10 times
 *     normal:
 *         return providerFor(state.javaClass)
 *
 * So a single install either never sees the wall or is nagged on roughly a tenth of all
 * navigations - which is exactly the reported "sometimes when I open settings" behaviour, and it
 * is not something the licence patches can affect because it is driven by a different code than
 * the entitlement.
 *
 * Liveness of the code that feeds it is unclear (a sentinel int set through the init pipeline), so
 * the patch does not touch that source or its other consumers: it only pins the local gate. The
 * branch is forced to its "normal" path by zeroing the register it tests immediately before the
 * compare, which needs no label reconstruction and leaves the rest of the mapper untouched.
 *
 * Discovery is structural: the mapper is the method holding the "Unknown destination requested"
 * literal (an un-renamable diagnostic string kept in the obfuscated build), and the gate is the
 * first IF_EQZ in that method, which by construction runs before that literal is reached.
 */
private const val ANCHOR = "Unknown destination requested"

@Suppress("unused")
val disableBetaExpiryTripwirePatch = bytecodePatch(
    name = "Disable beta expiry tripwire",
    description = "Stops the app from randomly replacing the requested screen with the " +
        "\"beta version has expired\" update wall.",
    default = false
) {
    compatibleWith(COMPATIBILITY_SYMFONIUM)

    execute {
        val defs = ArrayList<ClassDef>()
        classDefForEach { def -> defs.add(def) }

        data class Site(val methodIndex: Int, val branchIndex: Int, val register: Int)

        val sites = ArrayList<Pair<ClassDef, Site>>()
        for (def in defs) {
            def.methods.forEachIndexed { methodIndex, method ->
                val instructions = method.implementation?.instructions?.toList()
                    ?: return@forEachIndexed
                val anchorIndex = instructions.indexOfFirst { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                        ?.string == ANCHOR
                }
                if (anchorIndex < 0) return@forEachIndexed
                val branchIndex = instructions.indexOfFirst { instruction ->
                    instruction.opcode == Opcode.IF_EQZ &&
                        instruction is OneRegisterInstruction
                }
                if (branchIndex < 0 || branchIndex >= anchorIndex) {
                    throw PatchException(
                        "Beta tripwire gate not found in " + def.type +
                            "->" + method.name + " - structure changed?"
                    )
                }
                sites.add(
                    def to Site(
                        methodIndex,
                        branchIndex,
                        (instructions[branchIndex] as OneRegisterInstruction).registerA
                    )
                )
            }
        }

        if (sites.size != 1) {
            throw PatchException(
                "Beta tripwire sites: ${sites.size}, expected 1 - structure changed?"
            )
        }
        val (def, site) = sites.single()
        val method = mutableClassDefBy(def).methods.toList()[site.methodIndex]
        // The branch tests the "needs attention" code; zero it so the normal lookup is always
        // used. The register is a local temp at this point, so clobbering it is safe.
        val const = if (site.register <= 0xF) "const/4 v" else "const/16 v"
        method.addInstructions(site.branchIndex, const + site.register + ", 0x0")
        println(
            "Disable beta expiry tripwire: forced the " + def.type + "->" + method.name +
                " destination mapper to its normal path"
        )
    }
}
