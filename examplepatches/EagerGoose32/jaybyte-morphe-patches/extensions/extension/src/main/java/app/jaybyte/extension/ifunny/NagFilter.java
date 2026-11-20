package app.jaybyte.extension.ifunny;

/**
 * Feed "extra element" types that are upsells or nags rather than content.
 */
@SuppressWarnings("unused")
public final class NagFilter {
    private NagFilter() {
    }

    public static boolean isBlocked(String type) {
        if (type == null) return false;
        switch (type) {
            case "paywall_premium_subscription": // 3-day trial / Premium promo cards
            case "survey":
            case "ask_to_smile":
            case "second_push_request_inline":   // push-permission nag card
                return true;
            default:
                return false;
        }
    }
}
