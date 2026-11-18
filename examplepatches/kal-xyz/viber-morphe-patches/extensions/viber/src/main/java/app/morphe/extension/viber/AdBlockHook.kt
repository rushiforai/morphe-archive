package app.morphe.extension.viber

import android.view.View

/**
 * Runtime interception hooks for suppressing ads and promotional content in Viber.
 */
object AdBlockHook {

    /**
     * Called before Viber initializes or displays an ad unit.
     * @return true if the ad should be blocked, false to allow default behavior.
     */
    @JvmStatic
    fun shouldBlockAd(placement: String?): Boolean {
        if (!ViberModPreferences.isAdBlockEnabled()) return false
        // Intercept all ad placements (chat list, call end, explore banner)
        return true
    }

    /**
     * Intercepts banner view visibility in chats and main screen.
     */
    @JvmStatic
    fun hideAdView(view: View?) {
        if (!ViberModPreferences.isAdBlockEnabled()) return
        view?.visibility = View.GONE
    }

    /**
     * Intercepts call end screen promotional dialogs.
     */
    @JvmStatic
    fun shouldSuppressCallEndPromotions(): Boolean {
        return ViberModPreferences.isAdBlockEnabled()
    }
}
