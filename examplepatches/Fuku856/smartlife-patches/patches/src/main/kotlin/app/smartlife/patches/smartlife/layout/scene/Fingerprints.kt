package app.smartlife.patches.smartlife.layout.scene

import app.morphe.patcher.Fingerprint

/** Interface of the smart-tab tab container (not obfuscated: it is a plug API). */
internal const val SCENE_TAB_CONTAINER = "Lcom/thingclips/smart/scene/list/plug/api/home/protocol/ISceneTabContainer;"

/** Service implementation; its name is kept because module_app.json registers it by name. */
internal const val SCENE_RECOMMEND_SERVICE_IMPL = "Lcom/thingclips/smart/scene/recommend/service/SceneRecommendServiceImpl;"

/** The "recommended scenes" section attached under the automation / tap-to-run lists. */
internal const val SCENE_HOME_PAGE_EXT = "Lcom/thingclips/smart/scene/business/ISceneHomePageExt;"

/**
 * SceneViewPagerFragment code that shows/hides the red dot on the Smart App tab. It looks the tab
 * up with tabTypes.indexOf(Integer.valueOf(SMART_APP_TAB_TYPE)) right before reading this
 * preference, which is how the patch learns the Smart App tab type (3 in 7.12.0 / 7.12.6)
 * instead of hard-coding it.
 */
internal object SmartAppTabDotFingerprint : Fingerprint(
    strings = listOf("scene_smart_app_tab_dot_dismissed"),
)
