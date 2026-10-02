/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.extension.tiktok.share;

import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;

import app.morphe.extension.shared.GlobalLayoutHook;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceIdCache;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;
import app.morphe.extension.tiktok.settings.preference.SettingsUi;
import app.morphe.extension.tiktok.settings.Settings;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Share sheet tools: hiding of chosen people or share options, or the whole "Send to" row.
 *
 * Ids were read off the live view hierarchy with the share sheet open. TikTok 47.0.3 moved
 * the panel into its own window and renamed all four anchors. The 46.x names (ibc, u3t, dqr,
 * a59) are not kept as fallbacks: on 47.0.3 each of them names some other view.
 * <pre>
 *   ip5   frame around the "Send to" contacts row
 *   v3j   the contacts list; each child is the contact cell, content description
 *         = the display name, and is itself clickable
 *   dwr   the share channels row (Repost, Copy link, SMS, Facebook, ...)
 *   a5t   the actions row (Report, Not interested, Download, Create group, ...)
 * </pre>
 * Every cell in the three rows carries its label as its content description, which is
 * what the hidden list matches against.
 *
 * There used to be a confirm step here, a second tap before a video went to a friend. On every
 * build Hushfeed supports, a tap on a person only marks them chosen and TikTok's own Send button
 * sends, and the method the step was hooked to was the contact cell's impression callback, which
 * TikTok runs when a cell scrolls into view. So it asked for a second tap nobody had made a first
 * time (#58) and never held a real one.
 */
public final class ShareSheetTools {
    /** One family for everything that touches the sheet, so an export reads as one surface. */
    private static final String FAMILY = ShareModelFilter.FAMILY;
    private static final String[] CONTACTS_SECTION_IDS = {"47.0.3:ip5", "47.1.3:iql", "47.1.4:iql"};
    private static final String[] CONTACTS_LIST_IDS = {"47.0.3:v3j", "47.1.3:v71", "47.1.4:v71"};
    private static final String[] CHANNELS_LIST_IDS = {"47.0.3:dwr", "47.1.3:dxb", "47.1.4:dxb"};
    private static final String[] ACTIONS_LIST_IDS = {"47.0.3:a5t", "47.1.3:a5u", "47.1.4:a5u"};

    private static final ResourceIdCache RESOURCE_IDS = new ResourceIdCache();

    /** Original layout width of each cell this class has shrunk, so it can be restored. */
    private static final WeakHashMap<View, Integer> ORIGINAL_WIDTHS = new WeakHashMap<>();

    private static WeakReference<Activity> activityReference = new WeakReference<>(null);
    private static final GlobalLayoutHook LAYOUT_HOOK = new GlobalLayoutHook();

    private static boolean applyPosted;

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
            HookStatus.threw(FAMILY, "install", ex);
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

            List<View> roots = windowRoots(activity);
            Set<Integer> wanted = new HashSet<>();
            addIds(activity, wanted, CONTACTS_LIST_IDS);
            addIds(activity, wanted, CONTACTS_SECTION_IDS);
            addIds(activity, wanted, CHANNELS_LIST_IDS);
            addIds(activity, wanted, ACTIONS_LIST_IDS);
            List<Map<Integer, View>> found = indexRoots(roots, wanted);
            View contacts = find(activity, roots, found, CONTACTS_LIST_IDS);
            List<String> hidden = entries(ShareModelFilter.hiddenItems());

            View contactsSection = find(activity, roots, found, CONTACTS_SECTION_IDS);
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

            hideByLabel(find(activity, roots, found, CHANNELS_LIST_IDS), hidden);
            hideByLabel(find(activity, roots, found, ACTIONS_LIST_IDS), hidden);
        } catch (Throwable ex) {
            HookStatus.threw(FAMILY, "layout pass", ex);
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

    // ---- contact binds -----------------------------------------------------------------

    /**
     * Called from the patched contact adapter each time it binds a cell in the Send to row.
     * 47.0.3 presents the panel in another WindowManager root, so the activity root's
     * global-layout listener does not reliably observe its first layout. A contact bind happens
     * while that window is being built, so it asks for one coalesced pass after the bind.
     */
    public static void contactBound() {
        try {
            requestApply();
        } catch (Throwable ex) {
            HookStatus.threw(FAMILY, "contact bind", ex);
            Logger.printException(() -> "Could not schedule a share sheet pass after a contact bind", ex);
        }
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

    private static synchronized void requestApply() {
        if (applyPosted) return;
        applyPosted = true;
        Utils.runOnMainThread(() -> {
            synchronized (ShareSheetTools.class) {
                applyPosted = false;
            }
            apply();
        });
    }

    /**
     * Adds the resolved ids one group can name, so one walk per root can look for all four groups.
     * One array per call, like find(): RuntimeViewIdAnchorsTest traces every lookup's name to its
     * literals through a helper's parameter, and a varargs call left it nothing to follow.
     */
    private static void addIds(Activity activity, Set<Integer> ids, String[] candidates) {
        for (String name : candidates) {
            int id = RESOURCE_IDS.resolve(activity.getResources(), activity.getPackageName(), name, false);
            if (id != 0) ids.add(id);
        }
    }

    /**
     * The first view carrying each wanted id in each root, from one pre-order walk per root:
     * what root.findViewById(id) returns, since that checks a view and then its children in
     * order. findViewById never enters a child that is a root namespace, which the framework sets
     * on a window's DecorView, so a DecorView met below a root is left out the same way. apply()
     * used to walk every window once per group, four times on each layout pass of the main
     * window, sheet open or not.
     */
    static List<Map<Integer, View>> indexRoots(List<View> roots, Set<Integer> ids) {
        List<Map<Integer, View>> index = new ArrayList<>(roots.size());
        ArrayDeque<View> stack = new ArrayDeque<>();
        for (View root : roots) {
            Map<Integer, View> found = new HashMap<>();
            index.add(found);
            if (root == null || ids.isEmpty()) continue;
            stack.clear();
            stack.push(root);
            while (!stack.isEmpty() && found.size() < ids.size()) {
                View view = stack.pop();
                int id = view.getId();
                if (id != View.NO_ID && ids.contains(id) && !found.containsKey(id)) found.put(id, view);
                if (view instanceof ViewGroup) {
                    ViewGroup group = (ViewGroup) view;
                    for (int child = group.getChildCount() - 1; child >= 0; child--) {
                        View next = group.getChildAt(child);
                        if (next != null && !isDecorView(next)) stack.push(next);
                    }
                }
            }
        }
        return index;
    }

    /** The window root class: com.android.internal.policy.DecorView, PhoneWindow$DecorView on API 23. */
    private static boolean isDecorView(View view) {
        String name = view.getClass().getName();
        return name.equals("com.android.internal.policy.DecorView") || name.endsWith("PhoneWindow$DecorView");
    }

    /** Chooses the newest candidate that occurs in one of the app's current windows. */
    private static View find(Activity activity, List<View> roots, List<Map<Integer, View>> index,
            String[] candidates) {
        if (activity == null) return null;
        boolean resolvedAny = false;
        String diagnostic = String.join("|", candidates);
        for (String name : candidates) {
            // The running package, not TikTok's: a cloned build renames it, resource table and all (#59).
            int id = RESOURCE_IDS.resolve(activity.getResources(), activity.getPackageName(), name, false);
            if (id == 0) continue;
            resolvedAny = true;
            for (int root = 0; root < roots.size(); root++) {
                View found = index.get(root).get(id);
                if (found == null) continue;
                HookStatus.recoveredViewId(FAMILY, diagnostic);
                HookStatus.bound(FAMILY, name);
                return found;
            }
        }
        // The sheet is normally absent, so a resolved id with no current view is not a miss.
        if (!resolvedAny) HookStatus.missingViewId(FAMILY, diagnostic);
        return null;
    }

    /** Activity content plus dialog and bottom-sheet roots currently owned by this process. */
    @SuppressWarnings("unchecked")
    private static List<View> windowRoots(Activity activity) {
        List<View> roots = new ArrayList<>();
        Set<View> seen = Collections.newSetFromMap(new IdentityHashMap<>());
        View decor = activity == null || activity.getWindow() == null
                ? null : activity.getWindow().getDecorView();
        if (decor != null && seen.add(decor)) roots.add(decor);
        if (windowViewsUnavailable) return roots;
        try {
            Object value = windowViews();
            if (value instanceof List) {
                for (Object candidate : (List<Object>) value) {
                    if (candidate instanceof View && seen.add((View) candidate)) {
                        roots.add((View) candidate);
                    }
                }
            }
        } catch (Throwable ex) {
            // The activity root still covers retained 46.x builds and every share action filtered
            // at the model layer. A non-SDK lookup failure must not break the share sheet, and it
            // is not retried: this runs on every layout pass, and a refusal stays a refusal. Once
            // the lookup has worked, a failure is the read itself, a window list changing under
            // the walk say, and the next pass reads it again.
            if (windowViewsReader == null) windowViewsUnavailable = true;
            Logger.printDebug(() -> "Could not enumerate secondary share sheet windows: "
                    + ex.getClass().getSimpleName());
        }
        return roots;
    }

    /*
     * WindowManagerGlobal and the read of its window list, looked up once. apply() runs on every
     * layout pass of the main window, sheet open or not, and it used to repeat the class lookup,
     * two method lookups and the access changes each time. Main thread only.
     */
    private static Object windowGlobal;
    private static Object windowViewsReader;
    private static boolean windowViewsUnavailable;

    private static Object windowViews() throws ReflectiveOperationException {
        if (windowViewsReader == null) {
            Class<?> globalClass = Class.forName("android.view.WindowManagerGlobal");
            Method getInstance = globalClass.getDeclaredMethod("getInstance");
            getInstance.setAccessible(true);
            Object global = getInstance.invoke(null);
            Object reader;
            try {
                Method getWindowViews = globalClass.getDeclaredMethod("getWindowViews");
                getWindowViews.setAccessible(true);
                reader = getWindowViews;
            } catch (NoSuchMethodException missingMethod) {
                Field views = globalClass.getDeclaredField("mViews");
                views.setAccessible(true);
                reader = views;
            }
            windowGlobal = global;
            windowViewsReader = reader;
        }
        return windowViewsReader instanceof Method
                ? ((Method) windowViewsReader).invoke(windowGlobal)
                : ((Field) windowViewsReader).get(windowGlobal);
    }

    /**
     * The hidden list, split the way ShareModelFilter and the checklist split it: on commas and
     * line breaks. Split on commas alone, a list typed one per line hid nothing on the sheet.
     */
    static List<String> entries(String stored) {
        List<String> entries = new ArrayList<>();
        if (stored == null) {
            return entries;
        }
        for (String part : stored.split("[,\\n]")) {
            String trimmed = part.trim();
            if (!trimmed.isEmpty()) {
                entries.add(trimmed.toLowerCase(Locale.ROOT));
            }
        }
        return entries;
    }
}
