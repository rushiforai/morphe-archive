package app.hoitruyenchu.extension.itruyenchu.patches.settings;

import android.app.ActionBar;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.ComponentName;
import android.content.Intent;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.speech.tts.TextToSpeech;
import android.speech.tts.Voice;
import android.text.TextUtils;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import app.hoitruyenchu.extension.itruyenchu.patches.shared.HtcPatches;
import app.hoitruyenchu.extension.itruyenchu.patches.shared.HtcSettings;
import app.hoitruyenchu.extension.itruyenchu.patches.titles.ChapterTitlesPatch;
import app.hoitruyenchu.extension.itruyenchu.patches.tts.SleepTimer;

/**
 * The settings screen of the patches, opened from the account tab ("Cài đặt HoiTruyenChu").
 * Built in code (the extension has no resources), one section per applied patch.
 */
@SuppressWarnings({"deprecation", "unused"})
public final class SettingsActivity extends Activity {
    private static final String TAG = "HTC-Settings";
    private static final String REPO = "CozyCode890/HoiTruyenChu-patches";
    private static final int REQUEST_EXPORT = 1;
    private static final int REQUEST_IMPORT = 2;

    private final Handler main = new Handler(Looper.getMainLooper());
    private LinearLayout list;
    private ScrollView scroll;
    private boolean night;
    private int colorText, colorSecondary, colorAccent, colorDivider, colorBackground;
    private int selectableBackground;

    /** A setting that needs a restart was changed. */
    private boolean restartNeeded;
    private float shownSpeed = -1;

    // Engines and voices of the TTS section.
    private TextToSpeech probe;
    private String probeEngine;
    private boolean probeReady;
    private final List<TextToSpeech.EngineInfo> engines = new ArrayList<>();
    private final List<Voice> voices = new ArrayList<>();

    // ---------------------------------------------------------------------------------------------
    // Lifecycle

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        night = (getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        setTheme(night ? android.R.style.Theme_DeviceDefault : android.R.style.Theme_DeviceDefault_Light);
        super.onCreate(savedInstanceState);
        setTitle("Cài đặt HoiTruyenChu");
        ActionBar actionBar = getActionBar();
        if (actionBar != null) actionBar.setDisplayHomeAsUpEnabled(true);

        colorBackground = night ? 0xFF121316 : 0xFFF6F6F8;
        colorText = night ? 0xFFECECEC : 0xFF1C1C1E;
        colorSecondary = night ? 0xFFA0A3AA : 0xFF6B6B70;
        colorAccent = night ? 0xFFF0A93B : 0xFFB8650A;
        colorDivider = night ? 0x1FFFFFFF : 0x1F000000;
        TypedArray a = obtainStyledAttributes(new int[]{android.R.attr.selectableItemBackground});
        selectableBackground = a.getResourceId(0, 0);
        a.recycle();

        scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.setBackgroundColor(colorBackground);
        scroll.setFitsSystemWindows(true);
        scroll.setClipToPadding(false);
        list = new LinearLayout(this);
        list.setOrientation(LinearLayout.VERTICAL);
        list.setPadding(0, 0, 0, dp(32));
        scroll.addView(list, new ScrollView.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT));
        setContentView(scroll);
        getWindow().getDecorView().setBackgroundColor(colorBackground);

        if (HtcPatches.ttsReliability()) startProbe(HtcSettings.string(HtcSettings.TTS_ENGINE));
        render();
    }

    @Override
    protected void onResume() {
        super.onResume();
        render();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        shutdownProbe();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == android.R.id.home) {
            finish();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    // ---------------------------------------------------------------------------------------------
    // Content

    private void render() {
        int y = scroll.getScrollY();
        list.removeAllViews();

        if (restartNeeded) {
            header("Cần khởi động lại");
            action("Khởi động lại app", "Một số thay đổi chỉ áp dụng sau khi mở lại app", true, this::restartApp);
        }

        if (HtcPatches.ttsReliability()) ttsSection();
        if (HtcPatches.backgroundReading()) backgroundSection();
        if (HtcPatches.rememberSpeed()) speedSection();
        if (HtcPatches.mediaControls()) mediaSection();
        if (HtcPatches.resumeListening()) resumeSection();
        if (HtcPatches.tapToSeek()) tapSection();
        if (HtcPatches.chapterTitles()) titlesSection();
        if (HtcPatches.autoSync()) syncSection();
        if (HtcPatches.googleLogin()) loginSection();
        generalSection();
        aboutSection();

        scroll.post(() -> scroll.scrollTo(0, y));
    }

    private void ttsSection() {
        header("Đọc to (TTS)");
        String m = HtcSettings.TTS_ENABLED;
        toggle(m, "Sửa lỗi đọc to", "Tạo lại bộ đọc khi bị lỗi, xử lý cuộc gọi, đọc lại dòng lỗi, dùng đúng giọng tiếng Việt", true);
        boolean on = HtcSettings.bool(m);
        choice(HtcSettings.TTS_CALL, "Khi có cuộc gọi", on,
                new Object[]{"resume", "pause", "none"},
                new String[]{"Tạm dừng, đọc tiếp sau cuộc gọi", "Chỉ tạm dừng", "Không làm gì"});
        toggle(HtcSettings.TTS_NOISY, "Tạm dừng khi rút tai nghe", "Cả khi ngắt kết nối tai nghe Bluetooth", on);
        choice(HtcSettings.TTS_RETRIES, "Đọc lại dòng bị lỗi", on,
                new Object[]{0, 1, 2, 3, 4, 5},
                new String[]{"Không đọc lại", "1 lần", "2 lần", "3 lần", "4 lần", "5 lần"});
        toggle(HtcSettings.TTS_APPLY_SPEED, "Áp dụng tốc độ mới ngay",
                "Đổi tốc độ khi đang đọc thì dòng hiện tại được đọc lại với tốc độ mới", on);
        action("Bộ đọc (TTS engine)", engineLabel(), on, this::pickEngine);
        action("Giọng đọc", voiceLabel(), on, this::pickVoice);
        action("Nghe thử", "Đọc một câu mẫu với bộ đọc, giọng và tốc độ đang chọn", on, this::preview);
        reset("tts.", "Đọc to (TTS)");
    }

    private void backgroundSection() {
        header("Đọc nền & hẹn giờ tắt");
        String m = HtcSettings.BG_ENABLED;
        toggle(m, "Đọc khi tắt màn hình", "Vẫn đọc tiếp và sang chương mới khi app chạy nền", true);
        boolean on = HtcSettings.bool(m);
        String state = SleepTimer.describe();
        action("Hẹn giờ tắt", state != null ? SleepTimer.label(SleepTimer.option()) + " · " + state : "Tắt",
                on, this::pickSleep);
        toggle(HtcSettings.BG_SLEEP_BUTTON, "Nút hẹn giờ trên thanh đọc",
                "Nút mặt trăng cạnh nút tốc độ: mỗi lần bấm chuyển sang mức hẹn giờ tiếp theo", on);
        reset("bg.", "Đọc nền");
    }

    private void speedSection() {
        header("Nhớ tốc độ đọc");
        String m = HtcSettings.SPEED_ENABLED;
        toggle(m, "Giữ tốc độ khi mở lại app", "Một tốc độ cho mọi truyện", true);
        boolean on = HtcSettings.bool(m);
        float speed = shownSpeed > 0 ? shownSpeed : HtcSettings.savedSpeed();
        action("Tốc độ đọc", String.format(Locale.US, "%.2fx · chỉnh từ 0.50x đến 3.00x", speed), on, this::pickSpeed);
        toggle(HtcSettings.SPEED_EXTRA_LEVELS, "Thêm mức tốc độ",
                "Bảng chọn tốc độ của thanh đọc có thêm 0.90x, 1.10x, 1.75x, 2.50x, 3.00x", on);
        reset("speed.", "Nhớ tốc độ đọc");
    }

    private void mediaSection() {
        header("Điều khiển trên màn hình khóa");
        String m = HtcSettings.MEDIA_ENABLED;
        toggle(m, "Điều khiển việc đọc từ thông báo",
                "Thông báo / màn hình khóa hiện việc đọc (dòng x/y), các nút điều khiển việc đọc. Cần khởi động lại app",
                true, true);
        boolean on = HtcSettings.bool(m);
        choice(HtcSettings.MEDIA_SKIP, "Nút tới / lùi", on,
                new Object[]{"chapter", "line1", "line5"},
                new String[]{"Đổi chương", "Tới / lùi 1 dòng", "Tới / lùi 5 dòng"});
        reset("media.", "Điều khiển trên màn hình khóa");
    }

    private void resumeSection() {
        header("Nghe tiếp vị trí cũ");
        String m = HtcSettings.RESUME_ENABLED;
        toggle(m, "Nhớ dòng đang nghe", "Mở lại truyện thì quay về dòng đã nghe tới", true);
        choice(HtcSettings.RESUME_MODE, "Khi mở truyện", HtcSettings.bool(m),
                new Object[]{"highlight", "play", "ask"},
                new String[]{"Chỉ đánh dấu dòng", "Đọc luôn", "Hỏi \"Nghe tiếp từ dòng X?\""});
        reset("resume.", "Nghe tiếp vị trí cũ");
    }

    private void tapSection() {
        header("Chạm dòng để nghe");
        String m = HtcSettings.TAP_ENABLED;
        toggle(m, "Chạm vào dòng để nghe từ dòng đó", "Đọc theo chiều dọc", true);
        boolean on = HtcSettings.bool(m);
        choice(HtcSettings.TAP_GESTURE, "Cử chỉ", on,
                new Object[]{"tap", "double", "long"},
                new String[]{"Chạm một lần", "Chạm hai lần", "Nhấn giữ"});
        toggle(HtcSettings.TAP_RETURN_BUTTON, "Nút \"Về dòng đang đọc\"",
                "Hiện khi tự cuộn trang lúc đang nghe", on);
        choice(HtcSettings.TAP_AUTO_RETURN, "Tự quay về dòng đang đọc", on,
                new Object[]{0, 5, 10, 30},
                new String[]{"Tắt", "Sau 5 giây không chạm", "Sau 10 giây không chạm", "Sau 30 giây không chạm"});
        choice(HtcSettings.TAP_CLOSED_BAR, "Chạm khi thanh đọc đang đóng", on,
                new Object[]{"mark", "nothing", "play"},
                new String[]{"Mở thanh đọc, đánh dấu dòng", "Không làm gì", "Mở thanh đọc và đọc luôn"});
        reset("tap.", "Chạm dòng để nghe");
    }

    private void titlesSection() {
        header("Tên chương");
        String m = HtcSettings.TITLES_ENABLED;
        toggle(m, "Hiện tên chương thật", "Thay \"Vô Đề Mục\" bằng tên lấy từ dòng đầu của chương", true);
        boolean on = HtcSettings.bool(m);
        toggle(HtcSettings.TITLES_WIFI_ONLY, "Chỉ tải tên chương qua Wi-Fi",
                "Không tải khi dùng dữ liệu di động (tên đã có vẫn hiện)", on);
        toggle(HtcSettings.TITLES_SKIP_HEADER, "Không đọc dòng tên chương",
                "Bỏ qua dòng \"Chương N: ...\" khi đọc to", on);
        action("Xóa bộ nhớ tên chương", "Đang dùng " + size(ChapterTitlesPatch.cacheSize()), true, () ->
                confirm("Xóa bộ nhớ tên chương?", "Tên chương sẽ được tải lại khi mở danh sách chương.", () -> {
                    int n = ChapterTitlesPatch.clearCache();
                    toast("Đã xóa tên chương của " + n + " truyện");
                    render();
                }));
        reset("titles.", "Tên chương");
    }

    private void syncSection() {
        header("Đồng bộ lịch sử đọc");
        String m = HtcSettings.SYNC_ENABLED;
        toggle(m, "Tự đồng bộ với tài khoản", "Cả nút \"Đồng bộ\" của tủ truyện", true);
        boolean on = HtcSettings.bool(m);
        toggle(HtcSettings.SYNC_ON_START, "Khi mở app", "Lấy tiến độ đọc từ máy khác", on);
        toggle(HtcSettings.SYNC_ON_LOGIN, "Ngay sau khi đăng nhập", null, on);
        toggle(HtcSettings.SYNC_ON_RESUME, "Khi quay lại app", "Sau hơn 5 phút chạy nền", on);
        toggle(HtcSettings.SYNC_RECORD_FREE, "Ghi lại chương miễn phí 1–50", "Máy chủ không tự ghi các chương này", on);
        choice(HtcSettings.SYNC_TOASTS, "Thông báo khi tự đồng bộ", on,
                new Object[]{"all", "changes", "none"},
                new String[]{"Luôn hiện", "Chỉ khi có thay đổi hoặc lỗi", "Không hiện"});
        reset("sync.", "Đồng bộ lịch sử đọc");
    }

    private void loginSection() {
        header("Đăng nhập Google");
        String status = HtcSettings.status(HtcSettings.LOGIN_STATUS);
        long at = HtcSettings.statusTime(HtcSettings.LOGIN_STATUS);
        String when = at > 0 ? " lúc " + new SimpleDateFormat("HH:mm dd/MM", Locale.US).format(new Date(at)) : "";
        String summary;
        if (status == null) summary = "Đang hoạt động · chưa đăng nhập Google từ khi cài bản này";
        else if ("ok".equals(status)) summary = "Đang hoạt động · lần cuối thành công" + when;
        else summary = "Đang hoạt động · lần cuối " + status + when;
        info("Sửa lỗi đăng nhập Google", summary + "\n(Không tắt được: tắt đi thì không đăng nhập Google được)");
    }

    private void generalSection() {
        header("Chung");
        toggle(HtcSettings.DEBUG, "Ghi log gỡ lỗi", "Các script ghi log [HTC-...] để báo lỗi", true);
        action("Chia sẻ log", "Gửi log HTC-* (để báo lỗi)", true, this::shareLog);
        action("Xuất cài đặt", "Lưu ra file .json", true, () -> {
            Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("application/json");
            intent.putExtra(Intent.EXTRA_TITLE, "hoitruyenchu-settings.json");
            startForResult(intent, REQUEST_EXPORT);
        });
        action("Nhập cài đặt", "Đọc từ file .json đã xuất", true, () -> {
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("*/*");
            intent.putExtra(Intent.EXTRA_MIME_TYPES, new String[]{"application/json", "text/plain", "application/octet-stream"});
            startForResult(intent, REQUEST_IMPORT);
        });
        action("Đặt lại tất cả", "Đưa mọi cài đặt về mặc định", true, () ->
                confirm("Đặt lại tất cả?", "Mọi cài đặt của HoiTruyenChu về mặc định.", () -> {
                    HtcSettings.reset("");
                    restartNeeded = true;
                    toast("Đã đặt lại");
                    render();
                }));
        action("Khởi động lại app", null, true, this::restartApp);
    }

    private void aboutSection() {
        header("Thông tin");
        String version = HtcPatches.version();
        info("HoiTruyenChu Patches", "Phiên bản " + (TextUtils.isEmpty(version) ? "?" : version));
        action("Mã nguồn trên GitHub", "github.com/" + REPO, true,
                () -> open("https://github.com/" + REPO));
        action("Kiểm tra cập nhật", null, true, this::checkUpdate);
    }

    // ---------------------------------------------------------------------------------------------
    // Rows

    private void header(String title) {
        TextView view = new TextView(this);
        view.setText(title.toUpperCase(new Locale("vi")));
        view.setTextColor(colorAccent);
        view.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        view.setTypeface(Typeface.DEFAULT_BOLD);
        view.setLetterSpacing(0.04f);
        view.setPadding(dp(20), dp(24), dp(20), dp(8));
        list.addView(view);
    }

    private View row(String title, String summary, boolean enabled, Runnable onClick, View widget) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(56));
        row.setPadding(dp(20), dp(12), dp(16), dp(12));
        LinearLayout texts = new LinearLayout(this);
        texts.setOrientation(LinearLayout.VERTICAL);
        TextView t = new TextView(this);
        t.setText(title);
        t.setTextColor(colorText);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        texts.addView(t);
        if (!TextUtils.isEmpty(summary)) {
            TextView s = new TextView(this);
            s.setText(summary);
            s.setTextColor(colorSecondary);
            s.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            s.setPadding(0, dp(2), 0, 0);
            texts.addView(s);
        }
        row.addView(texts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        if (widget != null) {
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            lp.leftMargin = dp(12);
            row.addView(widget, lp);
        }
        if (onClick != null && enabled) {
            if (selectableBackground != 0) row.setBackgroundResource(selectableBackground);
            row.setOnClickListener(v -> onClick.run());
        }
        row.setEnabled(enabled);
        row.setAlpha(enabled ? 1f : 0.4f);
        list.addView(row);
        View divider = new View(this);
        divider.setBackgroundColor(colorDivider);
        LinearLayout.LayoutParams dlp = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 1);
        dlp.leftMargin = dp(20);
        list.addView(divider, dlp);
        return row;
    }

    private void toggle(String key, String title, String summary, boolean enabled) {
        toggle(key, title, summary, enabled, false);
    }

    private void toggle(String key, String title, String summary, boolean enabled, boolean needsRestart) {
        Switch view = new Switch(this);
        view.setChecked(HtcSettings.bool(key));
        view.setClickable(false);
        view.setFocusable(false);
        view.setEnabled(enabled);
        row(title, summary, enabled, () -> {
            HtcSettings.put(key, !HtcSettings.bool(key));
            if (needsRestart) restartNeeded = true;
            render();
        }, view);
    }

    private void choice(String key, String title, boolean enabled, Object[] values, String[] labels) {
        Object current = valueOf(key);
        int index = 0;
        for (int i = 0; i < values.length; i++) if (values[i].equals(current)) index = i;
        final int selected = index;
        row(title, labels[selected], enabled, () -> new AlertDialog.Builder(this)
                .setTitle(title)
                .setSingleChoiceItems(labels, selected, (dialog, which) -> {
                    dialog.dismiss();
                    HtcSettings.put(key, values[which]);
                    render();
                })
                .setNegativeButton("Hủy", null)
                .show(), null);
    }

    private static Object valueOf(String key) {
        Object d = HtcSettings.defaultOf(key);
        if (d instanceof Integer) return HtcSettings.integer(key);
        if (d instanceof Boolean) return HtcSettings.bool(key);
        return HtcSettings.string(key);
    }

    private void action(String title, String summary, boolean enabled, Runnable onClick) {
        row(title, summary, enabled, onClick, null);
    }

    private void info(String title, String summary) {
        row(title, summary, true, null, null);
    }

    private void reset(String prefix, String name) {
        action("Đặt lại mặc định", null, true, () ->
                confirm("Đặt lại \"" + name + "\"?", "Các cài đặt của mục này về mặc định.", () -> {
                    HtcSettings.reset(prefix);
                    if ("media.".equals(prefix)) restartNeeded = true;
                    if ("tts.".equals(prefix)) startProbe("");
                    render();
                }));
    }

    // ---------------------------------------------------------------------------------------------
    // TTS engine / voice

    private void startProbe(String engine) {
        shutdownProbe();
        probeEngine = engine == null ? "" : engine;
        probeReady = false;
        final TextToSpeech[] holder = new TextToSpeech[1];
        TextToSpeech.OnInitListener listener = status -> main.post(() -> {
            if (holder[0] != probe) return;
            probeReady = status == TextToSpeech.SUCCESS;
            loadEnginesAndVoices();
            render();
        });
        try {
            probe = probeEngine.isEmpty()
                    ? new TextToSpeech(getApplicationContext(), listener)
                    : new TextToSpeech(getApplicationContext(), listener, probeEngine);
            holder[0] = probe;
        } catch (Throwable t) {
            Log.w(TAG, "could not start the TTS engine", t);
            probe = null;
        }
    }

    private void shutdownProbe() {
        if (probe != null) {
            try {
                probe.stop();
                probe.shutdown();
            } catch (Throwable ignored) {
            }
        }
        probe = null;
        probeReady = false;
    }

    private void loadEnginesAndVoices() {
        engines.clear();
        voices.clear();
        if (probe == null) return;
        try {
            List<TextToSpeech.EngineInfo> found = probe.getEngines();
            if (found != null) engines.addAll(found);
        } catch (Throwable ignored) {
        }
        if (!probeReady) return;
        try {
            Set<Voice> all = probe.getVoices();
            if (all != null) {
                for (Voice v : all) {
                    Locale l = v.getLocale();
                    if (l != null && "vi".equals(l.getLanguage())) voices.add(v);
                }
            }
            voices.sort((a, b) -> a.getName().compareTo(b.getName()));
        } catch (Throwable ignored) {
        }
    }

    private String engineLabel() {
        String engine = HtcSettings.string(HtcSettings.TTS_ENGINE);
        if (engine.isEmpty()) {
            String def = probe != null ? safeDefaultEngine() : null;
            return "Mặc định của hệ thống" + (def != null ? " (" + engineName(def) + ")" : "");
        }
        return engineName(engine);
    }

    private String safeDefaultEngine() {
        try {
            return probe.getDefaultEngine();
        } catch (Throwable t) {
            return null;
        }
    }

    private String engineName(String pkg) {
        for (TextToSpeech.EngineInfo e : engines) if (e.name.equals(pkg)) return e.label;
        return pkg;
    }

    private String voiceLabel() {
        String voice = HtcSettings.string(HtcSettings.TTS_VOICE);
        if (voice.isEmpty()) return "Tự động (giọng tiếng Việt)";
        for (Voice v : voices) if (v.getName().equals(voice)) return describe(v);
        return voice;
    }

    private static String describe(Voice v) {
        StringBuilder s = new StringBuilder(v.getName());
        ArrayList<String> extra = new ArrayList<>();
        if (v.isNetworkConnectionRequired()) extra.add("cần mạng");
        if (v.getQuality() >= Voice.QUALITY_HIGH) extra.add("chất lượng cao");
        Set<String> features = v.getFeatures();
        if (features != null && features.contains(TextToSpeech.Engine.KEY_FEATURE_NOT_INSTALLED)) extra.add("chưa tải");
        if (!extra.isEmpty()) s.append(" (").append(TextUtils.join(", ", extra)).append(")");
        return s.toString();
    }

    private void pickEngine() {
        if (engines.isEmpty()) loadEnginesAndVoices();
        final List<String> values = new ArrayList<>();
        List<String> labels = new ArrayList<>();
        values.add("");
        labels.add("Mặc định của hệ thống");
        for (TextToSpeech.EngineInfo e : engines) {
            values.add(e.name);
            labels.add(e.label);
        }
        int selected = Math.max(0, values.indexOf(HtcSettings.string(HtcSettings.TTS_ENGINE)));
        new AlertDialog.Builder(this)
                .setTitle("Bộ đọc (TTS engine)")
                .setSingleChoiceItems(labels.toArray(new String[0]), selected, (dialog, which) -> {
                    dialog.dismiss();
                    String engine = values.get(which);
                    if (engine.equals(HtcSettings.string(HtcSettings.TTS_ENGINE))) return;
                    // The voices belong to the engine: back to automatic.
                    HtcSettings.put(HtcSettings.TTS_VOICE, "");
                    HtcSettings.put(HtcSettings.TTS_ENGINE, engine);
                    startProbe(engine);
                    render();
                })
                .setNegativeButton("Hủy", null)
                .show();
    }

    private void pickVoice() {
        if (!probeReady) {
            toast("Bộ đọc đang khởi động, thử lại sau giây lát");
            return;
        }
        loadEnginesAndVoices();
        final List<String> values = new ArrayList<>();
        List<String> labels = new ArrayList<>();
        values.add("");
        labels.add("Tự động (giọng tiếng Việt)");
        for (Voice v : voices) {
            values.add(v.getName());
            labels.add(describe(v));
        }
        if (voices.isEmpty()) toast("Bộ đọc này không có giọng tiếng Việt");
        int selected = Math.max(0, values.indexOf(HtcSettings.string(HtcSettings.TTS_VOICE)));
        new AlertDialog.Builder(this)
                .setTitle("Giọng đọc")
                .setSingleChoiceItems(labels.toArray(new String[0]), selected, (dialog, which) -> {
                    dialog.dismiss();
                    HtcSettings.put(HtcSettings.TTS_VOICE, values.get(which));
                    render();
                    preview();
                })
                .setNegativeButton("Hủy", null)
                .show();
    }

    private void preview() {
        if (probe == null || !probeReady) {
            toast("Bộ đọc đang khởi động, thử lại sau giây lát");
            return;
        }
        try {
            probe.stop();
            probe.setLanguage(Locale.forLanguageTag("vi-VN"));
            String wanted = HtcSettings.string(HtcSettings.TTS_VOICE);
            if (!wanted.isEmpty()) {
                for (Voice v : voices) {
                    if (v.getName().equals(wanted)) {
                        probe.setVoice(v);
                        break;
                    }
                }
            }
            probe.setSpeechRate(shownSpeed > 0 ? shownSpeed : HtcSettings.savedSpeed());
            probe.speak("Xin chào, đây là giọng đọc thử của Hội Truyện Chữ.", TextToSpeech.QUEUE_FLUSH, null, "htc-preview");
        } catch (Throwable t) {
            toast("Không đọc thử được: " + t.getMessage());
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Sleep timer, speed

    private void pickSleep() {
        final String[] options = SleepTimer.OPTIONS;
        String[] labels = new String[options.length];
        int selected = 0;
        for (int i = 0; i < options.length; i++) {
            labels[i] = i == 0 ? "Tắt" : options[i].startsWith("m") ? "Sau " + SleepTimer.label(options[i]) : SleepTimer.label(options[i]);
            if (options[i].equals(SleepTimer.option())) selected = i;
        }
        new AlertDialog.Builder(this)
                .setTitle("Hẹn giờ tắt")
                .setSingleChoiceItems(labels, selected, (dialog, which) -> {
                    dialog.dismiss();
                    SleepTimer.set(options[which]);
                    toast(which == 0 ? "Đã tắt hẹn giờ" : "Hẹn giờ tắt: " + SleepTimer.label(options[which])
                            + " (dừng ở cuối dòng đang đọc)");
                    render();
                })
                .setNegativeButton("Hủy", null)
                .show();
    }

    private void pickSpeed() {
        float current = shownSpeed > 0 ? shownSpeed : HtcSettings.savedSpeed();
        final int steps = 50; // 0.50x .. 3.00x by 0.05
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(24), dp(16), dp(24), dp(4));
        final TextView label = new TextView(this);
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 28);
        label.setGravity(Gravity.CENTER);
        label.setTextColor(colorText);
        final SeekBar bar = new SeekBar(this);
        bar.setMax(steps);
        int progress = Math.round((Math.max(0.5f, Math.min(3f, current)) - 0.5f) / 0.05f);
        bar.setProgress(progress);
        label.setText(String.format(Locale.US, "%.2fx", 0.5f + progress * 0.05f));
        bar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int p, boolean fromUser) {
                label.setText(String.format(Locale.US, "%.2fx", 0.5f + p * 0.05f));
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
        box.addView(label);
        box.addView(bar);
        new AlertDialog.Builder(this)
                .setTitle("Tốc độ đọc")
                .setView(box)
                .setPositiveButton("Đặt", (d, w) -> {
                    float speed = Math.round((0.5f + bar.getProgress() * 0.05f) * 100f) / 100f;
                    if (HtcSettings.sendSpeed(speed)) {
                        shownSpeed = speed;
                        toast(String.format(Locale.US, "Tốc độ đọc: %.2fx", speed));
                    } else {
                        toast("Mở app (thanh đọc) rồi thử lại");
                    }
                    render();
                })
                .setNeutralButton("1.00x", (d, w) -> {
                    if (HtcSettings.sendSpeed(1f)) shownSpeed = 1f;
                    render();
                })
                .setNegativeButton("Hủy", null)
                .show();
    }

    // ---------------------------------------------------------------------------------------------
    // General

    private void startForResult(Intent intent, int request) {
        try {
            startActivityForResult(intent, request);
        } catch (Throwable t) {
            toast("Máy không có trình chọn file");
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode != RESULT_OK || data == null || data.getData() == null) return;
        Uri uri = data.getData();
        try {
            if (requestCode == REQUEST_EXPORT) {
                JSONObject json = HtcSettings.toJson();
                json.put("htcSettingsVersion", 1);
                json.put("patchesVersion", HtcPatches.version());
                try (OutputStream out = getContentResolver().openOutputStream(uri, "wt")) {
                    if (out == null) throw new Exception("no output");
                    out.write(json.toString(2).getBytes(StandardCharsets.UTF_8));
                }
                toast("Đã xuất cài đặt");
            } else if (requestCode == REQUEST_IMPORT) {
                ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                try (InputStream in = getContentResolver().openInputStream(uri)) {
                    if (in == null) throw new Exception("no input");
                    byte[] buffer = new byte[8192];
                    int n;
                    while ((n = in.read(buffer)) > 0 && bytes.size() < 1 << 20) bytes.write(buffer, 0, n);
                }
                int count = HtcSettings.fromJson(new JSONObject(new String(bytes.toByteArray(), StandardCharsets.UTF_8)));
                restartNeeded = true;
                startProbe(HtcSettings.string(HtcSettings.TTS_ENGINE));
                toast(count > 0 ? "Đã nhập " + count + " cài đặt" : "File không có cài đặt nào");
                render();
            }
        } catch (Throwable t) {
            Log.w(TAG, "export / import failed", t);
            toast("Lỗi: " + t.getMessage());
        }
    }

    private void shareLog() {
        toast("Đang lấy log...");
        new Thread(() -> {
            String text;
            try {
                Process process = Runtime.getRuntime().exec(new String[]{"logcat", "-d", "-v", "time"});
                ArrayDeque<String> lines = new ArrayDeque<>();
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream(), StandardCharsets.UTF_8))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        if (!line.contains("HTC-")) continue;
                        lines.add(line);
                        if (lines.size() > 3000) lines.removeFirst();
                    }
                }
                StringBuilder s = new StringBuilder();
                s.append("HoiTruyenChu Patches ").append(HtcPatches.version())
                        .append(" · Android ").append(Build.VERSION.RELEASE)
                        .append(" · ").append(Build.MANUFACTURER).append(' ').append(Build.MODEL).append('\n')
                        .append("Settings: ").append(HtcSettings.toJson()).append("\n\n");
                for (String line : lines) s.append(line).append('\n');
                text = s.length() > 400_000 ? s.substring(s.length() - 400_000) : s.toString();
            } catch (Throwable t) {
                text = null;
            }
            final String log = text;
            main.post(() -> {
                if (log == null) {
                    toast("Không đọc được log");
                    return;
                }
                Intent send = new Intent(Intent.ACTION_SEND);
                send.setType("text/plain");
                send.putExtra(Intent.EXTRA_SUBJECT, "Log HoiTruyenChu");
                send.putExtra(Intent.EXTRA_TEXT, log);
                try {
                    startActivity(Intent.createChooser(send, "Chia sẻ log"));
                } catch (Throwable t) {
                    toast("Không chia sẻ được: " + t.getMessage());
                }
            });
        }, "HTC-Log").start();
    }

    private void checkUpdate() {
        toast("Đang kiểm tra...");
        new Thread(() -> {
            String tag = null, page = null, error = null;
            HttpURLConnection connection = null;
            try {
                connection = (HttpURLConnection) new URL("https://api.github.com/repos/" + REPO + "/releases/latest").openConnection();
                connection.setConnectTimeout(10_000);
                connection.setReadTimeout(10_000);
                connection.setRequestProperty("Accept", "application/vnd.github+json");
                connection.setRequestProperty("User-Agent", "HoiTruyenChu-patches-settings");
                int code = connection.getResponseCode();
                if (code != 200) throw new Exception("HTTP " + code);
                ByteArrayOutputStream bytes = new ByteArrayOutputStream();
                try (InputStream in = connection.getInputStream()) {
                    byte[] buffer = new byte[8192];
                    int n;
                    while ((n = in.read(buffer)) > 0) bytes.write(buffer, 0, n);
                }
                JSONObject json = new JSONObject(new String(bytes.toByteArray(), StandardCharsets.UTF_8));
                tag = json.optString("tag_name", "");
                page = json.optString("html_url", "https://github.com/" + REPO + "/releases");
            } catch (Throwable t) {
                error = t.getMessage();
            } finally {
                if (connection != null) connection.disconnect();
            }
            final String latest = tag, url = page, failure = error;
            main.post(() -> {
                if (isFinishing()) return;
                if (latest == null || latest.isEmpty()) {
                    toast("Không kiểm tra được" + (failure != null ? ": " + failure : ""));
                    return;
                }
                String mine = HtcPatches.version();
                String latestVersion = latest.startsWith("v") ? latest.substring(1) : latest;
                boolean newer = compareVersions(latestVersion, mine) > 0;
                AlertDialog.Builder dialog = new AlertDialog.Builder(this)
                        .setTitle(newer ? "Đã có bản mới" : "Đang dùng bản mới nhất")
                        .setMessage("Bản mới nhất: " + latestVersion + "\nBản đang dùng: "
                                + (TextUtils.isEmpty(mine) ? "?" : mine));
                if (newer) dialog.setPositiveButton("Mở trang tải", (d, w) -> open(url)).setNegativeButton("Để sau", null);
                else dialog.setPositiveButton("OK", null);
                dialog.show();
            });
        }, "HTC-Update").start();
    }

    /** Compares "2.1.0" style versions. */
    static int compareVersions(String a, String b) {
        String[] x = (a == null ? "" : a).split("[.\\-]");
        String[] y = (b == null ? "" : b).split("[.\\-]");
        for (int i = 0; i < Math.max(x.length, y.length); i++) {
            int p = i < x.length ? parseInt(x[i]) : 0;
            int q = i < y.length ? parseInt(y[i]) : 0;
            if (p != q) return Integer.compare(p, q);
        }
        return 0;
    }

    private static int parseInt(String s) {
        try {
            return Integer.parseInt(s.replaceAll("\\D.*$", ""));
        } catch (Throwable t) {
            return 0;
        }
    }

    private void restartApp() {
        try {
            Intent launch = getPackageManager().getLaunchIntentForPackage(getPackageName());
            ComponentName component = launch != null ? launch.getComponent() : null;
            if (component == null) throw new Exception("no launcher activity");
            startActivity(Intent.makeRestartActivityTask(component));
            Runtime.getRuntime().exit(0);
        } catch (Throwable t) {
            toast("Hãy tự đóng và mở lại app");
        }
    }

    // ---------------------------------------------------------------------------------------------
    // Helpers

    private void open(String url) {
        try {
            startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(url)));
        } catch (Throwable t) {
            toast("Không mở được " + url);
        }
    }

    private void confirm(String title, String message, Runnable onYes) {
        new AlertDialog.Builder(this)
                .setTitle(title)
                .setMessage(message)
                .setPositiveButton("Đồng ý", (d, w) -> onYes.run())
                .setNegativeButton("Hủy", null)
                .show();
    }

    private void toast(String text) {
        Toast.makeText(this, text, Toast.LENGTH_SHORT).show();
    }

    private static String size(long bytes) {
        if (bytes < 1024) return bytes + " B";
        if (bytes < 1024 * 1024) return String.format(Locale.US, "%.0f KB", bytes / 1024.0);
        return String.format(Locale.US, "%.1f MB", bytes / (1024.0 * 1024.0));
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
