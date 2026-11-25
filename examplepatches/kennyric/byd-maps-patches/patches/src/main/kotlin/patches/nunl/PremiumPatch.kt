package patches.nunl

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hidePremiumBanner = bytecodePatch(
    name = "Hide Premium banner",
    description = "Removes the observed contentBlocker registration/premium notice while retaining ordinary WebAppBlock embeds and NU+ article links. Does not retrieve article bodies omitted by the server.",
) {
    dependsOn(originalInput)
    compatibleWith(nunl)
    execute { installPremiumFilter() }
}
