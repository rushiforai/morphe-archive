package e.e.a;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.PorterDuff;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.SystemClock;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceActivity;
import android.preference.PreferenceGroup;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.util.Log;
import android.util.LruCache;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.SeekBar;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import android.view.inputmethod.EditorInfo;
import java.io.ByteArrayOutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.UUID;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONArray;
import org.json.JSONObject;

/** Short feeds reuse nicoid's existing player, comments and playback policies. */
public final class ModernShorts {
    private static final String PATCH_VERSION = "v1.8.1 @chikuwadon";
    private static final String PLAYER = "com.sauzask.nicoid.NicoidVideoActivity";
    private static final String MODE = "nicoid_re_shorts";
    private static final String SESSION = "nicoid_re_shorts_session";
    private static final Handler MAIN = new Handler(android.os.Looper.getMainLooper());
    private static final java.util.concurrent.ThreadPoolExecutor REQUESTS = new java.util.concurrent.ThreadPoolExecutor(
        2, 2, 30, java.util.concurrent.TimeUnit.SECONDS, new java.util.concurrent.LinkedBlockingQueue<Runnable>());
    private static final LinkedHashMap<String, Feed> FEEDS = new LinkedHashMap<>();
    private static final WeakHashMap<Activity, State> STATES = new WeakHashMap<>();
    private static final WeakHashMap<Activity, Boolean> MENU_STATE = new WeakHashMap<>();
    private static final WeakHashMap<View, Long> REFRESH_WATCH = new WeakHashMap<>();
    private static final WeakHashMap<Activity, Integer> REFRESH_MONITORS = new WeakHashMap<>();
    private static boolean registered;
    private static final class Item {
        final String id, title, thumbnail, channel;
        final boolean paid;
        Item(String id, String title) { this(id, title, ""); }
        Item(String id, String title, String thumbnail) {
            this(id, title, thumbnail, "");
        }
        Item(String id, String title, String thumbnail, String channel) {
            this.id = id; this.title = title; this.thumbnail = thumbnail == null ? "" : thumbnail;
            this.channel = channel; this.paid = PaidVideos.required(id);
        }
    }
    private static final class Feed {
        final String key = UUID.randomUUID().toString();
        final ArrayList<Item> items = new ArrayList<>();
    }
    private static final class State {
        Feed feed;
        NetworkTask request;
        Runnable resumeRequest, redraw;
        int index;
        boolean home;
        boolean busy, dead, dragging, blocked, launching, cancelling, controlsTapped;
        float x, y;
        long downTime;
        TextView number;
        ProgressBar progress;
        View video, bar;
        ViewTreeObserver.OnPreDrawListener controlsListener;
        ViewTreeObserver.OnGlobalLayoutListener listener;
    }
    private ModernShorts() {}
    private static SharedPreferences prefs(Context c) { return PreferenceManager.getDefaultSharedPreferences(c); }
    private static int dp(Context c, int n) { return Math.round(c.getResources().getDisplayMetrics().density * n); }
    private static int color(Context c, int attr, int fallback) {
        TypedValue v = new TypedValue();
        if (!c.getTheme().resolveAttribute(attr, v, true)) return fallback;
        if (v.resourceId != 0) try { return c.getResources().getColorStateList(v.resourceId).getDefaultColor(); }
        catch (Exception ignored) { }
        return v.data;
    }
    private static void tint(Context c, ProgressBar p) {
        p.getIndeterminateDrawable().mutate().setColorFilter(color(c, 0x7f03005e, 0xff52cca3), PorterDuff.Mode.SRC_IN);
    }
    private static Button button(Context c, String text) {
        Button b = new Button(c); b.setText(text); b.setTextColor(color(c, 0x7f03005e, 0xff52cca3));
        b.setMinWidth(0); b.setMinimumWidth(0); b.setTextSize(14); b.setAllCaps(false);
        b.setTypeface(android.graphics.Typeface.create("sans-serif-medium", android.graphics.Typeface.NORMAL));
        b.setPadding(dp(c, 16), 0, dp(c, 16), 0);
        GradientDrawable bg = new GradientDrawable(); bg.setColor(color(c, android.R.attr.colorBackground, 0xff1b1d22));
        bg.setCornerRadius(dp(c, 24)); b.setBackground(new android.graphics.drawable.RippleDrawable(
            android.content.res.ColorStateList.valueOf((color(c, 0x7f03005e, 0xff52cca3) & 0x00ffffff) | 0x33000000), bg, null)); return b;
    }
    private static ImageButton icon(Context c, String kind, String label) {
        ImageButton b = new ImageButton(c); b.setContentDescription(label); b.setPadding(dp(c, 12), dp(c, 12), dp(c, 12), dp(c, 12));
        final int ink = color(c, 0x7f03005e, 0xff52cca3);
        b.setImageDrawable(new android.graphics.drawable.Drawable() {
            private final android.graphics.Paint paint = new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
            public void draw(android.graphics.Canvas canvas) {
                android.graphics.Rect bounds = getBounds(); canvas.save(); canvas.translate(bounds.left, bounds.top);
                canvas.scale(bounds.width() / 24f, bounds.height() / 24f); paint.setColor(ink);
                paint.setStrokeWidth(2f); paint.setStyle(android.graphics.Paint.Style.STROKE); paint.setStrokeCap(android.graphics.Paint.Cap.ROUND);
                android.graphics.Path path = new android.graphics.Path();
                if ("prev".equals(kind)) { path.moveTo(15, 5); path.lineTo(8, 12); path.lineTo(15, 19); }
                else if ("next".equals(kind)) { path.moveTo(9, 5); path.lineTo(16, 12); path.lineTo(9, 19); }
                else if ("home".equals(kind)) { path.moveTo(3, 11); path.lineTo(12, 3); path.lineTo(21, 11); path.moveTo(6, 9); path.lineTo(6, 21); path.lineTo(10, 21); path.lineTo(10, 15); path.lineTo(14, 15); path.lineTo(14, 21); path.lineTo(18, 21); path.lineTo(18, 9); }
                else if ("niconico".equals(kind)) {
                    canvas.drawRoundRect(3, 7, 21, 20, 2, 2, paint);
                    path.moveTo(8, 3); path.lineTo(12, 7); path.lineTo(16, 3);
                    path.moveTo(7, 12); path.lineTo(7, 14); path.moveTo(17, 12); path.lineTo(17, 14);
                    path.moveTo(9, 16); path.lineTo(12, 18); path.lineTo(15, 16);
                    path.moveTo(6, 20); path.lineTo(6, 22); path.moveTo(18, 20); path.lineTo(18, 22);
                }
                else if ("info".equals(kind)) { canvas.drawCircle(12, 12, 9, paint); path.moveTo(12, 11); path.lineTo(12, 17); canvas.drawCircle(12, 7, .6f, paint); }
                else { canvas.drawArc(4, 4, 20, 20, 45, 290, false, paint); path.moveTo(20, 3); path.lineTo(20, 9); path.lineTo(14, 9); }
                canvas.drawPath(path, paint); canvas.restore();
            }
            public void setAlpha(int alpha) { paint.setAlpha(alpha); }
            public void setColorFilter(android.graphics.ColorFilter filter) { paint.setColorFilter(filter); }
            public int getOpacity() { return android.graphics.PixelFormat.TRANSLUCENT; }
            public int getIntrinsicWidth() { return dp(c, 24); }
            public int getIntrinsicHeight() { return dp(c, 24); }
        });
        b.setBackground(new android.graphics.drawable.RippleDrawable(android.content.res.ColorStateList.valueOf((ink & 0xffffff) | 0x33000000), null, null));
        return b;
    }
    private static Intent player(Context c, String id) {
        return new Intent(Intent.ACTION_VIEW, Uri.parse("https://www.nicovideo.jp/watch/" + id))
            .setClassName(c.getPackageName(), PLAYER).putExtra("intentselect", true);
    }
    public static void addMenu(Context c, ArrayList<?> rows) {
        UiStrings.selectLanguage(prefs(c).getString("app_lang", "0"));
        register(c);
        removeMovedMenuRows(rows);
        if (c instanceof Activity) MENU_STATE.put((Activity)c, prefs(c).getBoolean("show_shorts_menu", true));
        if (!prefs(c).getBoolean("show_shorts_menu", true)) return;
        Intent i = player(c, "ss0").setData(Uri.parse("nicoid-re://shorts"));
        addMenuRow(rows, false, "ショート", "ショート動画の視聴", i, 0);
    }
    /** Runs after all original menu rows have been added, before adapter binding. */
    public static void finishMenu(Context c, ArrayList<?> rows) {
        UiStrings.selectLanguage(prefs(c).getString("app_lang", "0"));
        for (Iterator<?> it = rows.iterator(); it.hasNext();) {
            Object row = it.next();
            if (hasTitle(row, "アプリを再起動") || hasTitle(row, "デバッグログを共有") || hasTitle(row, "その他")) it.remove();
        }
        ArrayList<Object> extra = new ArrayList<>();
        addMenuRow(extra, true, "その他", "", null, 0);
        addMenuRow(extra, false, "アプリを再起動", "設定を反映して最初から開く", null, 4);
        int at = rows.size();
        for (int n = 0; n < rows.size(); n++) if (hasTitle(rows.get(n), "アプリ設定")) { at = n + 1; break; }
        @SuppressWarnings("unchecked") ArrayList<Object> mutable = (ArrayList<Object>)(ArrayList<?>)rows;
        mutable.addAll(at, extra);
    }
    private static boolean hasTitle(Object row, String title) {
        if (row instanceof java.util.Map) return title.equals(((java.util.Map<?, ?>)row).get("title"));
        for (Class<?> type = row.getClass(); type != null; type = type.getSuperclass()) {
            for (java.lang.reflect.Field f : type.getDeclaredFields()) if (f.getType() == String.class) try {
                f.setAccessible(true); if (title.equals(f.get(row))) return true;
            } catch (Exception ignored) { }
        }
        return false;
    }
    private static void addMenuRow(ArrayList<?> rows, boolean category, String title, String summary,
                                   Intent intent, int action) {
        try {
            Class.forName("com.sauzask.nicoid.NicoidTopActivity").getMethod("a", ArrayList.class, boolean.class,
                String.class, String.class, Intent.class, int.class).invoke(null, rows, category, title, summary, intent, action);
        } catch (Exception e) { log(e); }
    }
    public static void settings(PreferenceActivity a) {
        UiStrings.selectLanguage(prefs(a).getString("app_lang", "0"));
        PreferenceScreen screen = a.getPreferenceScreen(); if (screen == null) return;
        PreferenceGroup group = (PreferenceGroup)a.findPreference("player"); if (group == null) group = screen;
        if (a.findPreference("show_shorts_menu") == null) {
            CheckBoxPreference p = new CheckBoxPreference(a); p.setKey("show_shorts_menu");
            p.setTitle("サイドバーにショートを表示"); p.setSummary("ランキングの下にショート動画の入口を表示します");
            p.setDefaultValue(true); group.addPreference(p);
        }
        Preference version = a.findPreference("nicoid_patch_version");
        if (version != null) {
            version.setSummary(PATCH_VERSION);
            // The bundled XML marks this informational row non-selectable.
            // Enable selection before registering its hidden tap action.
            version.setEnabled(true);
            version.setSelectable(true);
            final int[] taps = {0}; final long[] lastTap = {0};
            version.setOnPreferenceClickListener(p -> {
                long now = SystemClock.uptimeMillis();
                if (now - lastTap[0] > 5000) taps[0] = 0;
                lastTap[0] = now;
                if (++taps[0] == 8) { taps[0] = 0; BikeRun.open(a); }
                return true;
            });
        }
        if (a.findPreference("nicoid_share_debug") == null) {
            PreferenceCategory debug = new PreferenceCategory(a); debug.setKey("nicoid_debug_category"); debug.setTitle("デバッグ");
            int after = screen.getPreferenceCount();
            for (int n = 0; n < screen.getPreferenceCount(); n++) {
                Preference section = screen.getPreference(n);
                if (containsPreferenceKey(section, "app_lang") || containsPreferenceKey(section, "player_lang")) {
                    after = n + 1;
                    break;
                }
            }
            // Assign explicit root order so the section follows the entire language group.
            ArrayList<Preference> sections = new ArrayList<>();
            for (int n = 0; n < screen.getPreferenceCount(); n++) sections.add(screen.getPreference(n));
            for (int n = 0; n < sections.size(); n++) sections.get(n).setOrder(n < after ? n * 2 : n * 2 + 2);
            debug.setOrder(after * 2 - 1); screen.addPreference(debug);
            Preference share = new Preference(a); share.setKey("nicoid_share_debug"); share.setTitle("デバッグログの保存");
            share.setSummary("再生状況や通信エラーなどの診断ログを Download フォルダに保存します。不具合報告時に利用できます。");
            share.setOnPreferenceClickListener(v -> {
                try { Class.forName("e.e.a.ModernDebug").getMethod("share", Context.class).invoke(null, a); }
                catch (Exception e) { log(e); }
                return true;
            }); debug.addPreference(share);
        }
        UiText.preferences(screen);
    }
    private static boolean containsPreferenceKey(Preference preference, String key) {
        if (key.equals(preference.getKey())) return true;
        if (preference instanceof PreferenceGroup) {
            PreferenceGroup group = (PreferenceGroup) preference;
            for (int i = 0; i < group.getPreferenceCount(); i++)
                if (containsPreferenceKey(group.getPreference(i), key)) return true;
        }
        return false;
    }
    private static void removeMovedMenuRows(ArrayList<?> rows) {
        for (Iterator<?> it = rows.iterator(); it.hasNext();) {
            Object row = it.next();
            if (hasTitle(row, "アプリを再起動") || hasTitle(row, "デバッグログを共有") || hasTitle(row, "その他") || hasTitle(row, "ショート")) it.remove();
        }
    }
    /** Called after Activity.super.onCreate, before nicoid parses a watch URL. */
    public static boolean bootstrap(Activity a) {
        Uri u = a.getIntent().getData();
        if (u == null || !"nicoid-re".equals(u.getScheme()) || !"shorts".equals(u.getHost())) return false;
        register(a);
        State s = new State(); s.feed = new Feed(); s.home = true; STATES.put(a, s);
        a.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
        Home home = buildHome(a); a.setContentView(home.root); s.progress = home.progress;
        s.redraw = () -> { if (!s.feed.items.isEmpty()) renderHome(a, s, home); };
        home.retry.setOnClickListener(v -> retryHome(a, s, home));
        home.refresh.setOnClickListener(v -> {
            if (home.query.getText().toString().trim().isEmpty()) loadFeed(a, s, home, false);
            else search(a, s, home);
        });
        home.search.setOnClickListener(v -> search(a, s, home));
        home.query.setOnEditorActionListener((v, action, event) -> {
            if (action == EditorInfo.IME_ACTION_SEARCH || action == EditorInfo.IME_ACTION_GO) {
                search(a, s, home); return true;
            }
            return false;
        });
        loadFeed(a, s, home, true);
        return true;
    }
    private static final class Home {
        LinearLayout root, rows;
        TextView message;
        EditText query;
        ProgressBar progress;
        Button retry, search; ImageButton refresh;
    }
    private static Home buildHome(Activity a) {
        Home h = new Home(); h.root = new LinearLayout(a); h.root.setOrientation(LinearLayout.VERTICAL);
        h.root.setPadding(dp(a, 20), dp(a, 18), dp(a, 20), dp(a, 12));
        h.root.setBackgroundColor(color(a, android.R.attr.colorBackground, 0xff101116));
        LinearLayout header = new LinearLayout(a); header.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout titles = new LinearLayout(a); titles.setOrientation(LinearLayout.VERTICAL);
        TextView title = new TextView(a); title.setText("ショート"); title.setTextSize(28);
        title.setTypeface(android.graphics.Typeface.DEFAULT, android.graphics.Typeface.BOLD);
        title.setTextColor(color(a, android.R.attr.textColorPrimary, 0xffffffff));
        TextView subtitle = new TextView(a); subtitle.setText("気になる動画を選んで再生"); subtitle.setTextSize(14);
        subtitle.setTextColor(color(a, android.R.attr.textColorSecondary, 0xffb8bbc5));
        titles.addView(title); titles.addView(subtitle); header.addView(titles, new LinearLayout.LayoutParams(0, -2, 1));
        h.root.addView(header);
        LinearLayout searchRow = new LinearLayout(a); searchRow.setGravity(Gravity.CENTER_VERTICAL);
        searchRow.setPadding(0, dp(a, 12), 0, dp(a, 8));
        h.query = new EditText(a); h.query.setSingleLine(true); h.query.setTextSize(16);
        h.query.setHint("ショート動画を検索"); h.query.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
        LinearLayout.LayoutParams queryLp = new LinearLayout.LayoutParams(0, dp(a, 52), 1);
        queryLp.rightMargin = dp(a, 8); searchRow.addView(h.query, queryLp);
        h.search = button(a, "検索"); searchRow.addView(h.search, new LinearLayout.LayoutParams(-2, dp(a, 48)));
        h.root.addView(searchRow);
        h.message = new TextView(a); h.message.setText("ショート動画を読み込んでいます…");
        h.message.setTextSize(14); h.message.setTextColor(color(a, android.R.attr.textColorSecondary, 0xffb8bbc5));
        h.message.setPadding(0, dp(a, 16), 0, dp(a, 8)); h.root.addView(h.message);
        h.progress = new ProgressBar(a); tint(a, h.progress); h.progress.setVisibility(View.GONE);
        LinearLayout progressRow = new LinearLayout(a); progressRow.setGravity(Gravity.CENTER_VERTICAL);
        progressRow.addView(h.progress, new LinearLayout.LayoutParams(dp(a, 22), dp(a, 22)));
        h.root.addView(progressRow, new LinearLayout.LayoutParams(-1, dp(a, 28)));
        HorizontalScrollView scroll = new HorizontalScrollView(a); scroll.setHorizontalScrollBarEnabled(false);
        scroll.setClipToPadding(false); h.rows = new LinearLayout(a); h.rows.setOrientation(LinearLayout.HORIZONTAL);
        scroll.addView(h.rows); h.root.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1));
        h.retry = button(a, "再試行"); h.retry.setVisibility(View.GONE); h.root.addView(h.retry);
        FrameLayout footer = new FrameLayout(a);
        ImageButton back = icon(a, "niconico", "ニコニコ動画のホームに戻る");
        back.setOnClickListener(v -> a.finish());
        if (android.os.Build.VERSION.SDK_INT >= 26) back.setTooltipText("ニコニコ動画に戻る");
        footer.addView(back, new FrameLayout.LayoutParams(dp(a, 56), dp(a, 56), Gravity.CENTER));
        h.refresh = icon(a, "refresh", "ショート一覧を更新");
        footer.addView(h.refresh, new FrameLayout.LayoutParams(dp(a, 56), dp(a, 56), Gravity.END | Gravity.CENTER_VERTICAL));
        h.root.addView(footer, new LinearLayout.LayoutParams(-1, dp(a, 56)));
        return h;
    }
    private static void retryHome(Activity a, State s, Home h) {
        if (h.query.getText().toString().trim().isEmpty()) loadFeed(a, s, h, false);
        else search(a, s, h);
    }
    private static void loadFeed(Activity a, State s, Home h, boolean startPlayback) {
        if (s.busy || s.dead) return;
        s.busy = true; h.progress.setVisibility(View.VISIBLE); h.retry.setVisibility(View.GONE);
        h.message.setText("ショート動画を読み込んでいます…");
        s.resumeRequest = () -> loadFeed(a, s, h, startPlayback);
        request(s, null, (items, error) -> {
            s.busy = false;
            if (s.dead || a.isFinishing()) return;
            h.progress.setVisibility(View.GONE);
            if (error != null || items.isEmpty()) {
                h.message.setText("ショート動画を取得できませんでした。通信状態を確認して再試行してください。");
                h.retry.setVisibility(View.VISIBLE); return;
            }
            s.feed = new Feed(); append(a, s.feed, items); remember(s.feed); renderHome(a, s, h);
            if (startPlayback && !s.feed.items.isEmpty()) launch(a, s, 0);
        });
    }
    private static void renderHome(Activity a, State s, Home h) {
        h.rows.removeAllViews(); h.message.setText(s.feed.items.size() + " 本の動画");
        for (int i = 0; i < s.feed.items.size(); i++) {
            final int index = i; Item item = s.feed.items.get(i);
            FrameLayout card = new FrameLayout(a);
            GradientDrawable bg = new GradientDrawable(); bg.setColor(color(a, android.R.attr.colorBackground, 0xff1b1d22));
            bg.setCornerRadius(dp(a, 20)); card.setBackground(bg); card.setClipToOutline(true); card.setClickable(true); card.setFocusable(true);
            ImageView image = new ImageView(a); image.setScaleType(ImageView.ScaleType.CENTER_CROP);
            card.addView(image, new FrameLayout.LayoutParams(-1, -1));
            TextView placeholder = new TextView(a); placeholder.setText("▶"); placeholder.setTextSize(36);
            placeholder.setGravity(Gravity.CENTER); placeholder.setTextColor(color(a, 0x7f03005e, 0xff52cca3));
            card.addView(placeholder, new FrameLayout.LayoutParams(-1, -1));
            LinearLayout overlay = new LinearLayout(a); overlay.setOrientation(LinearLayout.VERTICAL); overlay.setGravity(Gravity.BOTTOM);
            overlay.setPadding(dp(a, 12), dp(a, 24), dp(a, 12), dp(a, 12));
            GradientDrawable shade = new GradientDrawable(GradientDrawable.Orientation.BOTTOM_TOP,
                new int[]{0xee000000, 0x99000000, 0x00000000}); overlay.setBackground(shade);
            TextView itemTitle = new TextView(a); itemTitle.setText(item.title); itemTitle.setTextSize(16);
            itemTitle.setMaxLines(3); itemTitle.setEllipsize(android.text.TextUtils.TruncateAt.END);
            itemTitle.setTextColor(0xffffffff);
            TextView metadata = new TextView(a); metadata.setText("ニコニコ動画  •  " + item.id); metadata.setTextSize(11);
            metadata.setTextColor(color(a, android.R.attr.textColorSecondary, 0xffb8bbc5));
            LinearLayout.LayoutParams metaLp = new LinearLayout.LayoutParams(-1, -2); metaLp.topMargin = dp(a, 5);
            overlay.addView(itemTitle); overlay.addView(metadata, metaLp);
            card.addView(overlay, new FrameLayout.LayoutParams(-1, dp(a, 145), Gravity.BOTTOM));
            PaidVideos.show(card, item.paid);
            card.setOnClickListener(v -> launch(a, s, index));
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(a, 218), dp(a, 370));
            lp.rightMargin = dp(a, 12); h.rows.addView(card, lp);
            loadThumbnail(item.thumbnail, image, placeholder);
        }
    }
    private static void loadThumbnail(String url, ImageView target, TextView placeholder) {
        ShortImages.load(url, target, placeholder);
    }
    private static void search(Activity a, State s, Home h) {
        String query = h.query.getText().toString().trim();
        if (query.isEmpty() || s.dead) return;
        cancelRequest(s);
        s.busy = true; h.progress.setVisibility(View.VISIBLE); h.retry.setVisibility(View.GONE);
        h.message.setText("ショート動画を検索しています…"); h.rows.removeAllViews();
        s.resumeRequest = () -> search(a, s, h);
        requestSearch(s, query, (items, error) -> {
            if (s.dead || a.isFinishing()) return;
            s.busy = false; h.progress.setVisibility(View.GONE);
            if (error != null || items.isEmpty()) {
                h.message.setText(error != null ? "検索結果を取得できませんでした。通信状態を確認して再試行してください。" : "ショート動画が見つかりませんでした。キーワードを変えてお試しください。");
                if (error != null) h.retry.setVisibility(View.VISIBLE);
                return;
            }
            s.feed = new Feed(); append(a, s.feed, items); remember(s.feed); renderHome(a, s, h);
        });
    }
    /** Called after the original video fragment transaction has been committed. */
    public static void attach(Activity a) {
        Uri uri = a.getIntent().getData(); String id = uri == null ? null : uri.getLastPathSegment();
        if (!a.getIntent().getBooleanExtra(MODE, false) && (uri == null || !uri.getPath().startsWith("/shorts/"))) return;
        if (!ShortsRules.videoId(id)) return;
        register(a); a.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
        State s = new State(); s.index = a.getIntent().getIntExtra("nicoid_re_shorts_index", 0);
        s.feed = FEEDS.get(a.getIntent().getStringExtra(SESSION));
        if (s.feed == null) { s.feed = new Feed(); s.feed.items.add(new Item(id, "現在のショート")); s.index = 0; remember(s.feed); }
        if (s.index < 0 || s.index >= s.feed.items.size()) s.index = 0;
        STATES.put(a, s); final String current = id;
        install(a, s, 0);
        if (s.feed.items.size() == 1) extend(a, s, current, false);
    }
    private static void install(Activity a, State s, int attempt) {
        if (s.dead || a.isFinishing()) return;
        View video = find(a, "videoLayout");
        if (video == null) { if (attempt < 40) MAIN.postDelayed(() -> install(a, s, attempt + 1), 50); return; }
        s.video = video;
        ViewGroup.LayoutParams videoLayoutParams = video.getLayoutParams();
        if (videoLayoutParams != null) {
            videoLayoutParams.width = ViewGroup.LayoutParams.MATCH_PARENT;
            videoLayoutParams.height = ViewGroup.LayoutParams.MATCH_PARENT;
            video.setLayoutParams(videoLayoutParams);
        }
        View videoView = find(a, "video_view");
        fillVideo(a);
        if (videoView != null) try {
            videoView.getClass().getMethod("setMeasureBasedOnAspectRatioEnabled", boolean.class).invoke(videoView, false);
            ViewGroup.LayoutParams params = videoView.getLayoutParams();
            if (params != null) {
                params.width = ViewGroup.LayoutParams.MATCH_PARENT;
                params.height = ViewGroup.LayoutParams.MATCH_PARENT;
                videoView.setLayoutParams(params);
            }
        } catch (Exception e) { log(e); }
        if (videoView != null) try {
            Class<?> scaleType = Class.forName("com.devbrackets.android.exomedia.core.video.scale.ScaleType");
            @SuppressWarnings("unchecked") Object centerCrop = Enum.valueOf((Class<? extends Enum>)scaleType, "CENTER_CROP");
            videoView.getClass().getMethod("setScaleType", scaleType).invoke(videoView, centerCrop);
        } catch (Exception e) { log(e); }
        View info = find(a, "info"); if (info != null) info.setVisibility(View.GONE);
        for (String id : new String[]{"prevbutton", "nextbutton", "fullscbutton"}) { View v = find(a, id); if (v != null) v.setVisibility(View.GONE); }
        FrameLayout content = (FrameLayout)a.findViewById(android.R.id.content);
        LinearLayout bar = new LinearLayout(a); bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setPadding(dp(a, 10), dp(a, 6), dp(a, 10), dp(a, 6));
        GradientDrawable barBg = new GradientDrawable(); barBg.setColor(color(a, android.R.attr.colorBackground, 0xff1b1d22));
        barBg.setCornerRadius(dp(a, 22)); bar.setBackground(barBg);
        s.bar = bar;
        ImageButton prev = icon(a, "prev", "前のショート"); prev.setOnClickListener(v -> step(a, s, -1));
        bar.addView(prev, new LinearLayout.LayoutParams(0, -1, 1));
        FrameLayout numberCell = new FrameLayout(a);
        TextView number = new TextView(a); number.setGravity(Gravity.CENTER); number.setTextSize(14);
        number.setContentDescription("ショート動画一覧"); number.setTextColor(color(a, android.R.attr.textColorPrimary, 0xffffffff)); s.number = number;
        numberCell.addView(number, new FrameLayout.LayoutParams(-1, -1)); bar.addView(numberCell, new LinearLayout.LayoutParams(0, -1, 1));
        ProgressBar p = new ProgressBar(a); tint(a, p); s.progress = p; p.setVisibility(s.busy ? View.VISIBLE : View.GONE);
        numberCell.addView(p, new FrameLayout.LayoutParams(dp(a, 18), dp(a, 18), Gravity.TOP | Gravity.END));
        ImageButton home = icon(a, "home", "ショートのホーム"); home.setOnClickListener(v -> a.finish());
        bar.addView(home, new LinearLayout.LayoutParams(0, -1, 1));
        ImageButton details = icon(a, "info", "動画情報"); details.setOnClickListener(v -> {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("https://www.nicovideo.jp/watch/" + s.feed.items.get(s.index).id));
            intent.setClassName(a.getPackageName(), "com.sauzask.nicoid.NicoidVideoInfoActivity"); a.startActivity(intent);
        }); bar.addView(details, new LinearLayout.LayoutParams(0, -1, 1));
        ImageButton next = icon(a, "next", "次のショート"); next.setOnClickListener(v -> step(a, s, 1));
        bar.addView(next, new LinearLayout.LayoutParams(0, -1, 1));
        number.setOnClickListener(v -> showList(a, s)); number.setClickable(true);
        bar.setVisibility(View.GONE);
        // Existing video taps and auto-hide control the seekbar; mirror that exact visibility.
        View status = find(a, "statuslay"); if (status != null) status.setVisibility(View.INVISIBLE);
        s.controlsListener = () -> {
            View controller = find(a, "controller");
            int visibility = s.controlsTapped && controller != null && controller.isShown() ? View.VISIBLE : View.GONE;
            if (bar.getVisibility() != visibility) bar.setVisibility(visibility);
            float alpha = controller == null ? 1f : controller.getAlpha();
            if (bar.getAlpha() != alpha) bar.setAlpha(alpha);
            Review181.shortControls(a, visibility, alpha);
            return true;
        };
        content.getViewTreeObserver().addOnPreDrawListener(s.controlsListener);
        FrameLayout.LayoutParams barLp = new FrameLayout.LayoutParams(-1, dp(a, 64), Gravity.BOTTOM);
        barLp.setMargins(dp(a, 12), 0, dp(a, 12), dp(a, 8)); content.addView(bar, barLp); update(s);
        s.listener = () -> {
            if (s.dead) return;
            fillVideo(a);
            liftController(a);
            ViewGroup.LayoutParams lp = video.getLayoutParams();
            if (lp != null && (lp.width != ViewGroup.LayoutParams.MATCH_PARENT || lp.height != ViewGroup.LayoutParams.MATCH_PARENT)) {
                lp.width = ViewGroup.LayoutParams.MATCH_PARENT; lp.height = ViewGroup.LayoutParams.MATCH_PARENT;
                video.setLayoutParams(lp);
            }
            if (info != null && info.getVisibility() != View.GONE) info.setVisibility(View.GONE);
            View loading = find(a, "videopro"); if (loading instanceof ProgressBar) tint(a, (ProgressBar)loading);
        };
        content.getViewTreeObserver().addOnGlobalLayoutListener(s.listener); s.listener.onGlobalLayout();
        Toast.makeText(a, "上にスワイプで次、下にスワイプで前の動画", Toast.LENGTH_SHORT).show();
    }
    private static View find(Activity a, String name) { return a.findViewById(a.getResources().getIdentifier(name, "id", a.getPackageName())); }
    private static void update(State s) { if (s.number != null) s.number.setText( (s.index + 1) + "/" + s.feed.items.size()); }
    private static void showList(Activity a, State s) {
        LinearLayout panel = new LinearLayout(a); panel.setOrientation(LinearLayout.VERTICAL);
        panel.setPadding(dp(a, 16), dp(a, 12), dp(a, 16), dp(a, 12));
        GradientDrawable panelBg = new GradientDrawable(); panelBg.setCornerRadius(dp(a, 24));
        panelBg.setColor(color(a, android.R.attr.colorBackground, 0xff1b1d22)); panel.setBackground(panelBg);
        TextView title = new TextView(a); title.setText("ショート動画"); title.setTextSize(22);
        title.setTextColor(color(a, android.R.attr.textColorPrimary, 0xffffffff)); panel.addView(title);
        ScrollView scroll = new ScrollView(a); LinearLayout rows = new LinearLayout(a); rows.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(rows); panel.addView(scroll, new LinearLayout.LayoutParams(-1, dp(a, 400)));
        AlertDialog dialog = new AlertDialog.Builder(a).setView(panel).create();
        for (int n = 0; n < s.feed.items.size(); n++) {
            final int index = n; Item item = s.feed.items.get(n);
            LinearLayout row = new LinearLayout(a); row.setGravity(Gravity.CENTER_VERTICAL); row.setPadding(dp(a, 8), dp(a, 8), dp(a, 8), dp(a, 8));
            GradientDrawable bg = new GradientDrawable(); bg.setCornerRadius(dp(a, 16));
            bg.setColor(color(a, android.R.attr.colorBackground, 0xff1b1d22));
            if (n == s.index) bg.setStroke(dp(a, 2), color(a, 0x7f03005e, 0xff52cca3));
            row.setBackground(bg);
            FrameLayout thumb = new FrameLayout(a); ImageView image = new ImageView(a); image.setScaleType(ImageView.ScaleType.CENTER_CROP);
            thumb.addView(image, new FrameLayout.LayoutParams(-1, -1)); TextView placeholder = new TextView(a);
            placeholder.setText("▶"); placeholder.setGravity(Gravity.CENTER); placeholder.setTextColor(color(a, 0x7f03005e, 0xff52cca3));
            thumb.addView(placeholder, new FrameLayout.LayoutParams(-1, -1)); row.addView(thumb, new LinearLayout.LayoutParams(dp(a, 70), dp(a, 100)));
            PaidVideos.show(thumb, item.paid);
            loadThumbnail(item.thumbnail, image, placeholder);
            TextView label = new TextView(a); label.setText((n + 1) + "  " + item.title); label.setTextSize(15); label.setMaxLines(3);
            label.setEllipsize(android.text.TextUtils.TruncateAt.END); label.setPadding(dp(a, 12), 0, 0, 0);
            label.setTextColor(color(a, android.R.attr.textColorPrimary, 0xffffffff)); row.addView(label, new LinearLayout.LayoutParams(0, -2, 1));
            row.setOnClickListener(v -> { dialog.dismiss(); if (index != s.index && !s.busy) launch(a, s, index); });
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, -2); lp.topMargin = dp(a, 8); rows.addView(row, lp);
        }
        LinearLayout actions = new LinearLayout(a); actions.setGravity(Gravity.END);
        Button refresh = button(a, "更新"); refresh.setOnClickListener(v -> { dialog.dismiss(); extend(a, s, s.feed.items.get(s.index).id, false); });
        Button close = button(a, "閉じる"); close.setOnClickListener(v -> dialog.dismiss()); actions.addView(refresh); actions.addView(close); panel.addView(actions);
        dialog.show();
        if (dialog.getWindow() != null) dialog.getWindow().setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(android.graphics.Color.TRANSPARENT));
    }
    private static void fillVideo(Activity a) {
        for (String name : new String[]{"videoLayout", "video", "video_view"}) {
            View v = find(a, name); if (v == null) continue;
            ViewGroup.LayoutParams lp = v.getLayoutParams();
            if (lp != null && (lp.width != -1 || lp.height != -1)) { lp.width = -1; lp.height = -1; v.setLayoutParams(lp); }
        }
    }
    private static void liftController(Activity a) {
        View controller = find(a, "controller"); if (controller == null) return;
        ViewGroup.LayoutParams lp = controller.getLayoutParams();
        if (lp instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams margins = (ViewGroup.MarginLayoutParams)lp;
            if (margins.bottomMargin != dp(a, 80)) { margins.bottomMargin = dp(a, 80); controller.setLayoutParams(lp); }
        }
    }

    private static void step(Activity a, State s, int direction) {
        if (s.busy || s.dead || a.isFinishing()) return;
        int n = s.index + direction;
        if (n < 0) { Toast.makeText(a, "最初の動画です", 0).show(); return; }
        if (n >= s.feed.items.size()) { extend(a, s, s.feed.items.get(s.index).id, true); return; }
        launch(a, s, n);
    }
    private static void launch(Activity a, State s, int index) {
        if (s.dead || s.launching || index < 0 || index >= s.feed.items.size()) return;
        s.launching = true; s.index = index;
        if (!s.home) s.busy = true;
        Intent i = player(a, s.feed.items.get(index).id).putExtra(MODE, true).putExtra(SESSION, s.feed.key)
            .putExtra("nicoid_re_shorts_index", index).putExtra("title", s.feed.items.get(index).title);
        // finish is set before onPause, so app-switch policies do not open a second player.
        a.startActivity(i); if (!s.home) a.finish(); a.overridePendingTransition(0, 0);
    }
    private static void extend(Activity a, State s, String id, boolean next) {
        if (s.busy || s.dead) return;
        s.busy = true; if (s.progress != null) s.progress.setVisibility(View.VISIBLE);
        s.resumeRequest = () -> extend(a, s, id, next);
        request(s, id, (items, error) -> {
            if (s.dead || a.isFinishing()) return;
            s.busy = false; if (s.progress != null) s.progress.setVisibility(View.GONE);
            if (error != null) { Toast.makeText(a, "一覧を取得できませんでした。もう一度お試しください", 0).show(); return; }
            int added = append(a, s.feed, items); update(s);
            if (next && s.index + 1 < s.feed.items.size()) launch(a, s, s.index + 1);
            else if (added == 0) Toast.makeText(a, "新しいショート動画が見つかりませんでした", 0).show();
        });
    }
    private static int append(Context context, Feed feed, ArrayList<Item> items) {
        int before = feed.items.size(); ContentFilter.Rules rules = ContentFilter.rules(context);
        java.util.HashSet<String> seen = new java.util.HashSet<>(); for (Item old : feed.items) seen.add(old.id);
        for (Item i : items) {
            if (!rules.blocked(i.title, i.channel) && feed.items.size() < 200 && seen.add(i.id)) feed.items.add(i);
        }
        return feed.items.size() - before;
    }
    private static void remember(Feed f) { FEEDS.put(f.key, f); if (FEEDS.size() > 4) FEEDS.remove(FEEDS.keySet().iterator().next()); }
    /** Only capture a clear vertical swipe that starts outside interactive controls. */
    public static boolean active(Activity a) { State s=STATES.get(a);return s!=null&&!s.dead&&s.video!=null; }
    public static boolean touch(Activity a, MotionEvent e) {
        State s = STATES.get(a); if (s == null || s.video == null || s.dead) return false;
        int action = e.getActionMasked();
        if (action == MotionEvent.ACTION_DOWN) {
            s.x = e.getRawX(); s.y = e.getRawY(); s.downTime = e.getDownTime(); s.dragging = false;
            s.blocked = s.busy || interactive(a.getWindow().getDecorView(), s.x, s.y) || e.getY() < dp(a, 24) || e.getY() > a.getWindow().getDecorView().getHeight() - dp(a, 24);
            return false;
        }
        if (e.getPointerCount() > 1 || action == MotionEvent.ACTION_POINTER_DOWN) { s.blocked = true; return false; }
        if (action == MotionEvent.ACTION_CANCEL) {
            boolean consumed = s.dragging;
            if (!s.cancelling) { s.dragging = false; s.blocked = true; }
            return consumed;
        }
        if (action == MotionEvent.ACTION_UP && !s.dragging && !s.busy &&
            Math.abs(e.getRawX() - s.x) < dp(a, 16) && Math.abs(e.getRawY() - s.y) < dp(a, 16)) s.controlsTapped = true;
        if (s.blocked || e.getDownTime() != s.downTime) return false;
        int direction = ShortsRules.direction(e.getRawX() - s.x, e.getRawY() - s.y, a.getResources().getDisplayMetrics().density, false);
        if (action == MotionEvent.ACTION_MOVE && direction != 0 && !s.dragging) {
            s.dragging = true; MotionEvent cancel = MotionEvent.obtain(e); cancel.setAction(MotionEvent.ACTION_CANCEL);
            s.cancelling = true;
            try { a.getWindow().getDecorView().dispatchTouchEvent(cancel); }
            finally { s.cancelling = false; cancel.recycle(); }
        }
        if (action == MotionEvent.ACTION_UP && s.dragging) { s.dragging = false; if (direction != 0) step(a, s, direction); return true; }
        return s.dragging;
    }
    private static boolean interactive(View v, float x, float y) {
        if (v.getVisibility() != View.VISIBLE) return false;
        int[] at = new int[2]; v.getLocationOnScreen(at);
        if (x < at[0] || y < at[1] || x >= at[0] + v.getWidth() || y >= at[1] + v.getHeight()) return false;
        if (v instanceof Button || v instanceof SeekBar || v instanceof EditText || v instanceof ImageButton ||
            ((v instanceof TextView || v instanceof ImageView) && v.isClickable())) return true;
        if (v instanceof ViewGroup) { ViewGroup g = (ViewGroup)v; for (int n = g.getChildCount() - 1; n >= 0; n--) if (interactive(g.getChildAt(n), x, y)) return true; }
        return false;
    }
    private interface Result { void done(ArrayList<Item> items, Exception error); }
    private static void cancelRequest(State s) {
        if (s.request != null) { s.request.cancel(); s.request = null; REQUESTS.purge(); }
        s.busy = false;
    }
    private static void complete(State s, NetworkTask task, Result result, ArrayList<Item> items, Exception error) {
        MAIN.post(() -> {
            if (task.cancelled() || s.dead || s.request != task) return;
            s.request = null; s.resumeRequest = null; result.done(items, error);
        });
    }
    private static void request(State s, String id, Result result) {
        final String cookie = cookie();
        NetworkTask task = new NetworkTask(); s.request = task;
        task.start(REQUESTS, () -> {
            ArrayList<Item> items = new ArrayList<>(); Exception error = null; HttpURLConnection c = null;
            try {
                String url = "https://nvapi.nicovideo.jp/v1/playlist/recipe-id?recipeId=video_short_watch_recommendation&recipeVersion=1&site=nicovideo";
                if (id != null) url += "&videoId=" + Uri.encode(id) + "&currentVideoId=" + Uri.encode(id);
                c = (HttpURLConnection)new URL(url).openConnection(); if (!task.bind(c)) return; c.setConnectTimeout(8000); c.setReadTimeout(8000);
                c.setRequestProperty("X-Frontend-Id", "6"); c.setRequestProperty("X-Frontend-Version", "0");
                c.setRequestProperty("Accept", "application/json"); c.setRequestProperty("Origin", "https://www.nicovideo.jp");
                if (!cookie.isEmpty()) c.setRequestProperty("Cookie", cookie);
                StringBuilder text = new StringBuilder();
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(c.getInputStream(), "UTF-8"))) {
                    String line; while ((line = reader.readLine()) != null) { if (task.cancelled()) return; text.append(line); if (text.length() > 2000000) throw new IllegalStateException("Oversized feed"); }
                }
                JSONObject json = new JSONObject(text.toString());
                if (json.getJSONObject("meta").getInt("status") != 200) throw new IllegalStateException("Feed unavailable");
                JSONArray rows = json.getJSONObject("data").getJSONArray("items");
                for (int n = 0; n < rows.length(); n++) {
                    JSONObject row = rows.getJSONObject(n); String watch = row.optString("watchId");
                    if (!ShortsRules.videoId(watch)) continue;
                    JSONObject content = row.optJSONObject("content");
                    String title = content == null ? watch : content.optString("title", watch);
                    String channel = ContentFilter.owner(content);
                    if (channel.isEmpty()) channel = ContentFilter.owner(row);
                    PaidVideos.remember(content); PaidVideos.remember(row);
                    items.add(new Item(watch, title, thumbnail(row, content), channel));
                }
            } catch (Exception e) { error = e; if (!task.cancelled()) log(e); } finally { if (c != null) { task.release(c); c.disconnect(); } }
            complete(s, task, result, items, error);
        });
    }
    private static void requestSearch(State s, String query, Result result) {
        NetworkTask task = new NetworkTask(); s.request = task;
        task.start(REQUESTS, () -> {
            ArrayList<Item> items = new ArrayList<>(); Exception error = null; HttpURLConnection c = null;
            try {
                Uri uri = Uri.parse("https://nvapi.nicovideo.jp/v2/search/video").buildUpon()
                    .appendQueryParameter("keyword", query).appendQueryParameter("selectContentType", "short")
                    .appendQueryParameter("sortKey", "hot").appendQueryParameter("sortOrder", "none")
                    .appendQueryParameter("pageSize", "50").appendQueryParameter("page", "1").build();
                c = (HttpURLConnection)new URL(uri.toString()).openConnection(); if (!task.bind(c)) return;
                c.setConnectTimeout(8000); c.setReadTimeout(10000);
                c.setRequestProperty("Accept", "application/json");
                c.setRequestProperty("User-Agent", "nicoid Re");
                c.setRequestProperty("X-Frontend-Id", "6"); c.setRequestProperty("X-Frontend-Version", "0");
                c.setRequestProperty("Origin", "https://www.nicovideo.jp");
                String sessionCookie = cookie(); if (!sessionCookie.isEmpty()) c.setRequestProperty("Cookie", sessionCookie);
                StringBuilder body = new StringBuilder();
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(c.getInputStream(), "UTF-8"))) {
                    String line; while ((line = reader.readLine()) != null) {
                        if (task.cancelled()) return; body.append(line); if (body.length() > 2000000) throw new IllegalStateException("Oversized search response");
                    }
                }
                JSONObject json = new JSONObject(body.toString());
                if (json.getJSONObject("meta").getInt("status") != 200) throw new IllegalStateException("Search unavailable");
                JSONArray rows = json.getJSONObject("data").getJSONArray("items");
                for (int n = 0; n < rows.length(); n++) {
                    JSONObject row = rows.getJSONObject(n); String id = row.optString("id", row.optString("watchId", ""));
                    if (!ShortsRules.videoId(id)) continue;
                    items.add(new Item(id, row.optString("title", id), thumbnail(row, row), ContentFilter.owner(row)));
                }
            } catch (Exception e) { error = e; if (!task.cancelled()) log(e); } finally { if (c != null) { task.release(c); c.disconnect(); } }
            complete(s, task, result, items, error);
        });
    }
    private static String thumbnail(JSONObject row, JSONObject content) {
        for (JSONObject source : new JSONObject[]{content, row}) {
            if (source == null) continue;
            JSONObject thumb = source.optJSONObject("thumbnail");
            if (thumb != null) for (String key : new String[]{"shortUrl", "largeUrl", "middleUrl", "url", "listingUrl"}) {
                String url = thumb.optString(key, ""); if (url.startsWith("https://")) return url;
            }
            String url = source.optString("thumbnailUrl", ""); if (url.startsWith("https://")) return url;
        }
        return "";
    }

    private static String cookie() {
        try { Class<?> v = Class.forName("e.e.a.v0"); Object store = v.getField("b").get(null);
            if (store == null) return "";
            return (String)v.getMethod("a", Class.forName("org.apache.http.client.CookieStore")).invoke(null, store);
        } catch (Exception e) { return ""; }
    }
    private static void register(Context c) {
        UiStrings.selectLanguage(prefs(c).getString("app_lang", "0"));
        if (registered) return; registered = true;
        Application app = (Application)c.getApplicationContext();
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            public void onActivityCreated(Activity a, Bundle b) {}
            public void onActivityStarted(Activity a) {}
            public void onActivityResumed(Activity a) {
                State state = STATES.get(a);
                if (state != null && state.home) state.launching = false;
                if (state != null && !state.dead) {
                    if (state.redraw != null) state.redraw.run();
                    if (!state.busy && state.resumeRequest != null) {
                        Runnable resume = state.resumeRequest; state.resumeRequest = null; resume.run();
                    }
                }
                ShortImages.resume(a);
                int generation = REFRESH_MONITORS.containsKey(a) ? REFRESH_MONITORS.get(a) + 1 : 1;
                REFRESH_MONITORS.put(a, generation); monitorRefresh(a, generation);
                Boolean prior = MENU_STATE.get(a); boolean now = prefs(a).getBoolean("show_shorts_menu", true);
                if (prior != null && prior != now) {
                    View menu = find(a, "menu_listview");
                    if (menu instanceof ListView) try {
                        Class.forName("com.sauzask.nicoid.NicoidTopActivity").getMethod("a", Context.class, ListView.class).invoke(null, a, menu);
                    } catch (Exception e) { log(e); }
                    MENU_STATE.put(a, now);
                }
            }
            public void onActivityPaused(Activity a) {
                Integer generation = REFRESH_MONITORS.get(a);
                REFRESH_MONITORS.put(a, generation == null ? 1 : generation + 1);
            }
            public void onActivityStopped(Activity a) {
                State state = STATES.get(a);
                if (state != null) { cancelRequest(state); if (state.progress != null) state.progress.setVisibility(View.GONE); }
                ShortImages.cancel(a);
            }
            public void onActivitySaveInstanceState(Activity a, Bundle b) {}
            public void onActivityDestroyed(Activity a) {
                State s = STATES.remove(a); MENU_STATE.remove(a);
                if (s != null) { s.dead = true; cancelRequest(s); s.resumeRequest = null; s.redraw = null; ShortImages.cancel(a); if (s.listener != null) {
                    ViewTreeObserver observer = a.findViewById(android.R.id.content).getViewTreeObserver();
                    if (observer.isAlive()) { observer.removeOnGlobalLayoutListener(s.listener);
                        if (s.controlsListener != null) observer.removeOnPreDrawListener(s.controlsListener); }
                } }
            }
        });
    }
    private static void watchRefresh(View root) {
        if (root.getClass().getName().equals("androidx.swiperefreshlayout.widget.SwipeRefreshLayout")) {
            boolean refreshing = isRefreshing(root);
            Long started = REFRESH_WATCH.get(root);
            if (!refreshing) { REFRESH_WATCH.remove(root); return; }
            long now = SystemClock.uptimeMillis();
            if (started == null) REFRESH_WATCH.put(root, now);
            else if (now - started >= 10000) {
                setRefreshing(root, false); REFRESH_WATCH.remove(root);
                Toast.makeText(root.getContext(), "更新が完了しませんでした。もう一度お試しください。", Toast.LENGTH_SHORT).show();
            }
            return;
        }
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup)root;
            for (int i = 0; i < group.getChildCount(); i++) watchRefresh(group.getChildAt(i));
        }
    }
    private static void monitorRefresh(Activity a, int generation) {
        MAIN.postDelayed(() -> {
            if (!Integer.valueOf(generation).equals(REFRESH_MONITORS.get(a)) || a.isFinishing()) return;
            watchRefresh(a.getWindow().getDecorView());
            monitorRefresh(a, generation);
        }, 1000);
    }
    private static boolean isRefreshing(View v) {
        try { return (Boolean)v.getClass().getMethod("isRefreshing").invoke(v); }
        catch (Exception e) { return false; }
    }
    private static void setRefreshing(View v, boolean value) {
        try { v.getClass().getMethod("setRefreshing", boolean.class).invoke(v, value); }
        catch (Exception ignored) { }
    }
    private static void log(Exception e) { Log.w("nicoid-shorts", e.getClass().getSimpleName()); }
}
