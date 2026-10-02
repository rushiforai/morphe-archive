package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Color;
import android.net.Uri;
import android.os.Build;
import android.text.Html;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Spinner;
import android.widget.ArrayAdapter;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Native search for the Edge archive index. Thread bodies remain on the original BBS. */
final class EddiArchiveSearchUi {
    interface ThreadOpener {
        boolean open(String url);
    }

    private static final String HOST = "eddiarchive3rd.boy.jp";
    private static final Pattern THREAD = Pattern.compile(
            "(?is)<div\\s+class=[\"']thread[\"']\\s*>(.*?)</div>");
    private static final Pattern ANCHOR = Pattern.compile("(?is)<a\\s+([^>]*class=[\"']title[\"'][^>]*)>(.*?)</a>");
    private static final Pattern HREF = Pattern.compile("(?is)\\bhref=[\"']([^\"']+)[\"']");
    private static final Pattern DATE = Pattern.compile("(?is)<p\\s+class=[\"']date[\"']\\s*>(.*?)</p>");
    private static final Pattern COUNT = Pattern.compile("検索結果[^0-9]*([0-9,]+)件");
    private static final String[] SORT_VALUES = {"new", "old", "resDes", "resAs"};
    private static final String[] SORT_LABELS = {"新しい順", "古い順", "レスが多い順", "レスが少ない順"};
    private final Activity activity;
    private final ThreadOpener opener;
    private final LinearLayout root;
    private final LinearLayout results;
    private final TextView status;
    private final EditText keyword;
    private final EditText exclude;
    private final EditText minimumReplies;
    private final EditText startDate;
    private final EditText endDate;
    private final Spinner sort;
    private final Switch orSearch;
    private final Switch fuzzy;
    private final Button previous;
    private final Button next;
    private final ScrollView scroll;
    private final int background;
    private final int foreground;
    private final int muted;
    private int page = 1;
    private int generation;
    private int totalResults;

    static void show(Activity activity, Uri source, ThreadOpener opener) {
        new EddiArchiveSearchUi(activity, source, opener);
    }

    private EddiArchiveSearchUi(Activity activity, Uri source, ThreadOpener opener) {
        this.activity = activity;
        this.opener = opener;
        int theme = Haiagaru.hissiViewerTheme();
        boolean dark = theme == 1 || theme == 2 || (theme != 3
                && (activity.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES);
        background = dark ? Color.rgb(18, 18, 20) : Color.WHITE;
        foreground = dark ? Color.WHITE : Color.rgb(28, 30, 34);
        muted = dark ? Color.rgb(185, 188, 198) : Color.rgb(95, 99, 108);

        root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(background);
        root.setPadding(dp(16), dp(12), dp(16), dp(8));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            // This native search screen returns before HissiMenuActivity installs
            // its WebView insets handler. Keep the heading below the status bar.
            activity.getWindow().setDecorFitsSystemWindows(false);
            root.setOnApplyWindowInsetsListener((view, insets) -> {
                android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars());
                view.setPadding(dp(16), dp(12) + bars.top, dp(16), dp(8) + bars.bottom);
                return insets;
            });
        }
        TextView heading = text("エッヂ過去ログ検索", 21, foreground);
        heading.setOnClickListener(view -> activity.finish());
        root.addView(heading);
        root.addView(text("スレタイを探し、結果をタップするとChMateで開きます", 12, muted));

        keyword = input("スレタイを入力", false);
        keyword.setSingleLine(true);
        root.addView(keyword);
        LinearLayout actionRow = row();
        Button search = button("検索");
        actionRow.addView(search, weighted());
        Button details = button("詳細条件 ▾");
        actionRow.addView(details, weighted());
        root.addView(actionRow);

        LinearLayout advanced = new LinearLayout(activity);
        advanced.setOrientation(LinearLayout.VERTICAL);
        exclude = input("除外するスレタイ", false);
        advanced.addView(exclude);
        orSearch = toggle("OR検索");
        fuzzy = toggle("半角・全角を曖昧に検索");
        advanced.addView(orSearch);
        advanced.addView(fuzzy);
        minimumReplies = input("最小レス数", true);
        advanced.addView(minimumReplies);
        advanced.addView(text("並び順", 13, muted));
        sort = new Spinner(activity);
        ArrayAdapter<String> adapter = new ArrayAdapter<>(activity,
                android.R.layout.simple_spinner_dropdown_item, SORT_LABELS);
        sort.setAdapter(adapter);
        advanced.addView(sort);
        startDate = input("開始日 YYYY-MM-DD", false);
        endDate = input("終了日 YYYY-MM-DD", false);
        advanced.addView(startDate);
        advanced.addView(endDate);
        ScrollView advancedScroll = new ScrollView(activity);
        advancedScroll.addView(advanced);
        advancedScroll.setVisibility(View.GONE);
        root.addView(advancedScroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(240)));
        details.setOnClickListener(view -> {
            boolean expanded = advancedScroll.getVisibility() != View.VISIBLE;
            advancedScroll.setVisibility(expanded ? View.VISIBLE : View.GONE);
            details.setText(expanded ? "詳細条件 ▴" : "詳細条件 ▾");
        });
        search.setOnClickListener(view -> search(1));

        status = text("", 13, muted);
        status.setPadding(0, dp(8), 0, dp(4));
        root.addView(status);
        scroll = new ScrollView(activity);
        results = new LinearLayout(activity);
        results.setOrientation(LinearLayout.VERTICAL);
        scroll.addView(results);
        root.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        LinearLayout navigation = row();
        previous = button("‹ 前へ");
        next = button("次へ ›");
        navigation.addView(previous, weighted());
        navigation.addView(next, weighted());
        previous.setOnClickListener(view -> search(page - 1));
        next.setOnClickListener(view -> search(page + 1));
        root.addView(navigation);
        Button original = button("元サイトの表示に切り替える");
        original.setOnClickListener(view -> {
            Intent intent = new Intent(activity, HissiMenuActivity.class);
            intent.setAction(Intent.ACTION_VIEW);
            intent.setData(queryUri(page));
            intent.putExtra("haiagaru.eddi.web", true);
            activity.startActivity(intent);
        });
        root.addView(original);
        activity.setContentView(root);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) root.requestApplyInsets();

        restoreQuery(source);
        search(page);
    }

    private void restoreQuery(Uri uri) {
        if (uri == null) return;
        set(keyword, uri.getQueryParameter("keyword"));
        set(exclude, uri.getQueryParameter("keyword_exclude"));
        set(minimumReplies, uri.getQueryParameter("NoR"));
        set(startDate, uri.getQueryParameter("start_date"));
        set(endDate, uri.getQueryParameter("end_date"));
        orSearch.setChecked("or".equals(uri.getQueryParameter("onor")));
        String fuzzyValue = uri.getQueryParameter("fuzzy");
        fuzzy.setChecked(fuzzyValue != null && !fuzzyValue.isEmpty());
        String chosenSort = uri.getQueryParameter("sort");
        for (int index = 0; index < SORT_VALUES.length; index++) {
            if (SORT_VALUES[index].equals(chosenSort)) sort.setSelection(index);
        }
        try {
            page = Math.max(1, Integer.parseInt(uri.getQueryParameter("page")));
        } catch (RuntimeException ignored) {
            page = 1;
        }
    }

    private void search(int requestedPage) {
        if (requestedPage < 1) return;
        int requestId = ++generation;
        Uri uri = queryUri(requestedPage);
        status.setText("検索中…");
        previous.setEnabled(false);
        next.setEnabled(false);
        new Thread(() -> {
            try {
                SearchPage result = fetch(uri);
                activity.runOnUiThread(() -> {
                    if (requestId == generation && !activity.isFinishing()) {
                        display(requestedPage, result);
                    }
                });
            } catch (Exception error) {
                activity.runOnUiThread(() -> {
                    if (requestId != generation || activity.isFinishing()) return;
                    status.setText("検索に失敗しました。通信状態を確認して再検索してください。");
                    previous.setEnabled(page > 1);
                    Toast.makeText(activity, error.getMessage(), Toast.LENGTH_SHORT).show();
                });
            }
        }, "Haiagaru-eddi-search").start();
    }

    private Uri queryUri(int requestedPage) {
        Uri.Builder builder = new Uri.Builder().scheme("https").authority(HOST).path("/")
                .appendQueryParameter("page", String.valueOf(requestedPage))
                .appendQueryParameter("keyword", value(keyword))
                .appendQueryParameter("onor", orSearch.isChecked() ? "or" : "")
                .appendQueryParameter("keyword_exclude", value(exclude))
                .appendQueryParameter("NoR", value(minimumReplies))
                .appendQueryParameter("fuzzy", fuzzy.isChecked() ? "on" : "")
                .appendQueryParameter("sort", SORT_VALUES[sort.getSelectedItemPosition()])
                .appendQueryParameter("start_date", value(startDate))
                .appendQueryParameter("end_date", value(endDate));
        return builder.build();
    }

    private SearchPage fetch(Uri uri) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(uri.toString()).openConnection();
        connection.setConnectTimeout(10000);
        connection.setReadTimeout(15000);
        connection.setInstanceFollowRedirects(false);
        connection.setRequestProperty("Accept", "text/html");
        connection.setRequestProperty("User-Agent", "Haiagaru-ChMate/1.0");
        try {
            if (connection.getResponseCode() != 200) {
                throw new java.io.IOException("HTTP " + connection.getResponseCode());
            }
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            try (InputStream input = connection.getInputStream()) {
                byte[] buffer = new byte[8192];
                int length;
                while ((length = input.read(buffer)) != -1) {
                    if (bytes.size() + length > 2_000_000) {
                        throw new java.io.IOException("検索結果が大きすぎます");
                    }
                    bytes.write(buffer, 0, length);
                }
            }
            return parse(new String(bytes.toByteArray(), StandardCharsets.UTF_8));
        } finally {
            connection.disconnect();
        }
    }

    private SearchPage parse(String html) throws java.io.IOException {
        if (!html.contains("id=\"threadContainer\"")) {
            throw new java.io.IOException("検索結果の形式が変わりました");
        }
        Matcher countMatcher = COUNT.matcher(html);
        int count = 0;
        if (countMatcher.find()) {
            try { count = Integer.parseInt(countMatcher.group(1).replace(",", "")); }
            catch (NumberFormatException ignored) { }
        }
        List<ThreadResult> threads = new ArrayList<>();
        Matcher blocks = THREAD.matcher(html);
        while (blocks.find() && threads.size() < 50) {
            String block = blocks.group(1);
            Matcher anchor = ANCHOR.matcher(block);
            if (!anchor.find()) continue;
            Matcher href = HREF.matcher(anchor.group(1));
            if (!href.find()) continue;
            String url = href.group(1);
            if (!HissiLinkRouting.isThreadUrl(url)) continue;
            Matcher date = DATE.matcher(block);
            threads.add(new ThreadResult(clean(anchor.group(2)),
                    date.find() ? clean(date.group(1)) : "", url));
        }
        return new SearchPage(threads, count);
    }

    private void display(int requestedPage, SearchPage result) {
        page = requestedPage;
        totalResults = result.total;
        results.removeAllViews();
        status.setText("検索結果 " + totalResults + "件 · " + page + "ページ目");
        if (result.threads.isEmpty()) {
            results.addView(text("該当するスレはありません。検索条件を変えてください。", 15, muted));
        }
        for (ThreadResult thread : result.threads) {
            LinearLayout card = new LinearLayout(activity);
            card.setOrientation(LinearLayout.VERTICAL);
            card.setPadding(dp(12), dp(12), dp(12), dp(12));
            card.setBackgroundColor(background == Color.WHITE
                    ? Color.rgb(242, 246, 248) : Color.rgb(36, 38, 43));
            TextView title = text(thread.title, 16, foreground);
            card.addView(title);
            card.addView(text(thread.date, 12, muted));
            card.setOnClickListener(view -> {
                if (!opener.open(thread.url)) {
                    Toast.makeText(activity, "スレを開けませんでした", Toast.LENGTH_SHORT).show();
                }
            });
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.bottomMargin = dp(7);
            results.addView(card, params);
        }
        previous.setEnabled(page > 1);
        next.setEnabled(result.threads.size() == 50 && (long) page * 50 < totalResults);
        scroll.scrollTo(0, 0);
    }

    private static String clean(String html) {
        String text = Build.VERSION.SDK_INT >= 24
                ? Html.fromHtml(html, Html.FROM_HTML_MODE_LEGACY).toString()
                : Html.fromHtml(html).toString();
        return text.trim();
    }

    private TextView text(String value, int size, int color) {
        TextView view = new TextView(activity);
        view.setText(value);
        view.setTextSize(size);
        view.setTextColor(color);
        return view;
    }

    private EditText input(String hint, boolean numeric) {
        EditText view = new EditText(activity);
        view.setHint(hint);
        view.setTextColor(foreground);
        view.setHintTextColor(muted);
        view.setSingleLine(true);
        if (numeric) view.setInputType(InputType.TYPE_CLASS_NUMBER);
        return view;
    }

    private Switch toggle(String label) {
        Switch view = new Switch(activity);
        view.setText(label);
        view.setTextColor(foreground);
        view.setTextSize(12);
        return view;
    }

    private Button button(String label) {
        Button view = new Button(activity);
        view.setText(label);
        view.setAllCaps(false);
        return view;
    }

    private LinearLayout row() {
        LinearLayout view = new LinearLayout(activity);
        view.setOrientation(LinearLayout.HORIZONTAL);
        view.setGravity(Gravity.CENTER_VERTICAL);
        return view;
    }

    private LinearLayout.LayoutParams weighted() {
        return new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1);
    }

    private int dp(int size) {
        return Math.round(size * activity.getResources().getDisplayMetrics().density);
    }

    private static String value(EditText view) {
        return view.getText().toString().trim();
    }

    private static void set(EditText view, String value) {
        if (value != null) view.setText(value);
    }

    private static final class ThreadResult {
        final String title;
        final String date;
        final String url;
        ThreadResult(String title, String date, String url) {
            this.title = title;
            this.date = date;
            this.url = url;
        }
    }

    private static final class SearchPage {
        final List<ThreadResult> threads;
        final int total;
        SearchPage(List<ThreadResult> threads, int total) {
            this.threads = threads;
            this.total = total;
        }
    }
}
