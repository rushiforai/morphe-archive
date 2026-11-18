package patches.hln

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hidePremiumBanner = bytecodePatch(name = "Hide Premium banner", description = "Suppresses automatic marketing templates and Premium markers while retaining LIVE labels, editorial promotions and manual account navigation.") {
    compatibleWith(hln)
    dependsOn(originalInput, emptyMarketingTemplates, contentFilters)
    execute {
        change(FILTER, "morphePremium()Z", TRUE)
        change("Luki;", "i(Lkv0;ZLjg3;I)V", STOP)
        change("Lx8l;", "n(Lqab;FLjg3;II)V", STOP)
        change("Li8l;", "l(Lahc;Ljava/lang/String;Lx07;Lqab;Ljg3;II)V", STOP)
    }
}
