package local.transit.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.LocaleManager;
import android.content.Intent;
import android.os.Build;
import android.os.LocaleList;
import android.view.View;
import android.widget.TextView;
import android.widget.ImageView;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

/** In-app selector backed by Android 13+ persistent per-app locales. */
public final class LanguageSettings {
    private LanguageSettings() {}

    public static void install(Activity activity) {
        View root = activity.findViewById(android.R.id.content);
        if (root == null) return;
        View row = root.findViewWithTag("transit_language_picker");
        if (!(row instanceof TextView)) return;
        localizeBadge(activity);
        if (Build.VERSION.SDK_INT < 33) {
            row.setVisibility(View.GONE);
            return;
        }
        LocaleManager manager = activity.getSystemService(LocaleManager.class);
        if (manager == null) {
            row.setVisibility(View.GONE);
            return;
        }
        final String[] tags = {"ja", "en", ""};
        final String[] names = {"日本語", "English (preview)", "System default / システム"};
        LocaleList locales = manager.getApplicationLocales();
        String current = locales.isEmpty() ? "" : locales.get(0).getLanguage();
        // Clear a previously saved locale that is no longer offered by this patch.
        if (!current.isEmpty() && !"ja".equals(current) && !"en".equals(current)) {
            manager.setApplicationLocales(LocaleList.forLanguageTags(""));
            return;
        }
        int selected = tags.length - 1;
        for (int i = 0; i < tags.length; i++) if (tags[i].equals(current)) selected = i;
        ((TextView) row).setText("Language / 言語  ·  " + names[selected]);
        row.setOnClickListener(view -> {
            // Re-read each time, including changes made through Android system settings.
            LocaleList latest = manager.getApplicationLocales();
            String language = latest.isEmpty() ? "" : latest.get(0).getLanguage();
            int checked = tags.length - 1;
            for (int i = 0; i < tags.length; i++) if (tags[i].equals(language)) checked = i;
            new AlertDialog.Builder(activity)
                .setTitle("Language / 言語")
                .setSingleChoiceItems(names, checked, (dialog, which) -> {
                    dialog.dismiss();
                    if (tags[which].equals(language)) return;
                    confirmLanguageChange(activity, manager, tags[which]);
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
        });
    }

    private static void confirmLanguageChange(Activity activity, LocaleManager manager, String tag) {
        LocaleList target = tag.isEmpty() ? manager.getSystemLocales() : LocaleList.forLanguageTags(tag);
        String language = target.isEmpty() ? "ja" : target.get(0).getLanguage();
        String title, message, restart, later;
        if ("en".equals(language)) {
            title = "Restart required";
            message = "Restart the app to fully apply the new language. Some icons and text may stay in the previous language until you restart.";
            restart = "Restart now";
            later = "Later";
        } else {
            title = "アプリの再起動が必要です";
            message = "言語の変更をすべて反映するには、アプリを再起動してください。再起動するまで、一部のアイコンや文字が変更前の言語で表示される場合があります。";
            restart = "今すぐ再起動";
            later = "後で";
        }
        new AlertDialog.Builder(activity)
            .setTitle(title)
            .setMessage(message)
            .setCancelable(false)
            .setPositiveButton(restart, (dialog, which) -> {
                // The helper must become foreground before the old process exits.
                Intent helper = new Intent(activity, RestartActivity.class)
                    .putExtra("transit_parent_pid", android.os.Process.myPid())
                    .putExtra("transit_language", tag)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                activity.startActivity(helper);
            })
            .setNegativeButton(later, (dialog, which) ->
                manager.setApplicationLocales(LocaleList.forLanguageTags(tag)))
            .show();
    }

    private static void localizeBadge(Activity activity) {
        if (!"en".equals(activity.getResources().getConfiguration().getLocales().get(0).getLanguage())) return;
        int id = activity.getResources().getIdentifier("info_new", "id", activity.getPackageName());
        View badge = id == 0 ? null : activity.findViewById(id);
        if (badge instanceof ImageView) {
            // Retain the original ImageView and its dynamically controlled unread visibility.
            ((ImageView) badge).setImageDrawable(new UnreadBadge(activity));
            badge.setContentDescription("Unread announcements");
        }
    }

    private static final class UnreadBadge extends Drawable {
        private final Paint background = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint text = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final int width;
        private final int height;

        UnreadBadge(Activity activity) {
            float density = activity.getResources().getDisplayMetrics().density;
            float scaled = activity.getResources().getDisplayMetrics().scaledDensity;
            background.setColor(Color.rgb(89, 153, 108));
            text.setColor(Color.WHITE);
            text.setTextSize(12 * scaled);
            text.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
            width = (int) Math.ceil(text.measureText("Unread") + 16 * density);
            height = (int) Math.ceil(Math.max(22 * density, text.descent() - text.ascent() + 6 * density));
        }

        @Override public int getIntrinsicWidth() { return width; }
        @Override public int getIntrinsicHeight() { return height; }
        @Override public void draw(Canvas canvas) {
            RectF bounds = new RectF(getBounds());
            canvas.drawRoundRect(bounds, bounds.height() / 2, bounds.height() / 2, background);
            float x = bounds.centerX() - text.measureText("Unread") / 2;
            float y = bounds.centerY() - (text.ascent() + text.descent()) / 2;
            canvas.drawText("Unread", x, y, text);
        }
        @Override public void setAlpha(int alpha) { background.setAlpha(alpha); text.setAlpha(alpha); invalidateSelf(); }
        @Override public void setColorFilter(ColorFilter filter) {
            background.setColorFilter(filter); text.setColorFilter(filter); invalidateSelf();
        }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
