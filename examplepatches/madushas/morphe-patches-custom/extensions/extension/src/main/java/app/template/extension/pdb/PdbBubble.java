package app.template.extension.pdb;

import android.app.Activity;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.PopupMenu;
import android.widget.TextView;

/**
 * A small draggable power bubble pinned inside Pdb's own window — the "extra
 * buttons on different screens" surface.
 *
 * <p>Injected into {@code pdb.app.HomeActivity.onCreate} (a kept class), it adds
 * a compact circle to the activity's content frame. Drag moves it (clamped to
 * the screen edges, and the position is remembered); tap opens a quick menu:
 *
 * <ul>
 *   <li>Show profile IDs — flips {@link PdbUi#IDS_EVERYWHERE} live and persists
 *       the switch (hot: no relaunch needed, decorated names change on the next
 *       list refresh),</li>
 *   <li>Disable read receipts — persists; applied on next launch,</li>
 *   <li>Pause Morphe — persists; applied on next launch,</li>
 *   <li>Copy my profile ID (from the MMKV auth session),</li>
 *   <li>Open Pdb Extras.</li>
 * </ul>
 *
 * <p>Everything is best-effort: any failure removes the bubble instead of
 * touching the host.
 */
public final class PdbBubble {

    private static final String TAG = "PdbExtras";

    private PdbBubble() {}

    /** Tag identifying the bubble view, so a screen can never get two of them. */
    private static final Object BUBBLE_TAG = new Object();

    /** Hooked from patched {@code HomeActivity.onCreate}. Never throws. */
    public static void onHomeCreated(Activity activity) {
        schedule(activity);
    }

    /**
     * Hooked from patched {@code pdb.app.base.ui.BaseActivity.onCreate}, so the
     * power button is reachable from every Pdb screen, not just Home. Both hooks
     * fire on Home (HomeActivity extends BaseActivity); {@link #BUBBLE_TAG} makes
     * the second one a no-op.
     */
    public static void onActivityCreated(Activity activity) {
        schedule(activity);
    }

    private static void schedule(Activity activity) {
        try {
            if (activity == null || activity.isFinishing()) return;
            appCtxRef = activity.getApplicationContext();
            new Handler(Looper.getMainLooper()).postDelayed(() -> attach(activity), 600);
        } catch (Throwable ignored) {
        }
    }

    /**
     * Screens where a floating button is in the way rather than useful: full-screen
     * onboarding/media, the sign-in flow, and the Extras screen itself.
     */
    private static boolean isExcluded(Activity activity) {
        String name = activity.getClass().getName();
        return name.contains("Splash")
            || name.contains("Login")
            || name.contains("Story")
            || name.contains("InstantChatWaiting")
            || name.contains("PdbExtrasActivity");
    }

    private static void attach(Activity activity) {
        try {
            if (PdbSettings.getBool(prefs(activity), PdbSettings.BUBBLE, true) == false) return;

            if (isExcluded(activity)) return;

            android.content.Context ctx = activity;
            SharedPreferences sp = prefs(activity);

            final TextView bubble = new TextView(ctx);
            bubble.setText("\u26A1"); // ⚡
            bubble.setTextSize(16);
            bubble.setTextColor(Color.WHITE);
            bubble.setGravity(Gravity.CENTER);
            GradientDrawable bg = new GradientDrawable();
            bg.setShape(GradientDrawable.OVAL);
            bg.setColor(0xB36C5CE7); // Pdb purple, translucent
            bubble.setBackground(bg);
            int size = PdbUi.dp(ctx, 40);

            FrameLayout content = activity.findViewById(android.R.id.content);
            if (content == null) return;
            if (content.findViewWithTag(BUBBLE_TAG) != null) return; // already attached
            bubble.setTag(BUBBLE_TAG);

            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(size, size);
            // Remember the last position (percent of screen, so rotation survives).
            int[] saved = lastPos(sp, content.getWidth(), content.getHeight());
            lp.leftMargin = saved[0];
            lp.topMargin = saved[1];
            lp.gravity = Gravity.TOP | Gravity.START;
            content.addView(bubble, lp);
            bubble.setElevation(PdbUi.dp(ctx, 24));

            final int[] down = new int[2];
            final boolean[] dragged = {false};
            bubble.setOnTouchListener((v, ev) -> {
                switch (ev.getActionMasked()) {
                    case MotionEvent.ACTION_DOWN:
                        down[0] = (int) (ev.getRawX() - lp.leftMargin);
                        down[1] = (int) (ev.getRawY() - lp.topMargin);
                        dragged[0] = false;
                        return true;
                    case MotionEvent.ACTION_MOVE: {
                        int nx = Math.max(0, Math.min(content.getWidth() - size,
                            (int) ev.getRawX() - down[0]));
                        int ny = Math.max(0, Math.min(content.getHeight() - size,
                            (int) ev.getRawY() - down[1]));
                        if (Math.abs(nx - lp.leftMargin) + Math.abs(ny - lp.topMargin) > 8) {
                            dragged[0] = true;
                        }
                        lp.leftMargin = nx;
                        lp.topMargin = ny;
                        bubble.setLayoutParams(lp);
                        return true;
                    }
                    case MotionEvent.ACTION_UP: {
                        if (dragged[0]) {
                            savePos(sp, lp.leftMargin, lp.topMargin,
                                content.getWidth(), content.getHeight());
                        } else {
                            v.performClick();
                        }
                        return true;
                    }
                    default:
                        return false;
                }
            });

            bubble.setOnClickListener(v -> openMenu(activity, bubble));
        } catch (Throwable t) {
            android.util.Log.w(TAG, "bubble attach failed", t);
        }
    }

    /** Menu label for "copy the profile you were just looking at". */
    private static String lastProfileLabel() {
        String id = PdbUi.LAST_PROFILE_ID;
        if (id == null) return "Copy last viewed profile";
        String name = PdbUi.LAST_PROFILE_NAME;
        String shortName = name == null || name.length() == 0
            ? id
            : (name.length() > 18 ? name.substring(0, 18) + "\u2026" : name);
        return "Copy last viewed: " + shortName;
    }

    private static void openMenu(Activity activity, View anchor) {
        try {
            SharedPreferences sp = prefs(activity);
            PopupMenu menu = new PopupMenu(activity, anchor);
            menu.getMenu().add(0, 1, 0, idsLabel(sp));
            menu.getMenu().add(0, 2, 1, receiptsLabel(sp));
            menu.getMenu().add(0, 3, 2, pauseLabel(sp));
            menu.getMenu().add(0, 4, 3, "Copy my profile ID");
            menu.getMenu().add(0, 5, 4, lastProfileLabel());
            menu.getMenu().add(0, 6, 5, "Open Pdb Extras");

            menu.setOnMenuItemClickListener(item -> {
                try {
                    SharedPreferences.Editor e = sp.edit();
                    switch (item.getItemId()) {
                        case 1: {
                            boolean on = !PdbSettings.getBool(sp, PdbSettings.IDS_EVERYWHERE, true);
                            e.putBoolean(PdbSettings.IDS_EVERYWHERE, on);
                            e.apply();
                            PdbUi.IDS_EVERYWHERE = on; // hot
                            toast(activity, "Profile IDs " + (on ? "ON (next refresh)" : "OFF"));
                            break;
                        }
                        case 2: {
                            boolean on = !PdbSettings.getBool(sp, PdbSettings.PRIVACY_RECEIPTS, true);
                            e.putBoolean(PdbSettings.PRIVACY_RECEIPTS, on);
                            e.apply();
                            toast(activity, "Receipts disabled " + (on ? "ON" : "OFF")
                                + " (next launch)");
                            break;
                        }
                        case 3: {
                            boolean on = !PdbSettings.getBool(sp, PdbSettings.GLOBAL_PAUSE, false);
                            e.putBoolean(PdbSettings.GLOBAL_PAUSE, on);
                            e.apply();
                            toast(activity, on ? "Morphe paused (next launch)"
                                : "Morphe resumed (next launch)");
                            break;
                        }
                        case 4: {
                            String id = myId();
                            if (id == null) {
                                toast(activity, "Not signed in / no session found");
                            } else {
                                PdbTools.copyToClipboard(activity, id);
                                toast(activity, "Copied ID " + id);
                            }
                            break;
                        }
                        case 5: {
                            String lastId = PdbUi.LAST_PROFILE_ID;
                            if (lastId == null) {
                                toast(activity, "No profile seen yet this session");
                            } else {
                                PdbTools.copyToClipboard(activity, lastId);
                                toast(activity, "Copied " + lastId);
                            }
                            break;
                        }
                        case 6: {
                            android.content.Intent i = new android.content.Intent();
                            i.setClassName(activity,
                                "app.template.extension.pdb.PdbExtrasActivity");
                            activity.startActivity(i);
                            break;
                        }
                    }
                } catch (Throwable ignored) {
                }
                return true;
            });
            menu.show();
        } catch (Throwable ignored) {
        }
    }

    private static String idsLabel(SharedPreferences sp) {
        boolean on = PdbSettings.getBool(sp, PdbSettings.IDS_EVERYWHERE, true);
        return (on ? "\u2713 " : "") + "Show profile IDs";
    }

    private static String receiptsLabel(SharedPreferences sp) {
        boolean on = PdbSettings.getBool(sp, PdbSettings.PRIVACY_RECEIPTS, true);
        return (on ? "\u2713 " : "") + "Disable read receipts";
    }

    private static String pauseLabel(SharedPreferences sp) {
        boolean on = PdbSettings.getBool(sp, PdbSettings.GLOBAL_PAUSE, false);
        return (on ? "\u2713 " : "") + "Pause Morphe";
    }

    /** The signed-in user id from the MMKV auth session (kept shape: JSON). */
    private static String myId() {
        try {
            String json = PdbMmkv.getString("auth_session_v1");
            if (json == null) return null;
            android.util.Log.i(TAG, "auth session: " + json.length() + " chars");
            int i = json.indexOf("\"userId\":\"");
            if (i < 0) return null;
            int s = i + 10;
            int e2 = json.indexOf('"', s);
            return e2 < 0 ? null : json.substring(s, e2);
        } catch (Throwable t) {
            return null;
        }
    }

    private static SharedPreferences prefs(android.content.Context ctx) {
        return PdbSettings.prefs(ctx);
    }

    private static void toast(android.content.Context ctx, String msg) {
        PdbTools.toast(ctx, msg);
    }

    /* ── position persistence (percent-based, rotation-safe) ── */

    private static int[] lastPos(SharedPreferences sp, int w, int h) {
        try {
            float px = sp.getFloat("morphe_bubble_px", 0.94f);
            float py = sp.getFloat("morphe_bubble_py", 0.62f);
            int size = PdbUi.dp(appCtxRef, 40);
            return new int[]{
                Math.round((w - size) * clamp(px)),
                Math.round((h - size) * clamp(py)),
            };
        } catch (Throwable t) {
            return new int[]{(int) (w * 0.9f), (int) (h * 0.6f)};
        }
    }

    private static void savePos(SharedPreferences sp, int x, int y, int w, int h) {
        try {
            if (w <= 0 || h <= 0) return;
            SharedPreferences.Editor e = sp.edit();
            e.putFloat("morphe_bubble_px", clamp(x / (float) w));
            e.putFloat("morphe_bubble_py", clamp(y / (float) h));
            e.apply();
        } catch (Throwable ignored) {
        }
    }

    private static float clamp(float v) {
        return Math.max(0f, Math.min(1f, v));
    }

    private static android.content.Context appCtxRef;
}
