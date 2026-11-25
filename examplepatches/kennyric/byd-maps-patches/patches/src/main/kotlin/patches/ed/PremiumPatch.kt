package patches.ed

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hidePremiumBanner = bytecodePatch(name = "Hide Premium banner", description = "Suppresses automatic marketing templates and Premium markers while retaining LIVE labels, editorial promotions and manual account navigation.") {
    compatibleWith(ed)
    dependsOn(originalInput, emptyMarketingTemplates, contentFilters)
    execute {
        change(FILTER, "morphePremium()Z", TRUE)
        change("Lioc;", "j(Lrv0;ZLyg3;I)V", STOP)
        change("Lghc;", "r(Le9b;FLyg3;II)V", STOP)
        change("Lk5c;", "r(Le9b;Ljava/lang/String;Luc2;Lkj5;Lyg3;II)V", STOP)
    }
}
