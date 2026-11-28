package app.morphe.extension.sabp;

import android.app.Activity;
import android.app.SearchManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.drawable.Icon;
import android.os.Bundle;

import java.util.Collections;

/**
 * Central player routing. Every path into SABP's classic PlayerActivity (notification, widgets,
 * library "open book", voice search, the launcher, Android restoring the task) goes through
 * PlayerActivity.onCreate, which the patch hooks to call {@link #shouldRedirect}. So the chosen
 * "Player interface" applies everywhere without patching each caller.
 *
 * <p>The classic player opens only when the user picked "Classic SABP player", or when eppy
 * explicitly asks for it (setup, equalizer...), marked with {@link #EXTRA_CLASSIC}.
 */
@SuppressWarnings("unused")
public final class EppyRoute {
    public static final String EXTRA_CLASSIC = "eppy_classic";
    public static final String EXTRA_FORCE_EPPY = "eppy_force";
    public static final String EXTRA_OPEN_PLAYER = "openPlayer";
    public static final String EXTRA_SHEET_TAB = "eppy_sheet_tab";
    public static final String INTERFACE_EPPY = "eppy";
    public static final String INTERFACE_CLASSIC = "classic";

    private EppyRoute() {
    }

    public static SharedPreferences prefs(Context c) {
        return c.getSharedPreferences(EppyTheme.PREFS, Context.MODE_PRIVATE);
    }

    public static String playerInterface(Context c) {
        // Default comes from the patch option "Open eppy on launch".
        return prefs(c).getString("interface", EppyTheme.configString(c, "eppy_default_interface", INTERFACE_EPPY));
    }

    /** Injected at the start of PlayerActivity.onCreate. */
    public static boolean shouldRedirect(Activity a) {
        try {
            Intent i = a.getIntent();
            if (i != null && i.getBooleanExtra(EXTRA_CLASSIC, false)) return false;
            return INTERFACE_EPPY.equals(playerInterface(a));
        } catch (Throwable t) {
            EppyDiag.log("route", "shouldRedirect failed: " + t);
            return false;
        }
    }

    /**
     * Injected after PlayerActivity's super.onCreate when {@link #shouldRedirect} is true: opens
     * eppy's player (one instance, singleTask) with the same action/extras, then finishes the
     * classic activity before it builds any UI.
     */
    public static void redirect(Activity a) {
        try {
            Intent src = a.getIntent();
            Intent to = new Intent();
            to.setClassName(a.getPackageName(), EppyActivity.class.getName());
            to.putExtra(EXTRA_OPEN_PLAYER, true);
            if (src != null) {
                String action = src.getAction();
                if (MediaPlaybackSearch.ACTION.equals(action)) {
                    to.setAction(action);
                    String q = src.getStringExtra(SearchManager.QUERY);
                    if (q != null) to.putExtra(SearchManager.QUERY, q);
                }
            }
            to.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP);
            a.startActivity(to);
            EppyDiag.log("route", "classic player redirected to eppy (action=" + (src != null ? src.getAction() : null) + ")");
        } catch (Throwable t) {
            EppyDiag.log("route", "redirect failed: " + t);
        }
        a.finish();
        a.overridePendingTransition(0, 0);
    }

    /** Opens the classic player on purpose (setup, equalizer, full speed dialog...). */
    public static Intent classicIntent(Context c) {
        Intent i = new Intent();
        i.setClassName(c.getPackageName(), EppyBridge.PLAYER_ACTIVITY);
        i.putExtra(EXTRA_CLASSIC, true);
        return i;
    }

    /** Called from eppy's onCreate: if the user chose the classic player, go there instead. */
    public static boolean redirectToClassicIfChosen(Activity a) {
        Intent i = a.getIntent();
        if (i != null && i.getBooleanExtra(EXTRA_FORCE_EPPY, false)) return false;
        if (!INTERFACE_CLASSIC.equals(playerInterface(a))) return false;
        Intent classic = classicIntent(a);
        if (i != null && MediaPlaybackSearch.ACTION.equals(i.getAction())) {
            classic.setAction(i.getAction());
            classic.putExtras(i);
            classic.putExtra(EXTRA_CLASSIC, true);
        }
        a.startActivity(classic);
        a.finish();
        a.overridePendingTransition(0, 0);
        return true;
    }

    /** Saves the choice and keeps a launcher shortcut back to eppy while Classic is selected. */
    public static void setInterface(Context c, String value) {
        prefs(c).edit().putString("interface", value).commit();
        try {
            ShortcutManager sm = c.getSystemService(ShortcutManager.class);
            if (sm == null) return;
            if (INTERFACE_CLASSIC.equals(value)) {
                Intent open = new Intent(Intent.ACTION_MAIN);
                open.setClassName(c.getPackageName(), EppyActivity.class.getName());
                open.putExtra(EXTRA_FORCE_EPPY, true);
                ShortcutInfo s = new ShortcutInfo.Builder(c, "eppy")
                        .setShortLabel("eppy")
                        .setLongLabel("Open eppy (switch player back)")
                        .setIcon(Icon.createWithResource(c, c.getApplicationInfo().icon))
                        .setIntent(open)
                        .build();
                sm.setDynamicShortcuts(Collections.singletonList(s));
            } else {
                sm.removeDynamicShortcuts(Collections.singletonList("eppy"));
            }
        } catch (Throwable t) {
            EppyDiag.log("route", "shortcut update failed: " + t);
        }
    }

    // ---- "Switch to eppy" inside Classic SABP --------------------------------------------------

    /**
     * Switches the player interface to eppy and opens it on the player. Playback lives in SABP's
     * PlayerService, which neither activity owns, so nothing about playback changes.
     */
    public static void switchToEppy(Activity from) {
        setInterface(from, INTERFACE_EPPY);
        Intent to = new Intent();
        to.setClassName(from.getPackageName(), EppyActivity.class.getName());
        to.putExtra(EXTRA_FORCE_EPPY, true);
        to.putExtra(EXTRA_OPEN_PLAYER, true);
        to.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        EppyDiag.log("route", "switched to eppy from " + from.getClass().getSimpleName());
        from.startActivity(to);
        from.finish();
    }

    /** Injected just before the classic player's overflow menu is shown. */
    public static void addClassicMenuItem(android.widget.PopupMenu menu) {
        try {
            final Context c = getContextOf(menu);
            menu.getMenu().add(android.view.Menu.NONE, 0x65707079, 0, "Switch to eppy")
                    .setOnMenuItemClickListener(item -> {
                        if (c instanceof Activity) switchToEppy((Activity) c);
                        return true;
                    });
        } catch (Throwable t) {
            EppyDiag.log("route", "classic menu item failed: " + t);
        }
    }

    private static Context getContextOf(android.widget.PopupMenu menu) {
        // PopupMenu has no public context getter; the menu is always opened from the resumed
        // activity, which EppyDiag tracks through the application's lifecycle callbacks.
        return EppyDiag.resumedActivity();
    }

    /** Injected at the end of SABP's settings screen onCreate: a "Switch to eppy" row at the top. */
    @SuppressWarnings("deprecation")
    public static void addClassicSettingsEntry(Activity a) {
        try {
            if (!(a instanceof android.preference.PreferenceActivity)) return;
            android.preference.PreferenceScreen screen = ((android.preference.PreferenceActivity) a).getPreferenceScreen();
            if (screen == null) return;
            android.preference.Preference p = new android.preference.Preference(a);
            p.setKey("eppy_switch");
            p.setTitle("Switch to eppy");
            p.setSummary("Use the eppy player interface. Playback, books, bookmarks and settings stay the same.");
            p.setOrder(-1000);
            p.setOnPreferenceClickListener(pref -> {
                switchToEppy(a);
                return true;
            });
            screen.addPreference(p);
        } catch (Throwable t) {
            EppyDiag.log("route", "classic settings entry failed: " + t);
        }
    }

    /** Handles voice search ("play X on Smart AudioBook Player") the way PlayerActivity did. */
    static void handleSearch(Context c, Intent i) {
        if (i == null || !MediaPlaybackSearch.ACTION.equals(i.getAction())) return;
        String q = i.getStringExtra(SearchManager.QUERY);
        Intent s = EppyBridge.serviceIntent(c, EppyBridge.SABP_PACKAGE + ".AutoActionPlayFromSearch");
        s.putExtra("searchQuery", q != null ? q : "");
        try {
            c.startService(s);
        } catch (Throwable t) {
            EppyDiag.log("route", "voice search failed: " + t);
        }
    }

    static final class MediaPlaybackSearch {
        static final String ACTION = "android.media.action.MEDIA_PLAY_FROM_SEARCH";
    }

    static Bundle none() {
        return null;
    }

    /** PlayerActivity.onDestroy's unregisterReceiver, tolerant of a receiver that was never registered (router redirect). */
    public static void safeUnregister(android.content.Context c, android.content.BroadcastReceiver r) {
        if (r == null) return;
        try {
            c.unregisterReceiver(r);
        } catch (IllegalArgumentException notRegistered) {
            // The classic player was sent to eppy before it registered this receiver.
        }
    }
}
