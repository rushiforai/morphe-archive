package app.revanced.patches.tarotcounter

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.revanced.util.returnEarly

@Suppress("unused")
val adsPatch = resourcePatch(
    name = "Remove ads",
) {
    compatibleWith("net.aasuited.tarotscore"("3.12.4"));

    dependsOn(
        bytecodePatch {
            execute {
                bannerAdLoaderFingerprint.method.returnEarly()
                openAdLoadFingerprint.method.returnEarly()
            }
        },
    )

    execute {
        val layoutFiles = listOf(
            "res/layout/activity_score_board.xml",
            "res/layout/activity_player_statistics.xml",
            "res/layout/activity_multi_follow.xml"
        )

        layoutFiles.forEach { filePath ->
            document(filePath).use { document ->
                fun hideElementById(id: String) {
                    val elements = document.getElementsByTagName("*")
                    for (i in 0 until elements.length) {
                        val element = elements.item(i) as org.w3c.dom.Element
                        if (element.getAttribute("android:id") == "@id/$id") {
                            element.setAttribute("android:visibility", "gone")
                            return
                        }
                    }
                    throw IllegalStateException("Element with id $id not found in $filePath")
                }

                hideElementById("adbanner_container")
            }
        }

        val adUnitIds = setOf(
            "camera_interstitial_ad_unit_id",
            "player_ad_unit_id",
            "remote_score_board_ad_unit_id",
            "score_board_ad_unit_id",
            "splashscreen_ad_unit_id",
        )
        document("res/values/strings.xml").use { document ->
            val foundIds = mutableSetOf<String>()
            val strings = document.getElementsByTagName("string")
            for (i in 0 until strings.length) {
                val element = strings.item(i) as org.w3c.dom.Element
                val name = element.getAttribute("name")
                if (name in adUnitIds) {
                    element.textContent = ""
                    foundIds += name
                }
            }
            check(foundIds == adUnitIds) { "Expected ad unit resources $adUnitIds, found $foundIds" }
        }

        document("res/values/bools.xml").use { document ->
            val bools = document.getElementsByTagName("bool")
            val openAdsEnabled = (0 until bools.length)
                .map { bools.item(it) as org.w3c.dom.Element }
                .firstOrNull { it.getAttribute("name") == "open_ads_enable" }
                ?: throw IllegalStateException("Resource open_ads_enable not found")
            openAdsEnabled.textContent = "false"
        }
    }
}
