package e.e.a;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.graphics.drawable.ColorDrawable;
import android.preference.PreferenceManager;
import android.preference.Preference;
import android.preference.PreferenceGroup;
import android.preference.PreferenceActivity;
import android.os.Build;
import android.view.View;
import android.text.InputFilter;
import android.text.InputType;
import android.util.TypedValue;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

/** Settings login fallback that does not initialize WebView or CookieManager. */
public final class LoginSupport {
    private LoginSupport() { }
    private static String t(String source) { return UiStrings.translate(source); }

    public static void settings(PreferenceActivity activity) {
        Preference login = activity.findPreference("login");
        if (login == null || activity.findPreference("nicoid_logout") != null) return;
        PreferenceGroup group = parent(activity.getPreferenceScreen(), login);
        if (group == null) return;
        Preference logout = new Preference(activity);
        logout.setKey("nicoid_logout"); logout.setTitle(t("ログアウト"));
        logout.setOrder(login.getOrder() + 1);
        logout.setOnPreferenceClickListener(p -> {
            AlertDialog dialog = builder(activity, "ログアウト")
                .setMessage(t("ログイン情報を削除してログアウトしますか？"))
                .setPositiveButton(t("ログアウト"), (d, which) -> logout(activity))
                .setNegativeButton(t("キャンセル"), null).create();
            show(dialog, activity); return true;
        });
        group.addPreference(logout);
    }

    private static PreferenceGroup parent(PreferenceGroup group, Preference target) {
        for (int n = 0; n < group.getPreferenceCount(); n++) {
            Preference child = group.getPreference(n);
            if (child == target) return group;
            if (child instanceof PreferenceGroup) {
                PreferenceGroup result = parent((PreferenceGroup) child, target);
                if (result != null) return result;
            }
        }
        return null;
    }

    private static void logout(Activity activity) {
        try {
            Class<?> owner = Class.forName("e.e.a.v0");
            Object empty = owner.getMethod("b", String.class).invoke(null, "");
            SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(activity);
            if (!prefs.edit().remove("save_cookie").remove("login_mail").remove("login_pass")
                .putBoolean("nologin", true).putBoolean("nicoid_clear_web_login", true).commit())
                throw new IllegalStateException();
            Object previous = owner.getField("b").get(null);
            if (previous != null) Class.forName("org.apache.http.client.CookieStore").getMethod("clear").invoke(previous);
            owner.getField("b").set(null, empty);
            // Old devices can log out without loading their unsupported WebView.
            Toast.makeText(activity, t("ログアウトしました"), Toast.LENGTH_SHORT).show();
            activity.recreate();
        } catch (Exception failure) {
            Toast.makeText(activity, t("ログアウトできませんでした。再試行してください。"), Toast.LENGTH_LONG).show();
        }
    }

    /** Clear the previous web session only when a working login WebView exists. */
    public static void loadLogin(android.webkit.WebView web, String url) {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(web.getContext());
        if (!prefs.getBoolean("nicoid_clear_web_login", false)) { web.loadUrl(url); return; }
        android.webkit.CookieManager cookies = android.webkit.CookieManager.getInstance();
        cookies.removeAllCookies(removed -> {
            cookies.flush();
            prefs.edit().remove("nicoid_clear_web_login").apply();
            web.loadUrl(url);
        });
    }

    public static void open(Activity activity) {
        if (activity.isFinishing()) return;
        UiStrings.selectLanguage(PreferenceManager.getDefaultSharedPreferences(activity).getString("app_lang", "0"));
        LinearLayout choices = column(activity);
        TextView web = label(activity, "通常ログイン");
        TextView manual = label(activity, "Cookie手動入力");
        web.setFocusable(true); manual.setFocusable(true);
        choices.addView(web); choices.addView(manual);
        AlertDialog dialog = builder(activity, "ログイン方法").setView(choices)
            .setNegativeButton(t("キャンセル"), null).create();
        web.setOnClickListener(v -> {
            dialog.dismiss();
            Intent intent = new Intent().setClassName(activity, "com.sauzask.nicoid.ModernLoginActivity");
            activity.startActivity(intent);
        });
        manual.setOnClickListener(v -> { dialog.dismiss(); input(activity); });
        show(dialog, activity);
    }

    private static void input(Activity activity) {
        LinearLayout content = column(activity);
        content.addView(label(activity, "別の端末・PCでニコニコにログインし、ブラウザのCookieからuser_sessionの値を貼り付けてください。user_session=… の形式でも入力できます。Cookieは他の人に渡さないでください。"));
        EditText input = new EditText(activity);
        input.setHint("user_session");
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        input.setSingleLine(true);
        input.setSaveEnabled(false);
        if (Build.VERSION.SDK_INT >= 26) input.setImportantForAutofill(View.IMPORTANT_FOR_AUTOFILL_NO);
        input.setFilters(new InputFilter[]{new InputFilter.LengthFilter(16384)});
        input.setTextColor(color(activity, android.R.attr.textColorPrimary));
        input.setHintTextColor(color(activity, android.R.attr.textColorHint));
        input.setBackgroundTintList(ColorStateList.valueOf(color(input.getContext(), 0x7f03005e)));
        content.addView(input);
        ScrollView scroll = new ScrollView(activity); scroll.addView(content);
        AlertDialog dialog = builder(activity, "Cookie手動入力").setView(scroll)
            .setPositiveButton(t("保存"), null).setNegativeButton(t("キャンセル"), null).create();
        dialog.setOnDismissListener(d -> input.setText(""));
        dialog.getWindow().addFlags(WindowManager.LayoutParams.FLAG_SECURE);
        show(dialog, activity);
        dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
            final String cookie;
            try { cookie = ManualCookie.normalize(input.getText().toString()); }
            catch (IllegalArgumentException invalid) {
                input.setError(t("user_sessionの値、またはuser_session=… の形式で入力してください。")); return;
            }
            try {
                save(activity, cookie);
                dialog.dismiss();
                Toast.makeText(activity, t("Cookieを保存しました。認証が通らない場合は、ログインし直してCookieを再取得してください。"), Toast.LENGTH_LONG).show();
                activity.recreate();
            } catch (Exception failure) {
                // Do not expose exception details: they may contain account credentials.
                Toast.makeText(activity, t("Cookieを保存できませんでした。再試行してください。"), Toast.LENGTH_LONG).show();
            }
        });
    }

    private static void save(Context context, String cookie) throws Exception {
        Class<?> owner = Class.forName("e.e.a.v0");
        Class<?> storeType = Class.forName("org.apache.http.client.CookieStore");
        Object store = owner.getMethod("b", String.class).invoke(null, cookie);
        String serialized = (String) owner.getMethod("a", storeType).invoke(null, store);
        if (!cookie.equals(serialized)) throw new IllegalStateException();
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
        // Publish the new live session only after persistent storage succeeds.
        if (!prefs.edit().putString("save_cookie", serialized).putBoolean("nologin", false).commit())
            throw new IllegalStateException();
        owner.getField("b").set(null, store);
    }

    private static AlertDialog.Builder builder(Activity activity, String title) {
        TextView heading = label(activity, title); heading.setTextSize(20);
        return new AlertDialog.Builder(activity).setCustomTitle(heading);
    }
    private static LinearLayout column(Context context) {
        LinearLayout view = new LinearLayout(context); view.setOrientation(LinearLayout.VERTICAL);
        int pad = Math.round(16 * context.getResources().getDisplayMetrics().density);
        view.setPadding(pad, 0, pad, pad); return view;
    }
    private static TextView label(Context context, String text) {
        TextView view = new TextView(context); view.setText(t(text)); view.setTextSize(16);
        view.setTextColor(color(context, android.R.attr.textColorPrimary));
        int pad = Math.round(16 * context.getResources().getDisplayMetrics().density);
        view.setPadding(pad, pad, pad, pad); return view;
    }
    private static int color(Context context, int attr) {
        TypedValue value = new TypedValue(); context.getTheme().resolveAttribute(attr, value, true);
        return value.resourceId == 0 ? value.data : context.getResources().getColorStateList(value.resourceId).getDefaultColor();
    }
    private static void show(AlertDialog dialog, Activity activity) {
        dialog.show();
        PlaybackSession.formDialog(dialog);

    }
}
