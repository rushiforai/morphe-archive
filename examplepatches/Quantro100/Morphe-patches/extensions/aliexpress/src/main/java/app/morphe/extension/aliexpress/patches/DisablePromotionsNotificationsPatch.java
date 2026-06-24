package app.morphe.extension.aliexpress.patches;

@SuppressWarnings("unused")
public final class DisablePromotionsNotificationsPatch {

    public static boolean shouldShowNotification() {
        return false;
    }

    public static boolean isPromotionalNotification(String title, String body) {
        if (title == null) title = "";
        if (body == null) body = "";
        return title.contains("promotion")
            || title.contains("coupon")
            || title.contains("deal")
            || title.contains("sale")
            || body.contains("promotion")
            || body.contains("coupon")
            || body.contains("discount");
    }
}
