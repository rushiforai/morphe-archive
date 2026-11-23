package biz.kushan.ltkey;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/**
 * Appends a "LocalThings Owner PSK" section (Owner PSK + Identity rows) to the native
 * EditDevice screen for the device being edited. Tapping a value copies ONLY that value and
 * toasts. Shows nothing unless we hold a validated key for this exact device. Never throws into
 * the host; the screen looks stock on any failure.
 */
public final class DtEditRow {

    private static final String TAG = "dt_ltkey_section";
    private static final String WRAP_TAG = "dt_ltkey_wrap";
    private static final int ACCENT = 0xFF4CAF50;

    /** Called by the patch from EditDeviceActivity.onCreate, passing the cloud deviceId it holds. */
    public static void add(Activity activity, String cloudDeviceId) {
        try {
            Context ctx = activity;

            View root = activity.findViewById(android.R.id.content);
            if (!(root instanceof ViewGroup)) return;
            ViewGroup rootVg = (ViewGroup) root;

            // For OCF devices the SmartThings cloud deviceId IS the OCF di (subjectuuid) the
            // credential is stored under, so look it up directly. No exact match → no key is
            // shown for this device (never borrow another device's key).
            String[] cred = null;
            if (cloudDeviceId != null) {
                String[] c = DtStore.getCred(ctx, cloudDeviceId);
                if (c != null && c[0] != null && c[1] != null && !c[1].isEmpty()) cred = c;
            }

            // Remove any section we added on a previous pass, then render the current state.
            // (A no-key placeholder shown first must be replaced once a harvest finds the key.)
            View existing = findByTag(rootVg);
            if (existing != null && existing.getParent() instanceof ViewGroup) {
                ((ViewGroup) existing.getParent()).removeView(existing);
            }

            ViewGroup container = ensureWrapper(activity);
            if (container == null) {                              // fallback if layout differs
                ViewGroup vc = findVerticalContainer(rootVg);
                container = (vc != null) ? vc : rootVg;
            }

            LinearLayout section = (cred != null)
                ? buildSection(ctx, cred[0], cred[1])
                : buildEmptySection(ctx);
            section.setTag(TAG);
            container.addView(section);
            DtLog.i("edit row: haveKey=" + (cred != null));
        } catch (Throwable t) {
            DtLog.w("add row failed", t);                        // host screen stays stock
        }
    }

    /** Shown when no validated key exists for this device — confirms the patch is active. */
    private static LinearLayout buildEmptySection(Context ctx) {
        LinearLayout box = new LinearLayout(ctx);
        box.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(ctx, 16);
        box.setPadding(pad, pad, pad, pad);

        TextView header = new TextView(ctx);
        header.setText("LocalThings");
        header.setTextSize(12);
        header.setTypeface(null, Typeface.BOLD);
        box.addView(header);

        TextView msg = new TextView(ctx);
        msg.setText("No local key for this device yet.");
        msg.setTextSize(12);
        msg.setTextColor(0xFF9E9E9E);
        msg.setPadding(0, dp(ctx, 4), 0, 0);
        box.addView(msg);
        return box;
    }

    private static LinearLayout buildSection(Context ctx, String identity, String pskHex) {
        LinearLayout box = new LinearLayout(ctx);
        box.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(ctx, 16);
        box.setPadding(pad, pad, pad, pad);

        TextView header = new TextView(ctx);
        header.setText("LocalThings");
        header.setTextSize(12);
        header.setTypeface(null, Typeface.BOLD);
        box.addView(header);

        box.addView(valueRow(ctx, "Owner PSK  \u2605 LocalThings needs this", pskHex, true));
        box.addView(valueRow(ctx, "Identity", identity, false));
        return box;
    }

    private static View valueRow(final Context ctx, String label, final String value, boolean highlight) {
        LinearLayout row = new LinearLayout(ctx);
        row.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(ctx, 6);
        row.setPadding(0, pad, 0, pad);

        TextView lbl = new TextView(ctx);
        lbl.setText(label);
        lbl.setTextSize(11);
        if (highlight) { lbl.setTypeface(null, Typeface.BOLD); lbl.setTextColor(ACCENT); }

        TextView val = new TextView(ctx);
        val.setText(value);
        val.setTextSize(highlight ? 15 : 13);
        val.setTypeface(Typeface.MONOSPACE, highlight ? Typeface.BOLD : Typeface.NORMAL);
        val.setTextIsSelectable(true);
        if (highlight) val.setTextColor(ACCENT);

        row.addView(lbl);
        row.addView(val);
        row.setClickable(true);
        final String copyLabel = highlight ? "Owner PSK" : "Identity";
        row.setOnClickListener(new View.OnClickListener() {
            @Override public void onClick(View v) { copy(ctx, copyLabel, value); }
        });
        return row;
    }

    private static void copy(Context ctx, String label, String value) {
        try {
            ClipboardManager cm = (ClipboardManager) ctx.getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm != null) cm.setPrimaryClip(ClipData.newPlainText(label, value));
            Toast.makeText(ctx, label + " copied", Toast.LENGTH_SHORT).show();
        } catch (Throwable t) { DtLog.w("copy failed", t); }
    }

    // ---- defensive view-tree helpers ----
    private static View findByTag(ViewGroup root) {
        for (int i = 0; i < root.getChildCount(); i++) {
            View c = root.getChildAt(i);
            if (TAG.equals(c.getTag())) return c;
            if (c instanceof ViewGroup) { View r = findByTag((ViewGroup) c); if (r != null) return r; }
        }
        return null;
    }

    /**
     * Returns a vertical container we can safely append our section to, at the bottom of the
     * EditDevice scroll content. The scroll content is a ConstraintLayout (appending to it with no
     * constraints lands at 0,0 and overlaps), so on first run we wrap that ConstraintLayout in a
     * vertical LinearLayout inside the NestedScrollView and return the wrapper; later runs reuse
     * it. Re-parenting the ConstraintLayout is safe — the app's view-binding holds direct
     * references to the individual cards, not to the scroll view's child. Returns null if the
     * known scrollview isn't present (caller falls back).
     */
    private static ViewGroup ensureWrapper(Activity activity) {
        try {
            int svId = activity.getResources().getIdentifier(
                "device_details_scrollview", "id", activity.getPackageName());
            if (svId == 0) return null;
            View sv = activity.findViewById(svId);
            if (!(sv instanceof ViewGroup)) return null;
            ViewGroup scroll = (ViewGroup) sv;
            if (scroll.getChildCount() == 0) return null;

            View first = scroll.getChildAt(0);
            if (first instanceof LinearLayout && WRAP_TAG.equals(first.getTag()))
                return (ViewGroup) first;                         // already wrapped on a prior pass

            // Move the existing content into a vertical LinearLayout so we can stack below it.
            scroll.removeView(first);
            LinearLayout wrapper = new LinearLayout(activity);
            wrapper.setOrientation(LinearLayout.VERTICAL);
            wrapper.setTag(WRAP_TAG);
            first.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            wrapper.addView(first);
            scroll.addView(wrapper, new ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            return wrapper;
        } catch (Throwable t) {
            DtLog.w("ensureWrapper", t);
            return null;
        }
    }

    /** First VERTICAL LinearLayout in the tree (where info rows usually live). */
    private static ViewGroup findVerticalContainer(ViewGroup root) {
        for (int i = 0; i < root.getChildCount(); i++) {
            View c = root.getChildAt(i);
            if (c instanceof LinearLayout && ((LinearLayout) c).getOrientation() == LinearLayout.VERTICAL)
                return (ViewGroup) c;
            if (c instanceof ViewGroup) {
                ViewGroup r = findVerticalContainer((ViewGroup) c);
                if (r != null) return r;
            }
        }
        return null;
    }

    private static int dp(Context ctx, int v) {
        return Math.round(v * ctx.getResources().getDisplayMetrics().density);
    }
}
