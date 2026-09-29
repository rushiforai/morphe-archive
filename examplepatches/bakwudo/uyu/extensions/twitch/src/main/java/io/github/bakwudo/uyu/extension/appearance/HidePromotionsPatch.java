package io.github.bakwudo.uyu.extension.appearance;

import android.content.Context;
import android.view.View;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import io.github.bakwudo.uyu.extension.Utils;
import io.github.bakwudo.uyu.extension.settings.Settings;

/**
 * Hides the subscribe and Bits buttons, the gift leaderboard and subscription promotions.
 * The views are found by their resource names, which change far less often between Twitch
 * versions than the obfuscated code that shows them. Promotions shown as community highlights
 * share their view with other highlights, so they are dropped before they are added instead.
 */
@SuppressWarnings("unused")
public final class HidePromotionsPatch {
    /** Type ids of community highlights that advertise subscriptions. */
    private static final Set<String> PROMOTION_HIGHLIGHTS = new HashSet<>(Arrays.asList(
            // "Happy SUBtember!"
            "subtember",
            // Discounted gift sub bundles.
            "gift_promotion"
    ));

    private static final Target LEADERBOARD_BUTTON =
            new Target("leaderboards_icon", view -> Settings.HIDE_GIFT_LEADERBOARD.get(), false);
    /** Items of the chat header row besides the subscribe buttons. Only their ids are used. */
    private static final Target[] OTHER_CHAT_HEADER_ITEMS = {
            new Target("chat_name", null, false),
            LEADERBOARD_BUTTON,
            new Target("extension_button_container", null, false),
    };

    private static final Target[] TARGETS = {
            // The Bits, gift a sub and subscribe buttons above chat.
            new Target("chat_header_buttons_container",
                    view -> Settings.HIDE_SUBSCRIBE_BUTTONS.get(), false),
            // Twitch does not hide the row itself when only the buttons were in it.
            new Target("chat_header_container", HidePromotionsPatch::isChatHeaderEmpty, true),
            new Target("bit_picker", view -> Settings.HIDE_CHAT_BITS_BUTTON.get(), false),
            new Target("leaderboards_container", view -> Settings.HIDE_GIFT_LEADERBOARD.get(), false),
            LEADERBOARD_BUTTON,
            // Subscription and gift discounts, SUBtember and similar campaigns.
            new Target("promo_banner_container",
                    view -> Settings.HIDE_SUBSCRIPTION_PROMOTIONS.get(), false),
            new Target("turbo_upsell_container",
                    view -> Settings.HIDE_SUBSCRIPTION_PROMOTIONS.get(), false),
    };

    private HidePromotionsPatch() {
    }

    /**
     * Injection point: end of the BaseViewDelegate constructor. Every screen part of Twitch's
     * native UI, including the player, chat and chat box, is a view delegate.
     *
     * @param root The view the delegate was created with.
     */
    public static void onViewCreated(View root) {
        try {
            Context context = root.getContext();
            for (Target target : TARGETS) {
                int id = target.id(context);
                if (id == 0) continue;
                View view = root.findViewById(id);
                if (view != null) HiddenView.attach(view, target.condition, target.restore);
            }
        } catch (Exception ex) {
            Utils.logError("Failed to hide promotions", ex);
        }
    }

    /**
     * Injection point: start of the method that takes the events of Twitch's community
     * highlights, the banners above chat.
     *
     * @param event The event. Only events that add a highlight are hidden.
     * @return Whether to drop the event, so the highlight is never added.
     */
    public static boolean hideCommunityHighlight(Object event) {
        try {
            String type = highlightType(event);
            if (type == null || !PROMOTION_HIGHLIGHTS.contains(type)
                    || !Settings.HIDE_SUBSCRIPTION_PROMOTIONS.get()) {
                return false;
            }
            Utils.logInfo("Hid community highlight " + type);
            return true;
        } catch (Exception ex) {
            Utils.logError("Failed to check a community highlight", ex);
            return false;
        }
    }

    /**
     * Replaced by the patch with code that reads the obfuscated classes.
     *
     * @return The type id of the highlight an "add highlight" event adds, or null for other
     * events.
     */
    private static String highlightType(Object event) {
        return null;
    }

    private static boolean isChatHeaderEmpty(View header) {
        if (!Settings.HIDE_SUBSCRIBE_BUTTONS.get()) return false;
        boolean leaderboardHidden = Settings.HIDE_GIFT_LEADERBOARD.get();
        for (Target item : OTHER_CHAT_HEADER_ITEMS) {
            if (leaderboardHidden && item == LEADERBOARD_BUTTON) continue;
            int id = item.id(header.getContext());
            View view = id == 0 ? null : header.findViewById(id);
            if (view != null && view.getVisibility() == View.VISIBLE) return false;
        }
        return true;
    }

    private static final class Target {
        final String name;
        final HiddenView.Condition condition;
        final boolean restore;
        /** The resource id, or -1 until it is looked up. */
        private int id = -1;

        Target(String name, HiddenView.Condition condition, boolean restore) {
            this.name = name;
            this.condition = condition;
            this.restore = restore;
        }

        /**
         * @return The resource id, or 0 if this Twitch version has no such view.
         */
        int id(Context context) {
            if (id == -1) {
                id = Utils.getResourceId(context, name, "id");
                if (id == 0) Utils.logInfo("View " + name + " not found, it is not hidden");
            }
            return id;
        }
    }
}
