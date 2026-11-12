package app.twrailway.extension;

import android.content.Context;
import android.util.Log;
import android.view.View;
import android.widget.RemoteViews;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

/**
 * Turns off the subscription promotions: the popups, by overriding the Firebase Remote Config
 * values that enable them, and the "升級即時看板 ›" link of the free home screen widgets.
 * Only the promotions are affected: the subscription status and the paid features are not changed.
 */
@SuppressWarnings("unused")
public final class PromotionOverrides {
    /** Remote Config parameters that enable a promotion popup, and the value that disables it. */
    private static final String[][] OVERRIDES = {
            // PromoController: the discounted subscription popups (限時特價, 專屬優惠).
            {"promo_enabled", "false"},
            // The holiday sale popup.
            {"holiday_active", "false"},
            {"holiday_show_popup", "false"},
            // WidgetIntroPopup: "解鎖新功能：桌面小工具", which asks to subscribe for the full widget.
            {"widget_intro_enabled", "false"},
    };

    private PromotionOverrides() {
    }

    /**
     * Called with the parameters the firebase_remote_config plugin sends to Dart
     * (`FirebaseRemoteConfigHostApi.getAll` and the plugin constants), as a map of
     * key to `{"value": byte[], "source": String}`. The map is changed in place.
     */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static void overrideRemoteConfig(Map parameters) {
        if (parameters == null || !PatchSettings.hidePromotions()) return;
        try {
            for (String[] override : OVERRIDES) {
                Map<String, Object> value = new HashMap<>();
                value.put("value", override[1].getBytes(StandardCharsets.UTF_8));
                value.put("source", "remote");
                parameters.put(override[0], value);
            }
        } catch (Throwable t) {
            Log.e(PatchSettings.TAG, "Could not override the promotion parameters", t);
        }
    }

    /**
     * Called by the free version of the home screen widgets right after it creates their views.
     * Hides their footer, which only holds the "升級即時看板 ›" link to the paywall for free users
     * (their refresh button is hidden). The paid views are created from the layout again, so
     * they keep their footer.
     */
    public static void hideWidgetUpgradeLink(RemoteViews views, Context context) {
        if (views == null || context == null) return;
        try {
            if (!PatchSettings.hidePromotions(context)) return;
            // The app's code does not use the footer's id, so it is looked up by name.
            int footer = context.getResources().getIdentifier("widget_footer", "id", context.getPackageName());
            if (footer != 0) views.setViewVisibility(footer, View.GONE);
        } catch (Throwable t) {
            Log.e(PatchSettings.TAG, "Could not hide the widget upgrade link", t);
        }
    }
}
