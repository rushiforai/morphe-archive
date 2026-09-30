package com.feixiangdao.doubanplayerbridge;

import android.accessibilityservice.AccessibilityService;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ResolveInfo;
import android.graphics.Color;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DoubanAccessibilityService extends AccessibilityService {
    private static final String TAG = "DoubanPlayerBridge";
    private static final String DOUBAN_PACKAGE = "com.douban.frodo";
    private static final String SELF_PACKAGE =
            "com.feixiangdao.doubanplayerbridge";
    private static final String NUVIO_PACKAGE = "com.nuvio.app";
    private static final String NUVIO_ACTIVITY = "com.nuvio.app.MainActivity";

    // A real app switch should remove the overlay almost immediately.
    // A transient Douban accessibility-tree refresh gets a separate grace
    // window to avoid the old flicker problem.
    private static final long EXTERNAL_APP_HIDE_MS = 120L;
    private static final long TREE_REFRESH_HIDE_MS = 900L;

    private static final Pattern YEAR =
            Pattern.compile("(?:\\(|（)?\\b((?:18|19|20)\\d{2})\\b(?:\\)|）)?");
    private static final Pattern EXACT_YEAR =
            Pattern.compile("^[（(]?((?:18|19|20)\\d{2})[）)]?$");
    private static final Pattern TITLE_WITH_TRAILING_YEAR =
            Pattern.compile("^(.+?)\\s*[（(]((?:18|19|20)\\d{2})[）)]$");

    private static final Set<String> EXACT_REJECT = new HashSet<>();
    static {
        Collections.addAll(EXACT_REJECT,
                "豆瓣", "首页", "书影音", "广播", "小组", "市集", "我的",
                "想看", "看过", "短评", "影评", "讨论", "简介", "演职员",
                "预告片", "剧照", "评分", "更多", "全部", "展开", "收起",
                "分享", "写短评", "写影评", "举报", "Stremio", "Nuvio",
                "电影", "电视剧", "剧集", "综艺", "纪录片", "动画",
                "热门电影", "热门电视剧", "全部电影", "全部电视剧");
    }

    private final Handler main = new Handler(Looper.getMainLooper());
    private final ExecutorService worker = Executors.newSingleThreadExecutor();

    private WindowManager windowManager;
    private View overlay;
    private TextView overlayStatus;
    private TextView stremioButton;
    private TextView nuvioButton;
    private TextView infoButton;

    private MediaInfo currentInfo;
    private TmdbResolver.Result currentResolved;
    private String currentResolveKey;
    private String resolveDiagnostic = "尚未开始匹配";
    private boolean resolving;
    private boolean imdbLoading;

    private String lastDoubanWindowClass;
    private long lastDoubanEventAt;

    private final Runnable scanRunnable = this::scanCurrentWindow;
    private final Runnable hideRunnable = this::hideOverlay;

    @Override
    protected void onServiceConnected() {
        super.onServiceConnected();
        windowManager = (WindowManager) getSystemService(WINDOW_SERVICE);
    }

    @Override
    public void onAccessibilityEvent(AccessibilityEvent event) {
        if (event == null) return;

        CharSequence pkgCs = event.getPackageName();
        String pkg = pkgCs == null ? "" : pkgCs.toString();

        if (SELF_PACKAGE.equals(pkg)) return;

        if (DOUBAN_PACKAGE.equals(pkg)) {
            lastDoubanEventAt = android.os.SystemClock.uptimeMillis();
            main.removeCallbacks(hideRunnable);

            if (event.getEventType() ==
                    AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED) {
                CharSequence cls = event.getClassName();
                if (cls != null) lastDoubanWindowClass = cls.toString();
            }

            main.removeCallbacks(scanRunnable);
            main.postDelayed(scanRunnable, 320);
            return;
        }

        if (event.getEventType() ==
                AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED) {
            main.removeCallbacks(hideRunnable);
            main.postDelayed(hideRunnable, EXTERNAL_APP_HIDE_MS);
        }
    }

    @Override
    public void onInterrupt() {
        hideOverlay();
    }

    @Override
    public void onDestroy() {
        hideOverlay();
        worker.shutdownNow();
        super.onDestroy();
    }

    private void scanCurrentWindow() {
        AccessibilityNodeInfo root = getRootInActiveWindow();
        if (root == null) {
            scheduleGracefulHide();
            return;
        }

        List<NodeText> entries = new ArrayList<>();
        int[] counter = new int[]{0};
        collect(root, entries, counter, 0);

        if (!isMovieDetail(entries)) {
            if (overlay != null) scheduleGracefulHide();
            else hideOverlay();
            return;
        }

        MediaInfo info = extractMediaInfo(entries);
        if (info == null || TextUtils.isEmpty(info.title)) {
            if (overlay != null && currentInfo != null) {
                main.removeCallbacks(hideRunnable);
            } else {
                scheduleGracefulHide();
            }
            return;
        }

        main.removeCallbacks(hideRunnable);

        String oldKey = currentInfo == null ? null : currentInfo.cacheKey();
        String newKey = info.cacheKey();
        currentInfo = info;
        showOrUpdateOverlay();

        if (!newKey.equals(oldKey)) {
            currentResolved = null;
            currentResolveKey = newKey;
            resolveDiagnostic = "等待 TMDB 匹配";
            resolving = false;
            imdbLoading = false;
            beginPreResolve(info);
        } else {
            updateOverlayState();
        }
    }

    private boolean isMovieDetail(List<NodeText> entries) {
        boolean want = false;
        boolean seen = false;
        int markers = 0;

        for (NodeText entry : entries) {
            String t = entry.text;
            if ("想看".equals(t)) want = true;
            if ("看过".equals(t)) seen = true;
            if ("短评".equals(t) || "影评".equals(t) || "演职员".equals(t) ||
                    "预告片".equals(t) || "剧照".equals(t) || "简介".equals(t)) {
                markers++;
            }
        }

        boolean classMatch = lastDoubanWindowClass != null &&
                (lastDoubanWindowClass.contains("MovieActivity2") ||
                        lastDoubanWindowClass.contains(".subject."));

        return (want && seen && markers >= 1) || classMatch;
    }

    private MediaInfo extractMediaInfo(List<NodeText> entries) {
        DisplayMetrics dm = getResources().getDisplayMetrics();
        int screenHeight = dm.heightPixels;
        int maxTitleArea = (int) (screenHeight * 0.52f);

        /*
         * Douban commonly exposes two title layouts:
         *
         *   好久没做
         *   LTNS (2024)
         *
         * or:
         *
         *   奥德赛
         *   The Odyssey (2026)
         *
         * TITLE_WITH_TRAILING_YEAR is a much stronger signal than generic
         * labels such as "喜剧类韩剧榜", so always prefer it when present.
         */
        NodeText inlineTitleYearNode = null;
        String inlineAlias = null;
        Integer inlineYear = null;
        int inlineScore = Integer.MIN_VALUE;

        for (NodeText entry : entries) {
            int y = entry.bounds.centerY();
            if (y <= 0 || y > maxTitleArea) continue;

            Matcher matcher = TITLE_WITH_TRAILING_YEAR.matcher(entry.text.trim());
            if (!matcher.matches()) continue;

            String titlePart = matcher.group(1).trim();
            if (!looksLikeTitle(titlePart)) continue;

            int score = 500;
            score += Math.min(100, entry.bounds.height() * 2);
            score += Math.min(70, entry.bounds.width() / 5);
            if (y < screenHeight * 0.35f) score += 60;

            String id = entry.viewId == null ? "" :
                    entry.viewId.toLowerCase(Locale.US);
            if (id.contains("title")) score += 100;
            if (id.contains("subject")) score += 30;

            if (score > inlineScore) {
                inlineScore = score;
                inlineTitleYearNode = entry;
                inlineAlias = titlePart;
                try {
                    inlineYear = Integer.valueOf(matcher.group(2));
                } catch (Exception ignored) {
                    inlineYear = null;
                }
            }
        }

        if (inlineTitleYearNode != null) {
            NodeText primary = null;
            int primaryScore = Integer.MIN_VALUE;

            for (NodeText candidate : entries) {
                if (candidate == inlineTitleYearNode) continue;

                int cy = candidate.bounds.centerY();
                if (cy <= 0 || cy >= inlineTitleYearNode.bounds.centerY()) continue;

                int verticalGap =
                        inlineTitleYearNode.bounds.top - candidate.bounds.bottom;
                if (verticalGap < -dp(18) || verticalGap > dp(130)) continue;

                int horizontal = Math.abs(
                        candidate.bounds.left - inlineTitleYearNode.bounds.left);
                if (horizontal > dm.widthPixels * 0.45f) continue;

                String value = cleanTitle(candidate.text);
                if (!looksLikeTitle(value)) continue;
                if (isLikelySectionOrRankingLabel(value)) continue;

                int score = 260;
                score -= Math.max(0, verticalGap);
                score -= horizontal / 5;
                score += Math.min(100, candidate.bounds.height() * 2);
                score += Math.min(60, candidate.bounds.width() / 5);

                String id = candidate.viewId == null ? "" :
                        candidate.viewId.toLowerCase(Locale.US);
                if (id.contains("title")) score += 100;
                if (id.contains("subject")) score += 30;

                if (score > primaryScore) {
                    primaryScore = score;
                    primary = candidate;
                }
            }

            MediaInfo info = new MediaInfo();
            info.title = primary != null
                    ? cleanTitle(primary.text)
                    : inlineAlias;
            info.year = inlineYear;

            if (!TextUtils.isEmpty(inlineAlias) &&
                    !inlineAlias.equals(info.title)) {
                info.aliases.add(inlineAlias);
            }

            info.preferredType = detectMediaType(entries);
            return info;
        }

        // Older/alternate layout: title and "(YYYY)" are separate nodes.
        List<NodeText> yearAnchors = new ArrayList<>();
        for (NodeText entry : entries) {
            int y = entry.bounds.centerY();
            if (y <= 0 || y > maxTitleArea) continue;
            if (EXACT_YEAR.matcher(entry.text.trim()).matches()) {
                yearAnchors.add(entry);
            }
        }
        yearAnchors.sort(Comparator.comparingInt(a -> a.bounds.centerY()));

        NodeText bestTitle = null;
        NodeText bestYear = null;
        int bestScore = Integer.MIN_VALUE;

        for (NodeText anchor : yearAnchors) {
            for (NodeText candidate : entries) {
                if (candidate == anchor) continue;

                String title = cleanTitle(candidate.text);
                if (!looksLikeTitle(title)) continue;
                if (isLikelySectionOrRankingLabel(title)) continue;

                int cy = candidate.bounds.centerY();
                if (cy <= 0 || cy >= anchor.bounds.centerY()) continue;

                int gap = anchor.bounds.top - candidate.bounds.bottom;
                if (gap < -dp(22) || gap > dp(180)) continue;

                int horizontal = Math.abs(
                        candidate.bounds.left - anchor.bounds.left);
                if (horizontal > dm.widthPixels * 0.58f) continue;

                int score = 320;
                score -= Math.max(0, gap);
                score -= horizontal / 6;
                score += Math.min(100, candidate.bounds.height() * 2);
                score += Math.min(65, candidate.bounds.width() / 5);

                String id = candidate.viewId == null ? "" :
                        candidate.viewId.toLowerCase(Locale.US);
                if (id.contains("title")) score += 100;
                if (id.contains("subject")) score += 30;

                if (score > bestScore) {
                    bestScore = score;
                    bestTitle = candidate;
                    bestYear = anchor;
                }
            }
            if (bestTitle != null) break;
        }

        // Last-resort fallback. Ranking/section labels are excluded here too.
        if (bestTitle == null) {
            for (NodeText entry : entries) {
                int y = entry.bounds.centerY();
                if (y <= 0 || y > maxTitleArea) continue;

                String title = cleanTitle(entry.text);
                if (!looksLikeTitle(title)) continue;
                if (isLikelySectionOrRankingLabel(title)) continue;

                String id = entry.viewId == null ? "" :
                        entry.viewId.toLowerCase(Locale.US);

                int score = 0;
                if (id.contains("title")) score += 240;
                if (id.contains("subject")) score += 70;
                if (id.contains("name")) score += 35;

                // A node that itself contains a year is much more likely to be
                // the actual title than a badge/list label.
                if (parseYear(entry.text) != null) score += 180;

                score += Math.min(95, entry.bounds.height() * 2);
                score += Math.min(55, entry.bounds.width() / 6);
                if (y < screenHeight * 0.35f) score += 45;

                if (score > bestScore) {
                    bestScore = score;
                    bestTitle = entry;
                }
            }
        }

        if (bestTitle == null) return null;

        MediaInfo info = new MediaInfo();
        info.title = cleanTitle(bestTitle.text);
        info.year = bestYear != null
                ? parseYear(bestYear.text)
                : parseYear(bestTitle.text);

        if (info.year == null && !yearAnchors.isEmpty()) {
            info.year = parseYear(yearAnchors.get(0).text);
        }

        info.preferredType = detectMediaType(entries);
        return info;
    }

    private String detectMediaType(List<NodeText> entries) {
        for (NodeText entry : entries) {
            String t = entry.text;
            if (t.contains("集数") || t.contains("单集片长") ||
                    t.contains("季数") || t.contains("电视剧") ||
                    t.contains("剧集")) {
                return "series";
            }
        }
        return "movie";
    }

    private boolean isLikelySectionOrRankingLabel(String value) {
        if (TextUtils.isEmpty(value)) return true;

        String s = value.trim();
        String lower = s.toLowerCase(Locale.US);

        return s.contains("榜") ||
                s.contains("热门") ||
                s.contains("评分最高") ||
                s.contains("最值得期待") ||
                s.contains("豆瓣") ||
                s.contains("人气") ||
                lower.startsWith("no.") ||
                lower.startsWith("no。");
    }

    private void beginPreResolve(MediaInfo info) {
        String credential = tmdbCredential();
        currentResolveKey = info.cacheKey();

        if (TextUtils.isEmpty(credential)) {
            resolving = false;
            currentResolved = null;
            resolveDiagnostic = "TMDB Key 未设置";
            updateOverlayState();
            return;
        }

        TmdbResolver.Result cached = readTmdbCache(info);
        if (cached != null) {
            currentResolved = cached;
            resolving = false;
            resolveDiagnostic = "使用本地缓存：TMDB " + cached.tmdbId;
            updateOverlayState();

            if (TextUtils.isEmpty(cached.imdbId)) {
                fetchImdbInBackground(info, cached, credential);
            }
            return;
        }

        resolving = true;
        currentResolved = null;
        resolveDiagnostic = "TMDB 搜索中…";
        updateOverlayState();

        final String expectedKey = currentResolveKey;
        worker.execute(() -> {
            TmdbResolver.Lookup lookup;
            try {
                lookup = TmdbResolver.resolveFast(info, credential);
            } catch (Throwable error) {
                lookup = new TmdbResolver.Lookup(
                        null,
                        compactError(error)
                );
                Log.w(TAG, "TMDB resolve failed", error);
            }

            final TmdbResolver.Lookup finalLookup = lookup;
            main.post(() -> {
                if (currentInfo == null ||
                        !expectedKey.equals(currentInfo.cacheKey())) {
                    return;
                }

                resolving = false;
                currentResolved = finalLookup.result;
                resolveDiagnostic = finalLookup.message;

                if (currentResolved != null) {
                    writeTmdbCache(info, currentResolved);
                }

                updateOverlayState();

                if (currentResolved != null) {
                    fetchImdbInBackground(
                            info,
                            currentResolved,
                            credential
                    );
                }
            });
        });
    }

    private void fetchImdbInBackground(
            MediaInfo info,
            TmdbResolver.Result base,
            String credential
    ) {
        if (imdbLoading || base == null || !TextUtils.isEmpty(base.imdbId)) {
            return;
        }

        imdbLoading = true;
        final String expectedKey = info.cacheKey();
        final long expectedTmdb = base.tmdbId;

        worker.execute(() -> {
            String imdb = null;
            try {
                imdb = TmdbResolver.fetchImdbId(base, credential);
            } catch (Throwable error) {
                Log.w(TAG, "IMDb external-id fetch failed", error);
            }

            final String finalImdb = imdb;
            main.post(() -> {
                imdbLoading = false;

                if (currentInfo == null ||
                        !expectedKey.equals(currentInfo.cacheKey()) ||
                        currentResolved == null ||
                        currentResolved.tmdbId != expectedTmdb) {
                    return;
                }

                if (!TextUtils.isEmpty(finalImdb)) {
                    currentResolved = currentResolved.withImdb(finalImdb);
                    writeTmdbCache(currentInfo, currentResolved);
                }

                updateOverlayState();
            });
        });
    }

    private void updateOverlayState() {
        if (overlayStatus == null || currentInfo == null) return;

        String media = currentInfo.title +
                (currentInfo.year == null ? "" : " (" + currentInfo.year + ")");

        if (TextUtils.isEmpty(tmdbCredential())) {
            overlayStatus.setText(media + " · 请先设置 TMDB Key");
            styleReady(stremioButton, true);
            styleReady(nuvioButton, false);
            return;
        }

        if (resolving) {
            overlayStatus.setText(media + " · TMDB 匹配中…");
            styleReady(stremioButton, false);
            styleReady(nuvioButton, false);
            return;
        }

        if (currentResolved == null) {
            overlayStatus.setText(media + " · " + resolveDiagnostic);
            styleReady(stremioButton, true);
            styleReady(nuvioButton, false);
            return;
        }

        overlayStatus.setText(
                media + " → " + currentResolved.title +
                        " · TMDB " + currentResolved.tmdbId
        );

        styleReady(stremioButton, true);
        styleReady(nuvioButton, true);
    }

    /**
     * Keep controls clickable even when visually "not ready" so users always
     * receive an immediate explanatory Toast instead of a dead button.
     */
    private void styleReady(TextView button, boolean ready) {
        if (button == null) return;
        button.setEnabled(true);
        button.setAlpha(ready ? 1.0f : 0.42f);
    }

    private void onStremioClick() {
        if (currentInfo == null) {
            Toast.makeText(this, "尚未识别当前影片", Toast.LENGTH_SHORT).show();
            return;
        }

        if (resolving) {
            Toast.makeText(this, "TMDB 正在匹配，请稍候", Toast.LENGTH_SHORT).show();
            return;
        }

        if (currentResolved != null &&
                !TextUtils.isEmpty(currentResolved.imdbId)) {
            String uri = "series".equals(currentResolved.type)
                    ? "stremio:///detail/series/" + currentResolved.imdbId
                    : "stremio:///detail/movie/" + currentResolved.imdbId +
                    "/" + currentResolved.imdbId;
            launchStremio(uri);
            return;
        }

        openStremioSearch(currentInfo);
    }

    private void onNuvioClick() {
        if (resolving) {
            Toast.makeText(this, "TMDB 正在匹配，请稍候", Toast.LENGTH_SHORT).show();
            return;
        }

        if (currentResolved == null) {
            Toast.makeText(
                    this,
                    "Nuvio 未启用：没有可靠 TMDB 匹配",
                    Toast.LENGTH_SHORT
            ).show();
            return;
        }

        launchNuvio(currentResolved.type, currentResolved.tmdbId);
    }

    private void launchNuvio(String type, long tmdbId) {
        Uri uri = new Uri.Builder()
                .scheme("nuvio")
                .authority("meta")
                .appendQueryParameter("type", type)
                .appendQueryParameter("id", "tmdb:" + tmdbId)
                .build();

        Intent intent = new Intent(Intent.ACTION_VIEW, uri);
        intent.setClassName(NUVIO_PACKAGE, NUVIO_ACTIVITY);
        intent.addFlags(
                Intent.FLAG_ACTIVITY_NEW_TASK |
                Intent.FLAG_ACTIVITY_CLEAR_TASK
        );

        // The destination app is about to take over the screen, so remove the
        // overlay now instead of waiting for accessibility window events.
        hideOverlay();

        try {
            startActivity(intent);
        } catch (Throwable first) {
            try {
                Intent fallback = new Intent(Intent.ACTION_VIEW, uri);
                fallback.setClassName(NUVIO_PACKAGE, NUVIO_ACTIVITY);
                fallback.addFlags(
                        Intent.FLAG_ACTIVITY_NEW_TASK |
                        Intent.FLAG_ACTIVITY_CLEAR_TOP |
                        Intent.FLAG_ACTIVITY_SINGLE_TOP
                );
                startActivity(fallback);
            } catch (Throwable second) {
                Toast.makeText(
                        this,
                        "无法打开 Nuvio：" + second.getClass().getSimpleName(),
                        Toast.LENGTH_LONG
                ).show();
            }
        }
    }

    private void launchStremio(String uri) {
        Intent base = new Intent(Intent.ACTION_VIEW, Uri.parse(uri));
        base.addFlags(
                Intent.FLAG_ACTIVITY_NEW_TASK |
                Intent.FLAG_ACTIVITY_CLEAR_TOP |
                Intent.FLAG_ACTIVITY_SINGLE_TOP
        );

        String packageName = resolveStremioPackage(base);
        if (packageName == null) {
            Toast.makeText(this, "没有检测到 Stremio", Toast.LENGTH_LONG).show();
            return;
        }

        base.setPackage(packageName);
        hideOverlay();
        try {
            startActivity(base);
        } catch (Throwable error) {
            Toast.makeText(
                    this,
                    "Stremio 跳转失败：" + error.getClass().getSimpleName(),
                    Toast.LENGTH_LONG
            ).show();
        }
    }

    private String resolveStremioPackage(Intent intent) {
        List<ResolveInfo> handlers = getPackageManager()
                .queryIntentActivities(intent, 0);

        String fallback = null;
        for (ResolveInfo info : handlers) {
            if (info.activityInfo == null) continue;
            String pkg = info.activityInfo.packageName;
            if (NUVIO_PACKAGE.equals(pkg) || SELF_PACKAGE.equals(pkg)) continue;

            String lower = pkg.toLowerCase(Locale.US);
            if (lower.contains("stremio")) return pkg;
            if (fallback == null) fallback = pkg;
        }
        return fallback;
    }

    private void openStremioSearch(MediaInfo info) {
        try {
            String query = info.title +
                    (info.year == null ? "" : " " + info.year);
            String encoded = URLEncoder.encode(query, "UTF-8")
                    .replace("+", "%20");
            launchStremio("stremio:///search?search=" + encoded);
        } catch (Exception e) {
            Toast.makeText(
                    this,
                    "无法生成 Stremio 搜索链接",
                    Toast.LENGTH_LONG
            ).show();
        }
    }

    private void showOrUpdateOverlay() {
        if (windowManager == null) return;

        if (overlay == null) {
            overlay = buildOverlay();

            WindowManager.LayoutParams lp = new WindowManager.LayoutParams(
                    WindowManager.LayoutParams.WRAP_CONTENT,
                    WindowManager.LayoutParams.WRAP_CONTENT,
                    WindowManager.LayoutParams.TYPE_ACCESSIBILITY_OVERLAY,
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE |
                            WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL |
                            WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN,
                    PixelFormat.TRANSLUCENT
            );
            lp.gravity = Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL;
            lp.y = dp(82);

            try {
                windowManager.addView(overlay, lp);
            } catch (Throwable error) {
                Log.w(TAG, "Failed to add accessibility overlay", error);
                overlay = null;
            }
        }

        updateOverlayState();
    }

    private View buildOverlay() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setGravity(Gravity.CENTER);
        card.setPadding(dp(9), dp(7), dp(9), dp(7));

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(0xF2FFFFFF);
        bg.setCornerRadius(dp(24));
        bg.setStroke(dp(1), 0x26000000);
        card.setBackground(bg);
        card.setElevation(dp(9));

        overlayStatus = new TextView(this);
        overlayStatus.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
        overlayStatus.setTextColor(0xFF333333);
        overlayStatus.setGravity(Gravity.CENTER);
        overlayStatus.setMaxLines(2);
        overlayStatus.setPadding(dp(6), 0, dp(6), dp(5));
        card.addView(
                overlayStatus,
                new LinearLayout.LayoutParams(
                        dp(280),
                        LinearLayout.LayoutParams.WRAP_CONTENT)
        );

        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER);

        stremioButton = makeButton("Stremio", 0xFF7B5EA7);
        nuvioButton = makeButton("Nuvio", 0xFF25282D);
        infoButton = makeButton("ⓘ", 0xFF5D6470);

        LinearLayout.LayoutParams stremioLp =
                new LinearLayout.LayoutParams(dp(108), dp(42));
        stremioLp.rightMargin = dp(7);
        row.addView(stremioButton, stremioLp);

        LinearLayout.LayoutParams nuvioLp =
                new LinearLayout.LayoutParams(dp(92), dp(42));
        nuvioLp.rightMargin = dp(7);
        row.addView(nuvioButton, nuvioLp);

        row.addView(
                infoButton,
                new LinearLayout.LayoutParams(dp(46), dp(42))
        );

        card.addView(row);

        stremioButton.setOnClickListener(v -> onStremioClick());
        nuvioButton.setOnClickListener(v -> onNuvioClick());
        infoButton.setOnClickListener(v -> showDebugInfo());
        overlayStatus.setOnClickListener(v -> showDebugInfo());

        return card;
    }

    private void showDebugInfo() {
        StringBuilder message = new StringBuilder();

        if (currentInfo != null) {
            message.append(currentInfo.debugText());
        } else {
            message.append("尚未识别影片");
        }

        message.append("\n状态: ").append(resolveDiagnostic);

        if (currentResolved != null) {
            message.append("\nTMDB: ")
                    .append(currentResolved.tmdbId)
                    .append("\nTMDB标题: ")
                    .append(currentResolved.title)
                    .append("\nTMDB年份: ")
                    .append(currentResolved.year == null
                            ? "?" : currentResolved.year)
                    .append("\nIMDb: ")
                    .append(TextUtils.isEmpty(currentResolved.imdbId)
                            ? (imdbLoading ? "同步中…" : "?")
                            : currentResolved.imdbId);
        }

        Toast.makeText(
                this,
                message.toString(),
                Toast.LENGTH_LONG
        ).show();
    }

    private TextView makeButton(String label, int color) {
        TextView v = new TextView(this);
        v.setText(label);
        v.setTextColor(Color.WHITE);
        v.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        v.setGravity(Gravity.CENTER);
        v.setTypeface(v.getTypeface(), android.graphics.Typeface.BOLD);

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(color);
        bg.setCornerRadius(dp(21));
        v.setBackground(bg);
        return v;
    }

    private String tmdbCredential() {
        return getSharedPreferences(
                MainActivity.SETTINGS_PREFS,
                MODE_PRIVATE
        ).getString(MainActivity.TMDB_CREDENTIAL_KEY, "").trim();
    }

    private TmdbResolver.Result readTmdbCache(MediaInfo info) {
        String raw = cachePrefs().getString("tmdb5:" + info.cacheKey(), null);
        if (raw == null) return null;

        String[] parts = raw.split("\\|", 5);
        if (parts.length < 3) return null;

        try {
            long tmdbId = Long.parseLong(parts[0]);
            String type = parts[1];
            Integer year = TextUtils.isEmpty(parts[2])
                    ? null : Integer.valueOf(parts[2]);
            String imdb = parts.length >= 4 && !TextUtils.isEmpty(parts[3])
                    ? parts[3] : null;
            String title = parts.length >= 5 ? parts[4] : info.title;

            if (info.year != null && year != null &&
                    Math.abs(info.year - year) > 1) {
                return null;
            }

            return new TmdbResolver.Result(
                    tmdbId, type, title, year, imdb);
        } catch (Exception e) {
            return null;
        }
    }

    private void writeTmdbCache(
            MediaInfo info,
            TmdbResolver.Result result
    ) {
        cachePrefs().edit()
                .putString(
                        "tmdb5:" + info.cacheKey(),
                        result.tmdbId + "|" +
                                result.type + "|" +
                                (result.year == null ? "" : result.year) + "|" +
                                (result.imdbId == null ? "" : result.imdbId) + "|" +
                                sanitizeCacheText(result.title)
                )
                .apply();
    }

    private String sanitizeCacheText(String value) {
        return value == null ? "" : value.replace("|", " ");
    }

    private SharedPreferences cachePrefs() {
        return getSharedPreferences(
                "douban_player_bridge_cache",
                Context.MODE_PRIVATE);
    }

    private String compactError(Throwable error) {
        if (error == null) return "未知错误";
        String msg = error.getMessage();
        if (TextUtils.isEmpty(msg)) {
            msg = error.getClass().getSimpleName();
        }
        if (msg.length() > 140) msg = msg.substring(0, 140);
        return msg;
    }

    private void collect(
            AccessibilityNodeInfo node,
            List<NodeText> out,
            int[] counter,
            int depth
    ) {
        if (node == null || counter[0] >= 650 || depth > 45) return;
        counter[0]++;

        String viewId = null;
        try {
            viewId = node.getViewIdResourceName();
        } catch (Throwable ignored) {}

        CharSequence text = node.getText();
        if (text != null) {
            addNodeText(text.toString(), viewId, node, out);
        }

        CharSequence desc = node.getContentDescription();
        if (desc != null && (text == null ||
                !desc.toString().equals(text.toString()))) {
            addNodeText(desc.toString(), viewId, node, out);
        }

        int childCount = Math.min(node.getChildCount(), 80);
        for (int i = 0; i < childCount; i++) {
            AccessibilityNodeInfo child = null;
            try {
                child = node.getChild(i);
                collect(child, out, counter, depth + 1);
            } catch (Throwable ignored) {
            } finally {
                if (child != null) {
                    try {
                        child.recycle();
                    } catch (Throwable ignored) {}
                }
            }
        }
    }

    private void addNodeText(
            String raw,
            String viewId,
            AccessibilityNodeInfo node,
            List<NodeText> out
    ) {
        if (raw == null) return;
        String text = raw.trim().replaceAll("\\s+", " ");
        if (text.isEmpty() || text.length() > 220) return;

        Rect bounds = new Rect();
        try {
            node.getBoundsInScreen(bounds);
        } catch (Throwable ignored) {}

        out.add(new NodeText(text, viewId, bounds));
    }

    private static boolean looksLikeTitle(String raw) {
        if (TextUtils.isEmpty(raw)) return false;
        String s = raw.trim();
        if (s.length() < 1 || s.length() > 120) return false;
        if (EXACT_REJECT.contains(s)) return false;
        if (s.startsWith("http://") || s.startsWith("https://") ||
                s.startsWith("douban://")) return false;
        if (s.matches("[0-9.,%分]+")) return false;
        if (s.startsWith("豆瓣评分") || s.startsWith("评分") ||
                s.contains("人看过") || s.contains("人想看")) return false;
        return true;
    }

    private static String cleanTitle(String raw) {
        if (raw == null) return "";
        String s = raw.trim().replaceAll("\\s+", " ");
        s = s.replaceAll("\\s*[（(](?:18|19|20)\\d{2}[）)]\\s*$", "");
        s = s.replaceAll("\\s+(?:18|19|20)\\d{2}\\s*$", "");
        return s.trim();
    }

    private static Integer parseYear(String raw) {
        if (TextUtils.isEmpty(raw)) return null;
        Matcher m = YEAR.matcher(raw);
        if (!m.find()) return null;

        try {
            int year = Integer.parseInt(m.group(1));
            return year >= 1800 && year <= 2100 ? year : null;
        } catch (Exception e) {
            return null;
        }
    }

    private void scheduleGracefulHide() {
        main.removeCallbacks(hideRunnable);

        long elapsed = android.os.SystemClock.uptimeMillis() - lastDoubanEventAt;
        long delay = elapsed < 1200L ? TREE_REFRESH_HIDE_MS : 550L;
        main.postDelayed(hideRunnable, delay);
    }

    private void hideOverlay() {
        main.removeCallbacks(scanRunnable);
        main.removeCallbacks(hideRunnable);

        if (overlay != null && windowManager != null) {
            try {
                windowManager.removeView(overlay);
            } catch (Throwable ignored) {}
        }

        overlay = null;
        overlayStatus = null;
        stremioButton = null;
        nuvioButton = null;
        infoButton = null;
        currentInfo = null;
        currentResolved = null;
        currentResolveKey = null;
        resolveDiagnostic = "尚未开始匹配";
        resolving = false;
        imdbLoading = false;
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }

    private static final class NodeText {
        final String text;
        final String viewId;
        final Rect bounds;

        NodeText(String text, String viewId, Rect bounds) {
            this.text = text;
            this.viewId = viewId;
            this.bounds = bounds;
        }
    }
}
