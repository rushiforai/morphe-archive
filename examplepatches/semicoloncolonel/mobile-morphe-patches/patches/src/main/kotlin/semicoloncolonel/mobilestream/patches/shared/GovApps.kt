package semicoloncolonel.mobilestream.patches.shared

import semicoloncolonel.mobilestream.patches.fema.shared.Constants as Fema
import semicoloncolonel.mobilestream.patches.mytsa.shared.Constants as MyTsa
import semicoloncolonel.mobilestream.patches.nfg.shared.Constants as Nfg
import semicoloncolonel.mobilestream.patches.nps.shared.Constants as Nps

// The government apps that share the analytics patch. The White House app
// has its own patches.
internal val GOV_APPS = arrayOf(
    Nps.COMPATIBILITY,
    MyTsa.COMPATIBILITY,
    Fema.COMPATIBILITY,
    Nfg.COMPATIBILITY,
)
