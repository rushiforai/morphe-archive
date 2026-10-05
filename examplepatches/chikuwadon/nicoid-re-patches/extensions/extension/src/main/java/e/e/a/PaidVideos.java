package e.e.a;

import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.util.LinkedHashMap;
import org.json.JSONArray;
import org.json.JSONObject;

/** Payment metadata from list responses, without extra per-video requests. */
public final class PaidVideos {
    private static final String TAG = "nicoid_payment_badge";
    private static final LinkedHashMap<String, Boolean> known = new LinkedHashMap<>(16, .75f, true);
    private PaidVideos() { }
    static String id(String value) {
        if (value == null) return "";
        String id = value;
        int slash = id.lastIndexOf('/'); if (slash >= 0) id = id.substring(slash + 1);
        int query = id.indexOf('?'); if (query >= 0) id = id.substring(0, query);
        int fragment = id.indexOf('#'); if (fragment >= 0) id = id.substring(0, fragment);
        return id.matches("(?:sm|so|nm|ss)?[0-9]+") ? id : "";
    }
    public static void remember(JSONObject source) {
        if (source == null || !source.has("isPaymentRequired") || source.isNull("isPaymentRequired")) return;
        String key = id(source.optString("id", source.optString("videourl", "")));
        if (key.isEmpty()) return;
        synchronized (known) {
            known.put(key, source.optBoolean("isPaymentRequired", false));
            while (known.size() > 1024) known.remove(known.entrySet().iterator().next().getKey());
        }
    }
    public static JSONObject item(JSONArray array, int index) throws org.json.JSONException {
        JSONObject source = array.getJSONObject(index); remember(source); return source;
    }
    static boolean required(String key) {
        synchronized (known) { return Boolean.TRUE.equals(known.get(id(key))); }
    }
    static boolean watchRequired(JSONObject watch) {
        JSONObject payment = watch == null ? null : watch.optJSONObject("payment");
        JSONObject video = payment == null ? null : payment.optJSONObject("video");
        return video != null && (video.optBoolean("isPpv") || video.optBoolean("isAdmission") ||
            video.optBoolean("isPremium") || video.optBoolean("isContinuationBenefit"));
    }
    public static void bindAdapter(View root, Object adapter, int position) {
        if (root == null) return;
        try {
            java.util.List<?> rows = (java.util.List<?>)adapter.getClass().getField("b").get(adapter);
            if (position >= 0 && position < rows.size()) {
                Object row = rows.get(position);
                HistorySupport.bindAccount(root, adapter, row);
                bind(root, row);
            }
        } catch (ReflectiveOperationException error) { throw new IllegalStateException("Unsupported video adapter", error); }
    }
    public static void bind(View root, Object row) {
        if (root == null || row == null) return;
        try {
            Object url = row.getClass().getMethod("a", String.class).invoke(row, "videourl");
            View thumbnail = root.findViewById(0x7f0801b2);
            if (thumbnail != null && thumbnail.getParent() instanceof ViewGroup) {
                show((ViewGroup)thumbnail.getParent(), url != null && required(url.toString()));
            }
        } catch (ReflectiveOperationException error) { throw new IllegalStateException("Unsupported video row", error); }
    }
    static int foreground(int background) {
        double red = linear(Color.red(background)), green = linear(Color.green(background)), blue = linear(Color.blue(background));
        return .2126 * red + .7152 * green + .0722 * blue > .179 ? Color.BLACK : Color.WHITE;
    }
    private static double linear(int value) { double n = value / 255.; return n <= .04045 ? n / 12.92 : Math.pow((n + .055) / 1.055, 2.4); }
    public static void show(ViewGroup thumbnail, boolean paid) {
        TextView badge = (TextView)thumbnail.findViewWithTag(TAG);
        if (!paid) { if (badge != null) badge.setVisibility(View.GONE); return; }
        if (badge == null) {
            badge = new TextView(thumbnail.getContext()); badge.setTag(TAG);
            badge.setTextSize(11.4f);
            int padding = dp(thumbnail.getContext(), 4); badge.setPadding(padding, dp(thumbnail.getContext(), 1), padding, dp(thumbnail.getContext(), 1));
            badge.setGravity(android.view.Gravity.CENTER); badge.setIncludeFontPadding(false);
            badge.setClickable(false); badge.setFocusable(false);
            if (thumbnail instanceof RelativeLayout) {
                RelativeLayout.LayoutParams lp = new RelativeLayout.LayoutParams(-2, -2);
                lp.addRule(RelativeLayout.ALIGN_PARENT_LEFT); lp.addRule(RelativeLayout.ALIGN_PARENT_TOP); thumbnail.addView(badge, lp);
            } else if (thumbnail instanceof FrameLayout) {
                thumbnail.addView(badge, new FrameLayout.LayoutParams(-2, -2, android.view.Gravity.TOP | android.view.Gravity.LEFT));
            } else return;
        }
        TypedValue accent = new TypedValue(); Context context = badge.getContext();
        int color = Color.DKGRAY;
        if (context.getTheme().resolveAttribute(0x7f03005e, accent, true)) color = accent.resourceId == 0 ? accent.data : context.getResources().getColor(accent.resourceId);
        color = Color.rgb(Color.red(color), Color.green(color), Color.blue(color));
        TypedValue background = new TypedValue();
        if (context.getTheme().resolveAttribute(android.R.attr.colorBackground, background, true)) {
            int bg = background.resourceId == 0 ? background.data : context.getResources().getColor(background.resourceId);
            if (Color.red(bg) * 299 + Color.green(bg) * 587 + Color.blue(bg) * 114 < 128000) color = 0xff444444;
        }
        View durationView = thumbnail.findViewById(0x7f0800df);
        if (durationView instanceof TextView) {
            TextView duration = (TextView)durationView;
            badge.setTextSize(TypedValue.COMPLEX_UNIT_PX, duration.getTextSize() * .95f);
            badge.setTypeface(duration.getTypeface());
            badge.setIncludeFontPadding(false);
            int padding = dp(context, 4);
            badge.setPadding(padding, dp(context, 1), padding, dp(context, 1));
        }
        GradientDrawable shape = new GradientDrawable(); shape.setColor(color);
        float radius = dp(context, 4);
        shape.setCornerRadii(new float[]{0, 0, 0, 0, radius, radius, 0, 0});
        badge.setBackground(shape); badge.setTextColor(foreground(color));
        badge.setText(UiStrings.translate("有料")); badge.setContentDescription(UiStrings.translate("有料")); badge.setVisibility(View.VISIBLE);
    }
    private static int dp(Context context, int value) { return Math.round(context.getResources().getDisplayMetrics().density * value); }
}
