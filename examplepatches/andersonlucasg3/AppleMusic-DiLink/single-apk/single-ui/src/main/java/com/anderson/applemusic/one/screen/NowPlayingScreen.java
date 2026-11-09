package com.anderson.applemusic.one.screen;

import android.content.Context;
import android.content.res.ColorStateList;
import android.text.TextUtils;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
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
import com.anderson.applemusic.one.widget.Perf;
import com.anderson.applemusic.one.widget.Pill;
import com.anderson.applemusic.one.widget.TrackRow;

import java.util.List;
import java.util.Locale;

/**
 * Full-screen player: dark gradient derived from the cover's dominant colour, large
 * artwork, title/artist/album, seek bar with both times, circular transport controls
 * (prev 60 / play 80 / next 60), the shuffle/repeat/favorite toggles the session
 * publishes, the "Criar Estação"/"Ações" actions and the queue.
 *
 * <p>The three toggles only appear while the session's {@code PlaybackState} carries the
 * matching custom action; the engine does not publish the resulting shuffle/repeat
 * state, so they send the action and show a transient confirmation instead of an active
 * icon ({@link #showFeedback(String)}).
 *
 * <p>"Fila" opens the session queue ({@code MediaController.getQueue()}) as a sheet of
 * track rows with the current one highlighted; tapping a row calls
 * {@code skipToQueueItem}. The pill is hidden when the session has no queue.
 */
public final class NowPlayingScreen {

    private static final String TAG = "AppleMusicOne";
    private static final String STATION = "CREATE_STATION";
    private static final String SHUFFLE = "SHUFFLE";
    private static final String REPEAT = "REPEAT";
    private static final String FAVORITE = "FAVORITE";
    /** How long the transient action confirmation stays on screen. */
    private static final long FEEDBACK_MS = 1800L;

    private final Context context;
    private final ScreenHost host;
    private final FrameLayout root;
    private final LinearLayout page;
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
    private final LinearLayout toggles;
    private final CircleButton shuffle;
    private final CircleButton repeat;
    private final CircleButton favorite;
    private final TextView feedback;
    private final LinearLayout extras;
    private final FrameLayout queuePanel;
    private ListView queueList;
    private QueueAdapter queueAdapter;
    private final TextView queueCount;
    private MediaClient.Snapshot latest = new MediaClient.Snapshot();
    private int lastArtworkHash;
    private boolean seekTracking;

    /** Custom action ids this session publishes, or null when it does not. */
    private String shuffleAction;
    private String repeatAction;
    private String favoriteAction;

    private final Runnable hideFeedback = new Runnable() {
        @Override
        public void run() {
            feedback.setVisibility(View.GONE);
        }
    };

    /**
     * Puts the D-pad focus on the active queue row once the ListView has measured its
     * children (a single post runs before the first layout and used to leave the list
     * focused without a row).
     */
    private int queueFocusAttempts;
    private final Runnable focusQueueActive = new Runnable() {
        @Override
        public void run() {
            int active = Math.max(0, latest.activeQueueIndex());
            int index = active - queueList.getFirstVisiblePosition();
            View row = index >= 0 && index < queueList.getChildCount()
                    ? queueList.getChildAt(index) : null;
            boolean focused = row != null && row.requestFocus();
            // In touch mode the rows are not focusable; the list itself takes the focus and
            // hands it to a row on the first D-pad press.
            if (!focused) focused = queueList.requestFocus();
            if (focused) {
                queueFocusAttempts = 0;
                return;
            }
            if (queueFocusAttempts++ < 12) queueList.postOnAnimation(this);
            else queueFocusAttempts = 0;
        }
    };

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
        // The player covers the whole window: consume touches that miss the controls so
        // they cannot fall through to the mini player/screens below (without adding a
        // clickable node that would need an accessibility label).
        root.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, android.view.MotionEvent event) {
                return true;
            }
        });

        page = new LinearLayout(context);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setPadding(Tokens.dp(24), Tokens.dp(18), Tokens.dp(24), Tokens.dp(22));

        // Header: close/back chevron, "TOCANDO AGORA" eyebrow and the Ações pill.
        LinearLayout header = new LinearLayout(context);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        CircleButton close = new CircleButton(context, Icons.CHEVRON_LEFT, 44f,
                Tokens.SURFACE, Tokens.TEXT, 22f);
        close.setContentDescription("Fechar player");
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
        cover.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
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
        seek.setContentDescription("Posição da faixa");
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
        play.setContentDescription("Reproduzir");
        play.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.togglePlayPause();
            }
        });
        CircleButton previous = new CircleButton(context, Icons.PREV, 60f,
                Tokens.SURFACE, Tokens.TEXT, 24f);
        previous.setContentDescription("Faixa anterior");
        previous.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                host.skipPrevious();
            }
        });
        CircleButton next = new CircleButton(context, Icons.NEXT, 60f,
                Tokens.SURFACE, Tokens.TEXT, 24f);
        next.setContentDescription("Próxima faixa");
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

        // Aleatório / Repetir / Favorito come from the session custom actions; each button
        // stays GONE until the current PlaybackState publishes its action.
        shuffle = toggle(Icons.SHUFFLE, "Aleatório");
        shuffle.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sendToggle(shuffleAction);
            }
        });
        repeat = toggle(Icons.REPEAT, "Repetir");
        repeat.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sendToggle(repeatAction);
            }
        });
        favorite = toggle(Icons.FAVORITE, "Favorito");
        favorite.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sendToggle(favoriteAction);
            }
        });
        toggles = new LinearLayout(context);
        toggles.setOrientation(LinearLayout.HORIZONTAL);
        toggles.setGravity(Gravity.CENTER);
        toggles.setVisibility(View.GONE);
        LinearLayout.LayoutParams shuffleParams = new LinearLayout.LayoutParams(
                Tokens.dp(44), Tokens.dp(44));
        shuffleParams.rightMargin = Tokens.dp(8);
        toggles.addView(shuffle, shuffleParams);
        toggles.addView(repeat, new LinearLayout.LayoutParams(
                Tokens.dp(44), Tokens.dp(44)));
        LinearLayout.LayoutParams favoriteParams = new LinearLayout.LayoutParams(
                Tokens.dp(44), Tokens.dp(44));
        favoriteParams.leftMargin = Tokens.dp(8);
        toggles.addView(favorite, favoriteParams);

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
            // Side-by-side player: the detail column has no vertical room left on a
            // rotated phone (~360 dp tall), so the toggles sit in the header row next to
            // Ações instead of taking a line of their own.
            LinearLayout.LayoutParams togglesParams = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            togglesParams.rightMargin = Tokens.dp(10);
            header.addView(toggles, header.getChildCount() - 1, togglesParams);
            buildWide(page, previous, next);
        } else {
            buildNarrow(page, previous, next);
        }
        linkFocus(close, previous, next, actions);

        root.addView(page, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        // Transient action confirmation; floats over the page so it never changes the
        // player's vertical layout (portrait already fits it exactly).
        feedback = Inter.text(context, "", 13f, Inter.SEMIBOLD, Tokens.TEXT);
        feedback.setBackground(Shapes.rounded(0xE6000000, Tokens.RADIUS_PILL));
        feedback.setPadding(Tokens.dp(16), Tokens.dp(7), Tokens.dp(16), Tokens.dp(7));
        feedback.setVisibility(View.GONE);
        FrameLayout.LayoutParams feedbackParams = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.TOP | Gravity.CENTER_HORIZONTAL);
        feedbackParams.topMargin = Tokens.dp(64);
        root.addView(feedback, feedbackParams);

        queueCount = Inter.text(context, "", Tokens.CAPTION, Inter.REGULAR, Tokens.TEXT_DIM);
        queuePanel = buildQueuePanel();
        root.addView(queuePanel, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
    }

    private CircleButton toggle(int icon, String description) {
        CircleButton button = new CircleButton(context, icon, 44f, Tokens.SURFACE,
                Tokens.TEXT, 20f);
        button.setContentDescription(description);
        return button;
    }

    private void sendToggle(String actionId) {
        if (actionId == null) return;
        showFeedback(host.sessionAction(actionId));
    }

    /** Full custom action id ending with {@code suffix}, or null when the session lacks it. */
    private static String actionId(MediaClient.Snapshot snapshot, String suffix) {
        MediaClient.Action action = snapshot.findActionEndingWith(suffix);
        return action == null ? null : action.action;
    }

    private void showFeedback(String message) {
        if (message == null || message.length() == 0) return;
        feedback.setText(message);
        feedback.setVisibility(View.VISIBLE);
        feedback.removeCallbacks(hideFeedback);
        feedback.postDelayed(hideFeedback, FEEDBACK_MS);
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
        LinearLayout.LayoutParams togglesParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        togglesParams.gravity = Gravity.CENTER_HORIZONTAL;
        togglesParams.topMargin = Tokens.dp(6);
        body.addView(toggles, togglesParams);
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
        panel.setContentDescription("Fechar");

        LinearLayout sheet = new LinearLayout(context);
        sheet.setOrientation(LinearLayout.VERTICAL);
        sheet.setPadding(Tokens.dp(20), Tokens.dp(8), Tokens.dp(20), Tokens.dp(14));
        sheet.setBackground(Shapes.rounded(Tokens.SURFACE, Tokens.RADIUS_SHEET));
        sheet.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, android.view.MotionEvent event) {
                return true;
            }
        });
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

        queueList = new ListView(context);
        queueList.setVerticalScrollBarEnabled(false);
        queueList.setDivider(null);
        queueList.setSelector(android.R.color.transparent);
        queueList.setItemsCanFocus(true);
        queueList.setFocusable(true);
        queueList.setClipToPadding(false);
        sheet.addView(queueList, new LinearLayout.LayoutParams(
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
        panel.setVisibility(View.GONE);
        return panel;
    }

    private void openQueue() {
        if (latest.queue.isEmpty()) return;
        refreshQueue(latest);
        // The sheet owns the screen while it is open; the player underneath must leave the
        // accessibility tree so TalkBack does not walk into covered controls.
        page.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        queuePanel.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_AUTO);
        queuePanel.setVisibility(View.VISIBLE);
        queuePanel.setAlpha(0f);
        queuePanel.animate().alpha(1f).setDuration(140L).start();
        final int active = Math.max(0, latest.activeQueueIndex());
        queueList.setSelection(active);
        queueFocusAttempts = 0;
        queueList.post(focusQueueActive);
    }

    public void closeQueue() {
        queueList.removeCallbacks(focusQueueActive);
        queuePanel.setVisibility(View.GONE);
        page.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_AUTO);
    }

    /** Reopens the "A seguir" sheet after a rotation; no-op when the session has no queue. */
    public void openQueueRestored() {
        Log.i(TAG, "queue sheet restored (" + latest.queue.size() + " tracks)");
        openQueue();
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
            queueAdapter = new QueueAdapter(entries);
            queueList.setAdapter(queueAdapter);
            if (isQueueOpen()) queueList.setSelection(Math.max(0, snapshot.activeQueueIndex()));
            final int count = entries.size();
            queueList.postDelayed(new Runnable() {
                @Override
                public void run() {
                    Log.i(TAG, "perf queue items=" + count
                            + " rows=" + queueList.getChildCount()
                            + " views=" + Perf.views(queueList));
                }
            }, 150L);
        } else if (queueAdapter != null) {
            int active = snapshot.activeQueueIndex();
            if (active != queueAdapter.active) {
                queueAdapter.active = active;
                queueAdapter.notifyDataSetChanged();
            }
        }
        queueCount.setText(entries.size() + " faixas");
    }

    /** Recycled queue rows: 60-100 tracks reuse the visible TrackRows only. */
    private final class QueueAdapter extends BaseAdapter {

        private final List<MediaClient.QueueEntry> entries;
        private int active;

        QueueAdapter(List<MediaClient.QueueEntry> entries) {
            this.entries = entries;
            this.active = latest.activeQueueIndex();
        }

        @Override
        public int getCount() {
            return entries.size();
        }

        @Override
        public Object getItem(int position) {
            return entries.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            final MediaClient.QueueEntry entry = entries.get(position);
            TrackRow row = convertView instanceof TrackRow
                    ? (TrackRow) convertView : new TrackRow(context, position + 1, "", "");
            row.bind(position + 1, entry.title, entry.subtitle);
            row.setPlaying(position == active);
            row.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    host.skipToQueue(entry.queueId);
                }
            });
            return row;
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
        int shuffleId = View.generateViewId();
        int repeatId = View.generateViewId();
        int favoriteId = View.generateViewId();
        shuffle.setId(shuffleId);
        repeat.setId(repeatId);
        favorite.setId(favoriteId);

        close.setNextFocusDownId(previousId);
        previous.setNextFocusRightId(playId);
        play.setNextFocusLeftId(previousId);
        play.setNextFocusRightId(nextId);
        play.setNextFocusUpId(closeId);
        play.setNextFocusDownId(seek.getId());
        next.setNextFocusLeftId(playId);
        seek.setNextFocusUpId(playId);
        station.setNextFocusRightId(queue.getId());
        queue.setNextFocusLeftId(station.getId());
        queue.setNextFocusUpId(seek.getId());
        shuffle.setNextFocusRightId(repeatId);
        repeat.setNextFocusLeftId(shuffleId);
        repeat.setNextFocusRightId(favoriteId);
        favorite.setNextFocusLeftId(repeatId);
        if (Tokens.wide()) {
            // Header row: ‹, TOCANDO AGORA, toggles, Ações.
            close.setNextFocusRightId(shuffleId);
            favorite.setNextFocusRightId(actionsId);
            actions.setNextFocusLeftId(favoriteId);
            actions.setNextFocusDownId(previousId);
            shuffle.setNextFocusDownId(previousId);
            repeat.setNextFocusDownId(previousId);
            favorite.setNextFocusDownId(previousId);
            station.setNextFocusUpId(seek.getId());
        } else {
            // Toggles keep their own line between the transport and the pills.
            close.setNextFocusRightId(actionsId);
            actions.setNextFocusDownId(previousId);
            seek.setNextFocusDownId(shuffleId);
            shuffle.setNextFocusUpId(seek.getId());
            repeat.setNextFocusUpId(seek.getId());
            favorite.setNextFocusUpId(seek.getId());
            favorite.setNextFocusDownId(station.getId());
            station.setNextFocusUpId(favoriteId);
        }
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
        play.setContentDescription(snapshot.playing ? "Pausar" : "Reproduzir");
        station.setVisibility(snapshot.findActionEndingWith(STATION) != null
                ? View.VISIBLE : View.GONE);
        queue.setVisibility(snapshot.queue.isEmpty() ? View.GONE : View.VISIBLE);
        shuffleAction = actionId(snapshot, SHUFFLE);
        repeatAction = actionId(snapshot, REPEAT);
        favoriteAction = actionId(snapshot, FAVORITE);
        shuffle.setVisibility(shuffleAction != null ? View.VISIBLE : View.GONE);
        repeat.setVisibility(repeatAction != null ? View.VISIBLE : View.GONE);
        favorite.setVisibility(favoriteAction != null ? View.VISIBLE : View.GONE);
        boolean anyToggle = shuffleAction != null || repeatAction != null
                || favoriteAction != null;
        toggles.setVisibility(anyToggle ? View.VISIBLE : View.GONE);
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
        feedback.removeCallbacks(hideFeedback);
        feedback.setVisibility(View.GONE);
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
