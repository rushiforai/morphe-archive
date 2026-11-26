package app.voidhack.extension.applemusic.lyrics;

import android.app.Activity;
import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
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
import android.text.Editable;
import android.text.InputType;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.Log;
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
    private static boolean dictionaryDownloading;
    private static boolean folderScanning;
    private static final ExecutorService UI_EXECUTOR = Executors.newSingleThreadExecutor(r -> {
        Thread t = new Thread(r, "VoidhackLrclibUi");
        t.setDaemon(true);
        return t;
    });

    private LrclibUi() {}

    private static void rescanLocalFolder(final Activity activity, final Runnable rebuild, final boolean showToast) {
        if (folderScanning) return;
        folderScanning = true;
        if (rebuild != null) rebuild.run();
        final Context context = activity.getApplicationContext();
        UI_EXECUTOR.execute(() -> {
            LocalLrcFolder.ScanResult result = LocalLrcFolder.rescanNow(context);
            MAIN.post(() -> {
                folderScanning = false;
                LrclibController.onLocalFolderChanged(context);
                if (showToast) {
                    String msg = result.accessible
                            ? LrclibStrings.text(context, "local_folder_rescanned", result.fileCount)
                            : LrclibStrings.text(context, "local_folder_inaccessible");
                    Toast.makeText(context, msg, Toast.LENGTH_SHORT).show();
                }
                if (rebuild != null && !activity.isDestroyed()) rebuild.run();
            });
        });
    }

    private static void downloadDictionary(Activity activity, Runnable rebuild) {
        if (dictionaryDownloading) return;
        dictionaryDownloading = true;
        rebuild.run();
        Context context = activity.getApplicationContext();
        UI_EXECUTOR.execute(() -> {
            boolean installed;
            try {
                KuromojiDictionary.install(context);
                installed = true;
            } catch (IOException e) {
                Log.w("AppleMusicLrclib", "Could not install the Japanese lyrics dictionary", e);
                installed = false;
            }
            boolean success = installed;
            MAIN.post(() -> {
                dictionaryDownloading = false;
                if (success) {
                    LrclibController.reloadCurrentTrack(context, null, false);
                } else {
                    Toast.makeText(context, LrclibStrings.text(context, "dictionary_download_failed"),
                            Toast.LENGTH_LONG).show();
                }
                if (!activity.isDestroyed()) rebuild.run();
            });
        });
    }

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
            if (activeMode == LrclibModels.OverrideMode.FORCE_LOCAL_LRC && ov != null) {
                modeCard.addView(page.separator(), page.sepParams());
                String fileLabel = ov.localFileName.isEmpty() ? "lyrics.lrc" : ov.localFileName;
                String subLabel = ov.localForceUnsynced
                        ? LrclibStrings.text(activity, "override_local_file_unsynced")
                        : null;
                page.addRadioRow(
                        modeCard,
                        LrclibStrings.text(activity, "override_local_file", fileLabel),
                        subLabel,
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

            // Paste plain text or LRC lyrics directly (works for songs without lyrics too)
            TextView pasteBtn = page.secondaryButton(LrclibStrings.text(activity, "paste_lyrics_action"));
            pasteBtn.setOnClickListener(v -> openPasteLyricsPage(activity, fragment, query, () -> {
                page.dismiss();
            }));
            LinearLayout.LayoutParams pasteCtaParams = new LinearLayout.LayoutParams(-1, page.dp(46));
            pasteCtaParams.setMargins(0, page.dp(6), 0, page.dp(4));
            content.addView(pasteBtn, pasteCtaParams);

            // Load local LRC file button (secondary CTA)
            TextView localBtn = page.secondaryButton(LrclibStrings.text(activity, "local_pick_action"));
            localBtn.setOnClickListener(v -> LrcPickerFragment.pickFile(activity, (fileName, decoded) -> {
                openLocalLrcPreview(activity, fragment, query, fileName, decoded, () -> page.dismiss());
            }));
            LinearLayout.LayoutParams localCtaParams = new LinearLayout.LayoutParams(-1, page.dp(46));
            localCtaParams.setMargins(0, page.dp(6), 0, page.dp(4));
            content.addView(localBtn, localCtaParams);

            // Full-song Lyrics Editor CTA + edited lines review (only when Lyrics editor patch is active)
            LyricsLineEditor.Sheet activeSheet = LyricsLineEditor.getActiveSheet(fragment, query.trackKey);
            List<LyricsEditTtml.EditedLine> editedLines = LyricsFeatures.editor()
                    ? LyricsLineEditor.listEditedLines(activity, activeSheet)
                    : java.util.Collections.emptyList();
            if (LyricsFeatures.editor() && activeSheet != null && activeSheet.displayed != null && !activeSheet.displayed.isEmpty()) {
                TextView editorBtn = page.secondaryButton(LrclibStrings.text(activity, "open_lyrics_editor_action"));
                editorBtn.setOnClickListener(v -> LyricsLineEditor.openEditorForCurrentTrack(
                        activity, fragment, query, activeSheet, () -> page.dismiss()));
                LinearLayout.LayoutParams editorCtaParams = new LinearLayout.LayoutParams(-1, page.dp(46));
                editorCtaParams.setMargins(0, page.dp(6), 0, page.dp(4));
                content.addView(editorBtn, editorCtaParams);
            }
            if (LyricsFeatures.editor() && (!editedLines.isEmpty() || LyricsLineEditor.hasEditsForSheet(activity, activeSheet))) {
                LinearLayout editsCard = page.card();
                int displayCount = editedLines.isEmpty() ? 1 : editedLines.size();
                page.addActionRow(
                        editsCard,
                        LrclibStrings.text(activity, "review_edited_lines", displayCount),
                        page.accent,
                        () -> openEditedLinesPage(activity, fragment, query, activeSheet, rebuild[0])
                );
                content.addView(editsCard, page.cardParams());
            }

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

            // Utility actions: Export LRC, Reload & Settings
            LinearLayout utilCard = page.card();
            if (activeSheet != null && activeSheet.displayed != null && !activeSheet.displayed.isEmpty()) {
                page.addActionRow(utilCard, LrclibStrings.text(activity, "export_lrc_action"), page.primary, () -> {
                    openExportLrcPage(activity, query, activeSheet, !editedLines.isEmpty());
                });
                utilCard.addView(page.separator(), page.sepParams());
            }
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
    // 2b. Local LRC File Preview & Import Page
    // =========================================================================

    private static void openLocalLrcPreview(
            final Activity activity,
            final Object fragment,
            final LrclibModels.TrackQuery query,
            final String fileName,
            final LocalLrcParser.DecodedText decoded,
            final Runnable onApplied) {
        final Page page = new Page(activity, LrclibStrings.text(activity, "local_preview_title"));
        final LinearLayout content = page.createScrollBody();
        final LocalLrcParser.LrcMetadata meta = LocalLrcParser.parseMetadata(decoded.text);
        final boolean[] forceUnsynced = new boolean[]{false};

        page.addFooterButton(LrclibStrings.text(activity, "apply_lyrics"), true, () -> {
            boolean saved = LrclibController.applyLocalLrcFile(
                    activity, fragment, query, fileName, decoded.text, forceUnsynced[0]);
            if (!saved) {
                Toast.makeText(activity, LrclibStrings.text(activity, "local_save_error"), Toast.LENGTH_LONG).show();
                return;
            }
            page.dismiss();
            if (onApplied != null) onApplied.run();
        });

        final Runnable[] render = new Runnable[1];
        render[0] = () -> {
            content.removeAllViews();
            boolean allowWord = LrclibPrefs.isWordSyncEnabled(activity);
            LrclibParser.PreparedRecord prepared = LocalLrcParser.prepareLocalLrc(
                    decoded.text, query.durationSec, allowWord, forceUnsynced[0]);
            int lineCount = (prepared.parsed != null) ? prepared.parsed.lines.size() : 0;

            LinearLayout header = page.card();
            TextView nameTv = page.text(fileName, 17, true, page.primary);
            nameTv.setMaxLines(2);
            nameTv.setEllipsize(TextUtils.TruncateAt.END);
            header.addView(nameTv);

            if (meta.hasAnyTag()) {
                StringBuilder tagLine = new StringBuilder();
                if (!meta.title.isEmpty()) tagLine.append(meta.title);
                if (!meta.artist.isEmpty()) {
                    if (tagLine.length() > 0) tagLine.append(" · ");
                    tagLine.append(meta.artist);
                }
                if (!meta.album.isEmpty()) {
                    if (tagLine.length() > 0) tagLine.append(" · ");
                    tagLine.append(meta.album);
                }
                TextView tagTv = page.text(tagLine.toString(), 13, false, page.secondary);
                tagTv.setPadding(0, page.dp(3), 0, 0);
                tagTv.setMaxLines(2);
                tagTv.setEllipsize(TextUtils.TruncateAt.END);
                header.addView(tagTv);
            }

            LinearLayout chips = new LinearLayout(activity);
            chips.setOrientation(LinearLayout.HORIZONTAL);
            chips.setGravity(Gravity.CENTER_VERTICAL);
            chips.setPadding(0, page.dp(8), 0, 0);

            if (prepared.sourceType == LrclibModels.LyricsSource.LOCAL_WORD) {
                chips.addView(page.chip(LrclibStrings.text(activity, "tag_word"), 0x26FA2D48, page.accent));
            } else if (prepared.sourceType == LrclibModels.LyricsSource.LOCAL_LINE) {
                chips.addView(page.chip(LrclibStrings.text(activity, "tag_synced"), 0x260A84FF, 0xFF0A84FF));
            } else {
                chips.addView(page.chip(LrclibStrings.text(activity, "tag_unsynced"), 0x268E8E93, page.secondary));
            }

            TextView metaTv = page.text(
                    LrclibStrings.text(activity, "local_preview_meta", lineCount, decoded.charsetName),
                    12, false, page.secondary);
            metaTv.setPadding(page.dp(8), 0, 0, 0);
            chips.addView(metaTv);
            header.addView(chips);
            content.addView(header, page.cardParams());

            if (meta.hasSyncedTimestamps) {
                LinearLayout modeCard = page.card();
                page.addSwitchRow(
                        modeCard,
                        LrclibStrings.text(activity, "local_force_unsynced"),
                        LrclibStrings.text(activity, "local_force_unsynced_summary"),
                        forceUnsynced[0],
                        checked -> {
                            forceUnsynced[0] = checked;
                            render[0].run();
                        }
                );
                content.addView(modeCard, page.cardParams());
            }

            String previewBody = LocalLrcParser.formatPreviewText(decoded.text, forceUnsynced[0]);
            if (previewBody.isEmpty()) previewBody = LrclibStrings.text(activity, "preview_empty");
            TextView lyricsTv = page.text(previewBody, 15, false, page.primary);
            lyricsTv.setLineSpacing(page.dp(4), 1f);
            lyricsTv.setPadding(page.dp(4), page.dp(8), page.dp(4), page.dp(16));
            lyricsTv.setTextIsSelectable(true);
            content.addView(lyricsTv);
        };

        render[0].run();
    }

    // =========================================================================
    // 2b-2. Paste Plain Text or LRC Lyrics Page
    // =========================================================================

    private static void openPasteLyricsPage(
            final Activity activity,
            final Object fragment,
            final LrclibModels.TrackQuery query,
            final Runnable onApplied) {
        final Page page = new Page(activity, LrclibStrings.text(activity, "paste_lyrics_title"));
        final LinearLayout body = new LinearLayout(activity);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setPadding(page.dp(16), page.dp(12), page.dp(16), page.dp(12));

        // Subtle track context + clipboard actions row
        LinearLayout topRow = new LinearLayout(activity);
        topRow.setOrientation(LinearLayout.HORIZONTAL);
        topRow.setGravity(Gravity.CENTER_VERTICAL);
        topRow.setPadding(page.dp(2), 0, page.dp(2), page.dp(8));

        String trackMeta = query.title;
        if (!query.artist.isEmpty()) {
            trackMeta = trackMeta.isEmpty() ? query.artist : (trackMeta + " · " + query.artist);
        }
        TextView trackTv = page.text(trackMeta, 13, false, page.secondary);
        trackTv.setSingleLine(true);
        trackTv.setEllipsize(TextUtils.TruncateAt.END);
        topRow.addView(trackTv, new LinearLayout.LayoutParams(0, -2, 1f));

        final TextView clearBtn = page.text(LrclibStrings.text(activity, "paste_lyrics_clear"), 14, false, page.secondary);
        clearBtn.setPadding(page.dp(10), page.dp(6), page.dp(10), page.dp(6));
        clearBtn.setBackground(page.ripple(null));
        clearBtn.setClickable(true);
        clearBtn.setFocusable(true);
        clearBtn.setVisibility(View.GONE);
        topRow.addView(clearBtn);

        TextView pasteClipboardBtn = page.text(
                LrclibStrings.text(activity, "paste_lyrics_from_clipboard"), 14, true, page.accent);
        pasteClipboardBtn.setPadding(page.dp(10), page.dp(6), page.dp(4), page.dp(6));
        pasteClipboardBtn.setBackground(page.ripple(null));
        pasteClipboardBtn.setClickable(true);
        pasteClipboardBtn.setFocusable(true);
        topRow.addView(pasteClipboardBtn);
        body.addView(topRow, new LinearLayout.LayoutParams(-1, -2));

        // Live format status caption
        final TextView statusTv = page.text(
                LrclibStrings.text(activity, "paste_lyrics_status_empty"), 12, false, page.secondary);
        statusTv.setPadding(page.dp(2), 0, page.dp(2), page.dp(8));
        body.addView(statusTv, new LinearLayout.LayoutParams(-1, -2));

        // Optional unsynced switch (shown only when pasted text contains LRC timestamps)
        final boolean[] forceUnsynced = new boolean[]{false};
        final LinearLayout unsyncedCard = page.card();
        unsyncedCard.setVisibility(View.GONE);
        final Runnable[] refreshState = new Runnable[1];
        page.addSwitchRow(
                unsyncedCard,
                LrclibStrings.text(activity, "local_force_unsynced"),
                LrclibStrings.text(activity, "local_force_unsynced_summary"),
                false,
                checked -> {
                    forceUnsynced[0] = checked;
                    if (refreshState[0] != null) refreshState[0].run();
                });
        LinearLayout.LayoutParams switchLp = new LinearLayout.LayoutParams(-1, -2);
        switchLp.setMargins(0, 0, 0, page.dp(10));
        body.addView(unsyncedCard, switchLp);

        // Clean Apple Music surface multi-line text area
        final EditText input = new EditText(activity);
        input.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
        input.setTypeface(page.regular);
        input.setTextSize(15);
        input.setTextColor(page.primary);
        input.setHintTextColor(page.secondary);
        input.setHint(LrclibStrings.text(activity, "paste_lyrics_hint"));
        input.setGravity(Gravity.TOP | Gravity.START);
        input.setLineSpacing(page.dp(4), 1f);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE);
        input.setHorizontallyScrolling(false);
        input.setImeOptions(EditorInfo.IME_FLAG_NO_EXTRACT_UI);
        input.setBackground(page.round(page.elevatedSurface, 12));
        input.setPadding(page.dp(14), page.dp(12), page.dp(14), page.dp(12));
        body.addView(input, new LinearLayout.LayoutParams(-1, 0, 1f));

        page.setBody(body);

        final boolean[] validLyrics = new boolean[]{false};
        final TextView applyBtn = page.addFooterButton(LrclibStrings.text(activity, "apply_lyrics"), false, () -> {
            String raw = input.getText().toString();
            if (!validLyrics[0] || raw.trim().isEmpty()) {
                Toast.makeText(activity, LrclibStrings.text(activity, "paste_lyrics_invalid"), Toast.LENGTH_SHORT).show();
                return;
            }
            String label = LrclibStrings.text(activity, "paste_lyrics_label");
            boolean saved = LrclibController.applyLocalLrcFile(
                    activity, fragment, query, label, raw, forceUnsynced[0]);
            if (!saved) {
                Toast.makeText(activity, LrclibStrings.text(activity, "local_save_error"), Toast.LENGTH_LONG).show();
                return;
            }
            page.dismiss();
            if (onApplied != null) onApplied.run();
        });

        refreshState[0] = () -> {
            String raw = input.getText() == null ? "" : input.getText().toString();
            boolean hasText = !raw.trim().isEmpty();
            clearBtn.setVisibility(hasText ? View.VISIBLE : View.GONE);
            if (!hasText) {
                validLyrics[0] = false;
                unsyncedCard.setVisibility(View.GONE);
                statusTv.setText(LrclibStrings.text(activity, "paste_lyrics_status_empty"));
                statusTv.setTextColor(page.secondary);
                applyBtn.setEnabled(false);
                applyBtn.setAlpha(0.45f);
                return;
            }
            LocalLrcParser.LrcMetadata meta = LocalLrcParser.parseMetadata(raw);
            unsyncedCard.setVisibility(meta.hasSyncedTimestamps ? View.VISIBLE : View.GONE);
            boolean allowWord = LrclibPrefs.isWordSyncEnabled(activity);
            LrclibParser.PreparedRecord prep = LocalLrcParser.prepareLocalLrc(
                    raw, query.durationSec, allowWord, forceUnsynced[0]);
            int lines = (prep.parsed != null) ? prep.parsed.lines.size() : 0;
            validLyrics[0] = lines > 0;
            if (!validLyrics[0]) {
                statusTv.setText(LrclibStrings.text(activity, "paste_lyrics_invalid"));
                statusTv.setTextColor(page.secondary);
            } else if (prep.sourceType == LrclibModels.LyricsSource.LOCAL_PLAIN) {
                statusTv.setText(LrclibStrings.text(activity, "paste_lyrics_status_plain", lines));
                statusTv.setTextColor(page.secondary);
            } else {
                statusTv.setText(LrclibStrings.text(activity, "paste_lyrics_status_synced", lines));
                statusTv.setTextColor(page.accent);
            }
            applyBtn.setEnabled(validLyrics[0]);
            applyBtn.setAlpha(validLyrics[0] ? 1f : 0.45f);
        };

        input.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {}

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {}

            @Override
            public void afterTextChanged(Editable s) {
                refreshState[0].run();
            }
        });

        clearBtn.setOnClickListener(v -> {
            input.setText("");
            refreshState[0].run();
        });

        pasteClipboardBtn.setOnClickListener(v -> {
            ClipboardManager cm = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
            CharSequence pasted = null;
            if (cm != null && cm.hasPrimaryClip()) {
                ClipData clip = cm.getPrimaryClip();
                if (clip != null && clip.getItemCount() > 0) {
                    pasted = clip.getItemAt(0).coerceToText(activity);
                }
            }
            if (pasted == null || pasted.toString().trim().isEmpty()) {
                Toast.makeText(activity, LrclibStrings.text(activity, "paste_lyrics_clipboard_empty"), Toast.LENGTH_SHORT).show();
                return;
            }
            input.setText(pasted.toString());
            input.setSelection(input.getText().length());
            refreshState[0].run();
        });

        refreshState[0].run();
    }

    // =========================================================================
    // 2c. LRC Export Preview & Save Page
    // =========================================================================

    static void openExportLrcPage(
            final Activity activity,
            final LrclibModels.TrackQuery query,
            final LyricsLineEditor.Sheet sheet,
            final boolean includesEdits) {
        final LyricsLrcExporter.Capabilities caps = LyricsLrcExporter.inspect(sheet.displayed);
        if (caps.lineCount <= 0) {
            Toast.makeText(activity, LrclibStrings.text(activity, "export_unavailable"), Toast.LENGTH_SHORT).show();
            return;
        }

        final Page page = new Page(activity, LrclibStrings.text(activity, "export_lrc_title"));
        final LinearLayout content = page.createScrollBody();
        final String suggestedName = LyricsLrcExporter.suggestFileName(query);
        final LyricsLrcExporter.Format[] selectedFormat = new LyricsLrcExporter.Format[]{caps.defaultFormat()};
        final String[] generated = new String[]{""};

        page.addFooterButton(LrclibStrings.text(activity, "export_save_button"), true, () -> {
            if (!generated[0].isEmpty()) {
                LrcPickerFragment.saveFile(activity, suggestedName, generated[0], savedName -> {});
            }
        });

        final Runnable[] render = new Runnable[1];
        render[0] = () -> {
            content.removeAllViews();
            generated[0] = LyricsLrcExporter.export(sheet.displayed, query, selectedFormat[0]);

            LinearLayout header = page.card();
            TextView nameTv = page.text(suggestedName, 16, true, page.primary);
            nameTv.setMaxLines(2);
            nameTv.setEllipsize(TextUtils.TruncateAt.END);
            header.addView(nameTv);

            String metaLine = LrclibStrings.text(activity, "local_preview_meta", caps.lineCount, "UTF-8");
            if (includesEdits) {
                metaLine += " · " + LrclibStrings.text(activity, "export_includes_edits");
            }
            TextView metaTv = page.text(metaLine, 12, false, page.secondary);
            metaTv.setPadding(0, page.dp(4), 0, 0);
            header.addView(metaTv);
            content.addView(header, page.cardParams());

            if (caps.hasLineTiming) {
                LinearLayout formatCard = page.card();
                TextView fmtHeader = page.text(LrclibStrings.text(activity, "export_format_title"), 13, true, page.secondary);
                fmtHeader.setPadding(0, 0, 0, page.dp(6));
                formatCard.addView(fmtHeader);

                page.addRadioRow(
                        formatCard,
                        LrclibStrings.text(activity, "export_format_line"),
                        LrclibStrings.text(activity, "export_format_line_desc"),
                        selectedFormat[0] == LyricsLrcExporter.Format.LINE_SYNCED,
                        true,
                        () -> {
                            selectedFormat[0] = LyricsLrcExporter.Format.LINE_SYNCED;
                            render[0].run();
                        }
                );
                if (caps.hasWordTiming) {
                    formatCard.addView(page.separator(), page.sepParams());
                    page.addRadioRow(
                            formatCard,
                            LrclibStrings.text(activity, "export_format_word"),
                            LrclibStrings.text(activity, "export_format_word_desc"),
                            selectedFormat[0] == LyricsLrcExporter.Format.WORD_SYNCED,
                            true,
                            () -> {
                                selectedFormat[0] = LyricsLrcExporter.Format.WORD_SYNCED;
                                render[0].run();
                            }
                    );
                }
                formatCard.addView(page.separator(), page.sepParams());
                page.addRadioRow(
                        formatCard,
                        LrclibStrings.text(activity, "export_format_unsynced"),
                        LrclibStrings.text(activity, "export_format_unsynced_desc"),
                        selectedFormat[0] == LyricsLrcExporter.Format.UNSYNCED,
                        true,
                        () -> {
                            selectedFormat[0] = LyricsLrcExporter.Format.UNSYNCED;
                            render[0].run();
                        }
                );
                content.addView(formatCard, page.cardParams());
            }

            LinearLayout copyCard = page.card();
            page.addActionRow(copyCard, LrclibStrings.text(activity, "export_copy_clipboard"), page.accent, () -> {
                ClipboardManager cm = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
                if (cm != null && !generated[0].isEmpty()) {
                    cm.setPrimaryClip(ClipData.newPlainText(suggestedName, generated[0]));
                    Toast.makeText(activity, LrclibStrings.text(activity, "export_copied"), Toast.LENGTH_SHORT).show();
                }
            });
            content.addView(copyCard, page.cardParams());

            TextView previewTv = page.text(generated[0], 13, false, page.primary);
            previewTv.setTypeface(Typeface.MONOSPACE);
            previewTv.setLineSpacing(page.dp(3), 1f);
            previewTv.setPadding(page.dp(4), page.dp(10), page.dp(4), page.dp(16));
            previewTv.setTextIsSelectable(true);
            content.addView(previewTv);
        };

        render[0].run();
    }

    // =========================================================================
    // 3. Full LRCLIB Settings Page
    // =========================================================================

    static void openSettings(final Activity activity) {
        if (activity == null || activity.isFinishing()) return;
        LrclibController.captureContext(activity);

        final boolean hasLrclib = LyricsFeatures.lrclib();
        final boolean hasPron = LyricsFeatures.pronunciation();
        final boolean hasEditor = LyricsFeatures.editor();
        int enabledCount = (hasLrclib ? 1 : 0) + (hasPron ? 1 : 0) + (hasEditor ? 1 : 0);
        String titleKey;
        if (enabledCount > 1) {
            titleKey = "settings_title_lyrics";
        } else if (hasLrclib) {
            titleKey = "settings_title";
        } else if (hasPron) {
            titleKey = "settings_title_pronunciation";
        } else {
            titleKey = "settings_title_editor";
        }

        final Page page = new Page(activity, LrclibStrings.text(activity, titleKey));
        final LinearLayout content = page.createScrollBody();

        final Runnable[] rebuild = new Runnable[1];
        rebuild[0] = () -> {
            content.removeAllViews();

            if (hasLrclib) {
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

                // Local LRC folder & priority section
                content.addView(page.sectionHeader(LrclibStrings.text(activity, "section_local")));
                LinearLayout localFolderCard = page.card();
                localFolderCard.addView(page.text(LrclibStrings.text(activity, "local_folder_title"), 15, true, page.primary));
                boolean hasFolder = LrclibPrefs.hasLocalFolder(activity);
                String folderSummary;
                if (folderScanning) {
                    folderSummary = LrclibStrings.text(activity, "local_folder_scanning");
                } else if (hasFolder) {
                    String label = LrclibPrefs.getLocalFolderLabel(activity);
                    if (label.isEmpty()) label = LrclibPrefs.getLocalFolderUri(activity);
                    folderSummary = LrclibStrings.text(
                            activity, "local_folder_status", label, LrclibPrefs.getLocalFolderCount(activity));
                } else {
                    folderSummary = LrclibStrings.text(activity, "local_folder_not_set");
                }
                TextView folderDescTv = page.text(folderSummary, 12, false, hasFolder ? page.accent : page.secondary);
                folderDescTv.setPadding(0, page.dp(4), 0, page.dp(8));
                folderDescTv.setLineSpacing(page.dp(2), 1f);
                localFolderCard.addView(folderDescTv);

                localFolderCard.addView(page.separator(), page.sepParams());
                page.addActionRow(
                        localFolderCard,
                        LrclibStrings.text(activity, hasFolder ? "local_folder_change" : "local_folder_choose"),
                        page.accent,
                        () -> LrcPickerFragment.pickFolder(activity, (treeUri, displayLabel) -> {
                            LrclibPrefs.setLocalFolder(activity, treeUri.toString(), displayLabel);
                            rescanLocalFolder(activity, rebuild[0], true);
                        })
                );
                if (hasFolder) {
                    localFolderCard.addView(page.separator(), page.sepParams());
                    page.addActionRow(
                            localFolderCard,
                            LrclibStrings.text(activity, "local_folder_rescan"),
                            page.primary,
                            () -> rescanLocalFolder(activity, rebuild[0], true)
                    );
                    localFolderCard.addView(page.separator(), page.sepParams());
                    page.addActionRow(
                            localFolderCard,
                            LrclibStrings.text(activity, "local_folder_clear"),
                            page.secondary,
                            () -> {
                                LrclibPrefs.clearLocalFolder(activity);
                                LrclibController.onLocalFolderChanged(activity);
                                rebuild[0].run();
                            }
                    );
                }
                content.addView(localFolderCard, page.cardParams());

                LinearLayout localPriorityCard = page.card();
                TextView localPrioHeader = page.text(LrclibStrings.text(activity, "local_priority_title"), 13, true, page.secondary);
                localPrioHeader.setPadding(0, 0, 0, page.dp(6));
                localPriorityCard.addView(localPrioHeader);
                LrclibModels.LocalLrcPriority localPriority = LrclibPrefs.getLocalLrcPriority(activity);
                page.addRadioRow(
                        localPriorityCard,
                        LrclibStrings.text(activity, "local_priority_prefer"),
                        LrclibStrings.text(activity, "local_priority_prefer_desc"),
                        localPriority == LrclibModels.LocalLrcPriority.PREFER_LOCAL,
                        true,
                        () -> {
                            LrclibPrefs.setLocalLrcPriority(activity, LrclibModels.LocalLrcPriority.PREFER_LOCAL);
                            LrclibController.clearResolvedStates();
                            rebuild[0].run();
                        }
                );
                localPriorityCard.addView(page.separator(), page.sepParams());
                page.addRadioRow(
                        localPriorityCard,
                        LrclibStrings.text(activity, "local_priority_missing_unsynced"),
                        LrclibStrings.text(activity, "local_priority_missing_unsynced_desc"),
                        localPriority == LrclibModels.LocalLrcPriority.MISSING_AND_UNSYNCED,
                        true,
                        () -> {
                            LrclibPrefs.setLocalLrcPriority(activity, LrclibModels.LocalLrcPriority.MISSING_AND_UNSYNCED);
                            LrclibController.clearResolvedStates();
                            rebuild[0].run();
                        }
                );
                localPriorityCard.addView(page.separator(), page.sepParams());
                page.addRadioRow(
                        localPriorityCard,
                        LrclibStrings.text(activity, "local_priority_missing_only"),
                        LrclibStrings.text(activity, "local_priority_missing_only_desc"),
                        localPriority == LrclibModels.LocalLrcPriority.MISSING_ONLY,
                        true,
                        () -> {
                            LrclibPrefs.setLocalLrcPriority(activity, LrclibModels.LocalLrcPriority.MISSING_ONLY);
                            LrclibController.clearResolvedStates();
                            rebuild[0].run();
                        }
                );
                content.addView(localPriorityCard, page.cardParams());

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
            }

            // On-device pronunciation guides section (shown whenever Pronunciation patch is installed)
            if (hasPron && Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                content.addView(page.sectionHeader(LrclibStrings.text(activity, "section_pronunciation")));
                LinearLayout pronCard = page.card();
                page.addSwitchRow(
                        pronCard,
                        LrclibStrings.text(activity, "romanization"),
                        LrclibStrings.text(activity, "romanization_summary"),
                        LrclibPrefs.isRomanizationEnabled(activity),
                        checked -> {
                            LrclibPrefs.setRomanizationEnabled(activity, checked);
                            LrclibController.reloadCurrentTrack(activity, null, false);
                        }
                );
                pronCard.addView(page.separator(), page.sepParams());
                if (dictionaryDownloading || KuromojiDictionary.isInstalled(activity)) {
                    String status = dictionaryDownloading ? "dictionary_downloading" : "dictionary_installed";
                    pronCard.addView(page.text(LrclibStrings.text(activity, status), 15, false, page.secondary));
                } else {
                    page.addActionRow(pronCard, LrclibStrings.text(activity, "dictionary_download"), page.accent,
                            () -> downloadDictionary(activity, rebuild[0]));
                }
                content.addView(pronCard, page.cardParams());
            }

            if (hasLrclib) {
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
            }

            // Data / edited lyrics section
            if (hasLrclib || hasEditor) {
                String dataHdrKey = hasLrclib ? "section_data" : "section_editor";
                content.addView(page.sectionHeader(LrclibStrings.text(activity, dataHdrKey)));
                LinearLayout dataCard = page.card();
                boolean needSep = false;
                if (hasLrclib) {
                    int overrideCount = LrclibPrefs.loadAllOverrides(activity).size();
                    page.addActionRow(
                            dataCard,
                            LrclibStrings.text(activity, "manage_overrides", overrideCount),
                            page.primary,
                            () -> openOverridesManager(activity, rebuild[0])
                    );
                    needSep = true;
                }
                if (hasEditor) {
                    if (needSep) dataCard.addView(page.separator(), page.sepParams());
                    int editedDocCount = LyricsEdits.countDocuments(activity);
                    page.addActionRow(
                            dataCard,
                            LrclibStrings.text(activity, "manage_edited_lyrics", editedDocCount),
                            page.primary,
                            () -> openEditedLyricsManager(activity, rebuild[0])
                    );
                    needSep = true;
                }
                if (hasLrclib) {
                    if (needSep) dataCard.addView(page.separator(), page.sepParams());
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
                }
                content.addView(dataCard, page.cardParams());
            }

            String footerKey = hasLrclib
                    ? "about"
                    : (hasEditor ? "editor_settings_tip" : "pronunciation_settings_tip");
            TextView about = page.text(LrclibStrings.text(activity, footerKey), 13, false, page.secondary);
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
                    LrclibController.clearResolvedStates();
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
                LrclibController.clearResolvedStates();
                if (onChanged != null) onChanged.run();
                rebuild[0].run();
            });
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, page.dp(44));
            params.setMargins(0, page.dp(12), 0, page.dp(16));
            content.addView(clearAll, params);
        };

        rebuild[0].run();
    }

    private static void openEditedLinesPage(
            final Activity activity,
            final Object fragment,
            final LrclibModels.TrackQuery query,
            final LyricsLineEditor.Sheet sheet,
            final Runnable onChanged) {
        final Page page = new Page(activity, LrclibStrings.text(activity, "edited_lines_title"));
        final LinearLayout content = page.createScrollBody();

        final TextView restoreAllBtn = page.addFooterButton(
                LrclibStrings.text(activity, "restore_all_song_edits"),
                true,
                () -> {
                    if (LyricsLineEditor.restoreAll(activity, sheet.documentKey)) {
                        LrclibController.reloadCurrentTrack(activity, fragment, false);
                        Toast.makeText(activity, LrclibStrings.text(activity, "song_edits_restored"), Toast.LENGTH_SHORT).show();
                        if (onChanged != null) onChanged.run();
                        page.dismiss();
                    }
                });

        final Runnable[] rebuild = new Runnable[1];
        rebuild[0] = () -> {
            content.removeAllViews();
            List<LyricsEditTtml.EditedLine> list = LyricsLineEditor.listEditedLines(activity, sheet);
            if (list.isEmpty()) {
                restoreAllBtn.setEnabled(false);
                restoreAllBtn.setAlpha(0.45f);
                content.addView(page.emptyMessage(LrclibStrings.text(activity, "edited_lines_empty")));
                return;
            }
            restoreAllBtn.setEnabled(true);
            restoreAllBtn.setAlpha(1f);

            LyricsEditTtml.DocumentEdit v2Doc = LyricsEdits.loadDocument(activity, sheet.documentKey);
            LinearLayout editCtaCard = page.card();
            page.addActionRow(
                    editCtaCard,
                    LrclibStrings.text(activity, "open_lyrics_editor_action"),
                    page.accent,
                    () -> LyricsLineEditor.openEditorForCurrentTrack(activity, fragment, query, sheet, () -> {
                        if (onChanged != null) onChanged.run();
                        page.dismiss();
                    }));
            content.addView(editCtaCard, page.cardParams());

            for (final LyricsEditTtml.EditedLine entry : list) {
                LinearLayout card = page.card();

                LinearLayout topRow = new LinearLayout(activity);
                topRow.setOrientation(LinearLayout.HORIZONTAL);
                topRow.setGravity(Gravity.CENTER_VERTICAL);

                String lineMeta = LrclibStrings.text(activity, "edited_line_number", entry.index + 1);
                if (entry.startMs >= 0L) {
                    lineMeta += " · " + formatShortTimestamp(entry.startMs);
                }
                if (entry.timingChanged) {
                    lineMeta += " · " + LrclibStrings.text(activity, "editor_timing_changed_badge");
                }
                topRow.addView(page.text(lineMeta, 12, true, page.secondary),
                        new LinearLayout.LayoutParams(0, -2, 1f));

                if (v2Doc == null) {
                    TextView restoreBtn = page.text(LrclibStrings.text(activity, "reset_lyric_line"), 13, true, page.accent);
                    restoreBtn.setPadding(page.dp(10), page.dp(4), page.dp(2), page.dp(4));
                    restoreBtn.setBackground(page.ripple(null));
                    restoreBtn.setClickable(true);
                    restoreBtn.setFocusable(true);
                    restoreBtn.setOnClickListener(v -> {
                        if (LyricsLineEditor.restoreLine(activity, sheet.documentKey, entry.index)) {
                            LrclibController.reloadCurrentTrack(activity, fragment, false);
                            if (onChanged != null) onChanged.run();
                            if (LyricsLineEditor.listEditedLines(activity, sheet).isEmpty()) {
                                page.dismiss();
                            } else {
                                rebuild[0].run();
                            }
                        }
                    });
                    topRow.addView(restoreBtn);
                }
                card.addView(topRow);

                appendDiffSection(
                        activity, page, card,
                        entry.originalText, entry.currentText, entry.textChanged,
                        entry.originalReading, entry.currentReading, entry.readingChanged);

                content.addView(card, page.cardParams());
            }
        };

        rebuild[0].run();
    }

    private static void openEditedLyricsManager(final Activity activity, final Runnable onChanged) {
        final Page page = new Page(activity, LrclibStrings.text(activity, "edited_lyrics_title"));
        final LinearLayout content = page.createScrollBody();

        final Runnable[] rebuild = new Runnable[1];
        rebuild[0] = () -> {
            content.removeAllViews();
            List<LyricsEdits.DocumentRecord> list = LyricsEdits.listAll(activity);
            if (list.isEmpty()) {
                content.addView(page.emptyMessage(LrclibStrings.text(activity, "edited_lyrics_empty")));
                return;
            }

            for (final LyricsEdits.DocumentRecord item : list) {
                LinearLayout card = page.card();
                card.setClickable(true);
                card.setFocusable(true);
                card.setBackground(page.ripple(page.round(page.cardFill, 12)));
                card.setOnClickListener(v -> openStoredEditedDocumentPage(activity, item.documentKey, () -> {
                    if (onChanged != null) onChanged.run();
                    rebuild[0].run();
                }));

                LinearLayout row = new LinearLayout(activity);
                row.setOrientation(LinearLayout.HORIZONTAL);
                row.setGravity(Gravity.CENTER_VERTICAL);

                LinearLayout textCol = new LinearLayout(activity);
                textCol.setOrientation(LinearLayout.VERTICAL);
                boolean hasTitle = !item.trackTitle.isEmpty();
                String titleStr = hasTitle
                        ? item.trackTitle
                        : (!item.trackKey.isEmpty() ? item.trackKey : LrclibStrings.text(activity, "edited_lyrics_untitled"));
                TextView titleTv = page.text(titleStr, 15, true, page.primary);
                titleTv.setMaxLines(1);
                titleTv.setEllipsize(TextUtils.TruncateAt.END);
                textCol.addView(titleTv);

                StringBuilder detail = new StringBuilder();
                if (!item.artistName.isEmpty()) detail.append(item.artistName).append(" · ");
                detail.append(LrclibStrings.text(activity, "edited_lines_count", item.editedLineCount));
                TextView detailTv = page.text(detail.toString(), 13, false, page.secondary);
                detailTv.setPadding(0, page.dp(3), 0, 0);
                detailTv.setMaxLines(2);
                detailTv.setEllipsize(TextUtils.TruncateAt.END);
                textCol.addView(detailTv);

                row.addView(textCol, new LinearLayout.LayoutParams(0, -2, 1f));

                TextView remove = page.text(LrclibStrings.text(activity, "reset_lyric_line"), 14, true, page.accent);
                remove.setPadding(page.dp(12), page.dp(8), page.dp(4), page.dp(8));
                remove.setBackground(page.ripple(null));
                remove.setOnClickListener(v -> {
                    LyricsEdits.clearDocument(activity, item.documentKey);
                    LrclibController.reloadCurrentTrack(activity, null, false);
                    if (onChanged != null) onChanged.run();
                    rebuild[0].run();
                });
                row.addView(remove);
                card.addView(row);

                if (!item.lines.isEmpty()) {
                    card.addView(page.separator(), page.sepParams());
                    int previewCount = Math.min(2, item.lines.size());
                    for (int i = 0; i < previewCount; i++) {
                        LyricsEdits.StoredLineEdit line = item.lines.get(i);
                        TextView snippetTv = page.text(
                                formatStoredLinePreview(activity, line), 12, false, page.secondary);
                        snippetTv.setMaxLines(4);
                        snippetTv.setEllipsize(TextUtils.TruncateAt.END);
                        snippetTv.setLineSpacing(page.dp(2), 1f);
                        snippetTv.setPadding(0, i == 0 ? 0 : page.dp(6), 0, 0);
                        card.addView(snippetTv);
                    }
                    if (item.lines.size() > previewCount) {
                        TextView moreTv = page.text(
                                LrclibStrings.text(activity, "edited_lines_more", item.lines.size() - previewCount),
                                12, true, page.accent);
                        moreTv.setPadding(0, page.dp(4), 0, 0);
                        card.addView(moreTv);
                    }
                    if (!hasTitle) {
                        TextView legacyHint = page.text(
                                LrclibStrings.text(activity, "edited_lyrics_legacy_hint"),
                                11, false, page.secondary);
                        legacyHint.setPadding(0, page.dp(4), 0, 0);
                        card.addView(legacyHint);
                    }
                }

                content.addView(card, page.cardParams());
            }

            TextView clearAll = page.button(LrclibStrings.text(activity, "clear_all_edited_lyrics"), false);
            clearAll.setOnClickListener(v -> {
                LyricsEdits.clearAll(activity);
                LrclibController.reloadCurrentTrack(activity, null, false);
                Toast.makeText(activity, LrclibStrings.text(activity, "all_edits_restored"), Toast.LENGTH_SHORT).show();
                if (onChanged != null) onChanged.run();
                rebuild[0].run();
            });
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(-1, page.dp(44));
            params.setMargins(0, page.dp(12), 0, page.dp(16));
            content.addView(clearAll, params);
        };

        rebuild[0].run();
    }

    private static void openStoredEditedDocumentPage(
            final Activity activity,
            final String documentKey,
            final Runnable onChanged) {
        final LyricsEdits.DocumentRecord initial = LyricsEdits.getDocument(activity, documentKey);
        if (initial == null) return;
        String heading = !initial.trackTitle.isEmpty()
                ? initial.trackTitle
                : LrclibStrings.text(activity, "edited_lines_title");
        final Page page = new Page(activity, heading);
        final LinearLayout content = page.createScrollBody();

        final TextView restoreAllBtn = page.addFooterButton(
                LrclibStrings.text(activity, "restore_all_song_edits"),
                true,
                () -> {
                    if (LyricsEdits.clearDocument(activity, documentKey)) {
                        LrclibController.reloadCurrentTrack(activity, null, false);
                        Toast.makeText(activity, LrclibStrings.text(activity, "song_edits_restored"), Toast.LENGTH_SHORT).show();
                        if (onChanged != null) onChanged.run();
                        page.dismiss();
                    }
                });

        final Runnable[] rebuild = new Runnable[1];
        rebuild[0] = () -> {
            content.removeAllViews();
            LyricsEdits.DocumentRecord rec = LyricsEdits.getDocument(activity, documentKey);
            if (rec == null || rec.lines.isEmpty()) {
                restoreAllBtn.setEnabled(false);
                restoreAllBtn.setAlpha(0.45f);
                content.addView(page.emptyMessage(LrclibStrings.text(activity, "edited_lines_empty")));
                return;
            }
            restoreAllBtn.setEnabled(true);
            restoreAllBtn.setAlpha(1f);

            if (!rec.trackTitle.isEmpty() || !rec.artistName.isEmpty()) {
                LinearLayout header = page.card();
                if (!rec.trackTitle.isEmpty()) {
                    header.addView(page.text(rec.trackTitle, 16, true, page.primary));
                }
                if (!rec.artistName.isEmpty()) {
                    TextView artistTv = page.text(rec.artistName, 13, false, page.secondary);
                    artistTv.setPadding(0, page.dp(3), 0, 0);
                    header.addView(artistTv);
                }
                content.addView(header, page.cardParams());
            }

            for (final LyricsEdits.StoredLineEdit line : rec.lines) {
                LinearLayout card = page.card();
                LinearLayout topRow = new LinearLayout(activity);
                topRow.setOrientation(LinearLayout.HORIZONTAL);
                topRow.setGravity(Gravity.CENTER_VERTICAL);

                String lineMeta = LrclibStrings.text(activity, "edited_line_number", line.index + 1);
                if (line.startMs >= 0L) {
                    lineMeta += " · " + formatShortTimestamp(line.startMs);
                }
                if (line.timingChanged) {
                    lineMeta += " · " + LrclibStrings.text(activity, "editor_timing_changed_badge");
                }
                topRow.addView(page.text(lineMeta, 12, true, page.secondary),
                        new LinearLayout.LayoutParams(0, -2, 1f));

                if (!rec.isFullDocumentEdit) {
                    TextView restoreBtn = page.text(LrclibStrings.text(activity, "reset_lyric_line"), 13, true, page.accent);
                    restoreBtn.setPadding(page.dp(10), page.dp(4), page.dp(2), page.dp(4));
                    restoreBtn.setBackground(page.ripple(null));
                    restoreBtn.setClickable(true);
                    restoreBtn.setFocusable(true);
                    restoreBtn.setOnClickListener(v -> {
                        if (LyricsLineEditor.restoreLine(activity, documentKey, line.index)) {
                            LrclibController.reloadCurrentTrack(activity, null, false);
                            if (onChanged != null) onChanged.run();
                            LyricsEdits.DocumentRecord remaining = LyricsEdits.getDocument(activity, documentKey);
                            if (remaining == null || remaining.lines.isEmpty()) {
                                page.dismiss();
                            } else {
                                rebuild[0].run();
                            }
                        }
                    });
                    topRow.addView(restoreBtn);
                }
                card.addView(topRow);

                appendDiffSection(
                        activity, page, card,
                        line.originalText, line.displayCurrentText(), line.isTextChanged(),
                        line.originalReading, line.displayCurrentReading(), line.isReadingChanged());

                content.addView(card, page.cardParams());
            }
        };

        rebuild[0].run();
    }

    private static void appendDiffSection(
            Activity activity,
            Page page,
            LinearLayout card,
            String originalText,
            String currentText,
            boolean textChanged,
            String originalReading,
            String currentReading,
            boolean readingChanged) {
        String emptyVal = LrclibStrings.text(activity, "edit_diff_none");

        // Lyric text diff block
        String textHeader = LrclibStrings.text(
                activity, textChanged ? "edit_diff_lyrics_changed" : "edit_diff_lyrics_unchanged");
        TextView textHdrTv = page.text(textHeader, 11, true, textChanged ? page.accent : page.secondary);
        textHdrTv.setPadding(0, page.dp(8), 0, 0);
        card.addView(textHdrTv);

        if (textChanged) {
            TextView origTv = page.text(
                    LrclibStrings.text(activity, "edit_original_line",
                            originalText.isEmpty() ? emptyVal : originalText),
                    13, false, page.secondary);
            origTv.setPadding(0, page.dp(3), 0, 0);
            card.addView(origTv);

            TextView currTv = page.text(
                    LrclibStrings.text(activity, "edit_current_line",
                            currentText.isEmpty() ? emptyVal : currentText),
                    15, true, page.primary);
            currTv.setPadding(0, page.dp(2), 0, 0);
            card.addView(currTv);
        } else {
            String shownText = !currentText.isEmpty() ? currentText
                    : (!originalText.isEmpty() ? originalText : emptyVal);
            TextView sameTv = page.text(shownText, 14, false, page.primary);
            sameTv.setPadding(0, page.dp(3), 0, 0);
            card.addView(sameTv);
        }

        // Pronunciation / reading diff block (always shown alongside lyric text)
        card.addView(page.separator(), page.sepParams());
        String readHeader = LrclibStrings.text(
                activity, readingChanged ? "edit_diff_reading_changed" : "edit_diff_reading_unchanged");
        TextView readHdrTv = page.text(readHeader, 11, true, readingChanged ? page.accent : page.secondary);
        card.addView(readHdrTv);

        if (readingChanged) {
            TextView origRead = page.text(
                    LrclibStrings.text(activity, "edit_original_reading",
                            originalReading.isEmpty() ? emptyVal : originalReading),
                    12, false, page.secondary);
            origRead.setPadding(0, page.dp(3), 0, 0);
            card.addView(origRead);

            TextView currRead = page.text(
                    LrclibStrings.text(activity, "edit_current_reading",
                            currentReading.isEmpty() ? emptyVal : currentReading),
                    13, true, page.accent);
            currRead.setPadding(0, page.dp(2), 0, 0);
            card.addView(currRead);
        } else {
            String shownRead = !currentReading.isEmpty() ? currentReading
                    : (!originalReading.isEmpty() ? originalReading : emptyVal);
            TextView sameRead = page.text(shownRead, 13, false, page.secondary);
            sameRead.setPadding(0, page.dp(3), 0, 0);
            card.addView(sameRead);
        }
    }

    private static String formatStoredLinePreview(Context ctx, LyricsEdits.StoredLineEdit line) {
        StringBuilder sb = new StringBuilder();
        sb.append(LrclibStrings.text(ctx, "edited_line_number", line.index + 1));
        if (line.startMs >= 0L) {
            sb.append(' ').append(formatShortTimestamp(line.startMs));
        }
        String textPart;
        if (line.isTextChanged()) {
            textPart = !line.originalText.isEmpty()
                    ? (line.originalText + " → " + line.editedText)
                    : LrclibStrings.text(ctx, "edit_current_line", line.editedText);
        } else {
            textPart = line.displayCurrentText();
        }
        if (!textPart.isEmpty()) {
            sb.append("\n").append(LrclibStrings.text(ctx, "edit_lyric_text")).append(": ").append(textPart);
        }
        String currRead = line.displayCurrentReading();
        if (line.isReadingChanged()) {
            String readPart = !line.originalReading.isEmpty()
                    ? (line.originalReading + " → " + currRead)
                    : currRead;
            sb.append("\n").append(LrclibStrings.text(ctx, "edit_lyric_reading")).append(": ").append(readPart);
        } else if (!currRead.isEmpty()) {
            sb.append("\n").append(LrclibStrings.text(ctx, "edit_lyric_reading")).append(": ").append(currRead);
        }
        return sb.toString();
    }

    private static String formatShortTimestamp(long totalMs) {
        long clamped = Math.max(0L, totalMs);
        long minutes = clamped / 60000L;
        long seconds = (clamped % 60000L) / 1000L;
        long centis = (clamped % 1000L) / 10L;
        return String.format(Locale.ROOT, "[%02d:%02d.%02d]", minutes, seconds, centis);
    }

    // =========================================================================
    // Formatting helpers
    // =========================================================================

    private static String describeCurrentState(Context ctx, LrclibController.TrackLyricsState state) {
        if (state == null) return LrclibStrings.text(ctx, "status_none");
        String localName = state.localLabel.isEmpty() ? "lyrics.lrc" : state.localLabel;
        switch (state.source) {
            case OFFICIAL_WORD: return LrclibStrings.text(ctx, "status_official_word");
            case OFFICIAL_LINE: return LrclibStrings.text(ctx, "status_official_line");
            case OFFICIAL_STATIC: return LrclibStrings.text(ctx, "status_official_static");
            case LRCLIB_WORD: return LrclibStrings.text(ctx, "status_lrclib_word", state.lrclibId);
            case LRCLIB_LINE: return LrclibStrings.text(ctx, "status_lrclib_line", state.lrclibId);
            case LRCLIB_PLAIN: return LrclibStrings.text(ctx, "status_lrclib_plain", state.lrclibId);
            case LRCLIB_INSTRUMENTAL: return LrclibStrings.text(ctx, "status_lrclib_instrumental", state.lrclibId);
            case LOCAL_WORD:
                return LrclibStrings.text(ctx, state.localFromFolder ? "status_local_folder_word" : "status_local_word", localName);
            case LOCAL_LINE:
                return LrclibStrings.text(ctx, state.localFromFolder ? "status_local_folder_line" : "status_local_line", localName);
            case LOCAL_PLAIN:
                return LrclibStrings.text(ctx, state.localFromFolder ? "status_local_folder_plain" : "status_local_plain", localName);
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
            case FORCE_LOCAL_LRC: {
                String name = ov.localFileName.isEmpty() ? "lyrics.lrc" : ov.localFileName;
                String base = LrclibStrings.text(ctx, "override_local_file", name);
                if (ov.localForceUnsynced) {
                    return base + " · " + LrclibStrings.text(ctx, "tag_unsynced");
                }
                return base;
            }
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
        final int elevatedSurface;
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
            this.elevatedSurface = resolveColor("secondary_background_color",
                    Color.luminance(background) > 0.5 ? 0xFFF2F2F7 : 0xFF1C1C1E);
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

        TextView secondaryButton(String label) {
            TextView tv = text(label, 15, true, accent);
            tv.setGravity(Gravity.CENTER);
            tv.setBackground(ripple(round(cardFill, 10)));
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
