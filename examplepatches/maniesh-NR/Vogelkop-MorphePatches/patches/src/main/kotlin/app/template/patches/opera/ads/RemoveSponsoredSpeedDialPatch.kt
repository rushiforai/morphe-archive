package app.template.patches.opera.ads

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.morphe.patcher.util.matchAllMethodIndicesForEach
import app.template.patches.opera.OPERA_BETA_COMPATIBILITY
import app.template.patches.opera.OPERA_COMPATIBILITY
import app.template.patches.opera.OPERA_DIRECT_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

/**
 * Opera's start page embeds "suggested sites" — sponsored Speed Dial tiles and
 * partner tiles that sync from Opera's partner catalogue into a Room database
 * (`com.opera.android.suggested_sites.SuggestedSitesDatabase`) with the tables
 * `partner_data`, `partner_tree` and `domain_data`.
 *
 * The DAO lambda that refreshes/reads the database contains three SQL queries:
 *
 *   SELECT * FROM partner_data
 *   SELECT * FROM partner_tree LIMIT 1
 *   SELECT * FROM domain_data
 *
 * (verified identical in Opera 103.3.5234.91185 and Opera Beta 104.0.5262.91143)
 *
 * The patch appends `WHERE 0` to each query, so the tables always read as empty:
 * no sponsored tiles are ever shown, while the database schema stays intact and
 * the sync/insert code keeps running harmlessly.
 *
 * Replacement runs on the patcher's prebuilt string index via
 * `matchAllMethodIndicesForEach`, so only the matched methods are ever
 * materialized as mutable classes (the whole-app `classDefForEach` +
 * `mutableClassDefByOrNull` scan used before pushed peak patching memory to
 * 1.1-1.5 GB; see README "Memory usage").
 */
@Suppress("unused")
val operaRemoveSponsoredSpeedDialPatch = patch(
    name = "Remove sponsored Speed Dial",
    description = "Stops sponsored/partner tiles from appearing on the start page " +
        "by making Opera's suggested-sites database queries return no rows. " +
        "Regular Speed Dial entries and bookmarks are not affected.",
    default = true,
) {
    compatibleWith(OPERA_COMPATIBILITY, OPERA_DIRECT_COMPATIBILITY, OPERA_BETA_COMPATIBILITY)

    execute {
        val sqlReplacements = mapOf(
            "SELECT * FROM partner_data" to "SELECT * FROM partner_data WHERE 0",
            "SELECT * FROM partner_tree LIMIT 1" to "SELECT * FROM partner_tree WHERE 0 LIMIT 1",
            "SELECT * FROM domain_data" to "SELECT * FROM domain_data WHERE 0",
        )

        var patched = 0
        for ((originalSql, emptySql) in sqlReplacements) {
            string(originalSql).matchAllMethodIndicesForEach(requireMatches = false) { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                replaceInstruction(
                    index,
                    BuilderInstruction21c(
                        Opcode.CONST_STRING,
                        register,
                        ImmutableStringReference(emptySql),
                    ),
                )
                patched++
            }
        }

        if (patched != sqlReplacements.size) {
            throw PatchException(
                "Expected exactly ${sqlReplacements.size} suggested-sites SQL constants, " +
                    "found $patched. Is this an unsupported Opera version?",
            )
        }

        println("Opera sponsored Speed Dial: neutralized $patched SQL query(ies).")
    }
}
