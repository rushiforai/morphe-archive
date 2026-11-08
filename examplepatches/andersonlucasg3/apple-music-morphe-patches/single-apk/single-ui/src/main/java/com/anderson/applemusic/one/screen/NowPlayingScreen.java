package com.anderson.applemusic.one.screen;

import android.content.Context;
import android.content.res.ColorStateList;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.TextView;

import com.anderson.applemusic.one.media.MediaClient;
import com.anderson.applemusic.one.theme.ColorArt;
import com.anderson.applemusic.one.theme.Inter;
import com.anderson.applemusic.one.theme.Shapes;
import com.anderson.applemusic.one.theme.Tokens;
import com.anderson.applemusic.one.widget.CircleButton;
import com.anderson.applemusic.one.widget.Focus;
import com.anderson.applemusic.one.widget.Icons;
import com.anderson.applemusic.one.widget.Pill;
import com.anderson.applemusic.one.widget.TrackRow;

import java.util.List;
import java.util.Locale;

/**
 * Full-screen player: dark gradient derived from the cover's dominant colour, large
 * artwork, title/artist/album, seek bar with both times, circular transport controls
 * (prev 60 / play 80 / next 60), the "Criar Estação"/"Ações" actions and the queue.
 *
 * <p>"Fila" opens the session queue ({@code MediaController.getQueue()}) as a sheet of
 * track rows with the current one highlighted; tapping a row calls
 * {@code skipToQueueItem}. The pill is hidden when the session has no queue.
 */
public final class NowPlayingScreen {

    private static final String STATION = "CREATE_STATION";

    private final Context context;
    private final ScreenHost host;
    private final FrameLayout root;
    private final ImageView cover;
    private final TextView title;
    private final TextView artist;
    private final TextView album;
    private final TextView current;
    private final TextView duration;
    private final SeekBar seek;
    private final CircleButton play;
    private final Pill station;
    private final Pill queue;
    private final LinearLayout extras;
    private final FrameLayout queuePanel;
    private final LinearLayout queueRows;
    private final TextView queueCount;
    private MediaClient.Snapshot latest = new MediaClient.Snapshot();
    private int lastArtworkHash;
    private boolean seekTracking;

    /** Structural signature of the queue currently rendered in the sheet. */
    private int queueSize = -1;
    private long queueFirstId = Long.MIN_VALUE;
    private long queueLastId = Long.MIN_VALUE;

    public NowPlayingScreen(Context context, ScreenHost host) {
        this.context = context;
        this.host = host;

        root = new FrameLayout(context);
        root.setBackgroundColor(Tokens.BG_PLAYER);
        root.setVisibility(View.GONE);
        root.setClickable(true);

        LinearLayout page = new LinearLayout(context);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setPadding(Tokens.dp(24), Tokens.dp(18), Tokens.dp(24), Tokens.dp(22));

        // Header: close/back chevron, "TOCANDO AGORA" eyebrow and the Ações pill.
        LinearLayout header = new LinearLayout(context);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        CircleButton close = new CircleButton(context, Icons.CHEVRON_LEFT, 44f,
                Tokens.SURFACE, Tokens.TEXT, 22f);
        close.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.closePlayer();
            }
        });
        header.addView(close, new LinearLayout.LayoutParams(Tokens.dp(44), Tokens.dp(44)));
        TextView eyebrow = Inter.text(context, "TOCANDO AGORA", Tokens.CAPTION,
                Inter.BOLD, Tokens.ACCENT);
        eyebrow.setLetterSpacing(0.14f);
        LinearLayout.LayoutParams eyebrowParams = new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        eyebrowParams.leftMargin = Tokens.dp(14);
        header.addView(eyebrow, eyebrowParams);
        Pill actions = Pill.surface(context, Icons.MORE, "Ações");
        actions.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.sessionActions();
            }
        });
        header.addView(actions);
        page.addView(header, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        cover = new ImageView(context);
        cover.setScaleType(ImageView.ScaleType.CENTER_CROP);
        cover.setBackgroundColor(Tokens.SURFACE_HOVER);
        Shapes.clip(cover, Tokens.RADIUS_CARD);

        title = Inter.text(context, "", Tokens.DISPLAY, Inter.BOLD, Tokens.TEXT);
        title.setMaxLines(2);
        title.setEllipsize(TextUtils.TruncateAt.END);
        artist = Inter.text(context, "", 17f, Inter.MEDIUM, Tokens.TEXT);
        artist.setMaxLines(1);
        artist.setEllipsize(TextUtils.TruncateAt.END);
        album = Inter.text(context, "", 13f, Inter.REGULAR, Tokens.TEXT_DIM);
        album.setMaxLines(1);
        album.setEllipsize(TextUtils.TruncateAt.END);

        seek = new SeekBar(context);
        seek.setMax(1000);
        seek.setProgressTintList(ColorStateList.valueOf(Tokens.ACCENT));
        seek.setProgressBackgroundTintList(ColorStateList.valueOf(Tokens.TRACK));
        seek.setThumbTintList(ColorStateList.valueOf(Tokens.ACCENT));
        seek.setPadding(0, Tokens.dp(6), 0, Tokens.dp(6));
        seek.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar bar, int progress, boolean fromUser) {
                if (fromUser && latest.durationMs > 0L) {
                    current.setText(format(durationFor(progress)));
                }
            }

            @Override
            public void onStartTrackingTouch(SeekBar bar) {
                seekTracking = true;
            }

            @Override
            public void onStopTrackingTouch(SeekBar bar) {
                seekTracking = false;
                if (latest.durationMs > 0L) host.seek(durationFor(bar.getProgress()));
            }
        });

        current = Inter.text(context, "0:00", Tokens.CAPTION, Inter.MEDIUM, Tokens.TEXT_DIM);
        current.setGravity(Gravity.END);
        current.setMinWidth(Tokens.dp(44));
        duration = Inter.text(context, "0:00", Tokens.CAPTION, Inter.MEDIUM, Tokens.TEXT_DIM);
        duration.setMinWidth(Tokens.dp(44));

        play = new CircleButton(context, Icons.PLAY, 80f, Tokens.ACCENT, Tokens.TEXT, 30f);
        play.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.togglePlayPause();
            }
        });
        CircleButton previous = new CircleButton(context, Icons.PREV, 60f,
                Tokens.SURFACE, Tokens.TEXT, 24f);
        previous.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.skipPrevious();
            }
        });
        CircleButton next = new CircleButton(context, Icons.NEXT, 60f,
                Tokens.SURFACE, Tokens.TEXT, 24f);
        next.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.skipNext();
            }
        });

        station = Pill.surface(context, Icons.PLUS, "Criar Estação");
        station.setTextColor(Tokens.ACCENT);
        station.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.createStation();
            }
        });
        queue = Pill.surface(context, Icons.QUEUE, "Fila");
        queue.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                openQueue();
            }
        });

        extras = new LinearLayout(context);
        extras.setOrientation(LinearLayout.HORIZONTAL);
        extras.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams stationParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        stationParams.rightMargin = Tokens.dp(10);
        extras.addView(station, stationParams);
        extras.addView(queue, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        if (Tokens.wide()) {
            buildWide(page, previous, next);
        } else {
            buildNarrow(page, previous, next);
        }
        linkFocus(close, previous, next, actions);

        root.addView(page, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        queueRows = new LinearLayout(context);
        queueRows.setOrientation(LinearLayout.VERTICAL);
        queueCount = Inter.text(context, "", Tokens.CAPTION, Inter.REGULAR, Tokens.TEXT_DIM);
        queuePanel = buildQueuePanel();
        root.addView(queuePanel, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
    }

    private void buildWide(LinearLayout page, CircleButton previous, CircleButton next) {
        LinearLayout body = new LinearLayout(context);
        body.setOrientation(LinearLayout.HORIZONTAL);
        body.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams bodyParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
        bodyParams.topMargin = Tokens.dp(10);
        page.addView(body, bodyParams);

        int size = Math.min(Math.round(Tokens.screenWidth() * 0.32f),
                Tokens.dp(520));
        LinearLayout.LayoutParams coverParams = new LinearLayout.LayoutParams(size, size);
        body.addView(cover, coverParams);

        LinearLayout detail = new LinearLayout(context);
        detail.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams detailParams = new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        detailParams.leftMargin = Tokens.dp(44);
        body.addView(detail, detailParams);

        detail.addView(title);
        LinearLayout.LayoutParams artistParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        artistParams.topMargin = Tokens.dp(6);
        detail.addView(artist, artistParams);
        LinearLayout.LayoutParams albumParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        albumParams.topMargin = Tokens.dp(2);
        detail.addView(album, albumParams);

        detail.addView(buildProgress(), new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        detail.addView(buildControls(previous, next), new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        LinearLayout.LayoutParams extrasParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        extrasParams.gravity = Gravity.CENTER_HORIZONTAL;
        extrasParams.topMargin = Tokens.dp(14);
        detail.addView(extras, extrasParams);
    }

    private void buildNarrow(LinearLayout page, CircleButton previous, CircleButton next) {
        LinearLayout body = new LinearLayout(context);
        body.setOrientation(LinearLayout.VERTICAL);
        body.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams bodyParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
        page.addView(body, bodyParams);

        int size = Math.round(Tokens.screenWidth() * 0.80f);
        LinearLayout.LayoutParams coverParams = new LinearLayout.LayoutParams(size, size);
        coverParams.gravity = Gravity.CENTER_HORIZONTAL;
        coverParams.topMargin = Tokens.dp(18);
        body.addView(cover, coverParams);

        LinearLayout textBlock = new LinearLayout(context);
        textBlock.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams textParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        textParams.topMargin = Tokens.dp(18);
        body.addView(textBlock, textParams);
        textBlock.addView(title);
        LinearLayout.LayoutParams artistParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        artistParams.topMargin = Tokens.dp(4);
        textBlock.addView(artist, artistParams);
        textBlock.addView(album);

        LinearLayout.LayoutParams progressParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        progressParams.topMargin = Tokens.dp(10);
        body.addView(buildProgress(), progressParams);
        body.addView(buildControls(previous, next), new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        LinearLayout.LayoutParams extrasParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        extrasParams.gravity = Gravity.CENTER_HORIZONTAL;
        extrasParams.topMargin = Tokens.dp(10);
        body.addView(extras, extrasParams);
    }

    /**
     * "A seguir" sheet: the session queue as track rows, the current one in accent. Tapping
     * a row asks the session to jump there and the sheet stays open (the highlight moves).
     */
    private FrameLayout buildQueuePanel() {
        FrameLayout panel = new FrameLayout(context);
        panel.setBackgroundColor(0xD9000000);
        panel.setClickable(true);

        LinearLayout sheet = new LinearLayout(context);
        sheet.setOrientation(LinearLayout.VERTICAL);
        sheet.setPadding(Tokens.dp(20), Tokens.dp(8), Tokens.dp(20), Tokens.dp(14));
        sheet.setBackground(Shapes.rounded(Tokens.SURFACE, Tokens.RADIUS_SHEET));
        sheet.setClickable(true);
        Shapes.clip(sheet, Tokens.RADIUS_SHEET);

        View grabber = new View(context);
        grabber.setBackground(Shapes.rounded(Tokens.TRACK, 2f));
        LinearLayout.LayoutParams grabberParams =
                new LinearLayout.LayoutParams(Tokens.dp(40), Tokens.dp(4));
        grabberParams.gravity = Gravity.CENTER_HORIZONTAL;
        grabberParams.topMargin = Tokens.dp(4);
        grabberParams.bottomMargin = Tokens.dp(14);
        sheet.addView(grabber, grabberParams);

        LinearLayout headingRow = new LinearLayout(context);
        headingRow.setOrientation(LinearLayout.HORIZONTAL);
        headingRow.setGravity(Gravity.CENTER_VERTICAL);
        TextView heading = Inter.text(context, "A seguir", Tokens.SECTION, Inter.BOLD,
                Tokens.TEXT);
        headingRow.addView(heading, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        headingRow.addView(queueCount);
        LinearLayout.LayoutParams headingParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        headingParams.bottomMargin = Tokens.dp(10);
        sheet.addView(headingRow, headingParams);

        ScrollView scroll = new ScrollView(context);
        scroll.setVerticalScrollBarEnabled(false);
        scroll.addView(queueRows);
        sheet.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        TextView close = Inter.text(context, "Fechar", 13f, Inter.SEMIBOLD, Tokens.TEXT_DIM);
        close.setGravity(Gravity.CENTER);
        close.setMinHeight(Tokens.dp(44));
        Focus.attach(close, Tokens.RADIUS_PILL, 0x00000000, Tokens.SURFACE_HOVER, null);
        close.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                closeQueue();
            }
        });
        LinearLayout.LayoutParams closeParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        closeParams.gravity = Gravity.CENTER_HORIZONTAL;
        closeParams.topMargin = Tokens.dp(6);
        sheet.addView(close, closeParams);

        int width = Math.min(Tokens.dp(560), Math.round(Tokens.screenWidth() * 0.86f));
        int height = Math.round(context.getResources().getDisplayMetrics().heightPixels * 0.72f);
        sheet.setLayoutParams(new FrameLayout.LayoutParams(width, height, Gravity.CENTER));
        panel.addView(sheet);

        panel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                closeQueue();
            }
        });
        sheet.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Consume: taps inside the sheet must not close it.
            }
        });
        panel.setVisibility(View.GONE);
        return panel;
    }

    private void openQueue() {
        if (latest.queue.isEmpty()) return;
        refreshQueue(latest);
        queuePanel.setVisibility(View.VISIBLE);
        queuePanel.setAlpha(0f);
        queuePanel.animate().alpha(1f).setDuration(140L).start();
        int active = Math.max(0, latest.activeQueueIndex());
        View row = queueRows.getChildAt(active);
        if (row != null) row.requestFocus();
    }

    public void closeQueue() {
        queuePanel.setVisibility(View.GONE);
    }

    public boolean isQueueOpen() {
        return queuePanel.getVisibility() == View.VISIBLE;
    }

    /** Rebuilds the sheet rows only when the queue changed; updates the highlight always. */
    private void refreshQueue(MediaClient.Snapshot snapshot) {
        List<MediaClient.QueueEntry> entries = snapshot.queue;
        long first = entries.isEmpty() ? Long.MIN_VALUE : entries.get(0).queueId;
        long last = entries.isEmpty() ? Long.MIN_VALUE : entries.get(entries.size() - 1).queueId;
        if (entries.size() != queueSize || first != queueFirstId || last != queueLastId) {
            queueSize = entries.size();
            queueFirstId = first;
            queueLastId = last;
            queueRows.removeAllViews();
            for (int i = 0; i < entries.size(); i++) {
                final MediaClient.QueueEntry entry = entries.get(i);
                TrackRow row = new TrackRow(context, i + 1, entry.title, entry.subtitle);
                row.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        host.skipToQueue(entry.queueId);
                    }
                });
                LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT);
                params.bottomMargin = Tokens.dp(2);
                queueRows.addView(row, params);
            }
        }
        queueCount.setText(entries.size() + " faixas");
        int active = snapshot.activeQueueIndex();
        for (int i = 0; i < queueRows.getChildCount(); i++) {
            View child = queueRows.getChildAt(i);
            if (child instanceof TrackRow) ((TrackRow) child).setPlaying(i == active);
        }
    }

    private View buildProgress() {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams rowParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        row.setLayoutParams(rowParams);
        row.addView(current);
        LinearLayout.LayoutParams seekParams = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        seekParams.leftMargin = Tokens.dp(10);
        seekParams.rightMargin = Tokens.dp(10);
        row.addView(seek, seekParams);
        row.addView(duration);
        return row;
    }

    private View buildControls(CircleButton previous, CircleButton next) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = Tokens.dp(8);
        row.setLayoutParams(params);

        LinearLayout.LayoutParams side =
                new LinearLayout.LayoutParams(Tokens.dp(60), Tokens.dp(60));
        row.addView(previous, side);
        LinearLayout.LayoutParams playParams =
                new LinearLayout.LayoutParams(Tokens.dp(80), Tokens.dp(80));
        playParams.leftMargin = Tokens.dp(22);
        playParams.rightMargin = Tokens.dp(22);
        row.addView(play, playParams);
        LinearLayout.LayoutParams nextParams =
                new LinearLayout.LayoutParams(Tokens.dp(60), Tokens.dp(60));
        row.addView(next, nextParams);
        return row;
    }

    private void linkFocus(CircleButton close, CircleButton previous, CircleButton next,
                           Pill actions) {
        int closeId = View.generateViewId();
        int previousId = View.generateViewId();
        int playId = View.generateViewId();
        int nextId = View.generateViewId();
        int actionsId = View.generateViewId();
        close.setId(closeId);
        previous.setId(previousId);
        play.setId(playId);
        next.setId(nextId);
        actions.setId(actionsId);
        seek.setId(View.generateViewId());
        station.setId(View.generateViewId());
        queue.setId(View.generateViewId());

        close.setNextFocusDownId(previousId);
        close.setNextFocusRightId(actionsId);
        actions.setNextFocusDownId(previousId);
        previous.setNextFocusRightId(playId);
        play.setNextFocusLeftId(previousId);
        play.setNextFocusRightId(nextId);
        play.setNextFocusUpId(closeId);
        play.setNextFocusDownId(seek.getId());
        next.setNextFocusLeftId(playId);
        seek.setNextFocusUpId(playId);
        seek.setNextFocusDownId(station.getId());
        station.setNextFocusUpId(seek.getId());
        station.setNextFocusRightId(queue.getId());
        queue.setNextFocusLeftId(station.getId());
        queue.setNextFocusUpId(seek.getId());
    }

    public View view() {
        return root;
    }

    public boolean isOpen() {
        return root.getVisibility() == View.VISIBLE;
    }

    public void update(MediaClient.Snapshot snapshot) {
        latest = snapshot;
        if (snapshot.artwork != null && snapshot.artwork.hashCode() != lastArtworkHash) {
            lastArtworkHash = snapshot.artwork.hashCode();
            cover.setImageBitmap(snapshot.artwork);
            root.setBackground(Shapes.playerWash(ColorArt.dominant(snapshot.artwork)));
        }
        title.setText(snapshot.title);
        artist.setText(snapshot.artist);
        album.setText(snapshot.album);
        play.setIcon(snapshot.playing ? Icons.PAUSE : Icons.PLAY);
        station.setVisibility(snapshot.findActionEndingWith(STATION) != null
                ? View.VISIBLE : View.GONE);
        queue.setVisibility(snapshot.queue.isEmpty() ? View.GONE : View.VISIBLE);
        extras.setVisibility(station.getVisibility() == View.VISIBLE
                || queue.getVisibility() == View.VISIBLE ? View.VISIBLE : View.GONE);
        if (isQueueOpen()) refreshQueue(snapshot);
        if (!seekTracking) {
            int progress = snapshot.durationMs > 0L
                    ? (int) (snapshot.positionMs * 1000L / snapshot.durationMs) : 0;
            seek.setProgress(Math.max(0, Math.min(1000, progress)));
        }
        current.setText(format(snapshot.positionMs));
        duration.setText(format(snapshot.durationMs));
    }

    public void focus() {
        play.requestFocus();
    }

    public void close() {
        closeQueue();
        root.setVisibility(View.GONE);
    }

    private long durationFor(int progress) {
        return latest.durationMs > 0L ? latest.durationMs * progress / 1000L : 0L;
    }

    private static String format(long millis) {
        if (millis <= 0L) return "0:00";
        long seconds = millis / 1000L;
        return String.format(Locale.ROOT, "%d:%02d", seconds / 60L, seconds % 60L);
    }
}
