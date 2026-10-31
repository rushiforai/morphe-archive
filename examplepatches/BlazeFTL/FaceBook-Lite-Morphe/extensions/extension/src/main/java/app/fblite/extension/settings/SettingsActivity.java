package app.fblite.extension.settings;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.io.IOException;
import java.util.Locale;

/**
 * Settings screen of the patches, opened from the app icon's long-press menu. Built in code, since
 * the extension cannot add layout resources.
 */
public final class SettingsActivity extends Activity {
    private TextView value;
    private int primaryText;
    private int secondaryText;
    private TextView preview;
    private int percent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // Material rather than DeviceDefault: some OEM DeviceDefault themes leave TextView text black in dark mode.
        boolean night = (getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        setTheme(night ? android.R.style.Theme_Material_NoActionBar : android.R.style.Theme_Material_Light_NoActionBar);
        super.onCreate(savedInstanceState);
        MorpheLog.init(this);
        boolean vi = "vi".equals(Locale.getDefault().getLanguage());
        setTitle(vi ? "Cài đặt Morphe" : "Morphe settings");

        TypedArray colors = obtainStyledAttributes(new int[] {android.R.attr.textColorPrimary, android.R.attr.textColorSecondary});
        primaryText = colors.getColor(0, night ? 0xFFFFFFFF : 0xFF000000);
        secondaryText = colors.getColor(1, night ? 0xB3FFFFFF : 0x8A000000);
        colors.recycle();

        percent = MorpheSettings.fontScalePercent(this);
        final int pad = dp(20);

        final LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(pad, pad, pad, pad);

        TextView header = text(getTitle(), 22, primaryText);
        header.setPadding(0, 0, 0, dp(24));
        root.addView(header);

        root.addView(text(vi ? "Cỡ chữ" : "Font size", 18, primaryText));

        TextView summary = new TextView(this);
        summary.setTextColor(secondaryText);
        summary.setText(vi
                ? "Cỡ chữ của Facebook Lite, so với cỡ chữ hệ thống. Facebook dựng lại bố cục theo cỡ chữ này khi app mở lại."
                : "Facebook Lite's font size, relative to the system font size. Facebook lays the app out for it when the app restarts.");
        summary.setPadding(0, dp(4), 0, dp(12));
        root.addView(summary);

        value = text("", 14, primaryText);
        value.setGravity(Gravity.END);
        root.addView(value);

        SeekBar slider = new SeekBar(this);
        slider.setMax((MorpheSettings.MAX_PERCENT - MorpheSettings.MIN_PERCENT) / MorpheSettings.STEP_PERCENT);
        slider.setProgress((percent - MorpheSettings.MIN_PERCENT) / MorpheSettings.STEP_PERCENT);
        slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                percent = MorpheSettings.MIN_PERCENT + progress * MorpheSettings.STEP_PERCENT;
                update();
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
        root.addView(slider, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        preview = text("", 16, primaryText);
        preview.setText(vi ? "Xem trước cỡ chữ trong bảng tin" : "Preview of the feed font size");
        preview.setPadding(0, dp(16), 0, dp(16));
        root.addView(preview);

        LinearLayout buttons = new LinearLayout(this);
        buttons.setGravity(Gravity.END);

        Button reset = new Button(this);
        reset.setText(vi ? "Mặc định" : "Default");
        reset.setOnClickListener(v -> slider.setProgress(
                (MorpheSettings.DEFAULT_PERCENT - MorpheSettings.MIN_PERCENT) / MorpheSettings.STEP_PERCENT));
        buttons.addView(reset);

        Button apply = new Button(this);
        apply.setText(vi ? "Áp dụng và mở lại" : "Apply and restart");
        apply.setOnClickListener(v -> applyAndRestart());
        buttons.addView(apply);
        root.addView(buttons);

        root.addView(toggle(MorpheSettings.VIDEO_DOWNLOAD,
                vi ? "Tải video" : "Download videos",
                vi ? "Hiện nút tải khi đang xem video hoặc reel. Video được lưu vào thư mục Movies/Facebook Lite."
                        : "Shows a download button while a video or reel is playing. Videos are saved to Movies/Facebook Lite."));
        root.addView(toggle(MorpheSettings.ASK_DOWNLOAD_QUALITY,
                vi ? "Chọn chất lượng khi tải" : "Choose quality when downloading",
                vi ? "Hỏi chất lượng (HD, SD...) mỗi lần tải. Tắt thì luôn lưu chất lượng cao nhất."
                        : "Asks for the quality (HD, SD...) each time you download. Off: always saves the highest quality available."));
        root.addView(toggle(MorpheSettings.AUTO_NEXT_REEL,
                vi ? "Tự chuyển reel tiếp theo" : "Auto next reel",
                vi ? "Khi một reel phát hết, tự chuyển sang reel tiếp theo thay vì phát lại."
                        : "When a reel ends, moves on to the next one instead of playing it again."));

        root.addView(toggle(MorpheSettings.REELS_HIDE_ADS,
                vi ? "Xóa reel quảng cáo" : "Remove sponsored reels",
                vi ? "Gỡ reel quảng cáo ngay khi tải, nên vuốt đi thẳng sang reel kế tiếp mà không bị cuộn tự động. Áp dụng cho reel tải sau khi mở tab Reels."
                        : "Collapses sponsored reels as they load, so a swipe goes straight to the next real reel with no automatic scrolling. Applies to reels loaded after the Reels tab is opened."));
        root.addView(toggle(MorpheSettings.STORIES_HIDE_ADS,
                vi ? "Bỏ qua story quảng cáo" : "Skip sponsored stories",
                vi ? "Khi một story được tài trợ hiện ra, tự chuyển sang story tiếp theo và không hiện nút tải."
                        : "When a sponsored story shows up, moves on to the next story and shows no download button."));
        root.addView(toggle(MorpheSettings.DEBUG_LOG,
                vi ? "Ghi nhật ký gỡ lỗi" : "Debug logging",
                vi ? "Ghi cách Facebook tải quảng cáo (bảng tin, Reels, Marketplace) và nguồn video vào một tệp nhật ký. Nhật ký có chữ hiện trên màn hình. Chỉ bật khi cần."
                        : "Logs how Facebook loads ads (feed, Reels, Marketplace) and where videos come from. The log holds on-screen text. Keep off unless needed."));

        LinearLayout logButtons = new LinearLayout(this);
        logButtons.setGravity(Gravity.END);
        Button save = new Button(this);
        save.setText(vi ? "Lưu nhật ký vào Downloads" : "Save log to Downloads");
        save.setOnClickListener(v -> saveLog(vi));
        logButtons.addView(save);
        Button clear = new Button(this);
        clear.setText(vi ? "Xoá nhật ký" : "Clear log");
        clear.setOnClickListener(v -> {
            MorpheLog.clear(this);
            Toast.makeText(this, vi ? "Đã xoá nhật ký" : "Log cleared", Toast.LENGTH_SHORT).show();
        });
        logButtons.addView(clear);
        root.addView(logButtons);

        ScrollView scroll = new ScrollView(this);
        scroll.addView(root);
        // The app targets a recent SDK, so the window is edge to edge: keep the content clear of the system bars.
        scroll.setOnApplyWindowInsetsListener((v, insets) -> {
            root.setPadding(pad + insets.getSystemWindowInsetLeft(), pad + insets.getSystemWindowInsetTop(),
                    pad + insets.getSystemWindowInsetRight(), pad + insets.getSystemWindowInsetBottom());
            return insets.consumeSystemWindowInsets();
        });
        setContentView(scroll);
        update();
    }

    private LinearLayout toggle(final String key, String title, String summary) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(0, dp(28), 0, 0);

        final Switch control = new Switch(this);
        control.setText(title);
        control.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18);
        control.setTextColor(primaryText);
        control.setChecked(MorpheSettings.isEnabled(this, key));
        control.setOnCheckedChangeListener((button, checked) ->
                MorpheSettings.preferences(this).edit().putBoolean(key, checked).apply());
        row.addView(control, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView description = text(summary, 14, secondaryText);
        description.setPadding(0, dp(4), 0, 0);
        row.addView(description);
        return row;
    }

    private void saveLog(boolean vi) {
        try {
            String path = MorpheLog.saveToDownloads(this);
            Toast.makeText(this, path == null ? (vi ? "Nhật ký đang trống" : "The log is empty")
                    : (vi ? "Đã lưu: " : "Saved: ") + path, Toast.LENGTH_LONG).show();
        } catch (IOException | RuntimeException e) {
            Toast.makeText(this, (vi ? "Không lưu được: " : "Could not save: ") + e.getMessage(), Toast.LENGTH_LONG).show();
        }
    }

    private TextView text(CharSequence content, int sp, int color) {
        TextView view = new TextView(this);
        view.setText(content);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        view.setTextColor(color);
        return view;
    }

    private void update() {
        value.setText(percent + "%");
        // The system font scale is already applied to sp sizes here.
        preview.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f * percent / 100f);
    }

    private void applyAndRestart() {
        MorpheSettings.preferences(this).edit().putInt(MorpheSettings.FONT_SCALE_PERCENT, percent).commit();
        Intent launch = getPackageManager().getLaunchIntentForPackage(getPackageName());
        if (launch != null && launch.getComponent() != null) {
            startActivity(Intent.makeRestartActivityTask(launch.getComponent()));
        }
        // The font scale is read once at startup, so the process has to restart.
        Runtime.getRuntime().exit(0);
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
