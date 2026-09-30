package app.hushmessenger.extension;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Build;
import android.content.pm.PackageManager;
import android.os.Bundle;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/** Runtime switches default to the original Messenger behavior. */
public final class Settings {
    static volatile SharedPreferences preferences;
    static volatile Context appContext;
    static volatile Set<String> installed = Collections.emptySet();
    static boolean preview;
    static final ConcurrentHashMap<String, Long> activeAt = new ConcurrentHashMap<>();

    public static void initialize(Context context) {
        appContext = context.getApplicationContext();
        preferences = appContext.getSharedPreferences("hushmessenger", Context.MODE_PRIVATE);
        Set<String> features = new HashSet<>();
        preview = false;
        try {
            Bundle metadata = context.getPackageManager().getApplicationInfo(context.getPackageName(), PackageManager.GET_META_DATA).metaData;
            preview = metadata != null && metadata.getBoolean("hush.preview", false);
            if (metadata != null) for (String name : metadata.keySet()) {
                if (name.startsWith("hush.feature.") && metadata.getBoolean(name, false)) features.add(name.substring(13));
            }
        } catch (PackageManager.NameNotFoundException error) {
            android.util.Log.e("HushMessenger", "Can't read installed controls", error);
        }
        installed = Collections.unmodifiableSet(features);
    }

    public static boolean enabled(String key) {
        SharedPreferences prefs = preferences;
        boolean on = installed.contains(key) && prefs != null && !prefs.getBoolean("paused", false)
                && !CrashGuard.isSafeMode() && prefs.getBoolean(key, false);
        if (on) activeAt.put(key, System.currentTimeMillis());
        return on;
    }

    public static long lastActive(String key) {
        Long ts = activeAt.get(key);
        return ts != null ? ts : 0;
    }

    public static boolean hideStories() { return enabled("stories"); }
    public static boolean hideFacebook() { return enabled("facebook"); }
    public static boolean hideMetaAi() { return enabled("meta_ai"); }
    public static boolean showSubtabs(boolean original) { return original && !enabled("subtabs"); }
    public static boolean hidePeopleSection(boolean original) { return original || enabled("people"); }
    public static boolean keepPeopleSection(boolean original) { return original && !enabled("people"); }
    public static boolean suppressTyping() { return enabled("typing"); }
    /** Encrypted chats send typing through one mailbox call; "not typing" is always allowed through. */
    public static boolean outgoingTyping(boolean typing) { return typing && !enabled("typing"); }
    static boolean available(String key) { return !"bubbles".equals(key) || Build.VERSION.SDK_INT >= 30; }
    public static boolean enableBubbles() { return available("bubbles") && enabled("bubbles"); }
    public static boolean allowScreenshot() { return enabled("allow_screenshot"); }
    public static boolean hideReadReceipts() { return enabled("hide_read_receipts"); }
    public static boolean keepUnsent() { return enabled("keep_unsent"); }
    /** The icon stays hidden only while the Menu row that replaces it exists. */
    static boolean drawerIconHidden() {
        SharedPreferences prefs = preferences;
        return installed.contains("menu_row") && prefs != null && prefs.getBoolean("hide_drawer_icon", false);
    }

    private static final String KEPT_UNSENT_KEY = "kept_unsent_ids";

    public static void recordUnsent(String messageId) {
        if (messageId == null || messageId.isEmpty()) return;
        SharedPreferences prefs = preferences;
        if (prefs == null) return;
        Set<String> ids = new HashSet<>(prefs.getStringSet(KEPT_UNSENT_KEY, Collections.emptySet()));
        ids.add(messageId);
        prefs.edit().putStringSet(KEPT_UNSENT_KEY, ids).apply();
    }

    public static boolean isKeptUnsent(String messageId) {
        if (messageId == null) return false;
        SharedPreferences prefs = preferences;
        if (prefs == null) return false;
        return prefs.getStringSet(KEPT_UNSENT_KEY, Collections.emptySet()).contains(messageId);
    }

    public static String labelKeptUnsent(String text, String messageId) {
        if (!enabled("keep_unsent") || text == null) return text;
        if (isKeptUnsent(messageId)) return "[unsent] " + text;
        return text;
    }

    public static boolean suppressUnsent(boolean original, String messageId) {
        if (original && enabled("keep_unsent") && isKeptUnsent(messageId)) return false;
        return original;
    }

    private static android.graphics.Typeface systemEmoji;
    public static android.graphics.Typeface systemEmojiTypeface() {
        if (!enabled("use_system_emoji")) return null;
        if (systemEmoji != null) return systemEmoji;
        try {
            systemEmoji = android.graphics.Typeface.createFromFile("/system/fonts/NotoColorEmoji.ttf");
        } catch (Exception ignored) { }
        return systemEmoji;
    }

    /** Null means return the exact original list. Only typed ad rows are removed. */
    public static List<?> filterInboxAds(List<?> items) {
        if (!enabled("ads") || items == null || items.isEmpty()) return null;
        List<Object> filtered = null;
        for (int index = 0; index < items.size(); index++) {
            Object item = items.get(index);
            boolean ad = false;
            for (Class<?> type = item == null ? null : item.getClass(); type != null; type = type.getSuperclass()) {
                if ("com.facebook.messaging.business.inboxads.common.InboxAdsItem".equals(type.getName())) { ad = true; break; }
            }
            if (ad && filtered == null) filtered = new ArrayList<>(items.subList(0, index));
            if (!ad && filtered != null) filtered.add(item);
        }
        return filtered;
    }

    private static final String AVATAR_TAB_EVENT = "com.facebook.xapp.messaging.composer.avatar.composertab.event.ActivateAvatarSticker";

    /** Null means keep Messenger's sticker keyboard tabs; otherwise the tabs without the avatar tab. */
    public static List<?> filterKeyboardTabs(List<?> tabs) {
        if (tabs == null || tabs.isEmpty() || !enabled("avatar_stickers")) return null;
        List<Object> kept = new ArrayList<>(tabs.size());
        for (Object tab : tabs) if (!opensAvatarTab(tab)) kept.add(tab);
        return kept.size() == tabs.size() ? null : kept;
    }

    /** Builds that fill the tab list inline pass it here before copying it; the list is theirs to change. */
    public static void removeAvatarTabs(Iterable<?> tabs) {
        if (!(tabs instanceof java.util.Collection) || !enabled("avatar_stickers")) return;
        try {
            ((java.util.Collection<?>) tabs).removeIf(Settings::opensAvatarTab);
        } catch (RuntimeException error) {
            android.util.Log.e("HushMessenger", "Can't filter the sticker keyboard tabs", error);
        }
    }

    // Some builds keep the tab's event directly on the item, others on a config object the item holds.
    static boolean opensAvatarTab(Object tab) {
        return holdsAvatarEvent(tab, 2);
    }

    private static boolean holdsAvatarEvent(Object value, int depth) {
        if (value == null || depth == 0) return false;
        for (java.lang.reflect.Field f : value.getClass().getDeclaredFields()) {
            if (java.lang.reflect.Modifier.isStatic(f.getModifiers()) || f.getType().isPrimitive()) continue;
            try {
                f.setAccessible(true);
                Object field = f.get(value);
                if (field == null) continue;
                if (AVATAR_TAB_EVENT.equals(field.getClass().getName())) return true;
                // Only Messenger's own obfuscated classes are walked into, never strings or collections.
                if (field.getClass().getName().startsWith("X.") && holdsAvatarEvent(field, depth - 1)) return true;
            } catch (ReflectiveOperationException | RuntimeException ignored) { }
        }
        return false;
    }

    /** Keep non-web routes and Messenger's surrounding link handling intact. */
    public static boolean preferExternalBrowser(boolean original, Uri uri) {
        if (uri == null || !enabled("external_browser")) return original;
        String scheme = uri.getScheme();
        return ("http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme)) || original;
    }

    /** Appends a HushMessenger copy of the Menu tab's Settings folder row (one title String per row). */
    @SuppressWarnings("unchecked")
    public static void addMenuSettingsEntry(ArrayList list) {
        try {
            if (list == null || list.isEmpty()) return;
            Object original = list.get(0);
            Object clone = shallowClone(original);
            if (clone == null) return;
            java.lang.reflect.Field title = null;
            for (java.lang.reflect.Field f : original.getClass().getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(f.getModifiers())) continue;
                f.setAccessible(true);
                if (f.getType() == String.class) {
                    if (title != null) return;
                    title = f;
                } else if (f.getType() == Integer.class) {
                    f.set(clone, null);
                } else if (f.getType().getName().endsWith("HeterogeneousMap")) {
                    // Folder metadata, such as Settings' unseen badge count, belongs to the Settings row.
                    Object metadata = f.get(original);
                    if (metadata == null) continue;
                    Object copy = shallowClone(metadata);
                    if (copy == null) return;
                    for (java.lang.reflect.Field m : copy.getClass().getDeclaredFields()) {
                        if (java.lang.reflect.Modifier.isStatic(m.getModifiers()) || m.getType() != Map.class) continue;
                        m.setAccessible(true);
                        m.set(copy, new java.util.HashMap<>());
                    }
                    f.set(clone, copy);
                } else if (f.getType().getName().endsWith("DrawerFolderKey")) {
                    // Folder keys compare by identity, so a copy keeps this row from acting as Settings.
                    Object key = f.get(original);
                    Object copy = key == null ? null : shallowClone(key);
                    if (copy == null) return;
                    f.set(clone, copy);
                }
            }
            if (title == null) return;
            title.set(clone, "HushMessenger");
            list.add(clone);
        } catch (Exception e) {
            android.util.Log.e("HushMessenger", "addMenuSettingsEntry failed", e);
        }
    }

    /** Opens settings for the HushMessenger folder row and returns null; other rows come back unchanged. */
    public static Object drawerFolderClicked(Object item) {
        if (item == null) return null;
        try {
            Context context = null;
            boolean titled = false, settingsKey = false;
            for (java.lang.reflect.Field f : item.getClass().getDeclaredFields()) {
                if (java.lang.reflect.Modifier.isStatic(f.getModifiers())) continue;
                f.setAccessible(true);
                Object value = f.get(item);
                if (value instanceof Context) context = (Context) value;
                else if ("HushMessenger".equals(value)) titled = true;
                // Only the copy of the Settings row carries a Settings folder key with this title.
                else if (value != null && value.getClass().getName().endsWith("SettingsFolderKey")) settingsKey = true;
            }
            if (!titled || !settingsKey || context == null) return item;
            android.content.Intent intent = new android.content.Intent();
            intent.setClassName(context.getPackageName(), "app.hushmessenger.extension.SettingsActivity");
            intent.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
            return null;
        } catch (Exception e) {
            android.util.Log.e("HushMessenger", "drawerFolderClicked failed", e);
            return item;
        }
    }

    @SuppressWarnings("unchecked")
    public static java.util.List addMenuDrawerEntry(java.util.List list) {
        try {
            if (list == null || list.size() < 2) return list;
            for (Object item : list) {
                try {
                    java.lang.reflect.Field f = item.getClass().getDeclaredField("A05");
                    f.setAccessible(true);
                    if ("HushMessenger".equals(f.get(item))) return list;
                } catch (NoSuchFieldException ignored) {}
            }
            Object template = list.get(0);
            Object clone = shallowClone(template);
            if (clone == null) return list;
            java.lang.reflect.Field label = clone.getClass().getDeclaredField("A05");
            if (label.getType() != String.class) return list;
            label.setAccessible(true);
            label.set(clone, "HushMessenger");
            try {
                java.lang.reflect.Field longPress = clone.getClass().getDeclaredField("A03");
                longPress.setAccessible(true);
                longPress.set(clone, null);
            } catch (NoSuchFieldException ignored) {}
            java.util.ArrayList result = new java.util.ArrayList(list);
            result.add(clone);
            return result;
        } catch (Exception e) {
            android.util.Log.e("HushMessenger", "addMenuDrawerEntry failed", e);
            return list;
        }
    }

    public static void handleMenuItemBound(Object viewHolder) {
        try {
            java.lang.reflect.Field textField = viewHolder.getClass().getDeclaredField("A06");
            textField.setAccessible(true);
            Object tv = textField.get(viewHolder);
            if (!(tv instanceof android.widget.TextView)) return;
            CharSequence text = ((android.widget.TextView) tv).getText();
            if (!"HushMessenger".equals(text != null ? text.toString() : null)) return;
            java.lang.reflect.Field viewField = null;
            for (Class<?> c = viewHolder.getClass(); c != null; c = c.getSuperclass()) {
                try { viewField = c.getDeclaredField("A0I"); break; }
                catch (NoSuchFieldException ignored) {}
            }
            if (viewField == null) return;
            viewField.setAccessible(true);
            android.view.View itemView = (android.view.View) viewField.get(viewHolder);
            if (itemView == null) return;
            itemView.setOnClickListener(v -> {
                android.content.Context ctx = v.getContext();
                android.content.Intent intent = new android.content.Intent();
                intent.setClassName(ctx.getPackageName(), "app.hushmessenger.extension.SettingsActivity");
                intent.addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK);
                ctx.startActivity(intent);
            });
        } catch (Exception e) {
            android.util.Log.e("HushMessenger", "handleMenuItemBound failed", e);
        }
    }

    private static java.lang.reflect.Method allocateMethod;
    private static Object unsafeInstance;

    private static Object shallowClone(Object src) {
        try {
            if (allocateMethod == null) {
                Class<?> u = Class.forName("sun.misc.Unsafe");
                java.lang.reflect.Field f = u.getDeclaredField("theUnsafe");
                f.setAccessible(true);
                unsafeInstance = f.get(null);
                allocateMethod = u.getMethod("allocateInstance", Class.class);
            }
            Object dst = allocateMethod.invoke(unsafeInstance, src.getClass());
            for (Class<?> c = src.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (java.lang.reflect.Field f : c.getDeclaredFields()) {
                    if (java.lang.reflect.Modifier.isStatic(f.getModifiers())) continue;
                    f.setAccessible(true);
                    f.set(dst, f.get(src));
                }
            }
            return dst;
        } catch (Exception e) {
            android.util.Log.e("HushMessenger", "shallowClone failed", e);
            return null;
        }
    }

    private Settings() { }
}
