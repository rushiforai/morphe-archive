package app.template.patches.niagara.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_NIAGARA
import app.template.patches.shared.addInstructionsChecked

/**
 * Niagara has no local licence check: its Pro entitlement is the account JWT's "pro" claim (plus
 * the "flg" bit 0x20000), parsed into a three-boolean account state class that the app builds for
 * every account change (1.16.33: b/gzD9a0YbOD6gO7InQ4, toString "E(1=%s, 2=%s)").
 *
 * The first flag is the Pro switch: ~100 methods read it (settings, feature gates, the
 * subscription screens). The second flag is the account access switch that AccessDeniedActivity
 * finishes on. The third flag the app sets on its own (the free/no-claim state is
 * (false, false, true), a Pro claim is (true, true, false)), so it is left as built.
 *
 * Every construction goes through the (Z,Z,Z) constructor, so loading 1 into the first two
 * parameters at entry makes every state Pro without touching the JWT parse, the DataStore or the
 * Play Billing publishers. Server-backed features (account sync) still need a real account.
 *
 * Verified 2026-10-27 against 1.16.33 (versionCode 1639): see COMPATIBILITY_NIAGARA.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Niagara Pro and skips the 7-day trial prompt.",
) {
    compatibleWith(COMPATIBILITY_NIAGARA)

    execute {
        // The account record is the only (UUID, String, String, ..., auth0 JWT) constructor.
        val flagsType = AccountRecordFingerprint.method.parameterTypes[3].toString()
        val flags = mutableClassDefBy(flagsType)

        // Shape guard: the parameter must be the three-boolean account state, not some other
        // record field that happens to be a class.
        val fields = flags.fields.toList()
        if (fields.size != 3 || fields.any { it.type != "Z" }) {
            throw PatchException(
                "$flagsType is not the three-boolean account state: " +
                    fields.joinToString { "${it.name}:${it.type}" },
            )
        }
        if (flags.methods.none {
                it.name == "equals" && it.returnType == "Z" &&
                    it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;")
            }
        ) {
            throw PatchException("$flagsType has no equals(Object)Z; not a data-class state")
        }
        val constructors = flags.methods.filter {
            it.name == "<init>" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Z", "Z", "Z") &&
                it.implementation != null
        }
        if (constructors.size != 1) {
            throw PatchException(
                "expected one (Z,Z,Z) constructor in $flagsType, found ${constructors.map { it.name }}",
            )
        }

        // p1 and p2 are the state's first two flags (a 4-register method: p0..p3), so the
        // inserted constants fit const/4.
        constructors.single().addInstructionsChecked(
            0,
            """
                const/4 p1, 0x1
                const/4 p2, 0x1
            """,
        )
    }
}
