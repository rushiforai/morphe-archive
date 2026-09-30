package app.playerbridge.douban;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URLEncoder;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Loaded only after a real Douban MovieActivity2 is resumed.
 */
public final class DoubanPlayerBridgeRuntime {
    private static final String TAG = "DoubanPlayerBridge";
    private static final String CONTAINER_TAG = "douban_player_bridge_v2";
    private static final int STREMIO_COLOR = 0xFF7B5EA7;
    private static final int NUVIO_COLOR = 0xFF25282D;

    private static final Pattern DEEP_LINK_PATTERN = Pattern.compile(
            "(?:douban://douban\\.com/)?(movie|tv)/(\\d+)",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern SUBJECT_URL_PATTERN = Pattern.compile(
            "(?:movie\\.douban\\.com/subject/|subject/)(\\d+)",
            Pattern.CASE_INSENSITIVE
    );
    private static final Pattern YEAR_PATTERN =
            Pattern.compile("\\b(18|19|20)\\d{2}\\b");
    private static final Pattern IMDB_PATTERN =
            Pattern.compile("^tt\\d{5,12}$", Pattern.CASE_INSENSITIVE);

    private DoubanPlayerBridgeRuntime() {}

    public static void onMovieActivityResumed(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;

        try {
            attachButtons(activity);
        } catch (Throwable t) {
            Log.w(TAG, "UI attach failed", t);
        }
    }

    private static void attachButtons(Activity activity) {
        View content = activity.findViewById(android.R.id.content);
        if (!(content instanceof FrameLayout)) return;

        FrameLayout root = (FrameLayout) content;
        if (root.findViewWithTag(CONTAINER_TAG) != null) return;

        LinearLayout bar = new LinearLayout(activity);
        bar.setTag(CONTAINER_TAG);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setGravity(Gravity.CENTER);
        bar.setPadding(dp(activity, 8), dp(activity, 6), dp(activity, 8), dp(activity, 6));

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(0xE6FFFFFF);
        bg.setCornerRadius(dp(activity, 26));
        bar.setBackground(bg);
        bar.setElevation(dp(activity, 8));

        TextView stremio = makeButton(activity, "Stremio", STREMIO_COLOR);
        TextView nuvio = makeButton(activity, "Nuvio", NUVIO_COLOR);

        LinearLayout.LayoutParams a = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, dp(activity, 42));
        a.rightMargin = dp(activity, 8);
        stremio.setLayoutParams(a);
        nuvio.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, dp(activity, 42)));

        bar.addView(stremio);
        bar.addView(nuvio);

        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        lp.gravity = Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL;
        lp.bottomMargin = dp(activity, 78);
        root.addView(bar, lp);

        stremio.setOnClickListener(v -> resolveAndOpen(activity, false));
        nuvio.setOnClickListener(v -> resolveAndOpen(activity, true));

        View.OnLongClickListener debug = v -> {
            SubjectInfo info = extractSubjectInfo(activity);
            Toast.makeText(activity, info.debugSummary(), Toast.LENGTH_LONG).show();
            return true;
        };
        stremio.setOnLongClickListener(debug);
        nuvio.setOnLongClickListener(debug);
    }

    private static TextView makeButton(Context context, String text, int color) {
        TextView v = new TextView(context);
        v.setText(text);
        v.setTextColor(Color.WHITE);
        v.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        v.setGravity(Gravity.CENTER);
        v.setMinWidth(dp(context, 92));
        v.setPadding(dp(context, 18), 0, dp(context, 18), 0);
        GradientDrawable d = new GradientDrawable();
        d.setColor(color);
        d.setCornerRadius(dp(context, 22));
        v.setBackground(d);
        return v;
    }

    private static void resolveAndOpen(Activity activity, boolean nuvio) {
        final SubjectInfo info = extractSubjectInfo(activity);
        if (TextUtils.isEmpty(info.title)) {
            Toast.makeText(activity,
                    "暂时无法读取影片标题，长按按钮查看识别结果",
                    Toast.LENGTH_LONG).show();
            return;
        }

        Toast.makeText(activity, "正在匹配 IMDb…", Toast.LENGTH_SHORT).show();

        new Thread(() -> {
            Resolved resolved = null;
            try {
                resolved = resolveWithCinemeta(info);
            } catch (Throwable t) {
                Log.w(TAG, "Cinemeta lookup failed", t);
            }

            Resolved finalResolved = resolved;
            activity.runOnUiThread(() -> {
                if (activity.isFinishing() || activity.isDestroyed()) return;

                if (finalResolved == null) {
                    if (!nuvio) {
                        openStremioSearch(activity, info);
                    } else {
                        Toast.makeText(activity,
                                "未可靠匹配到 IMDb；请长按按钮查看识别结果",
                                Toast.LENGTH_LONG).show();
                    }
                    return;
                }

                String type = "series".equals(finalResolved.type) ? "series" : "movie";
                if (nuvio) {
                    launch(activity,
                            "nuvio://" + type + "/" + finalResolved.imdbId,
                            "没有检测到可处理 Nuvio 链接的应用");
                } else if ("series".equals(type)) {
                    launch(activity,
                            "stremio:///detail/series/" + finalResolved.imdbId,
                            "没有检测到可处理 Stremio 链接的应用");
                } else {
                    launch(activity,
                            "stremio:///detail/movie/" + finalResolved.imdbId +
                                    "/" + finalResolved.imdbId,
                            "没有检测到可处理 Stremio 链接的应用");
                }
            });
        }, "DoubanBridgeResolver").start();
    }

    private static SubjectInfo extractSubjectInfo(Activity activity) {
        SubjectInfo info = new SubjectInfo();

        try {
            Intent intent = activity.getIntent();
            if (intent != null) {
                scanString(intent.getDataString(), info);
                if (intent.getExtras() != null) {
                    for (String key : intent.getExtras().keySet()) {
                        Object value;
                        try {
                            value = intent.getExtras().get(key);
                        } catch (Throwable ignored) {
                            continue;
                        }
                        if (value instanceof CharSequence) {
                            String s = value.toString();
                            scanString(s, info);
                            String k = key == null ? "" : key.toLowerCase(Locale.US);
                            if ((k.contains("title") || k.contains("name")) &&
                                    looksLikeTitle(s) && TextUtils.isEmpty(info.title)) {
                                info.title = cleanTitle(s);
                            }
                            if (k.contains("year") && info.year == null) {
                                info.year = parseYear(s);
                            }
                        } else if (value instanceof Number) {
                            String k = key == null ? "" : key.toLowerCase(Locale.US);
                            long n = ((Number) value).longValue();
                            if (k.contains("year") && n >= 1800 && n <= 2100) {
                                info.year = (int) n;
                            } else if ((k.equals("id") || k.contains("subject")) &&
                                    n > 1000 && TextUtils.isEmpty(info.subjectId)) {
                                info.subjectId = Long.toString(n);
                            }
                        }
                    }
                }
            }
        } catch (Throwable t) {
            Log.d(TAG, "Intent scan failed", t);
        }

        scanVisibleText(activity, info);

        if (TextUtils.isEmpty(info.mediaType)) info.mediaType = "movie";
        return info;
    }

    private static void scanString(String text, SubjectInfo info) {
        if (TextUtils.isEmpty(text)) return;

        Matcher deep = DEEP_LINK_PATTERN.matcher(text);
        if (deep.find()) {
            info.mediaType = "tv".equalsIgnoreCase(deep.group(1)) ? "series" : "movie";
            info.subjectId = deep.group(2);
        }

        Matcher subject = SUBJECT_URL_PATTERN.matcher(text);
        if (subject.find() && TextUtils.isEmpty(info.subjectId)) {
            info.subjectId = subject.group(1);
        }

        if (info.year == null) info.year = parseYear(text);
    }

    private static void scanVisibleText(Activity activity, SubjectInfo info) {
        View decor = activity.getWindow().getDecorView();
        List<TextCandidate> all = new ArrayList<>();
        collectText(decor, all);

        Collections.sort(all,
                Comparator.comparingDouble((TextCandidate c) -> c.textSize).reversed()
                        .thenComparingInt(c -> c.y));

        for (TextCandidate c : all) {
            if (info.year == null) {
                Integer y = parseYear(c.text);
                if (y != null) info.year = y;
            }

            if (TextUtils.isEmpty(info.title) && looksLikeTitle(c.text)) {
                info.title = cleanTitle(c.text);
            }
        }
    }

    private static void collectText(View view, List<TextCandidate> out) {
        if (view == null || view.getVisibility() != View.VISIBLE) return;

        if (view instanceof TextView) {
            TextView tv = (TextView) view;
            CharSequence cs = tv.getText();
            if (cs != null) {
                String text = cs.toString().trim();
                if (!text.isEmpty() && text.length() <= 160) {
                    int[] pos = new int[2];
                    try { tv.getLocationOnScreen(pos); } catch (Throwable ignored) {}
                    out.add(new TextCandidate(text, tv.getTextSize(), pos[1]));
                }
            }
        }

        if (view instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) view;
            for (int i = 0; i < g.getChildCount(); i++) {
                collectText(g.getChildAt(i), out);
            }
        }
    }

    private static boolean looksLikeTitle(String raw) {
        if (TextUtils.isEmpty(raw)) return false;
        String s = raw.trim();
        if (s.length() > 120) return false;
        if (s.startsWith("http://") || s.startsWith("https://") ||
                s.startsWith("douban://")) return false;
        if (s.matches("[0-9.]+")) return false;

        String[] reject = {
                "想看", "看过", "写短评", "短评", "影评", "讨论",
                "简介", "演职员", "预告片", "剧照", "评分",
                "Stremio", "Nuvio", "豆瓣"
        };
        for (String r : reject) if (s.equals(r)) return false;
        return true;
    }

    private static String cleanTitle(String raw) {
        return raw.replaceAll("\\s*\\((18|19|20)\\d{2}\\)\\s*$", "").trim();
    }

    private static Integer parseYear(String text) {
        if (TextUtils.isEmpty(text)) return null;
        Matcher m = YEAR_PATTERN.matcher(text);
        if (!m.find()) return null;
        try {
            int y = Integer.parseInt(m.group());
            return y >= 1800 && y <= 2100 ? y : null;
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static Resolved resolveWithCinemeta(SubjectInfo info) throws Exception {
        String[] order = "series".equals(info.mediaType)
                ? new String[]{"series", "movie"}
                : new String[]{"movie", "series"};

        Candidate best = null;
        for (String type : order) {
            List<Candidate> candidates = searchCinemeta(type, info.title);
            for (int i = 0; i < candidates.size(); i++) {
                Candidate c = candidates.get(i);
                c.score = score(c, info, type, i);
                if (best == null || c.score > best.score) best = c;
            }
            if (best != null && best.score >= 115) break;
        }

        if (best == null || best.score < 45) return null;
        return new Resolved(best.imdbId, best.type);
    }

    private static List<Candidate> searchCinemeta(String type, String title) throws Exception {
        String encoded = URLEncoder.encode(title, "UTF-8").replace("+", "%20");
        URL url = new URL("https://v3-cinemeta.strem.io/catalog/" +
                type + "/top/search=" + encoded + ".json");

        HttpURLConnection c = (HttpURLConnection) url.openConnection();
        c.setConnectTimeout(4500);
        c.setReadTimeout(5500);
        c.setRequestProperty("Accept", "application/json");

        if (c.getResponseCode() < 200 || c.getResponseCode() >= 300) {
            c.disconnect();
            return Collections.emptyList();
        }

        String body;
        try (InputStream in = c.getInputStream()) {
            body = readAll(in);
        } finally {
            c.disconnect();
        }

        JSONArray metas = new JSONObject(body).optJSONArray("metas");
        if (metas == null) return Collections.emptyList();

        List<Candidate> out = new ArrayList<>();
        for (int i = 0; i < Math.min(12, metas.length()); i++) {
            JSONObject o = metas.optJSONObject(i);
            if (o == null) continue;
            String id = o.optString("id", "");
            if (!IMDB_PATTERN.matcher(id).matches()) continue;

            String name = o.optString("name", "");
            Integer year = parseYear(o.optString("releaseInfo", ""));
            if (year == null) year = parseYear(String.valueOf(o.opt("year")));

            String t = normalizeType(o.optString("type", type));
            out.add(new Candidate(id.toLowerCase(Locale.US), t, name, year));
        }
        return out;
    }

    private static int score(Candidate c, SubjectInfo info, String requestedType, int rank) {
        int score = 0;
        String a = normalize(info.title);
        String b = normalize(c.name);
        if (a.equals(b)) score += 90;
        else if (!a.isEmpty() && (a.contains(b) || b.contains(a))) score += 45;

        if (info.year != null && c.year != null) {
            int delta = Math.abs(info.year - c.year);
            if (delta == 0) score += 55;
            else if (delta == 1) score += 25;
            else if (delta > 2) score -= 20;
        }

        if (requestedType.equals(c.type)) score += 15;
        if (info.mediaType.equals(c.type)) score += 15;
        score += Math.max(0, 10 - rank);
        return score;
    }

    private static String normalize(String raw) {
        if (raw == null) return "";
        return Normalizer.normalize(raw, Normalizer.Form.NFKD)
                .toLowerCase(Locale.US)
                .replaceAll("[^\\p{L}\\p{N}]+", " ")
                .trim()
                .replaceAll("\\s+", " ");
    }

    private static String normalizeType(String raw) {
        String s = raw == null ? "" : raw.toLowerCase(Locale.US);
        return (s.contains("series") || s.contains("show") || s.contains("tv"))
                ? "series" : "movie";
    }

    private static String readAll(InputStream in) throws Exception {
        BufferedReader r = new BufferedReader(
                new InputStreamReader(in, StandardCharsets.UTF_8));
        StringBuilder b = new StringBuilder();
        char[] buf = new char[4096];
        int n;
        while ((n = r.read(buf)) != -1) {
            b.append(buf, 0, n);
            if (b.length() > 2_000_000) break;
        }
        return b.toString();
    }

    private static void openStremioSearch(Activity activity, SubjectInfo info) {
        try {
            String query = info.title + (info.year == null ? "" : " " + info.year);
            String encoded = URLEncoder.encode(query, "UTF-8").replace("+", "%20");
            launch(activity, "stremio:///search?search=" + encoded,
                    "没有检测到可处理 Stremio 链接的应用");
        } catch (Throwable t) {
            Log.w(TAG, "Search deep link failed", t);
        }
    }

    private static void launch(Activity activity, String uri, String error) {
        try {
            activity.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(uri)));
        } catch (ActivityNotFoundException e) {
            Toast.makeText(activity, error, Toast.LENGTH_LONG).show();
        }
    }

    private static int dp(Context context, int value) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics());
    }

    private static final class SubjectInfo {
        String subjectId;
        String title;
        String mediaType;
        Integer year;

        String debugSummary() {
            return "豆瓣识别结果\n" +
                    "ID: " + (subjectId == null ? "?" : subjectId) + "\n" +
                    "标题: " + (title == null ? "?" : title) + "\n" +
                    "年份: " + (year == null ? "?" : year) + "\n" +
                    "类型: " + (mediaType == null ? "?" : mediaType);
        }
    }

    private static final class Resolved {
        final String imdbId;
        final String type;
        Resolved(String imdbId, String type) {
            this.imdbId = imdbId;
            this.type = type;
        }
    }

    private static final class Candidate {
        final String imdbId;
        final String type;
        final String name;
        final Integer year;
        int score;
        Candidate(String imdbId, String type, String name, Integer year) {
            this.imdbId = imdbId;
            this.type = type;
            this.name = name;
            this.year = year;
        }
    }

    private static final class TextCandidate {
        final String text;
        final float textSize;
        final int y;
        TextCandidate(String text, float textSize, int y) {
            this.text = text;
            this.textSize = textSize;
            this.y = y;
        }
    }
}
