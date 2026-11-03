package app.template.patches.wemuslim.layout

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_WEMUSLIM
import app.template.patches.wemuslim.misc.encryption.bypassNativeEncryptionPatch

private const val INFO_STREAM_UNIT = "Lcom/fyxtech/muslim/protobuf/InfoStreamProto\$InfoStreamUnit;"

// The home and prayer feeds are a server-driven InfoStream list; the builder checks a chain of
// protobuf accessors and drops a unit that matches none of them (the same mechanism the premium
// banner patch uses for hasMembershipInfo). Answering false here removes the unit and its slot
// without leaving a gap:
//   hasLoginGuide        the "Log in" banner
//   hasNearby            the Nearby (map) card
//   hasPostInfo          the Feeds / Ummah post section
//   hasStore             Popular Items (theme store)
//   hasFirstRecharge     the first-recharge reward card
//   hasWatchAdWinRewards "Claim Rewards by Watching Ads"
// The Ad-Free buttons, the Ask AI search bar, the Me screen rows and the bottom navigation tabs
// are not InfoStream units and are not touched by this patch.
@Suppress("unused")
val hideFeedClutterPatch = bytecodePatch(
    name = "Hide feed clutter",
    description = "Hides the login, Nearby, Feeds, theme store, recharge and watch-ad reward units.",
) {
    compatibleWith(COMPATIBILITY_WEMUSLIM)

    dependsOn(bypassNativeEncryptionPatch)

    execute {
        val streamUnit = mutableClassDefByOrNull(INFO_STREAM_UNIT)
            ?: throw PatchException("Hide feed clutter: $INFO_STREAM_UNIT not found")
        for (name in HIDDEN_UNITS) {
            val accessor = streamUnit.methods.singleOrNull {
                it.name == name && it.returnType == "Z" && it.parameterTypes.isEmpty() &&
                    it.implementation != null
            } ?: throw PatchException("Hide feed clutter: no $INFO_STREAM_UNIT->$name()Z")
            accessor.returnEarly(false)
        }
    }
}

private val HIDDEN_UNITS = listOf(
    "hasLoginGuide",
    "hasNearby",
    "hasPostInfo",
    "hasStore",
    "hasFirstRecharge",
    "hasWatchAdWinRewards",
)
