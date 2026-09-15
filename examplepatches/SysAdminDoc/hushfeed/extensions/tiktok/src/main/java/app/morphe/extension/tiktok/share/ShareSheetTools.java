/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.share;

import android.app.Activity;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.SystemClock;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewGroup;

import app.morphe.extension.shared.GlobalLayoutHook;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceIdCache;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.settings.preference.SettingsUi;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.settings.L10n;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.WeakHashMap;

/**
 * Share sheet tools: a confirm step before a video goes to a friend, and hiding of chosen
 * people or share options, or the whole "Send to" row.
 *
 * Ids were read off the live view hierarchy of TikTok 46.2.3 with the share sheet open.
 * The sheet lives in the activity's own window, under the content view:
 * <pre>
 *   ibc   frame around the "Send to" contacts row
 *   u3t   the contacts RecyclerView; each child is the contact cell, content description
 *         = the display name, and is itself clickable
 *   bku   the avatar inside a cell, clickable
 *   p78   the name under the avatar, clickable
 *   dqr   the share channels row (Repost, Copy link, SMS, Facebook, ...)
 *   a59   the actions row (Report, Not interested, Download, Create group, ...)
 * </pre>
 * Every cell in the three rows carries its label as its content description, which is
 * what the hidden list matches against.
 *
 * The patch binds each recycled contact cell to the model's stable user or conversation id.
 * TikTok's common click dispatcher asks {@link #allowRecipientClick(View)} before it invokes
 * the native send callback, so touch, keyboard and accessibility activation all take the same
 * path and the native callback still runs exactly once after confirmation.
 */
public final class ShareSheetTools {
    private static final String APP_PACKAGE = "com.zhiliaoapp.musically";
    private static final String CONTACTS_SECTION_ID = "ibc";
    private static final String CONTACTS_LIST_ID = "u3t";
    private static final String CHANNELS_LIST_ID = "dqr";
    private static final String ACTIONS_LIST_ID = "a59";

    /** How long a first tap stays armed before a second tap is needed again. */
    private static final long ARM_WINDOW_MS = 4000;

    interface ConfirmationSettingReader {
        boolean enabled();
    }

    private static final ConfirmationSettingReader DEFAULT_CONFIRMATION_SETTING_READER =
            () -> Settings.SHARE_CONFIRM_SEND.get();
    private static ConfirmationSettingReader confirmationSettingReader =
            DEFAULT_CONFIRMATION_SETTING_READER;

    private static final ResourceIdCache RESOURCE_IDS = new ResourceIdCache();

    /** Original layout width of each cell this class has shrunk, so it can be restored. */
    private static final WeakHashMap<View, Integer> ORIGINAL_WIDTHS = new WeakHashMap<>();

    /** The current model identity for each recycled native contact cell. */
    private static final WeakHashMap<View, RecipientBinding> RECIPIENTS = new WeakHashMap<>();

    private static WeakReference<Activity> activityReference = new WeakReference<>(null);
    private static final GlobalLayoutHook LAYOUT_HOOK = new GlobalLayoutHook();

    private static String armedRecipientId;
    private static long armedAtMs;
    private static WeakReference<View> armedCell = new WeakReference<>(null);
    private static Drawable armedPreviousForeground;
    private static GradientDrawable armedRing;
    private static int armGeneration;

    private ShareSheetTools() {
    }

    /** Called from the patched {@code MainActivity.onCreate}; the work is posted. */
    public static void install(Activity activity) {
        if (activity == null) {
            return;
        }
        Utils.runOnMainThread(() -> installNow(activity));
    }

    private static void installNow(Activity activity) {
        try {
            if (activity.isFinishing()) {
                LAYOUT_HOOK.detach();
                return;
            }
            ViewGroup root = activity.findViewById(android.R.id.content);
            if (root == null) {
                LAYOUT_HOOK.detach();
                Logger.printInfo(() -> "Share sheet tools found no content view to watch");
                return;
            }
            boolean installed = LAYOUT_HOOK.install(root, ShareSheetTools::apply);
            activityReference = new WeakReference<>(activity);
            if (installed) {
                Logger.printDebug(() -> "Share sheet tools installed");
            }
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not install the share sheet tools", ex);
        }
    }

    private static void apply() {
        try {
            Activity activity = activityReference.get();
            if (activity == null) {
                LAYOUT_HOOK.detach();
                return;
            }
            if (activity.isFinishing()) {
                LAYOUT_HOOK.detach();
                return;
            }

            View contacts = find(activity, CONTACTS_LIST_ID);
            if (contacts == null) {
                // The sheet is closed. Its cells are gone, so the armed state is stale.
                disarm();
                RECIPIENTS.clear();
            }

            List<String> hidden = entries(Settings.SHARE_HIDDEN_ITEMS.get());
            boolean confirm = Settings.SHARE_CONFIRM_SEND.get();
            if (!confirm) {
                disarm();
            }

            View contactsSection = find(activity, CONTACTS_SECTION_ID);
            boolean hideContacts = Settings.HIDE_SHARE_CONTACTS.get();
            if (contactsSection != null) {
                setVisible(contactsSection, !hideContacts);
            }
            if (!hideContacts && contacts instanceof ViewGroup) {
                ViewGroup list = (ViewGroup) contacts;
                for (int index = 0; index < list.getChildCount(); index++) {
                    View cell = list.getChildAt(index);
                    setCellHidden(cell, matches(hidden, labelOf(cell)));
                }
            }

            hideByLabel(find(activity, CHANNELS_LIST_ID), hidden);
            hideByLabel(find(activity, ACTIONS_LIST_ID), hidden);
        } catch (Throwable ex) {
            Logger.printException(() -> "Share sheet tools failed", ex);
        }
    }

    // ---- hiding ------------------------------------------------------------------------

    private static void hideByLabel(View list, List<String> hidden) {
        if (!(list instanceof ViewGroup)) {
            return;
        }
        ViewGroup group = (ViewGroup) list;
        for (int index = 0; index < group.getChildCount(); index++) {
            View cell = group.getChildAt(index);
            setCellHidden(cell, matches(hidden, labelOf(cell)));
        }
    }

    /**
     * A RecyclerView lays a GONE child out at its full size, so the width goes to zero as
     * well. Cells are recycled, so the original width is kept and put back when the same
     * view later shows something that is not hidden.
     */
    static void setCellHidden(View cell, boolean hidden) {
        if (cell == null) {
            return;
        }
        ViewGroup.LayoutParams params = cell.getLayoutParams();
        if (params == null) {
            setVisible(cell, !hidden);
            return;
        }

        Integer original = ORIGINAL_WIDTHS.get(cell);
        if (hidden) {
            if (original == null) {
                ORIGINAL_WIDTHS.put(cell, params.width);
            }
            if (cell.getVisibility() != View.GONE || params.width != 0) {
                cell.setVisibility(View.GONE);
                params.width = 0;
                cell.setLayoutParams(params);
            }
        } else if (original != null) {
            if (cell.getVisibility() != View.VISIBLE || params.width != original) {
                cell.setVisibility(View.VISIBLE);
                params.width = original;
                cell.setLayoutParams(params);
            }
        }
    }

    private static void setVisible(View view, boolean visible) {
        int wanted = visible ? View.VISIBLE : View.GONE;
        if (view.getVisibility() != wanted) {
            view.setVisibility(wanted);
        }
    }

    private static boolean matches(List<String> hidden, String label) {
        if (label == null || hidden.isEmpty()) {
            return false;
        }
        for (String entry : hidden) {
            if (entry.equalsIgnoreCase(label)) {
                return true;
            }
        }
        return false;
    }

    // ---- confirm before sending --------------------------------------------------------

    /**
     * Called from the patched contact adapter each time a holder is bound. The AndroidX holder
     * stays an Object here because AndroidX is owned by the host and is not part of the extension
     * compile classpath. Its public {@code itemView} field is the native row the click dispatcher
     * later supplies.
     */
    public static void bindRecipient(Object holder, Object contact) {
        try {
            View cell = itemViewOf(holder);
            if (cell != null) {
                bindRecipientView(cell, contact);
            }
        } catch (Throwable ex) {
            Logger.printException(() -> "Could not bind a share recipient", ex);
        }
    }

    /**
     * The one gate in front of TikTok's native recipient callback. Returning false ends the
     * native dispatcher before its Function0 is invoked; returning true lets that same dispatcher
     * invoke it. Nothing here synthesizes another click.
     */
    public static boolean allowRecipientClick(View touched) {
        final boolean confirmationEnabled;
        try {
            confirmationEnabled = confirmationSettingReader.enabled();
        } catch (Throwable ex) {
            try {
                disarm();
            } catch (Throwable cleanupEx) {
                Logger.printException(() -> "Could not clear unread share confirmation", cleanupEx);
            }
            Logger.printException(() -> "Could not read share confirmation setting", ex);
            return false;
        }

        if (!confirmationEnabled) {
            try {
                disarm();
            } catch (Throwable ex) {
                Logger.printException(() -> "Could not clear disabled share confirmation", ex);
            }
            return true;
        }

        try {
            View cell = boundCellOf(touched);
            RecipientBinding binding = RECIPIENTS.get(cell);
            String recipientId = binding == null
                    ? "view:" + System.identityHashCode(cell)
                    : binding.id;
            String name = labelOf(cell);
            long now = SystemClock.uptimeMillis();
            boolean armed = cell == armedCell.get()
                    && recipientId.equals(armedRecipientId)
                    && now - armedAtMs < ARM_WINDOW_MS;
            if (armed) {
                disarm();
                Logger.printDebug(() -> "Share recipient confirmed");
                return true;
            }

            arm(cell, recipientId, name);
            return false;
        } catch (Throwable ex) {
            Logger.printException(() -> "Share confirm step failed", ex);
            // Confirmation failures must consume the activation instead of reaching native send.
            try {
                disarm();
            } catch (Throwable cleanupEx) {
                Logger.printException(() -> "Could not clear failed share confirmation", cleanupEx);
            }
            return false;
        }
    }

    static void bindRecipientView(View cell, Object contact) {
        if (cell == null) {
            return;
        }
        if (armedCell.get() == cell) {
            disarm();
        }
        if (contact == null) {
            RECIPIENTS.remove(cell);
            return;
        }
        RECIPIENTS.put(cell, new RecipientBinding(stableRecipientId(contact)));
    }

    private static void arm(View cell, String recipientId, String name) {
        disarm();
        armedRecipientId = recipientId;
        armedAtMs = SystemClock.uptimeMillis();
        armedCell = new WeakReference<>(cell);
        armedPreviousForeground = cell.getForeground();

        float density = cell.getResources().getDisplayMetrics().density;
        armedRing = new GradientDrawable();
        armedRing.setShape(GradientDrawable.RECTANGLE);
        // The same radius and the same red as the ring that arms a Follow or a Like, from the
        // scale rather than from a number of its own. The two are the same idea on two screens.
        armedRing.setCornerRadius(SettingsUi.dp(cell.getContext(), SettingsUi.RADIUS_OVERLAY));
        armedRing.setColor(Color.TRANSPARENT);
        armedRing.setStroke(Math.max(2, Math.round(2 * density)), SettingsUi.OVERLAY_ACCENT);
        cell.setForeground(armedRing);
        cell.performHapticFeedback(HapticFeedbackConstants.KEYBOARD_TAP);

        Utils.showToastShort(name == null
                ? L10n.t("Tap again to send")
                : L10n.f("Tap %1$s again to send", name));

        final int token = armGeneration;
        Utils.runOnMainThreadDelayed(() -> {
            if (armGeneration == token) {
                disarm();
            }
        }, ARM_WINDOW_MS);
    }

    private static void disarm() {
        View cell = armedCell.get();
        Drawable ring = armedRing;
        Drawable previousForeground = armedPreviousForeground;
        armedRecipientId = null;
        armedAtMs = 0;
        armedCell = new WeakReference<>(null);
        armedPreviousForeground = null;
        armedRing = null;
        armGeneration++;
        if (cell != null && cell.getForeground() == ring) {
            cell.setForeground(previousForeground);
        }
    }

    private static View itemViewOf(Object holder) throws ReflectiveOperationException {
        if (holder == null) {
            return null;
        }
        Class<?> type = holder.getClass();
        while (type != null) {
            try {
                Field field = type.getDeclaredField("itemView");
                field.setAccessible(true);
                Object value = field.get(holder);
                return value instanceof View ? (View) value : null;
            } catch (NoSuchFieldException ignored) {
                type = type.getSuperclass();
            }
        }
        return null;
    }

    private static String stableRecipientId(Object contact) {
        String conversation = stringMethod(contact, "getConversationId");
        if (conversation != null) {
            return "conversation:" + conversation;
        }
        String user = stringMethod(contact, "getUid");
        if (user != null) {
            return "user:" + user;
        }
        // Special action contacts do not identify a person. Object identity is conservative:
        // it may ask again after a rebuild, but it can never confirm a different model instance.
        return "model:" + contact.getClass().getName() + ":" + System.identityHashCode(contact);
    }

    private static String stringMethod(Object target, String name) {
        try {
            Method method = target.getClass().getMethod(name);
            Object value = method.invoke(target);
            if (value == null) {
                return null;
            }
            String text = value.toString().trim();
            return text.isEmpty() ? null : text;
        } catch (ReflectiveOperationException ignored) {
            return null;
        }
    }

    private static View boundCellOf(View view) {
        View current = view;
        for (int depth = 0; current != null && depth < 5; depth++) {
            if (RECIPIENTS.containsKey(current)) {
                return current;
            }
            current = current.getParent() instanceof View ? (View) current.getParent() : null;
        }
        return cellOf(view);
    }

    static void resetForTests() {
        disarm();
        RECIPIENTS.clear();
        confirmationSettingReader = DEFAULT_CONFIRMATION_SETTING_READER;
    }

    static void setConfirmationSettingReaderForTests(ConfirmationSettingReader reader) {
        confirmationSettingReader = reader == null
                ? DEFAULT_CONFIRMATION_SETTING_READER
                : reader;
    }

    private static final class RecipientBinding {
        final String id;

        RecipientBinding(String id) {
            this.id = id;
        }
    }

    /** The contact cell is the nearest ancestor (or the view itself) that carries a label. */
    static View cellOf(View view) {
        View current = view;
        for (int depth = 0; current != null && depth < 5; depth++) {
            if (labelOf(current) != null) {
                return current;
            }
            current = current.getParent() instanceof View ? (View) current.getParent() : null;
        }
        return view;
    }

    static String labelOf(View view) {
        if (view == null) {
            return null;
        }
        CharSequence description = view.getContentDescription();
        if (description == null) {
            return null;
        }
        String label = description.toString().trim();
        return label.isEmpty() ? null : label;
    }

    // ---- lookup ------------------------------------------------------------------------

    private static View find(Activity activity, String name) {
        int id = identifier(activity, name);
        return id == 0 ? null : activity.findViewById(id);
    }

    private static int identifier(Activity activity, String name) {
        int id = RESOURCE_IDS.resolve(
                activity == null ? null : activity.getResources(), APP_PACKAGE, name, false);
        if (id == 0) {
            HookStatus.missingViewId("share sheet", name);
        } else {
            HookStatus.bound("share sheet", name);
        }
        return id;
    }

    private static List<String> entries(String stored) {
        List<String> entries = new ArrayList<>();
        if (stored == null) {
            return entries;
        }
        for (String part : stored.split(",")) {
            String trimmed = part.trim();
            if (!trimmed.isEmpty()) {
                entries.add(trimmed.toLowerCase(Locale.ROOT));
            }
        }
        return entries;
    }
}
