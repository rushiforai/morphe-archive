package patches.hln

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hidePremiumBanner = bytecodePatch(name = "Hide Premium banner", description = "Suppresses automatic marketing templates and Premium markers while retaining LIVE labels, editorial promotions and manual account navigation.") {
    compatibleWith(hln)
    dependsOn(originalInput, emptyMarketingTemplates, contentFilters)
    execute {
        change(FILTER, "morphePremium()Z", TRUE)
        change("Lsgc;", "j(Lnv0;ZLtg3;I)V", STOP)
        change("Lk4c;", "z(Lk8b;FLtg3;II)V", STOP)
        change("Lfyb;", "o(Lk8b;Ljava/lang/String;Lpc2;Lij5;Ltg3;II)V", STOP)
    }
}
