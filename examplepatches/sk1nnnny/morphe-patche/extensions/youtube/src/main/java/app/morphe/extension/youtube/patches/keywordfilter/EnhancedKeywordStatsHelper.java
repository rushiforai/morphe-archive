package app.morphe.extension.youtube.patches.keywordfilter;

import static app.morphe.extension.shared.StringRef.str;

import android.annotation.SuppressLint;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Outline;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.util.LruCache;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.patches.components.BufferPhraseFilter.Source;
import app.morphe.extension.shared.theme.ThemeUtils;
import app.morphe.extension.shared.ui.Dim;
import app.morphe.extension.shared.ui.SheetBottomDialog;
import app.morphe.extension.youtube.patches.keywordfilter.EnhancedKeywordContentFilter.MatchLogEntry;
import app.morphe.extension.youtube.settings.Settings;

/**
 * Native YouTube-style Filter Match Log bottom sheet:
 * full video titles, channel names & avatars, comment authors & avatars,
 * clean non-redundant layout without micro-text or parenthetical clutter.
 */
@SuppressWarnings({"deprecation", "unused"})
public final class EnhancedKeywordStatsHelper {

    private static final Pattern COMPONENT_PREFIX_PATTERN =
            Pattern.compile("^\\[[^\\]]+\\]\\s*");

    private static final LruCache<String, Bitmap> imageCache = new LruCache<>(80);
    private static final Map<String, String> channelAvatarCache = new ConcurrentHashMap<>();
    private static final ExecutorService logIoExecutor = Executors.newFixedThreadPool(4);

    private record OEmbedInfo(String title, String authorName) {}
    private static final Map<String, OEmbedInfo> oEmbedCache = new ConcurrentHashMap<>();

    private static final String EXPORT_PREFS_NAME = "morphe_keyword_log_export";
    private static final String KEY_EXPORT_TITLE = "export_title";
    private static final String KEY_EXPORT_AUTHOR = "export_author";
    private static final String KEY_EXPORT_URL = "export_url";
    private static final String KEY_EXPORT_TRIGGER = "export_trigger";
    private static final String KEY_EXPORT_META = "export_meta";
    private static final String KEY_EXPORT_RULE = "export_rule";

    private record ExportOptions(
            boolean includeTitle,
            boolean includeAuthor,
            boolean includeUrl,
            boolean includeTrigger,
            boolean includeMeta,
            boolean includeRule
    ) {}

    private enum FilterTab {
        ALL, VIDEOS, COMMENTS
    }

    public static void addMatchLogRow(PreferenceCategory category) {
        if (category == null) return;
        Context context = category.getContext();
        NumberFormat nf = NumberFormat.getInstance(Settings.MORPHE_LANGUAGE.get().getLocale());

        List<MatchLogEntry> logs = EnhancedKeywordContentFilter.getRecentMatchLogs();
        Preference matchLogPref = new Preference(context);
        matchLogPref.setTitle(str("morphe_hide_keyword_log_title"));
        if (logs.isEmpty()) {
            matchLogPref.setSummary(str("morphe_hide_keyword_log_summary_empty"));
        } else {
            matchLogPref.setSummary(str("morphe_hide_keyword_log_summary", nf.format(logs.size())));
        }
        matchLogPref.setOnPreferenceClickListener(pref -> {
            showMatchLogSheet(category, matchLogPref);
            return true;
        });
        category.addPreference(matchLogPref);
    }

    @SuppressLint("SetTextI18n")
    private static void showMatchLogSheet(PreferenceCategory category, Preference matchLogPref) {
        try {
            Context context = category.getContext();
            List<MatchLogEntry> logs = EnhancedKeywordContentFilter.getRecentMatchLogs();

            final int bgColor = ThemeUtils.getDialogBackgroundColor();
            final int fgColor = ThemeUtils.getAppForegroundColor();
            final boolean isDark = isDarkColor(bgColor);
            final int secondaryTextColor = isDark ? 0xFFAAAAAA : 0xFF606060;
            final int cardBgColor = isDark ? 0xFF1F1F1F : 0xFFF2F2F2;
            final int chipBgColor = isDark ? 0xFF2B2B2B : 0xFFE5E5E5;
            final int chipSelectedBg = isDark ? 0xFFF1F1F1 : 0xFF0F0F0F;
            final int chipSelectedText = isDark ? 0xFF0F0F0F : 0xFFFFFFFF;
            final int dividerColor = isDark ? 0x1FFFFFFF : 0x14000000;

            SheetBottomDialog.DraggableLinearLayout mainLayout =
                    SheetBottomDialog.createMainLayout(context, bgColor);

            // --- Header: clean title only (no duplicate count badge) ---
            TextView titleView = new TextView(context);
            titleView.setText(str("morphe_hide_keyword_log_title"));
            titleView.setTextColor(fgColor);
            titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18f);
            titleView.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            titleView.setPadding(Dim.dp16, Dim.dp12, Dim.dp16, Dim.dp8);
            mainLayout.addView(titleView);

            final SheetBottomDialog.SlideDialog[] dialogHolder = new SheetBottomDialog.SlideDialog[1];

            if (logs.isEmpty()) {
                TextView emptyView = new TextView(context);
                emptyView.setText(str("morphe_hide_keyword_log_empty"));
                emptyView.setTextColor(secondaryTextColor);
                emptyView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
                emptyView.setGravity(Gravity.CENTER);
                emptyView.setPadding(Dim.dp24, Dim.dp24, Dim.dp24, Dim.dp24);
                mainLayout.addView(emptyView);

                LinearLayout footer = new LinearLayout(context);
                footer.setOrientation(LinearLayout.HORIZONTAL);
                footer.setPadding(Dim.dp16, Dim.dp8, Dim.dp16, Dim.dp16);
                Button okBtn = buildActionButton(context, "OK", chipSelectedBg, chipSelectedText, () -> {
                    if (dialogHolder[0] != null) dialogHolder[0].dismiss();
                });
                footer.addView(okBtn, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, Dim.dp40));
                mainLayout.addView(footer);

                SheetBottomDialog.SlideDialog dialog = SheetBottomDialog.createSlideDialog(context, mainLayout, 200);
                dialogHolder[0] = dialog;
                dialog.show();
                return;
            }

            for (MatchLogEntry e : logs) {
                if (e.authorName() != null && !e.authorName().isEmpty()
                        && e.avatarUrl() != null && !e.avatarUrl().isEmpty()) {
                    channelAvatarCache.put(e.authorName().trim().toLowerCase(Locale.ROOT), e.avatarUrl());
                }
            }

            // --- Filter chips row ---
            int videoCount = 0;
            int commentCount = 0;
            for (MatchLogEntry e : logs) {
                if (e.source() == Source.COMMENTS) commentCount++;
                else videoCount++;
            }

            boolean isRu = Locale.getDefault().getLanguage().equalsIgnoreCase("ru");
            String labelAll = (isRu ? "Все" : "All") + " · " + logs.size();
            String labelVideos = (isRu ? "Видео" : "Videos") + " · " + videoCount;
            String labelComments = (isRu ? "Комментарии" : "Comments") + " · " + commentCount;

            LinearLayout chipsRow = new LinearLayout(context);
            chipsRow.setOrientation(LinearLayout.HORIZONTAL);
            chipsRow.setPadding(Dim.dp16, Dim.dp4, Dim.dp16, Dim.dp10);

            TextView chipAll = createFilterChip(context, labelAll);
            TextView chipVideos = createFilterChip(context, labelVideos);
            TextView chipComments = createFilterChip(context, labelComments);

            LinearLayout.LayoutParams chipLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            chipLp.setMarginEnd(Dim.dp8);
            chipsRow.addView(chipAll, chipLp);
            chipsRow.addView(chipVideos, new LinearLayout.LayoutParams(chipLp));
            chipsRow.addView(chipComments, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            mainLayout.addView(chipsRow);

            View topDivider = new View(context);
            topDivider.setBackgroundColor(dividerColor);
            mainLayout.addView(topDivider, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, Dim.dp1)));

            // --- Scrollable cards list ---
            ScrollView scrollView = new ScrollView(context);
            scrollView.setClipToPadding(false);
            scrollView.setVerticalScrollBarEnabled(true);
            int maxListHeight = Math.round(context.getResources().getDisplayMetrics().heightPixels * 0.58f);
            LinearLayout.LayoutParams scrollLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, maxListHeight);

            LinearLayout cardsContainer = new LinearLayout(context);
            cardsContainer.setOrientation(LinearLayout.VERTICAL);
            cardsContainer.setPadding(Dim.dp12, Dim.dp10, Dim.dp12, Dim.dp12);
            scrollView.addView(cardsContainer);
            mainLayout.addView(scrollView, scrollLp);

            final FilterTab[] activeTab = {FilterTab.ALL};
            SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm", Locale.getDefault());

            Runnable renderCards = () -> {
                styleFilterChip(chipAll, activeTab[0] == FilterTab.ALL,
                        chipSelectedBg, chipSelectedText, chipBgColor, fgColor);
                styleFilterChip(chipVideos, activeTab[0] == FilterTab.VIDEOS,
                        chipSelectedBg, chipSelectedText, chipBgColor, fgColor);
                styleFilterChip(chipComments, activeTab[0] == FilterTab.COMMENTS,
                        chipSelectedBg, chipSelectedText, chipBgColor, fgColor);

                cardsContainer.removeAllViews();
                int shown = 0;
                for (int i = 0, size = logs.size(); i < size; i++) {
                    MatchLogEntry entry = logs.get(i);
                    if (activeTab[0] == FilterTab.VIDEOS && entry.source() == Source.COMMENTS) continue;
                    if (activeTab[0] == FilterTab.COMMENTS && entry.source() != Source.COMMENTS) continue;

                    View card = createMatchCard(context, entry, timeFormat, isDark,
                            fgColor, secondaryTextColor, cardBgColor, chipBgColor, isRu, dialogHolder);
                    LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                    cardLp.bottomMargin = Dim.dp10;
                    cardsContainer.addView(card, cardLp);
                    shown++;
                }

                if (shown == 0) {
                    TextView none = new TextView(context);
                    none.setText(isRu ? "В этой категории записей нет" : "No entries in this category");
                    none.setTextColor(secondaryTextColor);
                    none.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
                    none.setGravity(Gravity.CENTER);
                    none.setPadding(Dim.dp16, Dim.dp24, Dim.dp16, Dim.dp24);
                    cardsContainer.addView(none);
                }
            };

            chipAll.setOnClickListener(v -> { activeTab[0] = FilterTab.ALL; renderCards.run(); });
            chipVideos.setOnClickListener(v -> { activeTab[0] = FilterTab.VIDEOS; renderCards.run(); });
            chipComments.setOnClickListener(v -> { activeTab[0] = FilterTab.COMMENTS; renderCards.run(); });
            renderCards.run();

            // --- Bottom divider + pinned action bar ---
            View bottomDivider = new View(context);
            bottomDivider.setBackgroundColor(dividerColor);
            mainLayout.addView(bottomDivider, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, Dim.dp1)));

            LinearLayout footer = new LinearLayout(context);
            footer.setOrientation(LinearLayout.HORIZONTAL);
            footer.setGravity(Gravity.CENTER_VERTICAL);
            footer.setPadding(Dim.dp12, Dim.dp10, Dim.dp12, Dim.dp(14));

            Button copyBtn = buildActionButton(context, str("morphe_hide_keyword_log_copy"),
                    chipBgColor, fgColor, () -> {
                        List<MatchLogEntry> filtered = filterLogsByTab(logs, activeTab[0]);
                        showExportOptionsSheet(context, filtered, timeFormat, isDark,
                                bgColor, fgColor, cardBgColor, chipBgColor,
                                chipSelectedBg, chipSelectedText, dividerColor, isRu);
                    });
            Button clearBtn = buildActionButton(context, str("morphe_hide_keyword_log_clear"),
                    chipBgColor, fgColor, () -> {
                        EnhancedKeywordContentFilter.clearRecentMatchLogs();
                        matchLogPref.setSummary(str("morphe_hide_keyword_log_summary_empty"));
                        if (dialogHolder[0] != null) dialogHolder[0].dismiss();
                    });
            Button okBtn = buildActionButton(context, "OK", chipSelectedBg, chipSelectedText, () -> {
                if (dialogHolder[0] != null) dialogHolder[0].dismiss();
            });

            LinearLayout.LayoutParams btnLp1 = new LinearLayout.LayoutParams(0, Dim.dp40, 1.15f);
            btnLp1.setMarginEnd(Dim.dp8);
            LinearLayout.LayoutParams btnLp2 = new LinearLayout.LayoutParams(0, Dim.dp40, 1.0f);
            btnLp2.setMarginEnd(Dim.dp8);
            LinearLayout.LayoutParams btnLp3 = new LinearLayout.LayoutParams(0, Dim.dp40, 0.75f);

            footer.addView(copyBtn, btnLp1);
            footer.addView(clearBtn, btnLp2);
            footer.addView(okBtn, btnLp3);
            mainLayout.addView(footer);

            SheetBottomDialog.SlideDialog dialog = SheetBottomDialog.createSlideDialog(context, mainLayout, 200);
            dialogHolder[0] = dialog;
            dialog.show();
        } catch (Exception ex) {
            Logger.printException(() -> "showMatchLogSheet failure", ex);
        }
    }

    @SuppressLint("SetTextI18n")
    private static View createMatchCard(Context context, MatchLogEntry entry, SimpleDateFormat timeFormat,
                                        boolean isDark, int fgColor, int secondaryTextColor,
                                        int cardBgColor, int pillBgColor, boolean isRu,
                                        SheetBottomDialog.SlideDialog[] dialogHolder) {
        final boolean hasVideo = entry.source() != Source.COMMENTS
                && entry.videoId() != null && entry.videoId().length() == 11;

        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(Dim.dp12, Dim.dp12, Dim.dp12, Dim.dp12);
        card.setBackground(roundedRect(cardBgColor, Dim.dp12));

        String initialText = stripComponentPrefix(entry.matchedText());
        String initialAuthor = entry.authorName() != null ? entry.authorName().trim() : "";
        String avatarUrl = entry.avatarUrl();
        if ((avatarUrl == null || avatarUrl.isEmpty()) && !initialAuthor.isEmpty()) {
            avatarUrl = channelAvatarCache.get(initialAuthor.toLowerCase(Locale.ROOT));
        }
        String timeStr = timeFormat.format(new Date(entry.timestampMs()));
        String sourceLabel = formatSourceLabel(entry.source(), isRu);

        if (hasVideo) {
            // Top horizontal row: 16:9 thumbnail + full untruncated video title
            LinearLayout topRow = new LinearLayout(context);
            topRow.setOrientation(LinearLayout.HORIZONTAL);
            topRow.setGravity(Gravity.TOP);

            FrameLayout thumbFrame = new FrameLayout(context);
            int thumbW = Dim.dp(128);
            int thumbH = Dim.dp(72);
            LinearLayout.LayoutParams thumbLp = new LinearLayout.LayoutParams(thumbW, thumbH);
            thumbLp.setMarginEnd(Dim.dp12);
            thumbFrame.setBackground(roundedRect(isDark ? 0xFF2C2C2C : 0xFFDCDCDC, Dim.dp8));
            thumbFrame.setClipToOutline(true);
            thumbFrame.setOutlineProvider(new ViewOutlineProvider() {
                @Override
                public void getOutline(View view, Outline outline) {
                    outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), Dim.dp8);
                }
            });

            ImageView thumbImage = new ImageView(context);
            thumbImage.setScaleType(ImageView.ScaleType.CENTER_CROP);
            thumbFrame.addView(thumbImage, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
            loadImageAsync("https://i.ytimg.com/vi/" + entry.videoId() + "/mqdefault.jpg", thumbImage);
            topRow.addView(thumbFrame, thumbLp);

            // Full video title (no maxLines truncation!)
            TextView titleTv = new TextView(context);
            titleTv.setText(buildHighlightedSpannable(initialText, entry.matchedWord()));
            titleTv.setTextColor(fgColor);
            titleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            titleTv.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            titleTv.setLineSpacing(Dim.dp(2), 1.0f);
            topRow.addView(titleTv, new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            card.addView(topRow);

            // Bottom metadata row: circular channel avatar + channel name + source + time + trigger
            LinearLayout bottomRow = new LinearLayout(context);
            bottomRow.setOrientation(LinearLayout.HORIZONTAL);
            bottomRow.setGravity(Gravity.CENTER_VERTICAL);
            LinearLayout.LayoutParams bottomLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            bottomLp.topMargin = Dim.dp10;

            FrameLayout avatarView = createCircularAvatarView(context, avatarUrl, initialAuthor, Dim.dp24, pillBgColor, fgColor);
            LinearLayout.LayoutParams avLp = new LinearLayout.LayoutParams(Dim.dp24, Dim.dp24);
            avLp.setMarginEnd(Dim.dp8);
            bottomRow.addView(avatarView, avLp);

            LinearLayout metaCol = new LinearLayout(context);
            metaCol.setOrientation(LinearLayout.VERTICAL);

            TextView channelTv = new TextView(context);
            channelTv.setTextColor(fgColor);
            channelTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
            channelTv.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            channelTv.setSingleLine(true);
            channelTv.setEllipsize(TextUtils.TruncateAt.END);
            if (!initialAuthor.isEmpty()) {
                channelTv.setText(initialAuthor);
                channelTv.setVisibility(View.VISIBLE);
            } else {
                channelTv.setVisibility(View.GONE);
            }
            metaCol.addView(channelTv);

            TextView metaTv = new TextView(context);
            metaTv.setText(sourceLabel + " · " + timeStr);
            metaTv.setTextColor(secondaryTextColor);
            metaTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            metaCol.addView(metaTv);

            bottomRow.addView(metaCol, new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            // Clean trigger word pill (no regex dump)
            if (entry.matchedWord() != null && !entry.matchedWord().isEmpty()) {
                TextView triggerPill = createTriggerPill(context, entry.matchedWord(), isDark);
                LinearLayout.LayoutParams pillLp = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                pillLp.setMarginStart(Dim.dp8);
                bottomRow.addView(triggerPill, pillLp);
            }

            card.addView(bottomRow, bottomLp);

            // Asynchronously enrich full untruncated video title, exact channel name, and cached channel avatar
            enrichVideoWithOEmbedAsync(entry.videoId(), entry.matchedWord(), avatarUrl, titleTv, channelTv, avatarView);

            // Tap to open video in YouTube
            card.setClickable(true);
            card.setFocusable(true);
            card.setOnClickListener(v -> {
                try {
                    Intent intent = new Intent(Intent.ACTION_VIEW,
                            Uri.parse("https://www.youtube.com/watch?v=" + entry.videoId()));
                    intent.setPackage(context.getPackageName());
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    context.startActivity(intent);
                    if (dialogHolder[0] != null) dialogHolder[0].dismiss();
                } catch (Exception ex) {
                    Logger.printDebug(() -> "Could not open video from match log", ex);
                }
            });
        } else {
            // Comment card: circular author avatar + author name + full comment text + clean footer
            LinearLayout headerRow = new LinearLayout(context);
            headerRow.setOrientation(LinearLayout.HORIZONTAL);
            headerRow.setGravity(Gravity.CENTER_VERTICAL);

            View avatarView = createCircularAvatarView(context, avatarUrl, initialAuthor, Dim.dp(32), pillBgColor, fgColor);
            LinearLayout.LayoutParams avLp = new LinearLayout.LayoutParams(Dim.dp(32), Dim.dp(32));
            avLp.setMarginEnd(Dim.dp10);
            headerRow.addView(avatarView, avLp);

            LinearLayout authorCol = new LinearLayout(context);
            authorCol.setOrientation(LinearLayout.VERTICAL);

            if (!initialAuthor.isEmpty()) {
                TextView authorTv = new TextView(context);
                authorTv.setText(initialAuthor);
                authorTv.setTextColor(fgColor);
                authorTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
                authorTv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
                authorTv.setSingleLine(true);
                authorTv.setEllipsize(TextUtils.TruncateAt.END);
                authorCol.addView(authorTv);
            }

            TextView metaTv = new TextView(context);
            metaTv.setText(sourceLabel + " · " + timeStr);
            metaTv.setTextColor(secondaryTextColor);
            metaTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            authorCol.addView(metaTv);

            headerRow.addView(authorCol, new LinearLayout.LayoutParams(
                    0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            if (entry.matchedWord() != null && !entry.matchedWord().isEmpty()) {
                TextView triggerPill = createTriggerPill(context, entry.matchedWord(), isDark);
                LinearLayout.LayoutParams pillLp = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                pillLp.setMarginStart(Dim.dp8);
                headerRow.addView(triggerPill, pillLp);
            }
            card.addView(headerRow);

            // Full comment text (no truncation)
            TextView commentTv = new TextView(context);
            commentTv.setText(buildHighlightedSpannable(initialText, entry.matchedWord()));
            commentTv.setTextColor(fgColor);
            commentTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            commentTv.setLineSpacing(Dim.dp(2), 1.0f);
            LinearLayout.LayoutParams cLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            cLp.topMargin = Dim.dp8;
            card.addView(commentTv, cLp);
        }

        // Long-press any card to copy detailed entry
        card.setOnLongClickListener(v -> {
            String formatted = formatEntryForCopy(entry, timeFormat, isRu, loadExportOptions(context));
            ClipboardManager cm = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
            if (cm != null) {
                cm.setPrimaryClip(ClipData.newPlainText("KeywordFilterEntry", formatted));
                Utils.showToastShort(str("morphe_hide_keyword_log_copied"));
            }
            return true;
        });

        return card;
    }

    private static FrameLayout createCircularAvatarView(Context context, @Nullable String avatarUrl,
                                                        String authorName, int sizePx, int bgColor, int fgColor) {
        FrameLayout frame = new FrameLayout(context);
        frame.setBackground(roundedRect(bgColor, sizePx / 2f));
        frame.setClipToOutline(true);
        frame.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                outline.setOval(0, 0, view.getWidth(), view.getHeight());
            }
        });

        String initial = extractInitial(authorName);
        TextView letterTv = new TextView(context);
        letterTv.setText(initial);
        letterTv.setTextColor(fgColor);
        letterTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, sizePx >= Dim.dp(30) ? 13f : 11.5f);
        letterTv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        letterTv.setGravity(Gravity.CENTER);
        frame.addView(letterTv, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        ImageView iv = new ImageView(context);
        iv.setScaleType(ImageView.ScaleType.CENTER_CROP);
        frame.addView(iv, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        if (avatarUrl != null && !avatarUrl.isEmpty()) {
            loadImageAsync(avatarUrl, iv);
        }
        return frame;
    }

    private static String extractInitial(@Nullable String name) {
        if (name == null) return "•";
        String s = name.trim();
        if (s.startsWith("@") && s.length() > 1) s = s.substring(1);
        return s.isEmpty() ? "•" : s.substring(0, 1).toUpperCase(Locale.ROOT);
    }

    private static TextView createTriggerPill(Context context, String word, boolean isDark) {
        TextView pill = new TextView(context);
        pill.setText(word);
        pill.setTextColor(isDark ? 0xFFFF8A80 : 0xFFC62828);
        pill.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
        pill.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        pill.setSingleLine(true);
        pill.setEllipsize(TextUtils.TruncateAt.END);
        pill.setMaxWidth(Dim.dp(110));
        pill.setPadding(Dim.dp8, Dim.dp4, Dim.dp8, Dim.dp4);
        pill.setBackground(roundedRect(isDark ? 0x29EF5350 : 0x1AD32F2F, Dim.dp6));
        return pill;
    }

    private static void enrichVideoWithOEmbedAsync(String videoId, String matchedWord,
                                                   @Nullable String existingAvatarUrl,
                                                   TextView titleTv, TextView channelTv,
                                                   FrameLayout avatarFrame) {
        OEmbedInfo cached = oEmbedCache.get(videoId);
        if (cached != null) {
            applyOEmbedToViews(cached, matchedWord, existingAvatarUrl, titleTv, channelTv, avatarFrame);
            return;
        }
        titleTv.setTag(videoId);
        logIoExecutor.execute(() -> {
            try {
                URL url = new URL("https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v="
                        + videoId + "&format=json");
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setConnectTimeout(4000);
                conn.setReadTimeout(4000);
                if (conn.getResponseCode() == 200) {
                    StringBuilder sb = new StringBuilder();
                    try (BufferedReader br = new BufferedReader(
                            new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
                        String line;
                        while ((line = br.readLine()) != null) sb.append(line);
                    }
                    JSONObject json = new JSONObject(sb.toString());
                    String fullTitle = json.optString("title", "").trim();
                    String author = json.optString("author_name", "").trim();
                    if (!fullTitle.isEmpty() || !author.isEmpty()) {
                        if (!author.isEmpty() && existingAvatarUrl != null && !existingAvatarUrl.isEmpty()) {
                            channelAvatarCache.put(author.toLowerCase(Locale.ROOT), existingAvatarUrl);
                        }
                        OEmbedInfo info = new OEmbedInfo(fullTitle, author);
                        oEmbedCache.put(videoId, info);
                        Utils.runOnMainThread(() -> {
                            if (videoId.equals(titleTv.getTag())) {
                                applyOEmbedToViews(info, matchedWord, existingAvatarUrl,
                                        titleTv, channelTv, avatarFrame);
                            }
                        });
                    }
                }
                conn.disconnect();
            } catch (Exception ignored) {
            }
        });
    }

    private static void applyOEmbedToViews(OEmbedInfo info, String matchedWord,
                                           @Nullable String existingAvatarUrl,
                                           TextView titleTv, TextView channelTv,
                                           FrameLayout avatarFrame) {
        if (!info.title().isEmpty()) {
            titleTv.setText(buildHighlightedSpannable(info.title(), matchedWord));
        }
        if (!info.authorName().isEmpty()) {
            channelTv.setText(info.authorName());
            channelTv.setVisibility(View.VISIBLE);
            if (avatarFrame.getChildCount() >= 1 && avatarFrame.getChildAt(0) instanceof TextView letterTv) {
                letterTv.setText(extractInitial(info.authorName()));
            }
            if ((existingAvatarUrl == null || existingAvatarUrl.isEmpty())
                    && avatarFrame.getChildCount() >= 2
                    && avatarFrame.getChildAt(1) instanceof ImageView iv) {
                String cachedAv = channelAvatarCache.get(info.authorName().toLowerCase(Locale.ROOT));
                if (cachedAv != null && !cachedAv.isEmpty()) {
                    loadImageAsync(cachedAv, iv);
                }
            }
        }
    }

    private static void loadImageAsync(String imageUrl, ImageView target) {
        target.setTag(imageUrl);
        Bitmap cached = imageCache.get(imageUrl);
        if (cached != null) {
            target.setImageBitmap(cached);
            return;
        }
        logIoExecutor.execute(() -> {
            try {
                URL url = new URL(imageUrl);
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setConnectTimeout(4000);
                conn.setReadTimeout(4000);
                if (conn.getResponseCode() == 200) {
                    try (InputStream is = conn.getInputStream()) {
                        Bitmap bmp = BitmapFactory.decodeStream(is);
                        if (bmp != null) {
                            imageCache.put(imageUrl, bmp);
                            Utils.runOnMainThread(() -> {
                                if (imageUrl.equals(target.getTag())) {
                                    target.setImageBitmap(bmp);
                                }
                            });
                        }
                    }
                }
                conn.disconnect();
            } catch (Exception ignored) {
            }
        });
    }

    private static List<MatchLogEntry> filterLogsByTab(List<MatchLogEntry> logs, FilterTab tab) {
        if (tab == FilterTab.ALL) return logs;
        List<MatchLogEntry> out = new ArrayList<>();
        for (MatchLogEntry e : logs) {
            if (tab == FilterTab.VIDEOS && e.source() != Source.COMMENTS) out.add(e);
            else if (tab == FilterTab.COMMENTS && e.source() == Source.COMMENTS) out.add(e);
        }
        return out;
    }

    private static ExportOptions loadExportOptions(Context context) {
        SharedPreferences prefs = context.getSharedPreferences(EXPORT_PREFS_NAME, Context.MODE_PRIVATE);
        return new ExportOptions(
                prefs.getBoolean(KEY_EXPORT_TITLE, true),
                prefs.getBoolean(KEY_EXPORT_AUTHOR, true),
                prefs.getBoolean(KEY_EXPORT_URL, true),
                prefs.getBoolean(KEY_EXPORT_TRIGGER, true),
                prefs.getBoolean(KEY_EXPORT_META, true),
                prefs.getBoolean(KEY_EXPORT_RULE, false)
        );
    }

    private static void saveExportOptions(Context context, ExportOptions opts) {
        context.getSharedPreferences(EXPORT_PREFS_NAME, Context.MODE_PRIVATE)
                .edit()
                .putBoolean(KEY_EXPORT_TITLE, opts.includeTitle())
                .putBoolean(KEY_EXPORT_AUTHOR, opts.includeAuthor())
                .putBoolean(KEY_EXPORT_URL, opts.includeUrl())
                .putBoolean(KEY_EXPORT_TRIGGER, opts.includeTrigger())
                .putBoolean(KEY_EXPORT_META, opts.includeMeta())
                .putBoolean(KEY_EXPORT_RULE, opts.includeRule())
                .apply();
    }

    private static void showExportOptionsSheet(Context context, List<MatchLogEntry> logs,
                                               SimpleDateFormat timeFormat, boolean isDark,
                                               int bgColor, int fgColor, int cardBgColor,
                                               int chipBgColor, int chipSelectedBg,
                                               int chipSelectedText, int dividerColor, boolean isRu) {
        ExportOptions saved = loadExportOptions(context);
        SheetBottomDialog.DraggableLinearLayout layout =
                SheetBottomDialog.createMainLayout(context, bgColor);

        TextView header = new TextView(context);
        header.setText(isRu ? "Что копировать" : "Fields to export");
        header.setTextColor(fgColor);
        header.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17f);
        header.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        header.setPadding(Dim.dp16, Dim.dp12, Dim.dp16, Dim.dp10);
        layout.addView(header);

        View topDiv = new View(context);
        topDiv.setBackgroundColor(dividerColor);
        layout.addView(topDiv, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, Dim.dp1)));

        LinearLayout optionsCol = new LinearLayout(context);
        optionsCol.setOrientation(LinearLayout.VERTICAL);
        optionsCol.setPadding(Dim.dp12, Dim.dp8, Dim.dp12, Dim.dp8);

        CheckBox cbTitle = addExportOptionRow(context, optionsCol,
                isRu ? "Название видео и текст комментария" : "Video title & comment text",
                saved.includeTitle(), fgColor, cardBgColor);
        CheckBox cbAuthor = addExportOptionRow(context, optionsCol,
                isRu ? "Канал и автор" : "Channel & author",
                saved.includeAuthor(), fgColor, cardBgColor);
        CheckBox cbUrl = addExportOptionRow(context, optionsCol,
                isRu ? "Ссылка на видео" : "Video link",
                saved.includeUrl(), fgColor, cardBgColor);
        CheckBox cbTrigger = addExportOptionRow(context, optionsCol,
                isRu ? "Слово-триггер" : "Trigger word",
                saved.includeTrigger(), fgColor, cardBgColor);
        CheckBox cbMeta = addExportOptionRow(context, optionsCol,
                isRu ? "Источник и время" : "Source & time",
                saved.includeMeta(), fgColor, cardBgColor);
        CheckBox cbRule = addExportOptionRow(context, optionsCol,
                isRu ? "Полное правило фильтра" : "Full filter rule",
                saved.includeRule(), fgColor, cardBgColor);

        layout.addView(optionsCol);

        View botDiv = new View(context);
        botDiv.setBackgroundColor(dividerColor);
        layout.addView(botDiv, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, Dim.dp1)));

        final SheetBottomDialog.SlideDialog[] exportDialogHolder = new SheetBottomDialog.SlideDialog[1];

        LinearLayout footer = new LinearLayout(context);
        footer.setOrientation(LinearLayout.HORIZONTAL);
        footer.setGravity(Gravity.CENTER_VERTICAL);
        footer.setPadding(Dim.dp12, Dim.dp10, Dim.dp12, Dim.dp(14));

        Button cancelBtn = buildActionButton(context, isRu ? "Отмена" : "Cancel",
                chipBgColor, fgColor, () -> {
                    if (exportDialogHolder[0] != null) exportDialogHolder[0].dismiss();
                });
        Button doCopyBtn = buildActionButton(context, str("morphe_hide_keyword_log_copy"),
                chipSelectedBg, chipSelectedText, () -> {
                    ExportOptions chosen = new ExportOptions(
                            cbTitle.isChecked(),
                            cbAuthor.isChecked(),
                            cbUrl.isChecked(),
                            cbTrigger.isChecked(),
                            cbMeta.isChecked(),
                            cbRule.isChecked()
                    );
                    if (!chosen.includeTitle() && !chosen.includeAuthor() && !chosen.includeUrl()
                            && !chosen.includeTrigger() && !chosen.includeMeta() && !chosen.includeRule()) {
                        Utils.showToastShort(isRu ? "Выберите хотя бы одно поле" : "Select at least one field");
                        return;
                    }
                    saveExportOptions(context, chosen);
                    copyAllLogs(context, logs, timeFormat, isRu, chosen);
                    if (exportDialogHolder[0] != null) exportDialogHolder[0].dismiss();
                });

        LinearLayout.LayoutParams lp1 = new LinearLayout.LayoutParams(0, Dim.dp40, 1f);
        lp1.setMarginEnd(Dim.dp8);
        LinearLayout.LayoutParams lp2 = new LinearLayout.LayoutParams(0, Dim.dp40, 1.3f);
        footer.addView(cancelBtn, lp1);
        footer.addView(doCopyBtn, lp2);
        layout.addView(footer);

        SheetBottomDialog.SlideDialog dialog = SheetBottomDialog.createSlideDialog(context, layout, 180);
        exportDialogHolder[0] = dialog;
        dialog.show();
    }

    private static CheckBox addExportOptionRow(Context context, LinearLayout parent,
                                               String label, boolean checked,
                                               int fgColor, int rowBgColor) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(Dim.dp12, Dim.dp8, Dim.dp12, Dim.dp8);
        row.setBackground(roundedRect(rowBgColor, Dim.dp10));
        row.setClickable(true);
        row.setFocusable(true);

        TextView tv = new TextView(context);
        tv.setText(label);
        tv.setTextColor(fgColor);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        row.addView(tv, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        CheckBox cb = new CheckBox(context);
        cb.setChecked(checked);
        cb.setClickable(false);
        cb.setFocusable(false);
        row.addView(cb);

        row.setOnClickListener(v -> cb.setChecked(!cb.isChecked()));

        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.bottomMargin = Dim.dp6;
        parent.addView(row, lp);
        return cb;
    }

    private static void copyAllLogs(Context context, List<MatchLogEntry> logs,
                                    SimpleDateFormat timeFormat, boolean isRu,
                                    ExportOptions opts) {
        StringBuilder sb = new StringBuilder();
        int index = 0;
        for (int i = 0, size = logs.size(); i < size; i++) {
            String block = formatEntryForCopy(logs.get(i), timeFormat, isRu, opts);
            if (block.isEmpty()) continue;
            if (index > 0) sb.append("\n\n");
            index++;
            sb.append(index).append(". ").append(block);
        }
        if (sb.length() == 0) {
            Utils.showToastShort(isRu ? "Нет данных для выбранных полей" : "No data for selected fields");
            return;
        }
        ClipboardManager cm = (ClipboardManager) context.getSystemService(Context.CLIPBOARD_SERVICE);
        if (cm != null) {
            cm.setPrimaryClip(ClipData.newPlainText("KeywordFilterLog", sb.toString()));
            Utils.showToastShort(str("morphe_hide_keyword_log_copied"));
        }
    }

    private static String formatEntryForCopy(MatchLogEntry entry, SimpleDateFormat timeFormat,
                                             boolean isRu, ExportOptions opts) {
        List<String> lines = new ArrayList<>();
        String timeStr = timeFormat.format(new Date(entry.timestampMs()));
        String sourceLabel = formatSourceLabel(entry.source(), isRu);
        String statusLabel = entry.debugMode()
                ? (isRu ? "Отладка" : "Debug")
                : (isRu ? "Скрыто" : "Hidden");

        String title = stripComponentPrefix(entry.matchedText());
        String author = entry.authorName() != null ? entry.authorName().trim() : "";
        if (entry.videoId() != null) {
            OEmbedInfo info = oEmbedCache.get(entry.videoId());
            if (info != null) {
                if (!info.title().isEmpty()) title = info.title();
                if (!info.authorName().isEmpty()) author = info.authorName();
            }
        }

        if (opts.includeMeta()) {
            lines.add(sourceLabel + " · " + timeStr + " · " + statusLabel);
        }
        if (opts.includeTitle() && !title.isEmpty()) {
            lines.add(title);
        }
        if (opts.includeAuthor() && !author.isEmpty()) {
            lines.add((entry.source() == Source.COMMENTS
                    ? (isRu ? "Автор: " : "Author: ")
                    : (isRu ? "Канал: " : "Channel: ")) + author);
        }
        if (opts.includeTrigger() && entry.matchedWord() != null && !entry.matchedWord().isEmpty()) {
            lines.add((isRu ? "Триггер: " : "Trigger: ") + entry.matchedWord());
        }
        if (opts.includeRule() && entry.ruleDisplay() != null && !entry.ruleDisplay().isEmpty()) {
            lines.add((isRu ? "Правило: " : "Rule: ") + entry.ruleDisplay());
        }
        if (opts.includeUrl() && entry.videoId() != null && entry.videoId().length() == 11) {
            lines.add("https://youtu.be/" + entry.videoId());
        }
        return String.join("\n", lines);
    }

    private static TextView createFilterChip(Context context, String label) {
        TextView chip = new TextView(context);
        chip.setText(label);
        chip.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        chip.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        chip.setPadding(Dim.dp12, Dim.dp6, Dim.dp12, Dim.dp6);
        chip.setSingleLine(true);
        chip.setClickable(true);
        chip.setFocusable(true);
        return chip;
    }

    private static void styleFilterChip(TextView chip, boolean selected,
                                        int selectedBg, int selectedText, int normalBg, int normalText) {
        chip.setBackground(roundedRect(selected ? selectedBg : normalBg, Dim.dp8));
        chip.setTextColor(selected ? selectedText : normalText);
    }

    private static Button buildActionButton(Context context, CharSequence text,
                                            int bgColor, int textColor, Runnable onClick) {
        Button btn = new Button(context, null, 0);
        btn.setText(text);
        btn.setTextColor(textColor);
        btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
        btn.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        btn.setAllCaps(false);
        btn.setSingleLine(true);
        btn.setEllipsize(TextUtils.TruncateAt.END);
        btn.setGravity(Gravity.CENTER);
        btn.setPadding(Dim.dp10, 0, Dim.dp10, 0);
        btn.setMinWidth(0);
        btn.setMinimumWidth(0);
        btn.setBackground(roundedRect(bgColor, Dim.dp(20)));
        btn.setOnClickListener(v -> onClick.run());
        return btn;
    }

    private static GradientDrawable roundedRect(int color, float radiusPx) {
        GradientDrawable d = new GradientDrawable();
        d.setShape(GradientDrawable.RECTANGLE);
        d.setColor(color);
        d.setCornerRadius(radiusPx);
        return d;
    }

    private static boolean isDarkColor(int color) {
        return (Color.red(color) + Color.green(color) + Color.blue(color)) < 384;
    }

    private static String stripComponentPrefix(@Nullable String text) {
        if (text == null) return "";
        Matcher m = COMPONENT_PREFIX_PATTERN.matcher(text);
        return m.find() ? text.substring(m.end()).trim() : text.trim();
    }

    private static String formatSourceLabel(Source source, boolean isRu) {
        return switch (source) {
            case HOME -> isRu ? "Главная" : "Home";
            case SUBSCRIPTIONS -> isRu ? "Подписки" : "Subscriptions";
            case SEARCH -> isRu ? "Поиск" : "Search";
            case COMMENTS -> isRu ? "Комментарии" : "Comments";
        };
    }

    private static SpannableStringBuilder buildHighlightedSpannable(String text, @Nullable String word) {
        SpannableStringBuilder sb = new SpannableStringBuilder();
        appendHighlightedText(sb, text, word);
        return sb;
    }

    private static void appendHighlightedText(SpannableStringBuilder sb, String text, @Nullable String word) {
        int base = sb.length();
        sb.append(text);
        if (word == null || word.isEmpty()) return;

        String lowerText = text.toLowerCase(Locale.ROOT);
        String lowerWord = word.toLowerCase(Locale.ROOT);
        if (lowerText.length() != text.length() || lowerWord.length() != word.length()) {
            int idx = text.indexOf(word);
            if (idx >= 0) {
                applyWordHighlight(sb, base + idx, base + idx + word.length());
            }
            return;
        }
        int from = 0;
        while (from < lowerText.length()) {
            int idx = lowerText.indexOf(lowerWord, from);
            if (idx < 0) break;
            applyWordHighlight(sb, base + idx, base + idx + lowerWord.length());
            from = idx + lowerWord.length();
        }
    }

    private static void applyWordHighlight(SpannableStringBuilder sb, int start, int end) {
        sb.setSpan(new BackgroundColorSpan(0xFFD32F2F), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        sb.setSpan(new ForegroundColorSpan(0xFFFFFFFF), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        sb.setSpan(new StyleSpan(Typeface.BOLD), start, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
    }

    private EnhancedKeywordStatsHelper() {
    }
}
