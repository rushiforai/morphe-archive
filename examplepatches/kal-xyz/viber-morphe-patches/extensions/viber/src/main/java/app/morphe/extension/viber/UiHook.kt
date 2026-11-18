package app.morphe.extension.viber

import android.view.View

/**
 * Runtime interception hooks for clean UI (disabling Explore tab, store badges, promotional banners).
 */
object UiHook {

    /**
     * Determines whether the Explore / Discover tab should be displayed in bottom navigation.
     */
    @JvmStatic
    fun isExploreTabEnabled(): Boolean {
        return !ViberModPreferences.isCleanUiEnabled()
    }

    /**
     * Hides promotional banners or sticker store badges from the chat or main screen.
     */
    @JvmStatic
    fun hidePromotionalView(view: View?) {
        if (!ViberModPreferences.isCleanUiEnabled()) return
        view?.visibility = View.GONE
    }
}
