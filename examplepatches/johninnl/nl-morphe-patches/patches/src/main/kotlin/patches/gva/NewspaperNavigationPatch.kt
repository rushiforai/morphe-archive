package patches.gva

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import patches.shared.removeMediahuisNewspaperTab

private val newspaperNavigationResources = resourcePatch {
    dependsOn(originalInput)
    execute { removeMediahuisNewspaperTab(get("res/raw/bottom_tabs.json")) }
}

@Suppress("unused")
val hideNewspaperNavigation = bytecodePatch(
    name = "Hide newspaper navigation",
    description = "Removes De krant from the bottom navigation and removes the newspaper Menu card and Krant settings section.",
) {
    dependsOn(newspaperNavigationResources)
    compatibleWith(gva)
    execute {
        change("Lcom/mediahuis/oneapps/cueappsdk/data/config/brandinfo/models/MhbeGvaBrandInfo;", "getHasEPaperCapabilities()Z", FALSE)
        change("Lcom/mediahuis/oneapps/cueappsdk/data/settings/datasources/EpaperMenuDataSource;", "getEpaperBanner\$co_novemberfive_mediahuis_cueappsdk()Lcom/mediahuis/oneapps/cueappsdk/domain/external/menu/models/nav2/MenuItemComponent;", NULL)
    }
}
