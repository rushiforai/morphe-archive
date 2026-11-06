package app.template.patches.trakt.vip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TRAKT_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/**
 * trakt.TV Shows & Movies (tv.trakt.trakt), analyzed on stock 3.26.1 (449).
 *
 * VIP status lives in exactly one place: the Kotlinx-serialized
 * tv.trakt.trakt.common.model.User data class. Field layout:
 *
 *   a=Ids, b..f=Strings, g=isPrivate(Z), h=isVip(Z), i=isVipEp(Z),
 *   j=isVipOg(Z), k=isDirector(Z), l=Images, m=Streamings, n=Settings
 *
 * Nine distinct read sites consult `User;->h:Z` for ad-removal, advanced
 * filters, saved filters, year-in-review etc. The value flows in only from
 * the public 14-arg constructor (the synthetic default-args bridge delegates
 * to it). Forcing constructor arg p8 (=isVip) to 1 before the `iput-boolean
 * p8, p0, ->h:Z` store therefore upgrades the parsed user object for every
 * consumer, whatever the gate.
 *
 * isVipEp / isVipOg / isDirector are deliberately left untouched: badge
 * variants and staff flags, not feature gates.
 *
 * Can only unlock what the app gates locally. Membership benefits computed
 * server-side by the Trakt API (e.g. website VIP badge, API-level perks)
 * keep following the real account tier.
 */
@Suppress("unused")
val unlockVipPatch = bytecodePatch(
    name = "Unlock VIP",
    description = "Unlocks VIP in trakt.TV Shows & Movies by forcing the parsed User.isVip flag to true " +
        "(covers no-ads, advanced/saved filters, year-in-review and other local VIP gates). " +
        "Methods delegating to the primary User constructor are covered automatically.",
    default = true,
) {
    compatibleWith(TRAKT_COMPATIBILITY)

    execute {
        Fingerprint(
            definingClass = "Ltv/trakt/trakt/common/model/User;",
            name = "<init>",
            returnType = "V",
            parameters = listOf(
                "Ltv/trakt/trakt/common/model/Ids;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Z", "Z", "Z", "Z", "Z",
                "Ltv/trakt/trakt/common/model/User${'$'}Images;",
                "Ltv/trakt/trakt/common/model/User${'$'}Streamings;",
                "Ltv/trakt/trakt/common/model/User${'$'}Settings;",
            ),
        ).method.apply {
            val idx = instructions.indexOfFirst {
                it.opcode == Opcode.IPUT_BOOLEAN &&
                    (it as ReferenceInstruction).reference.toString()
                        .contains("Ltv/trakt/trakt/common/model/User;->h:Z")
            }
            if (idx < 0) throw PatchException("isVip store instruction (iput-boolean User;->h:Z) not found.")
            addInstructions(idx, "const/4 p8, 0x1")
        }
    }
}
