package patches.tubantia

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hidePremiumBanner = bytecodePatch(name = "Hide Premium banner", description = "Suppresses automatic marketing templates and Premium markers while retaining LIVE labels, editorial promotions and manual account navigation.") {
    compatibleWith(tubantia)
    dependsOn(originalInput, emptyMarketingTemplates, contentFilters)
    execute {
        change(FILTER, "morphePremium()Z", TRUE)
        change("Lrki;", "i(Lkv0;ZLfg3;I)V", STOP)
        change("Lx9l;", "l(Ljab;FLfg3;II)V", STOP)
        change("Lt8l;", "k(Ljab;Ljava/lang/String;Lxb2;Lfg3;II)V", STOP)
    }
}
