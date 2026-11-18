package patches.ad

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hidePremiumBanner = bytecodePatch(name = "Hide Premium banner", description = "Suppresses automatic marketing templates and Premium markers while retaining LIVE labels, editorial promotions and manual account navigation.") {
    compatibleWith(ad)
    dependsOn(originalInput, emptyMarketingTemplates, contentFilters)
    execute {
        change(FILTER, "morphePremium()Z", TRUE)
        change("Ldnc;", "j(Lnv0;ZLqg3;I)V", STOP)
        change("Lcgc;", "z(Lg8b;FLqg3;II)V", STOP)
        change("Lg4c;", "l(Lg8b;Ljava/lang/String;Loc2;Lfj5;Lqg3;II)V", STOP)
    }
}
