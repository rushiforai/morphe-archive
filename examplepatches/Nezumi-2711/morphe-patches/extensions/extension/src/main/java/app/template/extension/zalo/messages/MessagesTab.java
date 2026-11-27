package app.template.extension.zalo.messages;

import android.content.Context;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.buglog.Patch;
import app.template.extension.zalo.settings.NezumiPrefs;

/** Options that hide entries from the Messages tab list. */
public final class MessagesTab {
    private MessagesTab() { }

    public static boolean isMediaBoxHidden(Context context) {
        return NezumiPrefs.bool(context, NezumiPrefs.HIDE_MEDIA_BOX, false);
    }

    public static boolean isBusinessBoxHidden(Context context) {
        return NezumiPrefs.bool(context, NezumiPrefs.HIDE_BUSINESS_BOX, false);
    }

    public static boolean isMessageAdsHidden(Context context) {
        return NezumiPrefs.bool(context, NezumiPrefs.HIDE_MESSAGE_ADS, false);
    }

    /**
     * Asks Zalo to rebuild the Messages list so a changed option shows at once.
     * {@code caller} is the patch a failure is logged under.
     */
    public static void refreshList(Patch caller) {
        try {
            // MessageManager singleton p8g.w(); M() reschedules the tab message list rebuild.
            Object repository = Class.forName("p8g").getMethod("w").invoke(null);
            repository.getClass().getMethod("M").invoke(repository);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError failure) {
            NezumiLog.w(caller, "MessagesTab", "Messages refresh unavailable", failure);
        }
    }
}
