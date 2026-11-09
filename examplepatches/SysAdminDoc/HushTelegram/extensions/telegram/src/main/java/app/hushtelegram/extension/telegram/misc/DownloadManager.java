/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.graphics.Typeface;
import android.view.Gravity;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Download manager (#53). With the switch on, an account's downloads share one queue that runs one
 * file at a time, in the order they were asked for, and a Downloads row in the side menu lists what
 * is running, waiting and done, with a Cancel for each file still going.
 *
 * <p>Telegram keeps a small and a large queue per data center and runs several files in each. The
 * patch sends every new download to one large queue ({@link #merge}) and holds that queue to one
 * running file ({@link #limit}). A file that is opened or streamed gets a higher priority, and
 * Telegram still moves it ahead, so the file you are looking at is never kept waiting.
 *
 * <p>The list reads Telegram's own download lists and cancels through its own controller, so it
 * shows what Telegram's Downloads screen would, and a cancel is Telegram's cancel.
 */
public final class DownloadManager {
    private DownloadManager() {}

    /** One file in the list. */
    static final class Item {
        final Object message;
        final String name;
        final long size;
        final boolean running;

        Item(Object message, String name, long size, boolean running) {
            this.message = message;
            this.name = name;
            this.size = size;
            this.running = running;
        }
    }

    /** Where the lists come from; a test swaps it. */
    interface Source {
        List<Item> active() throws Exception;

        List<Item> finished() throws Exception;

        void cancel(Item item) throws Exception;
    }

    static volatile Source source = new TelegramSource();

    /** Whether the switch is on and HushTelegram isn't paused. */
    static boolean on() {
        try {
            return Utils.settingsReady() && Settings.DOWNLOAD_MANAGER.get();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FASTER_DOWNLOADS, "download manager switch", failure);
            return false;
        }
    }

    /** Whether the side menu shows its Downloads row: the patch is in this build and the switch is on. */
    public static boolean rowShown() {
        try {
            return PatchFamily.Capability.DOWNLOAD_MANAGER.installed() && on();
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FASTER_DOWNLOADS, "download manager row", failure);
            return false;
        }
    }

    /**
     * Injected where a new download picks its queue.
     *
     * @return non-zero when every download of the account goes to the one queue
     */
    public static int merge() {
        HookStatus.invoked(FamilyNames.FASTER_DOWNLOADS);
        if (!on()) return 0;
        HookStatus.counted(FamilyNames.FASTER_DOWNLOADS, "download queued in the one queue");
        return 1;
    }

    /**
     * Injected where a queue reads how many files it may run at once.
     *
     * @param stock the number Telegram's servers set for the queue
     * @return one while the switch is on, otherwise [stock]
     */
    public static int limit(int stock) {
        return on() ? 1 : stock;
    }

    /** A size in words, like "3.4 MB". */
    static String sizeText(long bytes) {
        if (bytes <= 0) return "";
        if (bytes < 1024) return bytes + " B";
        double value = bytes;
        String[] units = {"KB", "MB", "GB"};
        int unit = -1;
        while (value >= 1024 && unit < units.length - 1) {
            value /= 1024;
            unit++;
        }
        return String.format(Locale.US, value < 10 ? "%.1f %s" : "%.0f %s", value, units[unit]);
    }

    /** Opens the list over [activity]. */
    public static void show(Activity activity) {
        if (activity == null || activity.isFinishing()) return;
        LinearLayout list = new LinearLayout(activity);
        list.setOrientation(LinearLayout.VERTICAL);
        int pad = Math.round(activity.getResources().getDisplayMetrics().density * 20);
        list.setPadding(pad, pad / 2, pad, 0);
        ScrollView scroll = new ScrollView(activity);
        scroll.addView(list);
        AlertDialog dialog = new AlertDialog.Builder(activity)
                .setTitle(L10n.t("Downloads"))
                .setView(scroll)
                .setPositiveButton(L10n.t("Close"), null)
                .create();
        fill(list);
        dialog.show();
        HookStatus.counted(FamilyNames.FASTER_DOWNLOADS, "download list opened");
    }

    /** Builds the rows into [list]; a cancel builds them again. */
    static void fill(LinearLayout list) {
        list.removeAllViews();
        Context context = list.getContext();
        List<Item> active = new ArrayList<>();
        List<Item> finished = new ArrayList<>();
        try {
            active.addAll(source.active());
            finished.addAll(source.finished());
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.FASTER_DOWNLOADS, "download list", failure);
        }
        if (active.isEmpty() && finished.isEmpty()) {
            list.addView(text(context, L10n.t("No downloads yet"), 16, false));
            return;
        }
        for (Item each : active) {
            LinearLayout row = new LinearLayout(context);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            LinearLayout words = new LinearLayout(context);
            words.setOrientation(LinearLayout.VERTICAL);
            words.addView(text(context, each.name, 16, true));
            words.addView(text(context, status(each), 13, false));
            row.addView(words, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
            TextView cancel = text(context, L10n.t("Cancel"), 14, true);
            cancel.setPadding(cancel.getPaddingLeft() + 16, 16, 0, 16);
            cancel.setOnClickListener(v -> {
                try {
                    source.cancel(each);
                    HookStatus.counted(FamilyNames.FASTER_DOWNLOADS, "download cancelled from the list");
                } catch (Throwable failure) {
                    HookStatus.threw(FamilyNames.FASTER_DOWNLOADS, "download cancel", failure);
                }
                fill(list);
            });
            row.addView(cancel);
            list.addView(row);
        }
        for (Item each : finished) {
            list.addView(text(context, each.name, 16, true));
            String size = sizeText(each.size);
            list.addView(text(context, size.isEmpty() ? L10n.t("Finished") : L10n.t("Finished") + ", " + size, 13, false));
        }
    }

    private static String status(Item item) {
        String size = sizeText(item.size);
        String state = item.running ? L10n.t("Downloading") : L10n.t("Waiting");
        return size.isEmpty() ? state : state + ", " + size;
    }

    private static TextView text(Context context, String words, int sp, boolean bold) {
        TextView view = new TextView(context);
        view.setText(words);
        view.setTextSize(sp);
        view.setPadding(0, 8, 0, 8);
        if (bold) view.setTypeface(Typeface.DEFAULT_BOLD);
        return view;
    }

    /** Telegram's own lists, read the way {@code KeepDeletedBridge} reads its controllers. */
    private static final class TelegramSource implements Source {
        private static Object controller() throws Exception {
            ClassLoader loader = DownloadManager.class.getClassLoader();
            Class<?> configs = Class.forName("org.telegram.messenger.UserConfig", true, loader);
            Class<?> controllers = Class.forName("org.telegram.messenger.DownloadController", true, loader);
            int account = HostNames.field(configs, "selectedAccount").getInt(null);
            return HostNames.method(controllers, "getInstance", int.class).invoke(null, account);
        }

        private static List<Item> items(String field, boolean runningFirst) throws Exception {
            Object controller = controller();
            List<?> messages = (List<?>) HostNames.field(controller.getClass(), field).get(controller);
            List<Item> items = new ArrayList<>();
            if (messages == null) return items;
            for (Object message : new ArrayList<>(messages)) {
                if (message == null) continue;
                Method name = HostNames.method(message.getClass(), "getFileName");
                Method size = HostNames.method(message.getClass(), "getSize");
                String file = (String) name.invoke(message);
                items.add(new Item(message, file == null || file.isEmpty() ? "?" : file,
                        ((Number) size.invoke(message)).longValue(), runningFirst && items.isEmpty()));
            }
            return items;
        }

        @Override public List<Item> active() throws Exception {
            return items("downloadingFiles", true);
        }

        @Override public List<Item> finished() throws Exception {
            return items("recentDownloadingFiles", false);
        }

        @Override public void cancel(Item item) throws Exception {
            Object controller = controller();
            ArrayList<Object> one = new ArrayList<>();
            one.add(item.message);
            HostNames.method(controller.getClass(), "cancelDownloading", ArrayList.class).invoke(controller, one);
        }
    }
}
