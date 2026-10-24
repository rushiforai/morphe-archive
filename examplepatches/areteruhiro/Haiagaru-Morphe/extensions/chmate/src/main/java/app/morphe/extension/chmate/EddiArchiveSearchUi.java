package app.morphe.extension.chmate;

import android.app.Activity;

import android.content.Intent;
import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Color;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.text.Html;
import android.text.InputType;
import android.view.Gravity;
import android.view.MotionEvent;
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
import android.widget.SeekBar;
import android.widget.CheckBox;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONObject;

/** Native search for the Edge archive index. Thread bodies remain on the original BBS. */
final class EddiArchiveSearchUi {
    static final int CONTROL_SCALE_TAG = 0x48690c01;
    static final int RESULT_SCALE_TAG = 0x48690c02;
    static final int RESULT_CARD_TAG = 0x48690c03;
    static final int RESULT_FIRST_TAG = 0x48690c04;
    static final int RESULT_PADDING_TAG = 0x48690c05;
    static final int CONTROL_LAYOUT_TAG = 0x48690c06;
    static final int REFRESH_ACTION_TAG = 0x48690c07;
    static final int REFRESH_ENABLED_TAG = 0x48690c08;
    static final int SEARCH_BUSY_TAG = 0x48690c09;
    interface ThreadOpener {
        boolean open(String url);
    }

    private static final String HOST = "eddiarchive3rd.boy.jp";
    private static final String PREFS = "haiagaru_eddi_search";
    static final String STATE_KEY = "haiagaru.eddi.search.state";
    java.util.function.Consumer<String> onStateSaved;
    private final Runnable closeAction;
    // Also stored in the Activity bundle: leave room for the view hierarchy
    // below Android's Binder transaction limit.
    private static final int MAX_SAVED_LENGTH = 120_000;
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
    private final Spinner provider;
    private int activeProvider;
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
    private SearchPage displayedPage;
    private String displayedQuery;
    private ScrollView advancedScroll;
    private Button details;
    private LinearLayout searchForm;
    private ArrayAdapter<String> sortAdapter;
    private final java.util.Map<TextView, Float> controlTextSizes = new java.util.IdentityHashMap<>();
    private final java.util.Map<TextView, Float> resultTextSizes = new java.util.IdentityHashMap<>();
    private int controlScale;
    private int resultScale;
    private int resultPadding;
    private int controlLayoutScale;
    private boolean hideSearchForm;
    private int restoreScrollY = -1;
    private boolean disposed;

    static EddiArchiveSearchUi show(Activity activity, Uri source, ThreadOpener opener, Bundle state) {
        return new EddiArchiveSearchUi(activity, source, opener, state, false, activity::finish);
    }

    static EddiArchiveSearchUi embed(Activity activity,Uri source,ThreadOpener opener,Bundle state,Runnable close) {
        return new EddiArchiveSearchUi(activity,source,opener,state,true,close);
    }
    LinearLayout rootView(){return root;}

    private EddiArchiveSearchUi(Activity activity, Uri source, ThreadOpener opener, Bundle state, boolean embedded, Runnable close) {
        this.activity = activity;
        this.closeAction = close;
        this.opener = opener;
        android.content.SharedPreferences prefs = activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        controlScale = clampTextScale(prefs.getInt("controlTextScale", 100));
        resultScale = clampTextScale(prefs.getInt("resultTextScale", 100));
        resultPadding = clampResultPadding(prefs.getInt("resultVerticalPadding", 16));
        controlLayoutScale = clampControlLayout(prefs.getInt("controlLayoutScale", 100));
        hideSearchForm = prefs.getBoolean("hideSearchForm", false);
        int theme = Haiagaru.hissiViewerTheme();
        boolean dark = theme == 1 || theme == 2 || (theme != 3
                && (activity.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES);
        background = dark ? Color.rgb(18, 18, 20) : Color.WHITE;
        foreground = dark ? Color.WHITE : Color.rgb(28, 30, 34);
        muted = dark ? Color.rgb(185, 188, 198) : Color.rgb(95, 99, 108);

        root = new LinearLayout(activity);
        root.setTag(REFRESH_ACTION_TAG,(Runnable)this::refreshResults);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(background);
        root.setPadding(dp(16), dp(12), dp(16), dp(8));
        if (!embedded && Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            // This native search screen returns before HissiMenuActivity installs
            // its WebView insets handler. Keep the heading below the status bar.
            activity.getWindow().setDecorFitsSystemWindows(false);
            root.setOnApplyWindowInsetsListener((view, insets) -> {
                android.graphics.Insets bars = insets.getInsets(WindowInsets.Type.systemBars());
                view.setPadding(dp(16), dp(12) + bars.top, dp(16), dp(8) + bars.bottom);
                return insets;
            });
        }
        TextView heading = text("‹ エッヂ過去ログ検索", 21, foreground);
        heading.setOnClickListener(view -> closeAction.run());
        LinearLayout header = row();
        header.addView(heading, weighted());
        Button appearance = button("表示");
        appearance.setOnClickListener(view -> showAppearanceSettings());
        header.addView(appearance);
        root.addView(header);
        searchForm = new LinearLayout(activity);
        searchForm.setOrientation(LinearLayout.VERTICAL);
        root.addView(searchForm);

        provider = new Spinner(activity);
        provider.setContentDescription("過去ログの検索先");
        provider.setAdapter(new ArrayAdapter<String>(activity,
                android.R.layout.simple_spinner_dropdown_item,
                new String[]{"エッヂ過去ログ（従来）", "Kyodemo（現行＋過去ログ）"}) {
            @Override public View getView(int position, View recycled, ViewGroup parent) {
                return styleSortText(super.getView(position, recycled, parent));
            }
            @Override public View getDropDownView(int position, View recycled, ViewGroup parent) {
                return styleSortText(super.getDropDownView(position, recycled, parent));
            }
        });
        searchForm.addView(provider);

        keyword = input("スレタイを入力", false);
        keyword.setSingleLine(true);
        searchForm.addView(keyword);
        LinearLayout actionRow = row();
        Button search = button("検索");
        actionRow.addView(search, weighted());
        details = button("詳細条件 ▾");
        actionRow.addView(details, weighted());
        searchForm.addView(actionRow);

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
                android.R.layout.simple_spinner_dropdown_item, SORT_LABELS) {
            @Override public View getView(int position, View convertView, ViewGroup parent) {
                return styleSortText(super.getView(position, convertView, parent));
            }
            @Override public View getDropDownView(int position, View convertView, ViewGroup parent) {
                return styleSortText(super.getDropDownView(position, convertView, parent));
            }
        };
        sortAdapter = adapter;
        sort.setAdapter(adapter);
        advanced.addView(sort);
        startDate = input("開始日 YYYY-MM-DD", false);
        endDate = input("終了日 YYYY-MM-DD", false);
        advanced.addView(startDate);
        advanced.addView(endDate);
        advancedScroll = new ScrollView(activity);
        advancedScroll.addView(advanced);
        advancedScroll.setVisibility(View.GONE);
        searchForm.addView(advancedScroll, new LinearLayout.LayoutParams(
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
        scroll = new ScrollView(activity) {
            private float startX, startY;
            private boolean singleTouch;

            @Override
            public boolean dispatchTouchEvent(MotionEvent event) {
                int action = event.getActionMasked();
                if (action == MotionEvent.ACTION_DOWN) {
                    startX = event.getX();
                    startY = event.getY();
                    singleTouch = true;
                } else if (action == MotionEvent.ACTION_POINTER_DOWN
                        || action == MotionEvent.ACTION_CANCEL) {
                    singleTouch = false;
                } else if (action == MotionEvent.ACTION_UP && singleTouch) {
                    int mode = Haiagaru.hissiViewerSwipeHistory();
                    float dx = event.getX() - startX;
                    float dy = event.getY() - startY;
                    if (mode != 0 && Math.abs(dx) >= dp(96)
                            && Math.abs(dy) < Math.abs(dx) * 0.45f) {
                        // Cancel the result row's click before navigating.
                        MotionEvent cancel = MotionEvent.obtain(event);
                        cancel.setAction(MotionEvent.ACTION_CANCEL);
                        super.dispatchTouchEvent(cancel);
                        cancel.recycle();
                        navigateBySwipe((dx > 0) == (mode == 1));
                        return true;
                    }
                }
                return super.dispatchTouchEvent(event);
            }
        };
        HaiagaruUi.bindSwipe(scroll, right -> {
            int mode = Haiagaru.hissiViewerSwipeHistory();
            if (mode != 0) navigateBySwipe(right == (mode == 1));
        });
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
        provider.setOnItemSelectedListener(new android.widget.AdapterView.OnItemSelectedListener() {
            @Override public void onItemSelected(android.widget.AdapterView<?> parent, View view, int position, long id) {
                if (activeProvider == position) return;
                activeProvider = position;
                ++generation; // Do not let the previous provider's in-flight response replace this screen.
                root.setTag(SEARCH_BUSY_TAG,Boolean.FALSE);
                root.setTag(REFRESH_ENABLED_TAG,Boolean.FALSE);
                page = 1;
                displayedPage = null;
                displayedQuery = null;
                results.removeAllViews();
                resultTextSizes.clear();
                previous.setEnabled(false);
                next.setEnabled(false);
                updateProviderControls();
                status.setText("検索先を変更しました。「検索」で取得します。");
                saveState(null);
            }
            @Override public void onNothingSelected(android.widget.AdapterView<?> parent) { }
        });
        applyAppearance();
        if (!embedded) HaiagaruUi.showArchiveSearch((HaiagaruComposeActivity) activity, root);
        if (!embedded && Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) root.requestApplyInsets();

        if (!restoreSavedSearch(source, state)) {
            restoreQuery(source);
            search(page);
        }
        updateProviderControls();
    }

    /** Save data only, never retain the Activity or its views between launches. */
    void saveState(Bundle state) {
        try {
            JSONObject saved = new JSONObject();
            saved.put("query", queryUri(page).toString());
            saved.put("page", page);
            saved.put("scroll", HaiagaruUi.scrollPosition(scroll));
            saved.put("expanded", advancedScroll.getVisibility() == View.VISIBLE);
            if (displayedPage != null) {
                saved.put("resultQuery", displayedQuery);
                saved.put("total", displayedPage.total);
                saved.put("hasNext", displayedPage.hasNext);
                JSONArray threads = new JSONArray();
                for (ThreadResult thread : displayedPage.threads) {
                    threads.put(new JSONObject().put("title", thread.title)
                            .put("date", thread.date).put("url", thread.url));
                }
                saved.put("threads", threads);
            }
            String encoded = saved.toString();
            // Oversized results may be fetched again; keep the query and position.
            if (encoded.length() > MAX_SAVED_LENGTH) {
                saved.remove("threads");
                encoded = saved.toString();
            }
            if (encoded.length() > MAX_SAVED_LENGTH) return;
            if (state != null) state.putString(STATE_KEY, encoded);
            if (onStateSaved != null) onStateSaved.accept(encoded);
            activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                    .edit().putString("last", encoded).apply();
        } catch (Exception error) {
            android.util.Log.w("Haiagaru", "Could not save Edge archive search", error);
        }
    }

    void dispose() {
        onStateSaved = null;
        disposed = true;
        root.setTag(REFRESH_ACTION_TAG,null);
        root.setTag(SEARCH_BUSY_TAG,Boolean.FALSE);
        ++generation;
    }

    private boolean restoreSavedSearch(Uri source, Bundle state) {
        String encoded = state == null ? null : state.getString(STATE_KEY);
        boolean fromActivityState = encoded != null;
        if (encoded == null) encoded = activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
                .getString("last", null);
        if (encoded == null || encoded.length() > MAX_SAVED_LENGTH) return false;
        try {
            JSONObject saved = new JSONObject(encoded);
            // Explicit incoming searches must take precedence over the last search.
            if (!fromActivityState && source != null && source.getEncodedQuery() != null
                    && !source.getEncodedQuery().isEmpty()) return false;
            Uri query = Uri.parse(saved.getString("query"));
            if (!HOST.equalsIgnoreCase(query.getHost()) && !KyodemoArchive.accepts(query.toString())) return false;
            restoreQuery(query);
            boolean expanded = saved.optBoolean("expanded");
            advancedScroll.setVisibility(expanded ? View.VISIBLE : View.GONE);
            details.setText(expanded ? "詳細条件 ▴" : "詳細条件 ▾");
            JSONArray rows = saved.optJSONArray("threads");
            String resultQuery = saved.optString("resultQuery", query.toString());
            if (rows != null && rows.length() <= 50 && resultQuery.equals(query.toString())) {
                List<ThreadResult> threads = new ArrayList<>();
                for (int index = 0; index < rows.length(); index++) {
                    JSONObject row = rows.getJSONObject(index);
                    String url = row.getString("url");
                    if (!HissiLinkRouting.isThreadUrl(url)) return false;
                    threads.add(new ThreadResult(row.getString("title"), row.optString("date"), url));
                }
                displayedQuery = saved.optString("resultQuery", query.toString());
                display(Math.max(1, saved.optInt("page", page)),
                        new SearchPage(threads, saved.optInt("total"), saved.optBoolean("hasNext",
                                (long) page * 50 < saved.optInt("total"))));
                status.setText("前回の" + resultStatus() + "（「検索」で更新）");
                int position = Math.max(0, saved.optInt("scroll"));
                HaiagaruUi.scrollTo(scroll, position);
            } else {
                restoreScrollY = Math.max(0, saved.optInt("scroll"));
                search(page);
            }
            return true;
        } catch (Exception error) {
            android.util.Log.w("Haiagaru", "Could not restore Edge archive search", error);
            return false;
        }
    }

    private void navigateBySwipe(boolean forward) {
        if (forward) {
            if (next.isEnabled()) next.performClick();
        } else if (page <= 1) {
            closeAction.run();
        } else if (previous.isEnabled()) {
            previous.performClick();
        }
    }

    private void restoreQuery(Uri uri) {
        if (uri == null) return;
        if (KyodemoArchive.accepts(uri.toString())) {
            activeProvider = 1;
            provider.setSelection(1);
            set(keyword, KyodemoArchive.parameter(uri.toString(), "k"));
            set(startDate, KyodemoArchive.parameter(uri.toString(), "fr"));
            set(endDate, KyodemoArchive.parameter(uri.toString(), "to"));
            page = Math.max(1, KyodemoArchive.page(uri.toString()));
            return;
        }
        activeProvider = 0;
        provider.setSelection(0);
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
        final Uri uri;
        try { uri = queryUri(requestedPage); }
        catch (IllegalArgumentException invalid) { status.setText(invalid.getMessage()); return; }
        search(requestedPage,uri);
    }
    /** Re-fetch the displayed page/conditions, not unsubmitted edits in the form. */
    private void refreshResults(){
        if(disposed||Boolean.TRUE.equals(root.getTag(SEARCH_BUSY_TAG))||displayedPage==null||displayedQuery==null)return;
        search(page,Uri.parse(displayedQuery));
    }
    private void search(int requestedPage,Uri uri) {
        if(disposed||requestedPage<1)return;
        int requestId = ++generation;
        root.setTag(SEARCH_BUSY_TAG,Boolean.TRUE);
        status.setText("検索中…");
        previous.setEnabled(false);
        next.setEnabled(false);
        new Thread(() -> {
            try {
                SearchPage result = fetch(uri);
                activity.runOnUiThread(() -> {
                    if (requestId == generation && !activity.isFinishing()) {
                        root.setTag(SEARCH_BUSY_TAG,Boolean.FALSE);
                        displayedQuery = uri.toString();
                        display(requestedPage, result);
                        saveState(null);
                    }
                });
            } catch (Exception error) {
                String message = error.getMessage();
                String code = message != null && message.matches("HTTP [0-9]{3}")
                        ? "SEARCH_HTTP_" + message.substring(5) : "SEARCH_FAILED";
                activity.runOnUiThread(() -> {
                    if (requestId != generation || activity.isFinishing()) return;
                    root.setTag(SEARCH_BUSY_TAG,Boolean.FALSE);
                    Haiagaru.reportEddiArchiveError(activity, code,
                            "Search request failed: " + uri.getHost(), error);
                    status.setText((code.matches("SEARCH_HTTP_5[0-9]{2}")
                            ? "検索先が一時的に利用できません。検索先を切り替えてお試しください"
                            : "検索に失敗しました") + "（" + code + "）。診断ログを保存しました。");
                    previous.setEnabled(page > 1);
                });
            }
        }, "Haiagaru-eddi-search").start();
    }

    private Uri queryUri(int requestedPage) {
        if (provider.getSelectedItemPosition() == 1)
            return Uri.parse(KyodemoArchive.query(value(keyword), value(startDate), value(endDate), requestedPage));
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
            if (KyodemoArchive.accepts(uri.toString())) {
                KyodemoArchive.Page parsed = KyodemoArchive.parse(new String(bytes.toByteArray(),
                        java.nio.charset.Charset.forName("Windows-31J")), KyodemoArchive.page(uri.toString()));
                List<ThreadResult> threads = new ArrayList<>();
                for (KyodemoArchive.Row row : parsed.rows)
                    threads.add(new ThreadResult(clean(row.titleHtml), clean(row.dateHtml), row.url));
                return new SearchPage(threads, -1, parsed.hasNext);
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
        root.setTag(REFRESH_ENABLED_TAG,Boolean.TRUE);
        page = requestedPage;
        displayedPage = result;
        totalResults = result.total;
        results.removeAllViews();
        resultTextSizes.clear();
        status.setText(resultStatus());
        if (result.threads.isEmpty()) {
            results.addView(resultText("該当するスレはありません。検索条件を変えてください。", 15, muted));
        }
        int resultIndex=0;
        for (ThreadResult thread : result.threads) {
            LinearLayout card = new LinearLayout(activity);
            card.setOrientation(LinearLayout.VERTICAL);
            styleResultSpacing(card);
            boolean first=resultIndex++==0;
            card.setTag(RESULT_FIRST_TAG,first);
            int lineColor=background==Color.WHITE?Color.rgb(181,187,195):Color.rgb(105,113,124);
            card.setBackground(new ResultRules(first,lineColor,dp(1)));
            TextView title = resultText(thread.title, 16, foreground);
            card.addView(title);
            card.addView(resultText(thread.date, 12, muted));
            card.setOnClickListener(view -> {
                try {
                    saveState(null);
                    if (opener.open(thread.url)) return;
                    Haiagaru.reportEddiArchiveError(activity, "THREAD_OPEN_FAILED",
                            "ChMate could not open archive result: " + thread.url, null);
                    status.setText("スレを開けませんでした（THREAD_OPEN_FAILED）。診断ログを保存しました。");
                } catch (RuntimeException error) {
                    Haiagaru.reportEddiArchiveError(activity, "THREAD_OPEN_EXCEPTION",
                            "Archive result: " + thread.url, error);
                    status.setText("スレを開けませんでした（THREAD_OPEN_EXCEPTION）。診断ログを保存しました。");
                }
            });
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.bottomMargin = 0;
            card.setTag(RESULT_CARD_TAG,Boolean.TRUE);
            results.addView(card, params);
        }
        previous.setEnabled(page > 1);
        next.setEnabled(result.total < 0 ? result.hasNext
                : result.threads.size() == 50 && (long) page * 50 < result.total);
        HaiagaruUi.scrollTo(scroll, 0);
        if (restoreScrollY >= 0) {
            int position = restoreScrollY;
            restoreScrollY = -1;
            HaiagaruUi.scrollTo(scroll, position);
        }
    }

    private String resultStatus() {
        return (totalResults < 0 ? "検索結果 " + displayedPage.threads.size() + "件（このページ）"
                : "検索結果 " + totalResults + "件") + " · " + page + "ページ目";
    }

    private void updateProviderControls() {
        boolean original = provider.getSelectedItemPosition() != 1;
        // Kyodemo has no equivalent for these options; do not silently ignore an enabled control.
        for (View control : new View[]{exclude, orSearch, fuzzy, minimumReplies, sort})
            control.setVisibility(original ? View.VISIBLE : View.GONE);
        // The sort caption is paired with the Spinner by the Compose model renderer.
        ViewGroup advanced = (ViewGroup) advancedScroll.getChildAt(0);
        for (int i = 0; i < advanced.getChildCount(); i++) {
            View child = advanced.getChildAt(i);
            if (child instanceof TextView && "並び順".contentEquals(((TextView) child).getText()))
                child.setVisibility(original ? View.VISIBLE : View.GONE);
        }
    }

    /** Shared row boundaries: top only for the first result, bottom for every result. */
    private static final class ResultRules extends android.graphics.drawable.Drawable {
        final boolean first;final android.graphics.Paint paint=new android.graphics.Paint();final int thickness;
        ResultRules(boolean first,int color,int thickness){this.first=first;this.thickness=thickness;paint.setColor(color);}
        @Override public void draw(android.graphics.Canvas canvas){android.graphics.Rect b=getBounds();
            if(first)canvas.drawRect(b.left,b.top,b.right,b.top+thickness,paint);
            canvas.drawRect(b.left,b.bottom-thickness,b.right,b.bottom,paint);
        }
        @Override public void setAlpha(int alpha){paint.setAlpha(alpha);invalidateSelf();}
        @Override public void setColorFilter(android.graphics.ColorFilter filter){paint.setColorFilter(filter);invalidateSelf();}
        @Override public int getOpacity(){return android.graphics.PixelFormat.TRANSLUCENT;}
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
        controlTextSizes.put(view, (float) size);
        view.setTextSize(scaledTextSize(size, controlScale));
        view.setTextColor(color);
        return view;
    }

    private EditText input(String hint, boolean numeric) {
        EditText view = new EditText(activity);
        view.setHint(hint);
        view.setTextColor(foreground);
        view.setHintTextColor(muted);
        view.setSingleLine(true);
        controlTextSizes.put(view, 18f);
        view.setTextSize(scaledTextSize(18, controlScale));
        if (numeric) view.setInputType(InputType.TYPE_CLASS_NUMBER);
        return view;
    }

    private Switch toggle(String label) {
        Switch view = new Switch(activity);
        view.setText(label);
        view.setTextColor(foreground);
        controlTextSizes.put(view, 12f);
        view.setTextSize(scaledTextSize(12, controlScale));
        return view;
    }

    private Button button(String label) {
        Button view = new Button(activity);
        view.setText(label);
        view.setAllCaps(false);
        controlTextSizes.put(view, 14f);
        view.setTextSize(scaledTextSize(14, controlScale));
        return view;
    }

    static int clampTextScale(int scale) {
        return Math.max(70, Math.min(150, scale));
    }

    static float scaledTextSize(float baseSp, int scale) {
        return baseSp * clampTextScale(scale) / 100f;
    }

    private TextView resultText(String value, int size, int color) {
        TextView view = text(value, size, color);
        controlTextSizes.remove(view);
        resultTextSizes.put(view, (float) size);
        view.setTextSize(scaledTextSize(size, resultScale));
        return view;
    }

    private View styleSortText(View view) {
        if (view instanceof TextView) {
            ((TextView) view).setTextSize(scaledTextSize(16, controlScale));
            ((TextView) view).setTextColor(foreground);
            view.setBackgroundColor(background);
        }
        return view;
    }

    private void applyAppearance() {
        root.setTag(CONTROL_SCALE_TAG, controlScale);
        root.setTag(RESULT_SCALE_TAG, resultScale);
        root.setTag(CONTROL_LAYOUT_TAG, controlLayoutScale);
        int position = HaiagaruUi.scrollPosition(scroll);
        for (java.util.Map.Entry<TextView, Float> entry : controlTextSizes.entrySet()) {
            TextView view = entry.getKey();
            view.setTextSize(scaledTextSize(entry.getValue(), controlScale));
            // Remove the theme's fixed button/input minimum when compacting,
            // but keep usable touch targets and let larger fonts grow naturally.
            if (view instanceof Button || view instanceof EditText) {
                int minimum = dp(48);
                view.setMinimumHeight(minimum);
                view.setMinHeight(minimum);
                int vertical = Math.round(6 * controlLayoutScale / 100f);
                view.setPadding(dp(8), dp(vertical), dp(8), dp(vertical));
            }
        }
        for (java.util.Map.Entry<TextView, Float> entry : resultTextSizes.entrySet())
            entry.getKey().setTextSize(scaledTextSize(entry.getValue(), resultScale));
        for (int index = 0; index < results.getChildCount(); index++)
            styleResultSpacing(results.getChildAt(index));
        searchForm.setVisibility(hideSearchForm ? View.GONE : View.VISIBLE);
        advancedScroll.getLayoutParams().height = dp(Math.round(240 * controlScale / 100f));
        advancedScroll.requestLayout();
        sortAdapter.notifyDataSetChanged();
        HaiagaruUi.scrollTo(scroll, position);
    }

    private void showAppearanceSettings() {
        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(20), dp(8), dp(20), 0);
        SeekBar controls = sizeSlider(content, "検索欄・操作ボタン", controlScale);
        TextView densityLabel = new TextView(activity);
        densityLabel.setText("検索欄・操作ボタンの間隔: " + controlLayoutScale + "%");
        content.addView(densityLabel);
        SeekBar density = new SeekBar(activity);
        density.setMax(50);
        density.setProgress(controlLayoutScale - 50);
        density.setContentDescription("検索欄・操作ボタンの間隔");
        density.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                densityLabel.setText("検索欄・操作ボタンの間隔: " + (progress + 50) + "%");
            }
            @Override public void onStartTrackingTouch(SeekBar bar) { }
            @Override public void onStopTrackingTouch(SeekBar bar) { }
        });
        content.addView(density);
        SeekBar titles = sizeSlider(content, "検索結果の文字サイズ", resultScale);
        TextView spacingLabel = new TextView(activity);
        spacingLabel.setText("結果ごとの上下余白: " + resultPadding + "dp");
        content.addView(spacingLabel);
        SeekBar spacing = new SeekBar(activity);
        spacing.setMax(32);
        spacing.setProgress(resultPadding);
        spacing.setContentDescription("結果ごとの上下余白");
        spacing.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                spacingLabel.setText("結果ごとの上下余白: " + progress + "dp");
            }
            @Override public void onStartTrackingTouch(SeekBar bar) { }
            @Override public void onStopTrackingTouch(SeekBar bar) { }
        });
        content.addView(spacing);
        CheckBox hide = new CheckBox(activity);
        hide.setText("検索欄を隠して結果を広く表示");
        hide.setChecked(hideSearchForm);
        content.addView(hide);
        new HaiagaruDialog.Builder(activity).setTitle("過去ログ検索の表示設定")
                .setView(content).setNegativeButton("キャンセル", null)
                .setNeutralButton("標準に戻す", (dialog, which) -> saveAppearance(100, 100, 16, 100, false))
                .setPositiveButton("適用", (dialog, which) -> saveAppearance(
                        controls.getProgress() + 70, titles.getProgress() + 70,
                        spacing.getProgress(), density.getProgress() + 50, hide.isChecked()))
                .show();
    }

    private SeekBar sizeSlider(LinearLayout content, String title, int value) {
        TextView label = new TextView(activity);
        label.setText(title + ": " + value + "%");
        content.addView(label);
        SeekBar slider = new SeekBar(activity);
        slider.setMax(80);
        slider.setProgress(clampTextScale(value) - 70);
        slider.setContentDescription(title);
        slider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                label.setText(title + ": " + (progress + 70) + "%");
            }
            @Override public void onStartTrackingTouch(SeekBar bar) { }
            @Override public void onStopTrackingTouch(SeekBar bar) { }
        });
        content.addView(slider);
        return slider;
    }

    static int clampResultPadding(int value) {
        return Math.max(0, Math.min(32, value));
    }

    static int clampControlLayout(int value) {
        return Math.max(50, Math.min(100, value));
    }

    private void styleResultSpacing(View card) {
        card.setTag(RESULT_PADDING_TAG, resultPadding);
        card.setPadding(dp(12), dp(resultPadding), dp(12), dp(resultPadding));
        card.setMinimumHeight(dp(48));
    }

    private void saveAppearance(int controls, int titles, int padding, int layoutScale, boolean hide) {
        controlScale = clampTextScale(controls);
        resultScale = clampTextScale(titles);
        resultPadding = clampResultPadding(padding);
        controlLayoutScale = clampControlLayout(layoutScale);
        hideSearchForm = hide;
        activity.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                .putInt("controlTextScale", controlScale).putInt("resultTextScale", resultScale)
                .putInt("resultVerticalPadding", resultPadding)
                .putInt("controlLayoutScale", controlLayoutScale)
                .putBoolean("hideSearchForm", hideSearchForm).apply();
        applyAppearance();
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
        final boolean hasNext;
        SearchPage(List<ThreadResult> threads, int total) {
            this(threads, total, threads.size() == 50 && total > 50);
        }
        SearchPage(List<ThreadResult> threads, int total, boolean hasNext) {
            this.threads = threads;
            this.total = total;
            this.hasNext = hasNext;
        }
    }
}
