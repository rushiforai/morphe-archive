/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.view.PixelCopy;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.io.ByteArrayOutputStream;
import java.lang.ref.WeakReference;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

/**
 * Screenshot (#71): a button in a chat's selection bar, beside Select between, that saves a picture
 * of the selected messages the way the chat shows them, wallpaper, date rows and times included, to
 * Pictures/Telegram.
 *
 * <p>The picture is the chat screen cut to a band as wide as the chat, from the top of the highest
 * selected message to the bottom of the lowest, so whatever sits between them comes along. Only
 * what's on screen can be pictured, so every selected message has to show at least in part;
 * otherwise a toast asks for a scroll and the selection stays. The tap then leaves selection the
 * way the bar's back arrow does, and the picture is taken once the checks have faded. Secret chats
 * are always refused, and chats that don't allow saving are refused unless Allow screenshots is on.
 */
public final class SelectionScreenshot {
    private SelectionScreenshot() {}

    /** The bar item's number, next to Select between's. */
    static final int ITEM = 0x48544d21;
    /** The number of the bar's back arrow, which Telegram's handler answers by leaving selection. */
    static final int BACK = -1;
    /** How long the checks take to fade once selection ends. */
    static long delayMillis = 500;

    static boolean on() {
        return Utils.settingsReady() && Settings.SELECTION_SCREENSHOT.get() && PatchFamily.Capability.SELECTION_SCREENSHOT.installed();
    }

    /** Asked by Select between's click hook for this button. Returns what Telegram's own handler should see. */
    static int clicked(Object chat) {
        try {
            if (!on()) return SelectBetween.TAKEN;
            List<Object> messages = SelectBetween.selectedMessages(chat);
            if (messages.isEmpty()) return SelectBetween.TAKEN;
            String refusal = refusal(messages);
            if (refusal != null) {
                MessageMenu.feedback(Utils.getContext(), refusal);
                return SelectBetween.TAKEN;
            }
            Set<Integer> ids = new HashSet<>();
            for (Object message : messages) ids.add(SelectBetween.messageId(message));
            View root = fragmentView(chat);
            if (root == null || find(root, ids) == null) {
                MessageMenu.feedback(Utils.getContext(), L10n.t("Scroll so they're all on screen"));
                return SelectBetween.TAKEN;
            }
            WeakReference<Object> held = new WeakReference<>(chat);
            new Handler(Looper.getMainLooper()).postDelayed(() -> capture(held.get(), ids), delayMillis);
            return BACK;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "selection screenshot", failure);
            MessageMenu.feedback(Utils.getContext(), L10n.t("Couldn't complete that action. Try again."));
            return SelectBetween.TAKEN;
        }
    }

    /** Why these messages can't be pictured, or null when they can. */
    static String refusal(List<Object> messages) {
        for (Object message : messages) {
            if (MessageMenu.secret(MessageMenu.dialog(message))) return L10n.t("Not in secret chats");
        }
        if (MessageMenu.on(Settings.ALLOW_SCREENSHOTS)) return null;
        for (Object message : messages) {
            if (MessageMenu.restricted(message)) return L10n.t("This chat doesn't allow saving");
        }
        return null;
    }

    /**
     * The band to picture, in [root]'s coordinates: the list's width, from the top of the highest
     * cell to the bottom of the lowest, cut to the list. Null when a cell doesn't show at all.
     */
    static Rect band(Rect list, List<Rect> cells) {
        if (cells.isEmpty()) return null;
        int top = Integer.MAX_VALUE;
        int bottom = Integer.MIN_VALUE;
        for (Rect cell : cells) {
            if (!Rect.intersects(cell, list)) return null;
            top = Math.min(top, cell.top);
            bottom = Math.max(bottom, cell.bottom);
        }
        Rect band = new Rect(list.left, Math.max(top, list.top), list.right, Math.min(bottom, list.bottom));
        return band.isEmpty() ? null : band;
    }

    /** The band holding every one of [ids] under [root], or null unless each one has a cell showing. */
    static Rect find(View root, Set<Integer> ids) {
        if (!(root instanceof ViewGroup)) return null;
        List<View> cells = new ArrayList<>();
        Set<Integer> seen = new HashSet<>();
        collect((ViewGroup) root, ids, cells, seen);
        if (!seen.containsAll(ids)) return null;
        ViewParent parent = cells.get(0).getParent();
        if (!(parent instanceof View)) return null;
        Rect list = within((ViewGroup) root, (View) parent);
        List<Rect> found = new ArrayList<>();
        for (View cell : cells) {
            if (cell.getParent() != parent) return null;
            found.add(within((ViewGroup) root, cell));
        }
        Rect band = band(list, found);
        if (band != null && !band.intersect(0, 0, root.getWidth(), root.getHeight())) return null;
        return band;
    }

    private static void collect(ViewGroup group, Set<Integer> ids, List<View> cells, Set<Integer> seen) {
        for (int i = 0; i < group.getChildCount(); i++) {
            View child = group.getChildAt(i);
            if (child.getVisibility() != View.VISIBLE) continue;
            Object message = cellMessage(child);
            if (message != null) {
                int id = SelectBetween.messageId(message);
                if (ids.contains(id)) {
                    cells.add(child);
                    seen.add(id);
                }
            } else if (child instanceof ViewGroup) {
                collect((ViewGroup) child, ids, cells, seen);
            }
        }
    }

    private static Rect within(ViewGroup root, View view) {
        Rect rect = new Rect(0, 0, view.getWidth(), view.getHeight());
        if (view != root) root.offsetDescendantRectToMyCoords(view, rect);
        return rect;
    }

    private static void capture(Object chat, Set<Integer> ids) {
        Context context = Utils.getContext();
        try {
            View root = chat == null ? null : fragmentView(chat);
            Rect band = root == null || !root.isAttachedToWindow() ? null : find(root, ids);
            if (band == null) {
                MessageMenu.feedback(context, L10n.t("Scroll so they're all on screen"));
                return;
            }
            Bitmap picture = Bitmap.createBitmap(band.width(), band.height(), Bitmap.Config.ARGB_8888);
            Activity activity = MessageMenu.activity(chat);
            Window window = activity == null ? null : activity.getWindow();
            if (window != null) {
                // What the screen shows, video and all. The drawing below is for when the copy can't be made.
                int[] at = new int[2];
                root.getLocationInWindow(at);
                Rect source = new Rect(band);
                source.offset(at[0], at[1]);
                PixelCopy.request(window, source, picture, result -> {
                    if (result != PixelCopy.SUCCESS) draw(root, band, picture);
                    save(context, picture);
                }, new Handler(Looper.getMainLooper()));
                return;
            }
            draw(root, band, picture);
            save(context, picture);
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "selection screenshot capture", failure);
            MessageMenu.feedback(context, L10n.t("Couldn't save the picture"));
        }
    }

    private static void draw(View root, Rect band, Bitmap picture) {
        Canvas canvas = new Canvas(picture);
        canvas.translate(-band.left, -band.top);
        root.draw(canvas);
    }

    private static void save(Context context, Bitmap picture) {
        String name = "Telegram_" + new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(new Date()) + ".png";
        MediaArt.work.execute(() -> {
            try {
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                picture.compress(Bitmap.CompressFormat.PNG, 100, out);
                picture.recycle();
                boolean saved = MediaArt.sink.write(context, out.toByteArray(), name, "image/png");
                MessageMenu.feedback(context, saved ? L10n.t(context, "Screenshot saved to Pictures") : L10n.t(context, "Couldn't save the picture"));
                if (saved) HookStatus.counted(FamilyNames.MESSAGE_MENU_REPEAT, "selection screenshot saved");
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.MESSAGE_MENU_REPEAT, "selection screenshot save", failure);
                MessageMenu.feedback(context, L10n.t(context, "Couldn't save the picture"));
            }
        });
    }

    // Filled in by the patch with this build's chat screen.

    /** The chat screen's whole view. */
    public static View fragmentView(Object chat) { return null; }

    /** The message a chat row shows, or null when the view isn't a message row. */
    public static Object cellMessage(Object view) { return null; }

    public static int icon() { return 0; }
}
