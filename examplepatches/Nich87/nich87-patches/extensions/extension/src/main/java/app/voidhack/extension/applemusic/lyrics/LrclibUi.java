package app.voidhack.extension.applemusic.lyrics;

import android.app.Activity;
import android.app.Dialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowInsetsController;
import android.view.WindowManager;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicInteger;

final class LrclibUi {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService UI_EXECUTOR = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "VoidhackLrclibUi");
        t.setDaemon(true);
        return t;
    });

    private LrclibUi() {}

    // =========================================================================
    // 1. Quick Lyrics Source & Override Sheet
    // =========================================================================

    static void openSourceSheet(final Activity activity, final Object fragment) {
        if (activity == null || activity.isFinishing()) return;
        LrclibController.captureContext(activity);
        final LrclibModels.TrackQuery query = LrclibController.getCurrentTrackQuery(fragment);
        if (query == null) {
            Toast.makeText(activity, LrclibStrings.text(activity, "no_track"), Toast.LENGTH_SHORT).show();
            return;
        }

        final Page page = new Page(activity, LrclibStrings.text(activity, "sheet_title"));
        final LinearLayout content = page.createScrollBody();

        final Runnable[] rebuild = new Runnable[1];
        rebuild[0] = () -> {
            content.removeAllViews();
            LrclibModels.TrackOverride ov = LrclibPrefs.getOverride(activity, query.trackKey);
            LrclibModels.OverrideMode activeMode = ov != null ? ov.mode : LrclibModels.OverrideMode.AUTO;
            int songOffset = ov != null ? ov.offsetMs : 0;
            LrclibController.TrackLyricsState state = LrclibController.getTrackState(query.trackKey);

            // Track header card
            LinearLayout headerCard = page.card();
            TextView titleTv = page.text(query.title, 18, true, page.primary);
            titleTv.setMaxLines(2);
            titleTv.setEllipsize(TextUtils.TruncateAt.END);
            headerCard.addView(titleTv);

            String sub = query.artist;
            if (!query.album.isEmpty()) sub = sub.isEmpty() ? query.album : (sub + " · " + query.album);
            if (!sub.isEmpty()) {
                TextView subTv = page.text(sub, 14, false, page.secondary);
                subTv.setPadding(0, page.dp(3), 0, 0);
                subTv.setMaxLines(1);
                subTv.setEllipsize(TextUtils.TruncateAt.END);
                headerCard.addView(subTv);
            }

            TextView statusTv = page.text(describeCurrentState(activity, state), 13, true, page.accent);
            statusTv.setPadding(0, page.dp(8), 0, 0);
            headerCard.addView(statusTv);
            content.addView(headerCard, page.cardParams());

            // Source mode radio options
            LinearLayout modeCard = page.card();
            page.addRadioRow(
                    modeCard,
                    LrclibStrings.text(activity, "override_auto"),
                    null,
                    activeMode == LrclibModels.OverrideMode.AUTO,
                    true,
                    () -> {
                        LrclibController.updateOverrideMode(activity, fragment, query, LrclibModels.OverrideMode.AUTO);
                        page.dismiss();
                    }
            );
            modeCard.addView(page.separator(), page.sepParams());

            boolean officialAvailable = query.hasOfficialLyrics || query.hasCustomLyrics;
            page.addRadioRow(
                    modeCard,
                    LrclibStrings.text(activity, "override_official"),
                    officialAvailable ? null : LrclibStrings.text(activity, "override_official_unavailable"),
                    activeMode == LrclibModels.OverrideMode.FORCE_OFFICIAL,
                    true,
                    () -> {
                        LrclibController.updateOverrideMode(activity, fragment, query, LrclibModels.OverrideMode.FORCE_OFFICIAL);
                        page.dismiss();
                    }
            );
            modeCard.addView(page.separator(), page.sepParams());

            page.addRadioRow(
                    modeCard,
                    LrclibStrings.text(activity, "override_lrclib_auto"),
                    null,
                    activeMode == LrclibModels.OverrideMode.FORCE_LRCLIB_AUTO,
                    true,
                    () -> {
                        LrclibController.updateOverrideMode(activity, fragment, query, LrclibModels.OverrideMode.FORCE_LRCLIB_AUTO);
                        page.dismiss();
                    }
            );

            if (activeMode == LrclibModels.OverrideMode.FORCE_LRCLIB_ID && ov != null && ov.lrclibId > 0L) {
                modeCard.addView(page.separator(), page.sepParams());
                page.addRadioRow(
                        modeCard,
                        LrclibStrings.text(activity, "override_lrclib_pinned", ov.lrclibId),
                        null,
                        true,
                        true,
                        () -> {}
                );
            }
            content.addView(modeCard, page.cardParams());

            // Search & Pick button (prominent filled CTA)
            TextView searchBtn = page.button(LrclibStrings.text(activity, "search_action"), true);
            searchBtn.setOnClickListener(v -> openSearchPicker(activity, fragment, query, () -> {
                page.dismiss();
            }));
            LinearLayout.LayoutParams ctaParams = new LinearLayout.LayoutParams(-1, page.dp(48));
            ctaParams.setMargins(0, page.dp(12), 0, page.dp(4));
            content.addView(searchBtn, ctaParams);

            // Per-song timing offset stepper
            LinearLayout offsetCard = page.card();
            page.addOffsetStepper(
                    offsetCard,
                    LrclibStrings.text(activity, "song_offset"),
                    songOffset,
                    newOffset -> {
                        LrclibController.updateSongOffset(activity, fragment, query, newOffset);
                        rebuild[0].run();
                    }
            );
            content.addView(offsetCard, page.cardParams());

            // Utility actions: Reload & Settings
            LinearLayout utilCard = page.card();
            page.addActionRow(utilCard, LrclibStrings.text(activity, "reload_action"), page.accent, () -> {
                LrclibController.reloadCurrentTrack(activity, fragment, true);
                page.dismiss();
            });
            utilCard.addView(page.separator(), page.sepParams());
            page.addActionRow(utilCard, LrclibStrings.text(activity, "open_settings"), page.primary, () -> {
                page.dismiss();
                openSettings(activity);
            });
            content.addView(utilCard, page.cardParams());
        };

        rebuild[0].run();
    }

    // =========================================================================
    // 2. LRCLIB Search & Preview/Picker Page
    // =========================================================================

    private static void openSearchPicker(
            final Activity activity,
            final Object fragment,
            final LrclibModels.TrackQuery query,
            final Runnable onApplied) {
        final Page page = new Page(activity, LrclibStrings.text(activity, "search_title"));
        final LinearLayout body = new LinearLayout(activity);
        body.setOrientation(LinearLayout.VERTICAL);

        // Search inputs header
        LinearLayout searchBox = new LinearLayout(activity);
        searchBox.setOrientation(LinearLayout.VERTICAL);
        searchBox.setPadding(page.dp(20), page.dp(12), page.dp(20), page.dp(8));

        final EditText trackInput = page.input(LrclibStrings.text(activity, "search_track_hint"), query.title);
        LinearLayout.LayoutParams inputParams = new LinearLayout.LayoutParams(-1, page.dp(44));
        inputParams.setMargins(0, 0, 0, page.dp(8));
        searchBox.addView(trackInput, inputParams);

        LinearLayout secondRow = new LinearLayout(activity);
        secondRow.setOrientation(LinearLayout.HORIZONTAL);
        secondRow.setGravity(Gravity.CENTER_VERTICAL);
        final EditText artistInput = page.input(LrclibStrings.text(activity, "search_artist_hint"), query.artist);
        LinearLayout.LayoutParams artistParams = new LinearLayout.LayoutParams(0, page.dp(44), 1f);
        artistParams.setMargins(0, 0, page.dp(8), 0);
        secondRow.addView(artistInput, artistParams);

        final TextView searchBtn = page.button(LrclibStrings.text(activity, "search_button"), true);
        searchBtn.setPadding(page.dp(16), 0, page.dp(16), 0);
        secondRow.addView(searchBtn, new LinearLayout.LayoutParams(-2, page.dp(44)));
        searchBox.addView(secondRow);

        body.addView(searchBox, new LinearLayout.LayoutParams(-1, -2));
        body.addView(page.separator(), new LinearLayout.LayoutParams(-1, 1));

        // Results area
        final ScrollView scroll = new ScrollView(activity);
        final LinearLayout resultsContainer = new LinearLayout(activity);
        resultsContainer.setOrientation(LinearLayout.VERTICAL);
        resultsContainer.setPadding(page.dp(20), page.dp(12), page.dp(20), page.dp(24));
        scroll.addView(resultsContainer, new FrameLayout.LayoutParams(-1, -2));
        body.addView(scroll, new LinearLayout.LayoutParams(-1, 0, 1f));
        page.setBody(body);

        final AtomicInteger searchSeq = new AtomicInteger(0);
        final Runnable runSearch = () -> {
            page.hideKeyboard();
            final String track = trackInput.getText().toString().trim();
            final String artist = artistInput.getText().toString().trim();
            if (track.isEmpty() && artist.isEmpty()) return;

            final int seq = searchSeq.incrementAndGet();
            resultsContainer.removeAllViews();
            resultsContainer.addView(page.loadingBlock(LrclibStrings.text(activity, "searching")));

            UI_EXECUTOR.execute(() -> {
                List<LrclibModels.SearchSummary> found = null;
                boolean rateLimited = false;
                boolean error = false;
                try {
                    if (!track.isEmpty()) {
                        found = LrclibApiClient.search(track, artist, null, null);
                    } else {
                        found = LrclibApiClient.search(null, null, null, artist);
                    }
                    if ((found == null || found.isEmpty()) && !track.isEmpty() && !artist.isEmpty()) {
                        // Broad free-text fallback when strict track+artist returns nothing.
                        found = LrclibApiClient.search(null, null, null, track + " " + artist);
                    }
                } catch (LrclibApiClient.RateLimitException e) {
                    rateLimited = true;
                } catch (IOException e) {
                    error = true;
                }

                final List<LrclibModels.SearchSummary> finalResults = found;
                final boolean finalRateLimited = rateLimited;
                final boolean finalError = error;
                MAIN.post(() -> {
                    if (seq != searchSeq.get() || !page.isShowing()) return;
                    resultsContainer.removeAllViews();
                    if (finalRateLimited) {
                        resultsContainer.addView(page.emptyMessage(LrclibStrings.text(activity, "rate_limited")));
                        return;
                    }
                    if (finalError) {
                        resultsContainer.addView(page.emptyMessage(LrclibStrings.text(activity, "search_error")));
                        return;
                    }
                    if (finalResults == null || finalResults.isEmpty()) {
                        resultsContainer.addView(page.emptyMessage(LrclibStrings.text(activity, "search_empty")));
                        return;
                    }

                    for (final LrclibModels.SearchSummary item : finalResults) {
                        resultsContainer.addView(
                                buildSearchResultCard(activity, fragment, page, query, item, () -> {
                                    page.dismiss();
                                    if (onApplied != null) onApplied.run();
                                }),
                                page.cardParams()
                        );
                    }
                });
            });
        };

        searchBtn.setOnClickListener(v -> runSearch.run());
        TextView.OnEditorActionListener editorListener = (v, actionId, event) -> {
            if (actionId == EditorInfo.IME_ACTION_SEARCH
                    || (event != null && event.getKeyCode() == KeyEvent.KEYCODE_ENTER && event.getAction() == KeyEvent.ACTION_DOWN)) {
                runSearch.run();
                return true;
            }
            return false;
        };
        trackInput.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
        artistInput.setImeOptions(EditorInfo.IME_ACTION_SEARCH);
        trackInput.setOnEditorActionListener(editorListener);
        artistInput.setOnEditorActionListener(editorListener);

        runSearch.run();
    }

    private static View buildSearchResultCard(
            final Activity activity,
            final Object fragment,
            final Page page,
            final LrclibModels.TrackQuery query,
            final LrclibModels.SearchSummary item,
            final Runnable onApplied) {
        LinearLayout card = page.card();
        card.setClickable(true);
        card.setFocusable(true);
        card.setBackground(page.ripple(page.round(page.cardFill, 12)));

        TextView title = page.text(item.trackName, 16, true, page.primary);
        title.setMaxLines(2);
        title.setEllipsize(TextUtils.TruncateAt.END);
        card.addView(title);

        String meta = item.artistName;
        if (!item.albumName.isEmpty()) {
            meta = meta.isEmpty() ? item.albumName : (meta + " · " + item.albumName);
        }
        TextView metaTv = page.text(meta, 13, false, page.secondary);
        metaTv.setPadding(0, page.dp(2), 0, page.dp(6));
        metaTv.setMaxLines(1);
        metaTv.setEllipsize(TextUtils.TruncateAt.END);
        card.addView(metaTv);

        LinearLayout chips = new LinearLayout(activity);
        chips.setOrientation(LinearLayout.HORIZONTAL);
        chips.setGravity(Gravity.CENTER_VERTICAL);

        if (item.instrumental) {
            chips.addView(page.chip(LrclibStrings.text(activity, "tag_instrumental"), 0x26FF9F0A, 0xFFFF9F0A));
        } else {
            if (item.hasWordSync) {
                chips.addView(page.chip(LrclibStrings.text(activity, "tag_word"), 0x26FA2D48, page.accent));
            } else if (item.hasSyncedLyrics) {
                chips.addView(page.chip(LrclibStrings.text(activity, "tag_synced"), 0x2634C759, 0xFF30B050));
            } else if (item.hasPlainLyrics) {
                chips.addView(page.chip(LrclibStrings.text(activity, "tag_plain"), 0x268E8E93, page.secondary));
            }
        }

        if (item.duration > 0.5) {
            int sec = (int) Math.round(item.duration);
            String durLabel = formatDuration(sec);
            if (query.durationSec > 0) {
                int diff = sec - query.durationSec;
                if (diff != 0) {
                    durLabel += String.format(Locale.ROOT, " (%+ds)", diff);
                }
            }
            TextView durTv = page.text(durLabel, 12, false, page.secondary);
            durTv.setPadding(page.dp(8), 0, 0, 0);
            chips.addView(durTv);
        }

        TextView idTv = page.text("#" + item.id, 12, false, page.secondary);
        idTv.setPadding(page.dp(8), 0, 0, 0);
        chips.addView(idTv);

        card.addView(chips);

        card.setOnClickListener(v -> openRecordPreview(activity, query, item, record -> {
            LrclibController.applyPinnedRecord(activity, fragment, query, record);
            if (onApplied != null) onApplied.run();
        }));
        return card;
    }

    private interface RecordConsumer {
        void accept(LrclibModels.LyricsRecord record);
    }

    private static void openRecordPreview(
            final Activity activity,
            final LrclibModels.TrackQuery query,
            final LrclibModels.SearchSummary summary,
            final RecordConsumer onSelect) {
        final Page page = new Page(activity, LrclibStrings.text(activity, "preview_title"));
        final LinearLayout content = page.createScrollBody();
        final LrclibModels.LyricsRecord[] loaded = new LrclibModels.LyricsRecord[]{summary.fullRecord};

        final TextView applyBtn = page.addFooterButton(LrclibStrings.text(activity, "apply_lyrics"), false, () -> {
            if (loaded[0] != null) {
                page.dismiss();
                onSelect.accept(loaded[0]);
            }
        });

        final Runnable renderLoaded = () -> {
            content.removeAllViews();
            LrclibModels.LyricsRecord rec = loaded[0];
            if (rec == null) {
                content.addView(page.emptyMessage(LrclibStrings.text(activity, "search_error")));
                return;
            }
            LinearLayout header = page.card();
            header.addView(page.text(rec.trackName, 17, true, page.primary));
            String sub = rec.artistName + (rec.albumName.isEmpty() ? "" : (" · " + rec.albumName))
                    + " · #" + rec.id;
            TextView subTv = page.text(sub, 13, false, page.secondary);
            subTv.setPadding(0, page.dp(4), 0, 0);
            header.addView(subTv);
            content.addView(header, page.cardParams());

            String bodyText;
            if (rec.instrumental) {
                bodyText = LrclibStrings.text(activity, "instrumental_message");
            } else {
                bodyText = LrclibParser.formatPreviewText(rec);
                if (bodyText.isEmpty()) bodyText = LrclibStrings.text(activity, "preview_empty");
            }

            TextView lyricsTv = page.text(bodyText, 15, false, page.primary);
            lyricsTv.setLineSpacing(page.dp(4), 1f);
            lyricsTv.setPadding(page.dp(4), page.dp(8), page.dp(4), page.dp(16));
            lyricsTv.setTextIsSelectable(true);
            content.addView(lyricsTv);

            applyBtn.setEnabled(true);
            applyBtn.setAlpha(1f);
        };

        if (loaded[0] != null) {
            renderLoaded.run();
            return;
        }

        content.addView(page.loadingBlock(LrclibStrings.text(activity, "preview_loading")));
        UI_EXECUTOR.execute(() -> {
            LrclibModels.LyricsRecord rec = LrclibPrefs.readRecordById(activity, summary.id);
            if (rec == null) {
                try {
                    rec = LrclibApiClient.getById(summary.id);
                    if (rec != null) {
                        LrclibPrefs.writeRecordByIdCache(activity, rec, false);
                    }
                } catch (IOException ignored) {
                }
            }
            loaded[0] = rec;
            MAIN.post(() -> {
                if (page.isShowing()) renderLoaded.run();
            });
        });
    }

    // =========================================================================
    // 3. Full LRCLIB Settings Page
    // =========================================================================

    static void openSettings(final Activity activity) {
        if (activity == null || activity.isFinishing()) return;
        LrclibController.captureContext(activity);

        final Page page = new Page(activity, LrclibStrings.text(activity, "settings_title"));
        final LinearLayout content = page.createScrollBody();

        final Runnable[] rebuild = new Runnable[1];
        rebuild[0] = () -> {
            content.removeAllViews();

            // Master enable toggle
            LinearLayout mainCard = page.card();
            page.addSwitchRow(
                    mainCard,
                    LrclibStrings.text(activity, "enabled"),
                    LrclibStrings.text(activity, "enabled_summary"),
                    LrclibPrefs.isEnabled(activity),
                    checked -> {
                        LrclibPrefs.setEnabled(activity, checked);
                        LrclibController.refreshAllUi();
                    }
            );
            content.addView(mainCard, page.cardParams());

            // Lyrics priority section
            content.addView(page.sectionHeader(LrclibStrings.text(activity, "section_mode")));
            LinearLayout modeCard = page.card();
            LrclibModels.FallbackMode mode = LrclibPrefs.getFallbackMode(activity);
            page.addRadioRow(
                    modeCard,
                    LrclibStrings.text(activity, "mode_missing_and_unsynced"),
                    LrclibStrings.text(activity, "mode_missing_and_unsynced_desc"),
                    mode == LrclibModels.FallbackMode.MISSING_AND_UNSYNCED,
                    true,
                    () -> {
                        LrclibPrefs.setFallbackMode(activity, LrclibModels.FallbackMode.MISSING_AND_UNSYNCED);
                        LrclibController.clearResolvedStates();
                        rebuild[0].run();
                    }
            );
            modeCard.addView(page.separator(), page.sepParams());
            page.addRadioRow(
                    modeCard,
                    LrclibStrings.text(activity, "mode_missing_only"),
                    LrclibStrings.text(activity, "mode_missing_only_desc"),
                    mode == LrclibModels.FallbackMode.MISSING_ONLY,
                    true,
                    () -> {
                        LrclibPrefs.setFallbackMode(activity, LrclibModels.FallbackMode.MISSING_ONLY);
                        LrclibController.clearResolvedStates();
                        rebuild[0].run();
                    }
            );
            modeCard.addView(page.separator(), page.sepParams());
            page.addRadioRow(
                    modeCard,
                    LrclibStrings.text(activity, "mode_prefer_lrclib"),
                    LrclibStrings.text(activity, "mode_prefer_lrclib_desc"),
                    mode == LrclibModels.FallbackMode.PREFER_LRCLIB,
                    true,
                    () -> {
                        LrclibPrefs.setFallbackMode(activity, LrclibModels.FallbackMode.PREFER_LRCLIB);
                        LrclibController.clearResolvedStates();
                        rebuild[0].run();
                    }
            );
            content.addView(modeCard, page.cardParams());

            // Matching & playback section
            content.addView(page.sectionHeader(LrclibStrings.text(activity, "section_playback")));
            LinearLayout playbackCard = page.card();
            page.addSwitchRow(
                    playbackCard,
                    LrclibStrings.text(activity, "word_sync"),
                    LrclibStrings.text(activity, "word_sync_summary"),
                    LrclibPrefs.isWordSyncEnabled(activity),
                    checked -> LrclibPrefs.setWordSyncEnabled(activity, checked)
            );
            playbackCard.addView(page.separator(), page.sepParams());
            page.addSwitchRow(
                    playbackCard,
                    LrclibStrings.text(activity, "allow_plain"),
                    LrclibStrings.text(activity, "allow_plain_summary"),
                    LrclibPrefs.isAllowPlainEnabled(activity),
                    checked -> LrclibPrefs.setAllowPlainEnabled(activity, checked)
            );
            playbackCard.addView(page.separator(), page.sepParams());
            page.addSwitchRow(
                    playbackCard,
                    LrclibStrings.text(activity, "search_fallback"),
                    LrclibStrings.text(activity, "search_fallback_summary"),
                    LrclibPrefs.isSearchFallbackEnabled(activity),
                    checked -> LrclibPrefs.setSearchFallbackEnabled(activity, checked)
            );
            playbackCard.addView(page.separator(), page.sepParams());
            page.addOffsetStepper(
                    playbackCard,
                    LrclibStrings.text(activity, "default_offset"),
                    LrclibPrefs.getDefaultOffsetMs(activity),
                    newOffset -> {
                        LrclibPrefs.setDefaultOffsetMs(activity, newOffset);
                        rebuild[0].run();
                    }
            );
            content.addView(playbackCard, page.cardParams());

            // Source indicator UI section
            content.addView(page.sectionHeader(LrclibStrings.text(activity, "section_ui")));
            LinearLayout uiCard = page.card();
            page.addSwitchRow(
                    uiCard,
                    LrclibStrings.text(activity, "show_button_badge"),
                    LrclibStrings.text(activity, "show_button_badge_summary"),
                    LrclibPrefs.isShowButtonBadge(activity),
                    checked -> {
                        LrclibPrefs.setShowButtonBadge(activity, checked);
                        LrclibController.refreshAllUi();
                    }
            );
            uiCard.addView(page.separator(), page.sepParams());
            page.addSwitchRow(
                    uiCard,
                    LrclibStrings.text(activity, "show_lyrics_pill"),
                    LrclibStrings.text(activity, "show_lyrics_pill_summary"),
                    LrclibPrefs.isShowLyricsPill(activity),
                    checked -> {
                        LrclibPrefs.setShowLyricsPill(activity, checked);
                        LrclibController.refreshAllUi();
                    }
            );
            content.addView(uiCard, page.cardParams());

            // Overrides & cache section
            content.addView(page.sectionHeader(LrclibStrings.text(activity, "section_data")));
            LinearLayout dataCard = page.card();
            int overrideCount = LrclibPrefs.loadAllOverrides(activity).size();
            page.addActionRow(
                    dataCard,
                    LrclibStrings.text(activity, "manage_overrides", overrideCount),
                    page.primary,
                    () -> openOverridesManager(activity, rebuild[0])
            );
            dataCard.addView(page.separator(), page.sepParams());
            int cacheCount = LrclibPrefs.getCacheFileCount(activity);
            page.addActionRow(
                    dataCard,
                    LrclibStrings.text(activity, "clear_cache", cacheCount),
                    page.accent,
                    () -> {
                        LrclibPrefs.clearCache(activity);
                        LrclibController.clearResolvedStates();
                        Toast.makeText(activity, LrclibStrings.text(activity, "cache_cleared"), Toast.LENGTH_SHORT).show();
                        rebuild[0].run();
                    }
            );
            content.addView(dataCard, page.cardParams());

            TextView about = page.text(LrclibStrings.text(activity, "about"), 13, false, page.secondary);
            about.setLineSpacing(page.dp(3), 1f);
            about.setPadding(page.dp(4), page.dp(12), page.dp(4), page.dp(24));
            content.addView(about);
        };

        rebuild[0].run();
    }

    private static void openOverridesManager(final Activity activity, final Runnable onChanged) {
        final Page page = new Page(activity, LrclibStrings.text(activity, "overrides_title"));
        final LinearLayout content = page.createScrollBody();

        final Runnable[] rebuild = new Runnable[1];
        rebuild[0] = () -> {
            content.removeAllViews();
            List<LrclibModels.TrackOverride> list = LrclibPrefs.listOverridesNewestFirst(activity);
            if (list.isEmpty()) {
                content.addView(page.emptyMessage(LrclibStrings.text(activity, "overrides_empty")));
                return;
            }

            for (final LrclibModels.TrackOverride item : list) {
                LinearLayout card = page.card();
                LinearLayout row = new LinearLayout(activity);
                row.setOrientation(LinearLayout.HORIZONTAL);
                row.setGravity(Gravity.CENTER_VERTICAL);

                LinearLayout textCol = new LinearLayout(activity);
                textCol.setOrientation(LinearLayout.VERTICAL);
                String titleStr = item.trackTitle.isEmpty() ? item.trackKey : item.trackTitle;
                TextView titleTv = page.text(titleStr, 15, true, page.primary);
                titleTv.setMaxLines(1);
                titleTv.setEllipsize(TextUtils.TruncateAt.END);
                textCol.addView(titleTv);

                StringBuilder detail = new StringBuilder();
                if (!item.artistName.isEmpty()) detail.append(item.artistName).append(" · ");
                detail.append(describeOverride(activity, item));
                if (item.offsetMs != 0) {
                    detail.append(" · ").append(formatSignedOffset(item.offsetMs)).append(" ms");
                }
                TextView detailTv = page.text(detail.toString(), 13, false, page.secondary);
                detailTv.setPadding(0, page.dp(3), 0, 0);
                detailTv.setMaxLines(2);
                detailTv.setEllipsize(TextUtils.TruncateAt.END);
                textCol.addView(detailTv);

                row.addView(textCol, new LinearLayout.LayoutParams(0, -2, 1f));

                TextView remove = page.text(LrclibStrings.text(activity, "remove_override"), 14, true, page.accent);
                remove.setPadding(page.dp(12), page.dp(8), page.dp(4), page.dp(8));
                remove.setBackground(page.ripple(null));
                remove.setOnClickListener(v -> {
                    LrclibPrefs.removeOverride(activity, item.trackKey);
                    LrclibController.refreshAllUi();
                    if (onChanged != null) onChanged.run();
                    rebuild[0].run();
                });
                row.addView(remove);
                card.addView(row);
                content.addView(card, page.cardParams());
            }

            TextView clearAll = page.button(LrclibStrings.text(activity, "clear_all_overrides"), false);
            clearAll.setOnClickListener(v -> {
                LrclibPrefs.clearAllOverrides(activity);
                LrclibController.refreshAllUi();
                if (onChanged != null) onChanged.run();
                rebuild[0].run();
            });
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, page.dp(44));
            params.setMargins(0, page.dp(12), 0, page.dp(16));
            content.addView(clearAll, params);
        };

        rebuild[0].run();
    }

    // =========================================================================
    // Formatting helpers
    // =========================================================================

    private static String describeCurrentState(Context ctx, LrclibController.TrackLyricsState state) {
        if (state == null) return LrclibStrings.text(ctx, "status_none");
        switch (state.source) {
            case OFFICIAL_WORD: return LrclibStrings.text(ctx, "status_official_word");
            case OFFICIAL_LINE: return LrclibStrings.text(ctx, "status_official_line");
            case OFFICIAL_STATIC: return LrclibStrings.text(ctx, "status_official_static");
            case LRCLIB_WORD: return LrclibStrings.text(ctx, "status_lrclib_word", state.lrclibId);
            case LRCLIB_LINE: return LrclibStrings.text(ctx, "status_lrclib_line", state.lrclibId);
            case LRCLIB_PLAIN: return LrclibStrings.text(ctx, "status_lrclib_plain", state.lrclibId);
            case LRCLIB_INSTRUMENTAL: return LrclibStrings.text(ctx, "status_lrclib_instrumental", state.lrclibId);
            case LOADING_LRCLIB: return LrclibStrings.text(ctx, "status_loading");
            case NONE:
            default:
                return state.rateLimited
                        ? LrclibStrings.text(ctx, "rate_limited")
                        : LrclibStrings.text(ctx, "status_none");
        }
    }

    private static String describeOverride(Context ctx, LrclibModels.TrackOverride ov) {
        switch (ov.mode) {
            case FORCE_OFFICIAL: return LrclibStrings.text(ctx, "override_official");
            case FORCE_LRCLIB_AUTO: return LrclibStrings.text(ctx, "override_lrclib_auto");
            case FORCE_LRCLIB_ID: return LrclibStrings.text(ctx, "override_lrclib_pinned", ov.lrclibId);
            case AUTO:
            default: return LrclibStrings.text(ctx, "override_auto");
        }
    }

    private static String formatSignedOffset(int ms) {
        if (ms > 0) return "+" + ms;
        return String.valueOf(ms);
    }

    private static String formatDuration(int totalSeconds) {
        int m = totalSeconds / 60;
        int s = totalSeconds % 60;
        return String.format(Locale.ROOT, "%d:%02d", m, s);
    }

    // =========================================================================
    // Native-styled Apple Music Full-Screen Dialog helper (matching MetadataRepairPage)
    // =========================================================================

    private interface BooleanConsumer {
        void accept(boolean value);
    }

    private interface IntConsumer {
        void accept(int value);
    }

    private static final class Page {
        final Activity activity;
        final Dialog dialog;
        final LinearLayout root;
        final int background;
        final int primary;
        final int secondary;
        final int accent;
        final int cardFill;
        final int separator;
        final int systemGray;
        final Typeface regular;
        final Typeface semibold;

        Page(Activity activity, String title) {
            this.activity = activity;
            this.background = resolveColor("background_color", 0xFF1C1C1E);
            this.primary = resolveColor("label_color", Color.WHITE);
            this.secondary = resolveColor("secondary_label_color", 0xFFAEAEB2);
            this.accent = resolveColor("key_color", 0xFFFA2D48);
            this.cardFill = resolveColor("tertiary_fill_color", 0xFF2C2C2E);
            this.separator = resolveColor("separator_color", 0x338E8E93);
            this.systemGray = resolveColor("system_gray", 0xFF8E8E93);
            this.regular = resolveFont("regular", Typeface.DEFAULT);
            this.semibold = resolveFont("semibold", Typeface.DEFAULT_BOLD);

            int themeId = LrclibStrings.id(activity, "style", "AppTheme.FullScreenDialog");
            this.dialog = themeId != 0 ? new Dialog(activity, themeId) : new Dialog(activity);
            dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

            root = new LinearLayout(activity);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setBackgroundColor(background);
            if (Build.VERSION.SDK_INT >= 29) {
                root.setForceDarkAllowed(false);
            }
            root.setFocusableInTouchMode(true);
            if (Build.VERSION.SDK_INT >= 30) {
                root.setOnApplyWindowInsetsListener((view, insets) -> {
                    android.graphics.Insets safe = insets.getInsets(
                            WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout() | WindowInsets.Type.ime()
                    );
                    view.setPadding(safe.left, safe.top, safe.right, safe.bottom);
                    return insets;
                });
            }

            // Toolbar
            FrameLayout toolbar = new FrameLayout(activity);
            TextView heading = text(title, 17, true, primary);
            heading.setGravity(Gravity.CENTER);
            heading.setSingleLine(true);
            heading.setEllipsize(TextUtils.TruncateAt.END);
            FrameLayout.LayoutParams headingParams = new FrameLayout.LayoutParams(-1, -1);
            headingParams.setMargins(dp(56), 0, dp(56), 0);
            toolbar.addView(heading, headingParams);

            ImageButton back = new ImageButton(activity);
            int backIcon = LrclibStrings.id(activity, "drawable", "sf_chevron_backward_monochrome_medium_medium");
            if (backIcon != 0) {
                back.setImageResource(backIcon);
                back.setImageTintList(ColorStateList.valueOf(accent));
            }
            back.setBackground(ripple(null));
            back.setContentDescription(LrclibStrings.text(activity, "back"));
            back.setOnClickListener(v -> dismiss());
            toolbar.addView(back, new FrameLayout.LayoutParams(dp(52), -1, Gravity.START));
            root.addView(toolbar, new LinearLayout.LayoutParams(-1, dp(52)));
            root.addView(separator(), new LinearLayout.LayoutParams(-1, 1));

            dialog.setContentView(root);
            Window window = dialog.getWindow();
            if (window != null) {
                window.setBackgroundDrawable(new ColorDrawable(background));
                window.clearFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
                window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS
                        | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN
                        | WindowManager.LayoutParams.FLAG_LAYOUT_INSET_DECOR);
                if (Build.VERSION.SDK_INT >= 30) {
                    window.setDecorFitsSystemWindows(false);
                }
                window.setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
                        | WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
                window.setStatusBarColor(Color.TRANSPARENT);
                window.setNavigationBarColor(background);
            }
            dialog.show();
            if (window != null) {
                window.setLayout(-1, -1);
                if (Build.VERSION.SDK_INT >= 30 && window.getInsetsController() != null) {
                    boolean light = Color.luminance(background) > 0.5;
                    int mask = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                            | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                    window.getInsetsController().setSystemBarsAppearance(light ? mask : 0, mask);
                }
            }
            root.requestApplyInsets();
        }

        boolean isShowing() {
            return dialog.isShowing();
        }

        void dismiss() {
            hideKeyboard();
            if (dialog.isShowing()) dialog.dismiss();
        }

        void hideKeyboard() {
            InputMethodManager imm = (InputMethodManager) activity.getSystemService(Context.INPUT_METHOD_SERVICE);
            if (imm != null && root.getWindowToken() != null) {
                imm.hideSoftInputFromWindow(root.getWindowToken(), 0);
            }
        }

        LinearLayout createScrollBody() {
            ScrollView scroll = new ScrollView(activity);
            LinearLayout content = new LinearLayout(activity);
            content.setOrientation(LinearLayout.VERTICAL);
            content.setPadding(dp(20), dp(12), dp(20), dp(24));
            scroll.addView(content, new FrameLayout.LayoutParams(-1, -2));
            setBody(scroll);
            return content;
        }

        void setBody(View body) {
            root.addView(body, new LinearLayout.LayoutParams(-1, 0, 1f));
        }

        TextView addFooterButton(String label, boolean enabled, Runnable onClick) {
            LinearLayout footer = new LinearLayout(activity);
            footer.setOrientation(LinearLayout.VERTICAL);
            footer.addView(separator(), new LinearLayout.LayoutParams(-1, 1));
            TextView btn = button(label, true);
            btn.setEnabled(enabled);
            btn.setAlpha(enabled ? 1f : 0.45f);
            btn.setOnClickListener(v -> onClick.run());
            LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(-1, dp(50));
            p.setMargins(dp(20), dp(12), dp(20), dp(12));
            footer.addView(btn, p);
            root.addView(footer, new LinearLayout.LayoutParams(-1, -2));
            return btn;
        }

        LinearLayout card() {
            LinearLayout ll = new LinearLayout(activity);
            ll.setOrientation(LinearLayout.VERTICAL);
            ll.setBackground(round(cardFill, 12));
            ll.setPadding(dp(16), dp(12), dp(16), dp(12));
            return ll;
        }

        LinearLayout.LayoutParams cardParams() {
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, -2);
            lp.setMargins(0, dp(8), 0, dp(4));
            return lp;
        }

        LinearLayout.LayoutParams sepParams() {
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-1, 1);
            lp.setMargins(0, dp(10), 0, dp(10));
            return lp;
        }

        TextView sectionHeader(String label) {
            TextView tv = text(label, 13, true, secondary);
            tv.setPadding(dp(4), dp(16), dp(4), dp(4));
            return tv;
        }

        void addSwitchRow(LinearLayout parent, String title, String summary, boolean checked, BooleanConsumer onChanged) {
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);

            LinearLayout labels = new LinearLayout(activity);
            labels.setOrientation(LinearLayout.VERTICAL);
            labels.addView(text(title, 15, false, primary));
            if (summary != null && !summary.isEmpty()) {
                TextView sum = text(summary, 12, false, secondary);
                sum.setPadding(0, dp(3), dp(12), 0);
                sum.setLineSpacing(dp(2), 1f);
                labels.addView(sum);
            }
            row.addView(labels, new LinearLayout.LayoutParams(0, -2, 1f));

            Switch sw = new Switch(activity);
            sw.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
            sw.setChecked(checked);
            sw.setThumbTintList(new ColorStateList(
                    new int[][]{new int[]{android.R.attr.state_checked}, new int[]{}},
                    new int[]{accent, systemGray}
            ));
            sw.setOnCheckedChangeListener((buttonView, isChecked) -> onChanged.accept(isChecked));
            row.addView(sw);
            row.setOnClickListener(v -> sw.toggle());
            parent.addView(row);
        }

        void addRadioRow(LinearLayout parent, String title, String summary, boolean selected, boolean enabled, Runnable onSelect) {
            LinearLayout row = new LinearLayout(activity);
            row.setOrientation(LinearLayout.HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setBackground(ripple(null));
            row.setPadding(0, dp(4), 0, dp(4));

            LinearLayout labels = new LinearLayout(activity);
            labels.setOrientation(LinearLayout.VERTICAL);
            labels.addView(text(title, 15, selected, selected ? accent : primary));
            if (summary != null && !summary.isEmpty()) {
                TextView sum = text(summary, 12, false, secondary);
                sum.setPadding(0, dp(3), dp(12), 0);
                sum.setLineSpacing(dp(2), 1f);
                labels.addView(sum);
            }
            row.addView(labels, new LinearLayout.LayoutParams(0, -2, 1f));

            TextView check = text(selected ? "✓" : "", 18, true, accent);
            check.setMinWidth(dp(24));
            check.setGravity(Gravity.END);
            row.addView(check);

            row.setEnabled(enabled);
            row.setAlpha(enabled ? 1f : 0.45f);
            row.setOnClickListener(v -> onSelect.run());
            parent.addView(row);
        }

        void addActionRow(LinearLayout parent, String title, int color, Runnable onClick) {
            TextView tv = text(title, 15, true, color);
            tv.setPadding(0, dp(6), 0, dp(6));
            tv.setBackground(ripple(null));
            tv.setClickable(true);
            tv.setFocusable(true);
            tv.setOnClickListener(v -> onClick.run());
            parent.addView(tv, new LinearLayout.LayoutParams(-1, -2));
        }

        void addOffsetStepper(LinearLayout parent, String title, final int currentMs, final IntConsumer onChange) {
            LinearLayout top = new LinearLayout(activity);
            top.setOrientation(LinearLayout.HORIZONTAL);
            top.setGravity(Gravity.CENTER_VERTICAL);
            top.addView(text(title, 15, false, primary), new LinearLayout.LayoutParams(0, -2, 1f));
            TextView valTv = text(
                    LrclibStrings.text(activity, "offset_value", formatSignedOffset(currentMs)),
                    15, true, currentMs == 0 ? secondary : accent
            );
            top.addView(valTv);
            parent.addView(top);

            LinearLayout controls = new LinearLayout(activity);
            controls.setOrientation(LinearLayout.HORIZONTAL);
            controls.setGravity(Gravity.CENTER_VERTICAL);
            controls.setPadding(0, dp(10), 0, dp(2));

            int[] deltas = {-500, -100, 100, 500};
            String[] labels = {"-500", "-100", "+100", "+500"};
            for (int i = 0; i < deltas.length; i++) {
                final int d = deltas[i];
                TextView btn = stepChip(labels[i], () -> onChange.accept(LrclibPrefs.clampOffset(currentMs + d)));
                LinearLayout.LayoutParams p = new LinearLayout.LayoutParams(0, dp(34), 1f);
                p.setMargins(i == 0 ? 0 : dp(6), 0, 0, 0);
                controls.addView(btn, p);
            }
            TextView resetBtn = stepChip(LrclibStrings.text(activity, "offset_reset"), () -> onChange.accept(0));
            LinearLayout.LayoutParams rp = new LinearLayout.LayoutParams(-2, dp(34));
            rp.setMargins(dp(6), 0, 0, 0);
            resetBtn.setPadding(dp(10), 0, dp(10), 0);
            controls.addView(resetBtn, rp);
            parent.addView(controls);
        }

        private TextView stepChip(String label, Runnable onClick) {
            TextView tv = text(label, 13, true, primary);
            tv.setGravity(Gravity.CENTER);
            tv.setBackground(ripple(round((primary & 0x00FFFFFF) | 0x1A000000, 8)));
            tv.setClickable(true);
            tv.setFocusable(true);
            tv.setOnClickListener(v -> onClick.run());
            return tv;
        }

        EditText input(String hint, String initial) {
            EditText et = new EditText(activity);
            et.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
            et.setTypeface(regular);
            et.setTextSize(15);
            et.setTextColor(primary);
            et.setHintTextColor(secondary);
            et.setHint(hint);
            et.setText(initial == null ? "" : initial);
            et.setSingleLine(true);
            et.setBackground(round(cardFill, 10));
            et.setPadding(dp(12), 0, dp(12), 0);
            return et;
        }

        TextView button(String label, boolean filled) {
            TextView tv = text(label, 15, true, filled ? Color.WHITE : accent);
            tv.setGravity(Gravity.CENTER);
            tv.setBackground(ripple(filled ? round(accent, 10) : null));
            tv.setClickable(true);
            tv.setFocusable(true);
            return tv;
        }

        TextView chip(String label, int bgColor, int fgColor) {
            TextView tv = text(label, 11, true, fgColor);
            tv.setPadding(dp(8), dp(3), dp(8), dp(3));
            tv.setBackground(round(bgColor, 6));
            return tv;
        }

        View loadingBlock(String message) {
            LinearLayout ll = new LinearLayout(activity);
            ll.setOrientation(LinearLayout.VERTICAL);
            ll.setGravity(Gravity.CENTER);
            ll.setPadding(dp(24), dp(36), dp(24), dp(36));
            ProgressBar pb = new ProgressBar(activity);
            pb.setIndeterminateTintList(ColorStateList.valueOf(accent));
            ll.addView(pb, new LinearLayout.LayoutParams(dp(28), dp(28)));
            TextView tv = text(message, 14, false, secondary);
            tv.setPadding(0, dp(12), 0, 0);
            ll.addView(tv);
            return ll;
        }

        TextView emptyMessage(String message) {
            TextView tv = text(message, 15, false, secondary);
            tv.setGravity(Gravity.CENTER);
            tv.setLineSpacing(dp(4), 1f);
            tv.setPadding(dp(16), dp(36), dp(16), dp(36));
            return tv;
        }

        TextView text(String value, int sp, boolean bold, int color) {
            TextView tv = new TextView(activity);
            tv.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
            tv.setText(value);
            tv.setTextSize(sp);
            tv.setTextColor(color);
            tv.setTypeface(bold ? semibold : regular);
            tv.setIncludeFontPadding(false);
            return tv;
        }

        View separator() {
            View v = new View(activity);
            v.setBackgroundColor(separator);
            return v;
        }

        GradientDrawable round(int color, int radiusDp) {
            GradientDrawable d = new GradientDrawable();
            d.setColor(color);
            d.setCornerRadius(dp(radiusDp));
            return d;
        }

        RippleDrawable ripple(Drawable content) {
            return new RippleDrawable(
                    ColorStateList.valueOf((primary & 0x00FFFFFF) | 0x18000000),
                    content,
                    new ColorDrawable(Color.WHITE)
            );
        }

        int dp(int value) {
            return Math.round(value * activity.getResources().getDisplayMetrics().density);
        }

        private int resolveColor(String name, int fallback) {
            int resId = LrclibStrings.id(activity, "color", name);
            if (resId == 0) return fallback;
            try {
                return activity.getColor(resId);
            } catch (RuntimeException ignored) {
                return fallback;
            }
        }

        private Typeface resolveFont(String name, Typeface fallback) {
            int resId = LrclibStrings.id(activity, "font", name);
            if (resId == 0) return fallback;
            try {
                return activity.getResources().getFont(resId);
            } catch (RuntimeException ignored) {
                return fallback;
            }
        }
    }
}
