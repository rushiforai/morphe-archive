package app.morphe.extension.tv360;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.res.ColorStateList;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.view.Window;
import android.widget.ScrollView;
import android.app.PictureInPictureParams;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.media.AudioManager;
import android.view.MotionEvent;
import android.view.WindowManager;
import android.content.Intent;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.KeyEvent;
import android.content.pm.ActivityInfo;
import android.graphics.Color;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.provider.OpenableColumns;
import android.database.Cursor;
import android.text.InputType;
import android.view.Gravity;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.media3.common.C;
import androidx.media3.common.Format;
import androidx.media3.common.Tracks;
import androidx.media3.common.TrackSelectionOverride;
import androidx.media3.common.TrackSelectionParameters;
import androidx.media3.common.VideoSize;
import androidx.media3.common.text.CueGroup;
import androidx.media3.common.MediaItem;
import androidx.media3.common.MimeTypes;
import androidx.media3.common.PlaybackException;
import androidx.media3.common.Player;
import androidx.media3.exoplayer.ExoPlayer;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Self-contained, opt-in Media3 player. No TV360 media objects or services are
 * accessed. No torrent engine, download capability, DRM bypass or credentials.
 *
 * Playback supported by Media3 + device codecs: progressive HTTP(S), SAF
 * content URIs, HLS, DASH. IPTV M3U lists are parsed with strict size limits.
 */
public final class ExternalPlayerActivity extends Activity {
    private static final int ACCENT = 0xFFEC3E50;
    private static final int CANVAS = 0xFF000000;
    private static final int PANEL = 0xFF070708;
    private static final int MUTED = 0xFFB5B5BC;
    private static final int PICK_VIDEO = 1401;
    private static final int PICK_LIST = 1402;
    private static final int PICK_SUBTITLE = 1403;
    private static final int PICK_EPG = 1404;
    private static final int MAX_PLAYLIST_BYTES = 2 * 1024 * 1024;
    private static final int MAX_CHANNELS = 500;

    private static final long CONTROLS_HIDE_DELAY = 4500L;
    private static final String RESUME_PREFS = "tv360_media3_resume_v2";
    private static final float[] SPEEDS = {0.5f, 0.75f, 1f, 1.25f, 1.5f, 2f};
    private static final String[] ASPECTS = {"Ajustar", "Rellenar", "Zoom", "16:9", "4:3"};

    private final Handler handler = new Handler(Looper.getMainLooper());
    private final ExecutorService background = Executors.newSingleThreadExecutor();
    private final Runnable hideControls = () -> setControlsVisible(false);
    private ExoPlayer player;
    private TextView title, captions, time, state, hud, headerSubtitle, qualityBadge, elapsedText;
    private LinearLayout rootLayout, centerControls, tvQuickControls;
    private View libraryPanel;
    private TextView liveStatus;
    private final List<Tv360IptvCatalog.Channel> liveChannels = new ArrayList<>();
    private Tv360IptvCatalog.Guide liveGuide;
    private String playlistEpgUrl;
    private int activeChannelIndex = -1;
    private boolean restoreAutoLastChannel;
    private boolean autoPlayLastChannel;
    private Button pause, lockButton, cinemaButton;
    private SeekBar seek;
    private LinearLayout chromeTop, chromeBottom, overlayControls;
    private FrameLayout videoFrame;
    private SurfaceView surface;
    private View gestureLayer;
    private Uri currentUri;
    private Uri subtitleUri;
    private String currentTitle = "";
    private boolean tracking;
    private boolean fullScreen;
    // Optional portrait cinema mode; separate from system immersive fullscreen.
    private boolean cinemaMode;
    private boolean controlsVisible = true;
    private boolean locked;
    private boolean inPip;
    private int aspectMode;
    private boolean manualQuality;
    private float subtitleSp = 18f;
    private int subtitleStyle;
    private int lastVideoWidth;
    private int lastVideoHeight;
    private float lastPixelRatio = 1f;
    private AudioManager audioManager;
    private float touchStartX, touchStartY, touchStartBrightness;
    private long touchStartPosition, lastTapTime, lastProgressWrite;
    private int touchStartVolume;
    private int gestureMode; // 0 = tap, 1 = seek, 2 = volume, 3 = brightness.

    private final Runnable ticker = new Runnable() {
        @Override public void run() {
            if (player == null) return;
            long duration = player.getDuration();
            long position = player.getCurrentPosition();
            if (!tracking && duration > 0 && duration != C.TIME_UNSET) {
                seek.setProgress((int) Math.min(1000L, position * 1000L / duration));
                seek.setSecondaryProgress(Math.max(0, player.getBufferedPercentage() * 10));
            }
            time.setText(clock(position) + " / " + clock(duration));
            pause.setText(player.isPlaying() ? "❚❚" : "▶");
            pause.setContentDescription(player.isPlaying() ? "Pausar" : "Reproducir");
            if (player.isPlaying() && android.os.SystemClock.elapsedRealtime() - lastProgressWrite > 8000L) {
                saveProgress();
                lastProgressWrite = android.os.SystemClock.elapsedRealtime();
            }
            handler.postDelayed(this, 800);
        }
    };

    @Override public void onCreate(Bundle stateBundle) {
        super.onCreate(stateBundle);
        setTheme(android.R.style.Theme_Material_NoActionBar);
        getWindow().setStatusBarColor(CANVAS);
        getWindow().setNavigationBarColor(CANVAS);
        if (Build.VERSION.SDK_INT >= 29)
            getWindow().setNavigationBarContrastEnforced(false);
        audioManager = (AudioManager) getSystemService(Context.AUDIO_SERVICE);
        autoPlayLastChannel = getPreferences(MODE_PRIVATE).getBoolean("auto_live", false);

        rootLayout = new LinearLayout(this);
        rootLayout.setOrientation(LinearLayout.VERTICAL);
        rootLayout.setBackgroundColor(CANVAS);

        videoFrame = new FrameLayout(this);
        videoFrame.setBackgroundColor(Color.BLACK);
        videoFrame.setClipChildren(true);
        videoFrame.setClipToPadding(true);

        surface = new SurfaceView(this);
        videoFrame.addView(surface, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT,
                Gravity.CENTER));

        captions = new TextView(this);
        captions.setTextColor(Color.WHITE);
        captions.setTextSize(subtitleSp);
        captions.setGravity(Gravity.CENTER);
        captions.setShadowLayer(3f, 1f, 1f, Color.BLACK);
        captions.setPadding(dp(12), dp(5), dp(12), dp(5));
        FrameLayout.LayoutParams subtitles = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
        subtitles.setMargins(dp(18), 0, dp(18), dp(100));
        videoFrame.addView(captions, subtitles);

        gestureLayer = new View(this);
        gestureLayer.setContentDescription("Gestos de volumen, brillo y búsqueda");
        gestureLayer.setOnTouchListener((v, event) -> handleGesture(event));
        videoFrame.addView(gestureLayer, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        hud = new TextView(this);
        hud.setTextColor(Color.WHITE);
        hud.setTextSize(14);
        hud.setGravity(Gravity.CENTER);
        hud.setPadding(dp(18), dp(10), dp(18), dp(10));
        hud.setBackground(roundDrawable(0xDA000000, 16, 0xFF38383A, 1));
        hud.setVisibility(View.GONE);
        videoFrame.addView(hud, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER));

        // Header is an overlay on the picture, rather than a permanent toolbar.
        chromeTop = new LinearLayout(this);
        chromeTop.setGravity(Gravity.CENTER_VERTICAL);
        chromeTop.setPadding(dp(12), dp(12), dp(12), dp(22));
        chromeTop.setBackground(new GradientDrawable(
                GradientDrawable.Orientation.TOP_BOTTOM,
                new int[]{0xE9000000, 0x98000000, 0x00000000}));
        Button back = iconButton("‹", "Volver", 44, 0xB0000000,
                v -> onBackPressed());
        chromeTop.addView(back);

        LinearLayout heading = new LinearLayout(this);
        heading.setPadding(dp(10), 0, dp(6), 0);
        heading.setOrientation(LinearLayout.VERTICAL);
        title = new TextView(this);
        title.setText("MI REPRODUCTOR");
        title.setTextColor(Color.WHITE);
        title.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        title.setTextSize(17);
        title.setSingleLine(true);
        title.setEllipsize(android.text.TextUtils.TruncateAt.END);
        heading.addView(title);
        headerSubtitle = new TextView(this);
        headerSubtitle.setText("MEDIA3  •  LISTO PARA REPRODUCIR");
        headerSubtitle.setTextSize(10);
        headerSubtitle.setLetterSpacing(0.09f);
        headerSubtitle.setTextColor(0xFFE4ADB5);
        headerSubtitle.setSingleLine(true);
        heading.addView(headerSubtitle);
        chromeTop.addView(heading, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        chromeTop.addView(iconButton("+", "Abrir contenido", 42, 0xB0000000,
                v -> showSourcesSheet()));
        // A dedicated shortcut makes the library reversible while the video is playing.
        cinemaButton = iconButton("CINE", "Activar modo Cine y ocultar biblioteca", 42,
                0xB0000000, v -> toggleCinemaMode());
        cinemaButton.setTextSize(10);
        chromeTop.addView(cinemaButton);
        chromeTop.addView(iconButton("⚙", "Ajustes de reproducción", 42, 0xB0000000,
                v -> showSettingsSheet()));
        FrameLayout.LayoutParams topParams = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.TOP);
        videoFrame.addView(chromeTop, topParams);

        // Compact playback actions are accessible without leaving the video.
        centerControls = new LinearLayout(this);
        centerControls.setGravity(Gravity.CENTER);
        Button rewind = iconButton("↶ 10", "Retroceder 10 segundos", 58, 0xC9000000,
                v -> { seekRelative(-10000L); showControls(); });
        centerControls.addView(rewind);
        pause = iconButton("▶", "Reproducir o pausar", 70, ACCENT,
                v -> togglePlayback());
        LinearLayout.LayoutParams pauseParams = new LinearLayout.LayoutParams(
                dp(70), dp(70));
        pauseParams.setMargins(dp(18), 0, dp(18), 0);
        centerControls.addView(pause, pauseParams);
        centerControls.addView(iconButton("10 ↷", "Avanzar 10 segundos", 58, 0xC9000000,
                v -> { seekRelative(10000L); showControls(); }));
        videoFrame.addView(centerControls, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER));

        overlayControls = new LinearLayout(this);
        overlayControls.setOrientation(LinearLayout.VERTICAL);
        overlayControls.setPadding(dp(18), dp(26), dp(18), dp(12));
        overlayControls.setBackground(new GradientDrawable(
                GradientDrawable.Orientation.TOP_BOTTOM,
                new int[]{0x00000000, 0x9D000000, 0xEE000000}));

        seek = new SeekBar(this);
        seek.setMax(1000);
        seek.setProgressTintList(ColorStateList.valueOf(ACCENT));
        seek.setThumbTintList(ColorStateList.valueOf(ACCENT));
        seek.setSecondaryProgressTintList(ColorStateList.valueOf(0xFF7B828F));
        seek.setProgressBackgroundTintList(ColorStateList.valueOf(0xFF333337));
        seek.setContentDescription("Progreso del vídeo");
        seek.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onStartTrackingTouch(SeekBar bar) {
                tracking = true;
                showControls();
            }
            @Override public void onStopTrackingTouch(SeekBar bar) {
                tracking = false;
                if (player != null) {
                    long duration = player.getDuration();
                    if (duration > 0 && duration != C.TIME_UNSET)
                        player.seekTo(duration * bar.getProgress() / 1000L);
                }
                showControls();
            }
            @Override public void onProgressChanged(SeekBar bar, int progress, boolean user) {}
        });
        // Only displayed when an IPTV channel is active; supports remote and touch.
        tvQuickControls = new LinearLayout(this);
        tvQuickControls.setGravity(Gravity.CENTER_VERTICAL);
        tvQuickControls.setVisibility(View.GONE);
        Button previousChannel = iconButton("‹ CH", "Canal anterior", 50, 0xBA000000,
                v -> switchChannel(-1));
        previousChannel.setTextSize(12);
        tvQuickControls.addView(previousChannel);
        TextView channelGuide = textLabel("TV EN VIVO", 12, Color.WHITE, true);
        channelGuide.setGravity(Gravity.CENTER);
        channelGuide.setOnClickListener(v -> showChannelBrowser());
        channelGuide.setFocusable(true);
        channelGuide.setContentDescription("Buscar o elegir canales");
        tvQuickControls.addView(channelGuide,
                new LinearLayout.LayoutParams(0, dp(48), 1f));
        Button nextChannel = iconButton("CH ›", "Canal siguiente", 50, 0xBA000000,
                v -> switchChannel(1));
        nextChannel.setTextSize(12);
        tvQuickControls.addView(nextChannel);
        overlayControls.addView(tvQuickControls);
        overlayControls.addView(seek, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(38)));

        LinearLayout details = new LinearLayout(this);
        details.setGravity(Gravity.CENTER_VERTICAL);
        time = new TextView(this);
        time.setTextColor(Color.WHITE);
        time.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        time.setTextSize(12);
        time.setText("00:00 / 00:00");
        details.addView(time);

        qualityBadge = new TextView(this);
        qualityBadge.setText("AUTO");
        qualityBadge.setTextColor(0xFFFFD7DB);
        qualityBadge.setTextSize(11);
        qualityBadge.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        qualityBadge.setGravity(Gravity.CENTER);
        qualityBadge.setPadding(dp(9), dp(6), dp(9), dp(6));
        qualityBadge.setBackground(roundDrawable(0xDC16090D, 11, 0xFF69303B, 1));
        qualityBadge.setOnClickListener(v -> chooseTracks(C.TRACK_TYPE_VIDEO));
        qualityBadge.setContentDescription("Seleccionar calidad de vídeo");
        LinearLayout.LayoutParams qualityParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        qualityParams.setMargins(dp(12), 0, 0, 0);
        details.addView(qualityBadge, qualityParams);

        View spacer = new View(this);
        details.addView(spacer, new LinearLayout.LayoutParams(0, dp(1), 1f));

        details.addView(iconButton("▢", "Formato de pantalla", 40, 0xB5000000,
                v -> chooseAspect()));
        details.addView(iconButton("⛶", "Pantalla completa", 40, 0xB5000000,
                v -> setFullScreen(!fullScreen)));
        overlayControls.addView(details);

        FrameLayout.LayoutParams overlayParams = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM);
        videoFrame.addView(overlayControls, overlayParams);

        lockButton = iconButton("🔒", "Bloquear controles", 42, 0xB5000000, v -> {
            locked = !locked;
            lockButton.setText(locked ? "🔓" : "🔒");
            lockButton.setContentDescription(locked ? "Desbloquear controles" : "Bloquear controles");
            showControls();
        });
        FrameLayout.LayoutParams lockParams = new FrameLayout.LayoutParams(
                dp(42), dp(42), Gravity.TOP | Gravity.END);
        lockParams.setMargins(0, dp(94), dp(14), 0);
        videoFrame.addView(lockButton, lockParams);

        rootLayout.addView(videoFrame, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        // In portrait, the picture is a 16:9 cinema canvas followed by a
        // purpose-built source/library area. Landscape keeps only the canvas.
        chromeBottom = new LinearLayout(this);
        chromeBottom.setOrientation(LinearLayout.VERTICAL);
        chromeBottom.setBackgroundColor(CANVAS);
        chromeBottom.setPadding(dp(18), dp(12), dp(18), dp(12));

        TextView sectionTitle = textLabel("TV360 MEDIA3", 12, 0xFFECABB4, true);
        sectionTitle.setLetterSpacing(0.17f);
        chromeBottom.addView(sectionTitle);

        LinearLayout headingRow = new LinearLayout(this);
        headingRow.setGravity(Gravity.CENTER_VERTICAL);
        TextView exploreTitle = textLabel("Explorar", 23, Color.WHITE, true);
        headingRow.addView(exploreTitle,
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        Button searchChannels = iconButton("⌕", "Buscar canales", 42, PANEL,
                v -> showChannelBrowser());
        headingRow.addView(searchChannels);
        LinearLayout.LayoutParams headingParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        headingParams.setMargins(0, dp(5), 0, dp(11));
        chromeBottom.addView(headingRow, headingParams);

        LinearLayout sources = new LinearLayout(this);
        sources.setGravity(Gravity.CENTER_VERTICAL);
        addSourceCard(sources, "▣", "TV EN VIVO", v -> showChannelBrowser(), true);
        addSourceCard(sources, "▶", "YOUTUBE",
                v -> openOfficialYouTube(Uri.parse("https://m.youtube.com/")), false);
        addSourceCard(sources, "▤", "MIS ARCHIVOS", v -> openDocument(PICK_VIDEO), false);
        chromeBottom.addView(sources);

        LinearLayout libraryActions = new LinearLayout(this);
        libraryActions.setGravity(Gravity.CENTER_VERTICAL);
        LinearLayout.LayoutParams libraryParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        libraryParams.setMargins(0, dp(9), 0, 0);
        chromeBottom.addView(libraryActions, libraryParams);
        addSourceCard(libraryActions, "≡", "MIS LISTAS", v -> showPlaylistSources(), false);
        addSourceCard(libraryActions, "♡", "FAVORITOS", v -> chooseSaved("favorites"), false);
        addSourceCard(libraryActions, "◷", "RECIENTES", v -> chooseSaved("recents"), false);

        TextView linkShortcut = textLabel("↗  Abrir enlace directo  ·  MP4 / HLS / DASH",
                13, 0xFFF2A8B2, true);
        linkShortcut.setGravity(Gravity.CENTER_VERTICAL);
        linkShortcut.setPadding(dp(14), dp(6), dp(14), dp(6));
        linkShortcut.setBackground(roundDrawable(0xFF130609, 12, 0xFF49252D, 1));
        linkShortcut.setClickable(true);
        linkShortcut.setFocusable(true);
        linkShortcut.setOnClickListener(v -> promptUrl());
        LinearLayout.LayoutParams linkParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(48));
        linkParams.setMargins(dp(3), dp(12), dp(3), 0);
        chromeBottom.addView(linkShortcut, linkParams);

        liveStatus = textLabel("TV en vivo · Importa una lista M3U para comenzar.",
                12, MUTED, false);
        liveStatus.setPadding(dp(6), dp(11), dp(6), dp(11));
        liveStatus.setBackground(roundDrawable(PANEL, 10, 0xFF202024, 1));
        liveStatus.setOnClickListener(v -> showChannelBrowser());
        liveStatus.setFocusable(true);
        LinearLayout.LayoutParams liveParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        liveParams.setMargins(dp(3), dp(12), dp(3), 0);
        chromeBottom.addView(liveStatus, liveParams);

        state = textLabel("Enlaces, canales, archivos e historial en un mismo lugar.",
                12, MUTED, false);
        LinearLayout.LayoutParams statusParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        statusParams.setMargins(dp(3), dp(10), dp(3), 0);
        chromeBottom.addView(state, statusParams);

        ScrollView libraryScroll = new ScrollView(this);
        libraryScroll.setFillViewport(false);
        libraryScroll.setVerticalScrollBarEnabled(false);
        libraryScroll.addView(chromeBottom);
        // The source area scrolls on smaller phones without compressing the video.
        LinearLayout libraryHolder = new LinearLayout(this);
        libraryHolder.setOrientation(LinearLayout.VERTICAL);
        libraryHolder.addView(libraryScroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        rootLayout.addView(libraryHolder, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        libraryPanel = libraryHolder;

        setContentView(rootLayout);
        videoFrame.addOnLayoutChangeListener((v, left, top, right, bottom,
                oldLeft, oldTop, oldRight, oldBottom) -> updateVideoGeometry());
        refreshPlayerLayout();
        rootLayout.post(this::refreshPlayerLayout);

        player = new ExoPlayer.Builder(this).build();
        player.setVideoSurfaceView(surface);
        player.addListener(new Player.Listener() {
            @Override public void onPlayerError(PlaybackException error) {
                state.setText("No se pudo reproducir: " + error.getErrorCodeName());
                headerSubtitle.setText("ERROR DE REPRODUCCIÓN");
                showControls();
            }
            @Override public void onIsPlayingChanged(boolean playing) {
                showControls();
            }
            @Override public void onPlaybackStateChanged(int playbackState) {
                if (playbackState == Player.STATE_BUFFERING) {
                    state.setText("Preparando el vídeo…");
                    headerSubtitle.setText("CARGANDO");
                }
                if (playbackState == Player.STATE_READY) {
                    state.setText("Reproduciendo · Media3");
                    headerSubtitle.setText("REPRODUCIENDO · MEDIA3");
                }
                if (playbackState == Player.STATE_ENDED) {
                    state.setText("Reproducción finalizada");
                    headerSubtitle.setText("FINALIZADO");
                    removeProgress();
                    showControls();
                }
            }
            @Override public void onVideoSizeChanged(VideoSize videoSize) {
                lastVideoWidth = videoSize.width;
                lastVideoHeight = videoSize.height;
                lastPixelRatio = videoSize.pixelWidthHeightRatio;
                updateVideoGeometry();
            }
            @Override public void onTracksChanged(Tracks tracks) {
                updateVideoGeometry();
                updateQualityBadge();
            }
            @Override public void onCues(CueGroup group) {
                StringBuilder subtitleText = new StringBuilder();
                for (androidx.media3.common.text.Cue cue : group.cues) {
                    if (cue.text == null) continue;
                    if (subtitleText.length() != 0) subtitleText.append('\n');
                    subtitleText.append(cue.text);
                }
                captions.setText(subtitleText.toString());
            }
        });
        handler.post(ticker);
        showControls();
        updateLiveStatus();
        if (stateBundle != null) {
            subtitleSp = stateBundle.getFloat("subtitleSp", 18f);
            captions.setTextSize(subtitleSp);
            subtitleStyle = stateBundle.getInt("subtitleStyle", 0);
            applySubtitleStyle();
            String previous = stateBundle.getString("media3Uri");
            String captionFile = stateBundle.getString("subtitleUri");
            if (captionFile != null) subtitleUri = Uri.parse(captionFile);
            if (previous != null) {
                playUriAt(Uri.parse(previous),
                        stateBundle.getString("title", "Reproducción"),
                        stateBundle.getLong("position", 0L),
                        stateBundle.getBoolean("playing", false));
            }
            aspectMode = stateBundle.getInt("aspectMode", 0);
            cinemaMode = stateBundle.getBoolean("cinemaMode", false);
            updateCinemaButton();
            if (player != null) player.setPlaybackSpeed(stateBundle.getFloat("speed", 1f));
            setFullScreen(stateBundle.getBoolean("fullScreen", false));
            restoreLastPlaylist(false);
        } else {
            // Autoplay of the last public channel is opt-in, never enabled by default.
            restoreLastPlaylist(true);
        }
    }

    private void togglePlayback() {
        if (player == null) return;
        if (player.isPlaying()) player.pause();
        else player.play();
        showControls();
    }

    private void showControls() {
        setControlsVisible(true);
        handler.removeCallbacks(hideControls);
        if (!locked && !inPip && player != null && player.isPlaying())
            handler.postDelayed(hideControls, CONTROLS_HIDE_DELAY);
    }

    // Only light overlay views are faded; never animate the SurfaceView, so
    // media rendering stays uninterrupted when the controls disappear.
    private void fadeOverlay(View overlay, boolean visible) {
        if (overlay == null) return;
        overlay.animate().cancel();
        if (visible) {
            if (overlay.getVisibility() != View.VISIBLE) {
                overlay.setAlpha(0f);
                overlay.setVisibility(View.VISIBLE);
            }
            if (overlay.getAlpha() != 1f)
                overlay.animate().alpha(1f).setDuration(190L).start();
        } else if (overlay.getVisibility() == View.VISIBLE) {
            overlay.animate().alpha(0f).setDuration(170L).withEndAction(() -> {
                overlay.setVisibility(View.GONE);
                overlay.setAlpha(1f);
            }).start();
        }
    }

    private void setControlsVisible(boolean visible) {
        controlsVisible = visible;
        fadeOverlay(chromeTop, visible && !inPip && !locked);
        fadeOverlay(centerControls, visible && !inPip && !locked);
        fadeOverlay(overlayControls, visible && !inPip && !locked);
        fadeOverlay(lockButton, (visible || locked) && !inPip);
    }

    private void refreshPlayerLayout() {
        if (videoFrame == null || rootLayout == null) return;
        int orientation = getResources().getConfiguration().orientation;
        boolean landscape = orientation == Configuration.ORIENTATION_LANDSCAPE;
        boolean cinema = cinemaMode || fullScreen || inPip || landscape;
        if (libraryPanel != null)
            libraryPanel.setVisibility(cinema ? View.GONE : View.VISIBLE);
        // Cinema/library switching only has meaning in regular portrait mode.
        if (cinemaButton != null)
            cinemaButton.setVisibility(fullScreen || inPip || landscape
                    ? View.GONE : View.VISIBLE);

        LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) videoFrame.getLayoutParams();
        if (params == null) return;
        int width = getResources().getDisplayMetrics().widthPixels;
        int desired = cinema ? 0 : Math.max(dp(190), Math.round(width * 9f / 16f));
        float weight = cinema ? 1f : 0f;
        if (params.height != desired || params.weight != weight) {
            params.height = desired;
            params.weight = weight;
            videoFrame.setLayoutParams(params);
        }
        videoFrame.post(this::updateVideoGeometry);
    }

    private void toggleCinemaMode() {
        cinemaMode = !cinemaMode;
        updateCinemaButton();
        refreshPlayerLayout();
        showControls();
        showHud(cinemaMode
                ? "MODO CINE · Pulsa BIB para mostrar la biblioteca"
                : "BIBLIOTECA VISIBLE");
    }

    private void updateCinemaButton() {
        if (cinemaButton == null) return;
        cinemaButton.setText(cinemaMode ? "BIB" : "CINE");
        cinemaButton.setContentDescription(cinemaMode
                ? "Mostrar biblioteca y salir del modo Cine"
                : "Activar modo Cine y ocultar biblioteca");
        cinemaButton.setBackground(roundDrawable(
                cinemaMode ? 0xFF43121F : 0xB0000000, 42,
                cinemaMode ? ACCENT : 0xFF25252B, 1));
    }

    private void setFullScreen(boolean enabled) {
        boolean wasFullScreen = fullScreen;
        fullScreen = enabled;
        int flags = enabled || inPip
                ? View.SYSTEM_UI_FLAG_FULLSCREEN | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                  | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
                  | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                  | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                  | View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                : 0;
        getWindow().getDecorView().setSystemUiVisibility(flags);
        refreshPlayerLayout();
        showControls();
        if (wasFullScreen != enabled && !inPip) {
            setRequestedOrientation(enabled
                    ? ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE
                    : ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED);
        }
    }

    private void openPip() {
        if (Build.VERSION.SDK_INT < 26 || player == null ||
                player.getMediaItemCount() == 0) {
            message("Abre un vídeo antes de activar PiP.");
            return;
        }
        try {
            enterPictureInPictureMode(new PictureInPictureParams.Builder().build());
        } catch (RuntimeException error) {
            message("PiP no disponible en este dispositivo.");
        }
    }

    @Override public void onPictureInPictureModeChanged(boolean isInPip, Configuration config) {
        super.onPictureInPictureModeChanged(isInPip, config);
        inPip = isInPip;
        setFullScreen(fullScreen);
        setControlsVisible(!isInPip);
    }

    private GradientDrawable roundDrawable(int color, int radius, int stroke, int strokeDp) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(dp(radius));
        if (strokeDp > 0) drawable.setStroke(dp(strokeDp), stroke);
        return drawable;
    }

    private TextView textLabel(String label, int sp, int color, boolean bold) {
        TextView view = new TextView(this);
        view.setText(label);
        view.setTextSize(sp);
        view.setTextColor(color);
        if (bold) view.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        return view;
    }

    private Button iconButton(String glyph, String description, int size,
            int background, View.OnClickListener onClick) {
        Button button = new Button(this);
        button.setText(glyph);
        button.setTextColor(Color.WHITE);
        button.setTextSize(size >= 65 ? 26 : size >= 55 ? 17 : 22);
        button.setAllCaps(false);
        button.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
        button.setPadding(0, 0, 0, 0);
        button.setMinHeight(0);
        button.setMinimumHeight(0);
        button.setMinWidth(0);
        button.setMinimumWidth(0);
        button.setBackground(roundDrawable(background, size, 0, 0));
        button.setElevation(dp(2));
        button.setContentDescription(description);
        button.setOnClickListener(v -> {
            if (onClick != null) onClick.onClick(v);
            showControls();
        });
        button.setLayoutParams(new LinearLayout.LayoutParams(dp(size), dp(size)));
        return button;
    }

    private void addSourceCard(LinearLayout parent, String symbol, String label,
            View.OnClickListener click, boolean primary) {
        LinearLayout tile = new LinearLayout(this);
        tile.setOrientation(LinearLayout.VERTICAL);
        tile.setGravity(Gravity.CENTER);
        tile.setPadding(dp(4), dp(8), dp(4), dp(8));
        // Near-black cards retain boundaries on OLED without gray blocks.
        tile.setBackground(roundDrawable(primary ? 0xFF13060A : PANEL,
                16, primary ? 0xFFB93A50 : 0xFF242429, 1));

        TextView image = textLabel(symbol, 26, primary ? 0xFFFF7887 : Color.WHITE, true);
        image.setGravity(Gravity.CENTER);
        tile.addView(image);
        TextView text = textLabel(label, 11, Color.WHITE, true);
        text.setGravity(Gravity.CENTER);
        text.setLetterSpacing(0.05f);
        LinearLayout.LayoutParams textParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        textParams.setMargins(0, dp(3), 0, 0);
        tile.addView(text, textParams);
        tile.setContentDescription(label);
        tile.setClickable(true);
        tile.setFocusable(true);
        tile.setOnClickListener(click);
        LinearLayout.LayoutParams layout = new LinearLayout.LayoutParams(0, dp(90), 1f);
        layout.setMargins(dp(3), 0, dp(3), 0);
        parent.addView(tile, layout);
    }

    private void showIpTvSourceDialog() {
        new AlertDialog.Builder(this).setTitle("Abrir lista IPTV")
                .setItems(new String[]{"Desde una URL .m3u", "Seleccionar archivo M3U"},
                        (dialog, which) -> {
                            if (which == 0) promptUrl();
                            else openDocument(PICK_LIST);
                        })
                .setNegativeButton("Cancelar", null).show();
    }

    private void showSourcesSheet() {
        showSheet("EXPLORAR · CONTENIDO",
                new String[]{"EN DIRECTO Y VÍDEOS", "TV en vivo y guía EPG",
                        "YouTube · visor interno", "Enlace HTTP(S)",
                        "Mis archivos", "Mis listas IPTV",
                        "MI BIBLIOTECA", "Favoritos", "Recientes e historial",
                        "Guardar en favoritos", "Subtítulo externo"},
                new Runnable[]{null, this::showChannelBrowser,
                        this::showYoutubeHub, this::promptUrl,
                        () -> openDocument(PICK_VIDEO), this::showPlaylistSources,
                        null, () -> chooseSaved("favorites"), () -> chooseSaved("recents"),
                        this::saveFavorite, () -> openDocument(PICK_SUBTITLE)});
    }

    private void showSettingsSheet() {
        showSheet("AJUSTES DE REPRODUCCIÓN",
                new String[]{"REPRODUCCIÓN", "Calidad · automática / manual",
                        "Pistas de audio", "Pistas de subtítulos", "Velocidad",
                        "IMAGEN Y PANTALLA",
                        cinemaMode ? "Mostrar biblioteca · salir de Cine" : "Modo Cine · ampliar el vídeo",
                        "Ajustar · Rellenar · Zoom · 16:9 · 4:3",
                        "Pantalla completa", "Girar vídeo", "Ventana flotante PiP",
                        "SUBTÍTULOS", "Añadir subtítulo externo", "Tamaño de subtítulos",
                        "Estilo de subtítulos",
                        "HERRAMIENTAS", "Información técnica", "Ayuda y gestos",
                        "Detener reproducción"},
                new Runnable[]{null, () -> chooseTracks(C.TRACK_TYPE_VIDEO),
                        () -> chooseTracks(C.TRACK_TYPE_AUDIO),
                        () -> chooseTracks(C.TRACK_TYPE_TEXT), this::chooseSpeed,
                        null, this::toggleCinemaMode, this::chooseAspect,
                        () -> setFullScreen(!fullScreen), this::toggleRotation, this::openPip,
                        null, () -> openDocument(PICK_SUBTITLE), this::chooseSubtitleSize,
                        this::chooseSubtitleStyle, null, this::showPlaybackInfo,
                        this::showGestureHelp, () -> {
                            if (player != null) {
                                saveProgress();
                                player.stop();
                            }
                        }});
    }

    private void showSheet(String heading, String[] items, Runnable[] actions) {
        if (items.length != actions.length) return;
        Dialog dialog = new Dialog(this);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
        LinearLayout panel = new LinearLayout(this);
        panel.setOrientation(LinearLayout.VERTICAL);
        panel.setPadding(dp(20), dp(18), dp(20), dp(22));
        panel.setBackground(roundDrawable(Color.BLACK, 24, 0xFF27272B, 1));

        View handle = new View(this);
        handle.setBackground(roundDrawable(0xFF58585F, 4, 0, 0));
        LinearLayout.LayoutParams handleParams = new LinearLayout.LayoutParams(dp(44), dp(4));
        handleParams.gravity = Gravity.CENTER_HORIZONTAL;
        handleParams.setMargins(0, 0, 0, dp(16));
        panel.addView(handle, handleParams);

        TextView label = textLabel(heading, 18, Color.WHITE, true);
        label.setLetterSpacing(0.05f);
        panel.addView(label);
        TextView hint = textLabel("MI REPRODUCTOR  ·  MEDIA3", 11, MUTED, false);
        LinearLayout.LayoutParams hintParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        hintParams.setMargins(0, dp(4), 0, dp(14));
        panel.addView(hint, hintParams);

        for (int i = 0; i < items.length; i++) {
            String item = items[i];
            Runnable action = actions[i];
            if (action == null) {
                TextView section = textLabel(item, 11, 0xFFF18E9B, true);
                section.setLetterSpacing(0.17f);
                LinearLayout.LayoutParams sectionParams = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                sectionParams.setMargins(0, dp(14), 0, dp(7));
                panel.addView(section, sectionParams);
                continue;
            }
            LinearLayout line = new LinearLayout(this);
            line.setGravity(Gravity.CENTER_VERTICAL);
            line.setPadding(dp(12), dp(6), dp(12), dp(6));
            line.setBackground(roundDrawable(PANEL, 12, 0xFF222226, 1));
            TextView name = textLabel(item, 14, Color.WHITE, false);
            line.addView(name, new LinearLayout.LayoutParams(0, dp(36), 1f));
            name.setGravity(Gravity.CENTER_VERTICAL);
            TextView arrow = textLabel("›", 23, MUTED, false);
            line.addView(arrow);
            line.setClickable(true);
            line.setFocusable(true);
            line.setContentDescription(item);
            line.setOnClickListener(v -> {
                dialog.dismiss();
                action.run();
            });
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            params.setMargins(0, 0, 0, dp(6));
            panel.addView(line, params);
        }

        ScrollView scroll = new ScrollView(this);
        scroll.setVerticalScrollBarEnabled(false);
        scroll.setFillViewport(false);
        scroll.addView(panel);
        dialog.setContentView(scroll);
        Window window = dialog.getWindow();
        if (window == null) return;
        window.setBackgroundDrawableResource(android.R.color.transparent);
        window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
        WindowManager.LayoutParams attributes = window.getAttributes();
        attributes.dimAmount = 0.74f;
        window.setAttributes(attributes);
        window.setGravity(Gravity.BOTTOM);
        dialog.show();
        window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT,
                Math.min(dp(670), (int) (getResources().getDisplayMetrics().heightPixels * 0.78f)));
        panel.setTranslationY(dp(32));
        panel.animate().translationY(0).setDuration(210).start();
    }

    private void updateQualityBadge() {
        if (qualityBadge == null || player == null) return;
        String quality = manualQuality ? "MANUAL" : "AUTO";
        for (Tracks.Group group : player.getCurrentTracks().getGroups()) {
            if (group.getType() != C.TRACK_TYPE_VIDEO) continue;
            for (int i = 0; i < group.length; i++) {
                if (!group.isTrackSelected(i)) continue;
                Format format = group.getTrackFormat(i);
                if (format.height > 0) quality += " · " + format.height + "p";
                qualityBadge.setText(quality);
                return;
            }
        }
        qualityBadge.setText(quality);
    }

    private Button addButton(LinearLayout parent, String label, View.OnClickListener onClick) {
        Button button = new Button(this);
        button.setText(label);
        button.setAllCaps(false);
        button.setTextColor(Color.WHITE);
        button.setTextSize(12);
        button.setBackgroundTintList(android.content.res.ColorStateList.valueOf(0xFF0D0D0F));
        button.setOnClickListener(onClick);
        parent.addView(button);
        return button;
    }

    private int dp(int units) {
        return (int) (getResources().getDisplayMetrics().density * units + 0.5f);
    }

    /**
     * Quality selection uses actual tracks exposed by Media3. Clearing the
     * override restores ABR for multi-rendition HLS/DASH. Progressive MP4
     * normally exposes a single fixed-quality video track.
     */
    private void chooseTracks(int type) {
        if (player == null || player.getMediaItemCount() == 0) {
            message("Primero abre un vídeo.");
            return;
        }
        final Tracks tracks = player.getCurrentTracks();
        final List<String> labels = new ArrayList<>();
        final List<TrackSelectionOverride> options = new ArrayList<>();
        final List<Tracks.Group> groups = tracks.getGroups();
        if (type == C.TRACK_TYPE_TEXT) labels.add("Desactivados");
        labels.add(type == C.TRACK_TYPE_VIDEO ? "Automática (adaptativa)"
                : type == C.TRACK_TYPE_AUDIO ? "Automático" : "Automáticos");

        for (Tracks.Group group : groups) {
            if (group.getType() != type) continue;
            for (int index = 0; index < group.length; index++) {
                Format format = group.getTrackFormat(index);
                String label = formatLabel(format, type);
                if (group.isTrackSelected(index)) label += " · Actual";
                labels.add(label);
                options.add(new TrackSelectionOverride(group.getMediaTrackGroup(), index));
            }
        }

        final int offset = type == C.TRACK_TYPE_TEXT ? 2 : 1;
        if (labels.size() == offset) {
            message("Este contenido no ofrece pistas de " +
                    (type == C.TRACK_TYPE_VIDEO ? "vídeo" :
                    type == C.TRACK_TYPE_AUDIO ? "audio" : "subtítulos") + " seleccionables.");
            return;
        }
        String dialogTitle = type == C.TRACK_TYPE_VIDEO ? "Calidad de vídeo"
                : type == C.TRACK_TYPE_AUDIO ? "Idioma / pista de audio" : "Pistas de subtítulos";
        new AlertDialog.Builder(this)
                .setTitle(dialogTitle)
                .setItems(labels.toArray(new String[0]), (dialog, which) -> {
                    TrackSelectionParameters.Builder builder =
                            player.getTrackSelectionParameters().buildUpon()
                                    .clearOverridesOfType(type)
                                    .setTrackTypeDisabled(type, false);
                    if (type == C.TRACK_TYPE_TEXT && which == 0) {
                        builder.setTrackTypeDisabled(type, true);
                    } else if (which >= offset) {
                        builder.setOverrideForType(options.get(which - offset));
                    }
                    player.setTrackSelectionParameters(builder.build());
                    if (type == C.TRACK_TYPE_VIDEO) manualQuality = which >= offset;
                    updateQualityBadge();
                    showControls();
                })
                .setNegativeButton("Cerrar", null)
                .show();
    }

    private String formatLabel(Format format, int type) {
        StringBuilder result = new StringBuilder();
        if (type == C.TRACK_TYPE_VIDEO) {
            if (format.height > 0) result.append(format.height).append("p");
            else if (format.width > 0) result.append(format.width).append(" px");
            else result.append("Vídeo");
            if (format.width > 0 && format.height > 0)
                result.append(" (").append(format.width).append("×").append(format.height).append(")");
            if (format.frameRate > 0)
                result.append(" · ").append(Math.round(format.frameRate)).append(" fps");
        } else {
            if (format.label != null && !format.label.isEmpty())
                result.append(format.label);
            if (format.language != null && !format.language.isEmpty()
                    && !"und".equals(format.language)) {
                if (result.length() > 0) result.append(" · ");
                result.append(format.language);
            }
            if (result.length() == 0)
                result.append(type == C.TRACK_TYPE_AUDIO ? "Audio" : "Subtítulos");
        }
        if (format.bitrate > 0)
            result.append(" · ").append(format.bitrate / 1000).append(" kb/s");
        return result.toString();
    }

    private void chooseSpeed() {
        if (player == null) return;
        String[] labels = new String[SPEEDS.length];
        for (int i = 0; i < SPEEDS.length; i++)
            labels[i] = SPEEDS[i] + "×";
        new AlertDialog.Builder(this).setTitle("Velocidad de reproducción")
                .setSingleChoiceItems(labels, speedIndex(player.getPlaybackParameters().speed),
                        (dialog, which) -> {
                            player.setPlaybackSpeed(SPEEDS[which]);
                            dialog.dismiss();
                        }).setNegativeButton("Cancelar", null).show();
    }

    private int speedIndex(float current) {
        int closest = 0;
        for (int i = 0; i < SPEEDS.length; i++)
            if (Math.abs(SPEEDS[i] - current) < Math.abs(SPEEDS[closest] - current))
                closest = i;
        return closest;
    }

    private void chooseAspect() {
        new AlertDialog.Builder(this).setTitle("Formato de imagen")
                .setSingleChoiceItems(ASPECTS, aspectMode, (dialog, which) -> {
                    aspectMode = which;
                    updateVideoGeometry();
                    dialog.dismiss();
                }).setNegativeButton("Cerrar", null).show();
    }

    private void chooseSubtitleSize() {
        String[] labels = {"Pequeños (14)", "Normales (18)", "Grandes (24)", "Muy grandes (30)"};
        float[] values = {14f, 18f, 24f, 30f};
        new AlertDialog.Builder(this).setTitle("Tamaño de subtítulos")
                .setItems(labels, (dialog, which) -> {
                    subtitleSp = values[which];
                    captions.setTextSize(subtitleSp);
                }).setNegativeButton("Cerrar", null).show();
    }

    private void chooseSubtitleStyle() {
        String[] styles = {"Blanco con sombra", "Blanco sobre negro", "Amarillo sobre negro", "Texto grande con sombra"};
        new AlertDialog.Builder(this).setTitle("Estilo de subtítulos")
                .setSingleChoiceItems(styles, subtitleStyle, (dialog, which) -> {
                    subtitleStyle = which;
                    applySubtitleStyle();
                    dialog.dismiss();
                }).setNegativeButton("Cerrar", null).show();
    }

    private void applySubtitleStyle() {
        if (captions == null) return;
        captions.setTextColor(subtitleStyle == 2 ? 0xFFFFFF00 : Color.WHITE);
        captions.setBackgroundColor(subtitleStyle == 1 || subtitleStyle == 2
                ? 0xA8000000 : Color.TRANSPARENT);
        captions.setShadowLayer(subtitleStyle == 1 || subtitleStyle == 2
                ? 0f : 3f, 1f, 1f, Color.BLACK);
        captions.setTextSize(subtitleStyle == 3 ? Math.max(subtitleSp, 26f) : subtitleSp);
    }

    private void showGestureHelp() {
        new AlertDialog.Builder(this).setTitle("Controles y gestos")
                .setMessage("Toque: mostrar u ocultar controles.\n"
                        + "Doble toque a la izquierda o derecha: retroceder o avanzar 10 segundos.\n"
                        + "Deslizar horizontal: buscar en el vídeo.\n"
                        + "Deslizar vertical por la izquierda: brillo.\n"
                        + "Deslizar vertical por la derecha: volumen.\n"
                        + "Bloquear: evita toques accidentales; usa Desbloquear para volver.\n"
                        + "Calidad Automática: Media3 adapta HLS/DASH a la conexión cuando hay variantes.\n"
                        + "Volver desde pantalla completa: pulsa Atrás.")
                .setPositiveButton("Entendido", null).show();
    }

    private void updateVideoGeometry() {
        if (videoFrame == null || surface == null) return;
        int availableW = videoFrame.getWidth();
        int availableH = videoFrame.getHeight();
        if (availableW <= 0 || availableH <= 0) return;

        double ratio = lastVideoWidth > 0 && lastVideoHeight > 0
                ? (double) lastVideoWidth * lastPixelRatio / lastVideoHeight
                : (double) availableW / availableH;
        if (aspectMode == 3) ratio = 16d / 9d;
        if (aspectMode == 4) ratio = 4d / 3d;
        if (ratio <= 0) ratio = (double) availableW / availableH;

        double fit = Math.min(availableW / ratio, availableH);
        double fill = Math.max(availableW / ratio, availableH);
        double height = aspectMode == 1 ? fill :
                aspectMode == 2 ? fill * 1.15d : fit;
        int h = Math.max(1, (int) Math.round(height));
        int w = Math.max(1, (int) Math.round(height * ratio));
        FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) surface.getLayoutParams();
        if (params.width != w || params.height != h) {
            params.width = w;
            params.height = h;
            params.gravity = Gravity.CENTER;
            surface.setLayoutParams(params);
        }
    }

    private void showPlaybackInfo() {
        if (player == null || player.getMediaItemCount() == 0) {
            message("No hay vídeo cargado.");
            return;
        }
        Tracks tracks = player.getCurrentTracks();
        String videoFormat = "Desconocido", audioFormat = "Desconocido";
        for (Tracks.Group group : tracks.getGroups()) {
            for (int index = 0; index < group.length; index++) {
                if (!group.isTrackSelected(index)) continue;
                Format format = group.getTrackFormat(index);
                String description = formatLabel(format, group.getType());
                if (format.sampleMimeType != null) description += " · " + format.sampleMimeType;
                if (format.codecs != null) description += " · códec " + format.codecs;
                if (group.getType() == C.TRACK_TYPE_VIDEO) videoFormat = description;
                if (group.getType() == C.TRACK_TYPE_AUDIO) audioFormat = description;
            }
        }
        String details = "Imagen: " + videoFormat
                + "\nAudio: " + audioFormat
                + "\nSuperficie: " + lastVideoWidth + "×" + lastVideoHeight
                + "\nBúfer: " + player.getBufferedPercentage() + "%"
                + "\nTiempo almacenado: " + clock(player.getTotalBufferedDuration())
                + "\nVelocidad: " + player.getPlaybackParameters().speed + "×"
                + "\nModo de imagen: " + ASPECTS[aspectMode]
                + "\nAdaptación de calidad: automática salvo selección manual.";
        new AlertDialog.Builder(this).setTitle("Información de reproducción")
                .setMessage(details).setPositiveButton("Cerrar", null).show();
    }

    private static String clock(long ms) {
        if (ms <= 0 || ms == C.TIME_UNSET) return "00:00";
        long sec = ms / 1000;
        return String.format(Locale.ROOT, "%02d:%02d:%02d",
                sec / 3600, (sec / 60) % 60, sec % 60);
    }

    private void seekRelative(long offset) {
        if (player == null || player.getMediaItemCount() == 0) return;
        long target = Math.max(0L, player.getCurrentPosition() + offset);
        long duration = player.getDuration();
        if (duration > 0 && duration != C.TIME_UNSET) target = Math.min(duration, target);
        player.seekTo(target);
    }

    private final Runnable hideHud = () -> {
        if (hud != null) hud.setVisibility(View.GONE);
    };

    private void showHud(String label) {
        if (hud == null) return;
        hud.setText(label);
        hud.setVisibility(View.VISIBLE);
        handler.removeCallbacks(hideHud);
        handler.postDelayed(hideHud, 950L);
    }

    private boolean handleGesture(MotionEvent event) {
        if (event.getPointerCount() > 1) return true;
        if (locked) {
            if (event.getActionMasked() == MotionEvent.ACTION_UP)
                showHud("Bloqueado: pulsa Desbloquear");
            return true;
        }
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                touchStartX = event.getX();
                touchStartY = event.getY();
                gestureMode = 0;
                touchStartPosition = player != null ? player.getCurrentPosition() : 0;
                WindowManager.LayoutParams attributes = getWindow().getAttributes();
                touchStartBrightness = attributes.screenBrightness < 0
                        ? 0.5f : attributes.screenBrightness;
                touchStartVolume = audioManager == null ? 0
                        : audioManager.getStreamVolume(AudioManager.STREAM_MUSIC);
                return true;
            case MotionEvent.ACTION_MOVE: {
                float dx = event.getX() - touchStartX;
                float dy = event.getY() - touchStartY;
                if (gestureMode == 0 && Math.max(Math.abs(dx), Math.abs(dy)) > dp(24)) {
                    if (Math.abs(dx) > Math.abs(dy) && player != null &&
                            player.getDuration() > 0 && player.getDuration() != C.TIME_UNSET)
                        gestureMode = 1;
                    else if (Math.abs(dy) > Math.abs(dx))
                        gestureMode = touchStartX >= gestureLayer.getWidth() / 2f ? 2 : 3;
                }
                if (gestureMode == 1 && player != null) {
                    long duration = player.getDuration();
                    long offset = (long) (dx / Math.max(1, gestureLayer.getWidth()) *
                            Math.min(duration, 180000L));
                    long target = Math.max(0, Math.min(duration, touchStartPosition + offset));
                    player.seekTo(target);
                    showHud("Posición: " + clock(target));
                } else if (gestureMode == 2 && audioManager != null) {
                    int maximum = audioManager.getStreamMaxVolume(AudioManager.STREAM_MUSIC);
                    int target = Math.max(0, Math.min(maximum,
                            touchStartVolume - Math.round(dy / Math.max(1, gestureLayer.getHeight()) * maximum)));
                    audioManager.setStreamVolume(AudioManager.STREAM_MUSIC, target, 0);
                    showHud("Volumen: " + Math.round(100f * target / Math.max(1, maximum)) + "%");
                } else if (gestureMode == 3) {
                    float brightness = Math.max(0.02f, Math.min(1f,
                            touchStartBrightness - dy / Math.max(1, gestureLayer.getHeight())));
                    WindowManager.LayoutParams params = getWindow().getAttributes();
                    params.screenBrightness = brightness;
                    getWindow().setAttributes(params);
                    showHud("Brillo: " + Math.round(brightness * 100f) + "%");
                }
                return true;
            }
            case MotionEvent.ACTION_UP:
                if (gestureMode != 0) {
                    showControls();
                    return true;
                }
                long now = android.os.SystemClock.elapsedRealtime();
                if (now - lastTapTime < 330L && player != null) {
                    if (event.getX() < gestureLayer.getWidth() * 0.36f) {
                        seekRelative(-10000L);
                        showHud("−10 segundos");
                    } else if (event.getX() > gestureLayer.getWidth() * 0.64f) {
                        seekRelative(10000L);
                        showHud("+10 segundos");
                    } else {
                        togglePlayback();
                    }
                    lastTapTime = 0;
                } else {
                    lastTapTime = now;
                    if (controlsVisible) {
                        handler.removeCallbacks(hideControls);
                        setControlsVisible(false);
                    } else showControls();
                }
                return true;
            case MotionEvent.ACTION_CANCEL:
                gestureMode = 0;
                return true;
            default:
                return true;
        }
    }

    /** Resume positions are keyed by SHA-256, not by stored URLs or signed tokens. */
    private String resumeKey(Uri uri) {
        if (uri == null) return null;
        String scheme = uri.getScheme();
        if (!"content".equals(scheme) && !"http".equals(scheme) && !"https".equals(scheme))
            return null;
        try {
            byte[] digest = MessageDigest.getInstance("SHA-256")
                    .digest(uri.toString().getBytes(StandardCharsets.UTF_8));
            StringBuilder result = new StringBuilder("p_");
            for (byte part : digest) {
                result.append(Character.forDigit((part >>> 4) & 15, 16));
                result.append(Character.forDigit(part & 15, 16));
            }
            return result.toString();
        } catch (Exception error) {
            return null;
        }
    }

    private SharedPreferences progressStore() {
        return getSharedPreferences(RESUME_PREFS, MODE_PRIVATE);
    }

    private long savedProgress(Uri uri) {
        String key = resumeKey(uri);
        return key == null ? 0 : progressStore().getLong(key, 0);
    }

    private void removeProgress() {
        String key = resumeKey(currentUri);
        if (key != null) progressStore().edit().remove(key).apply();
    }

    private void saveProgress() {
        if (player == null || currentUri == null || player.getMediaItemCount() == 0) return;
        String key = resumeKey(currentUri);
        if (key == null) return;
        long duration = player.getDuration();
        long position = player.getCurrentPosition();
        if (duration <= 0 || duration == C.TIME_UNSET) return;
        if (position >= duration - 10000L) {
            progressStore().edit().remove(key).apply();
        } else if (position > 5000L) {
            progressStore().edit().putLong(key, position).apply();
        }
    }

    @Override public void onBackPressed() {
        if (locked) {
            locked = false;
            lockButton.setText("🔒");
            showControls();
        } else if (fullScreen) {
            setFullScreen(false);
        } else {
            super.onBackPressed();
        }
    }

    private static boolean isYouTubeUri(Uri uri) {
        if (uri == null || !"https".equalsIgnoreCase(uri.getScheme())) return false;
        String host = uri.getHost();
        if (host == null) return false;
        host = host.toLowerCase(Locale.ROOT);
        return host.equals("youtube.com") || host.endsWith(".youtube.com") ||
                host.equals("youtu.be") || host.equals("www.youtu.be");
    }

    private void openOfficialYouTube(Uri uri) {
        if (!isYouTubeUri(uri)) {
            message("Se aceptan enlaces HTTPS de youtube.com o youtu.be.");
            return;
        }
        try {
            Intent embedded = new Intent(this, YouTubeInsideActivity.class);
            embedded.putExtra(YouTubeInsideActivity.EXTRA_URL, uri.toString());
            startActivity(embedded);
        } catch (RuntimeException error) {
            message("No se pudo abrir el visor interno de YouTube.");
        }
    }

    private void showYoutubeHub() {
        new AlertDialog.Builder(this).setTitle("YOUTUBE · DENTRO DE TV360")
                .setItems(new String[]{
                        "Explorar YouTube aquí mismo",
                        "Buscar vídeos y canales",
                        "Abrir vídeo, canal o lista por enlace"
                }, (dialog, option) -> {
                    if (option == 0)
                        openOfficialYouTube(Uri.parse("https://m.youtube.com/"));
                    if (option == 1) promptYoutubeSearch();
                    if (option == 2) promptYoutubeUrl();
                })
                .setNegativeButton("Cerrar", null).show();
    }

    private void promptYoutubeSearch() {
        EditText input = new EditText(this);
        input.setInputType(InputType.TYPE_CLASS_TEXT);
        input.setSingleLine(true);
        input.setHint("Buscar música, vídeos, canales…");
        new AlertDialog.Builder(this).setTitle("Buscar en YouTube")
                .setView(input).setNegativeButton("Cancelar", null)
                .setPositiveButton("Buscar", (dialog, which) -> {
                    String query = input.getText().toString().trim();
                    if (query.isEmpty()) return;
                    openOfficialYouTube(Uri.parse(
                            "https://www.youtube.com/results?search_query=" +
                            Uri.encode(query)));
                }).show();
    }

    private void promptYoutubeUrl() {
        EditText input = new EditText(this);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
        input.setHint("https://www.youtube.com/watch?v=…");
        new AlertDialog.Builder(this).setTitle("Abrir YouTube")
                .setView(input).setNegativeButton("Cancelar", null)
                .setPositiveButton("Abrir", (dialog, which) ->
                        openOfficialYouTube(Uri.parse(input.getText().toString().trim())))
                .show();
    }

    @Override public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (activeChannelIndex >= 0 && event.getRepeatCount() == 0) {
            if (keyCode == KeyEvent.KEYCODE_CHANNEL_UP ||
                    keyCode == KeyEvent.KEYCODE_MEDIA_NEXT) {
                switchChannel(1);
                return true;
            }
            if (keyCode == KeyEvent.KEYCODE_CHANNEL_DOWN ||
                    keyCode == KeyEvent.KEYCODE_MEDIA_PREVIOUS) {
                switchChannel(-1);
                return true;
            }
        }
        return super.onKeyDown(keyCode, event);
    }

    private void promptUrl() {
        EditText input = new EditText(this);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
        input.setHint("https://servidor/video.mp4 o lista.m3u");
        new AlertDialog.Builder(this).setTitle("Abrir enlace, vídeo o IPTV")
                .setView(input)
                .setNegativeButton("Cancelar", null)
                .setPositiveButton("Abrir", (dialog, which) -> {
                    String url = input.getText().toString().trim();
                    if (!isRemote(url)) {
                        message("Solo se admiten URL HTTP o HTTPS.");
                        return;
                    }
                    Uri uri = Uri.parse(url);
                    if (isYouTubeUri(uri)) {
                        openOfficialYouTube(uri);
                    } else if (uri.getPath() != null &&
                            uri.getPath().toLowerCase(Locale.ROOT).endsWith(".m3u")) {
                        loadRemotePlaylist(url);
                    } else {
                        playUri(uri, uri.getLastPathSegment() == null ?
                                "Enlace" : uri.getLastPathSegment());
                    }
                }).show();
    }

    private void openDocument(int requestCode) {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("*/*");
        if (requestCode == PICK_VIDEO)
            intent.putExtra(Intent.EXTRA_MIME_TYPES, new String[] {"video/*", "audio/*", "application/octet-stream"});
        startActivityForResult(intent, requestCode);
    }

    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (result != RESULT_OK || data == null || data.getData() == null) return;
        Uri uri = data.getData();
        if (!"content".equals(uri.getScheme())) {
            message("Selecciona un archivo usando el selector de Android.");
            return;
        }
        int flags = data.getFlags() & Intent.FLAG_GRANT_READ_URI_PERMISSION;
        if (flags != 0) {
            try { getContentResolver().takePersistableUriPermission(uri, flags); }
            catch (SecurityException ignored) { /* Permission remains valid for this session. */ }
        }
        if (request == PICK_VIDEO) {
            playUri(uri, displayName(uri));
        } else if (request == PICK_LIST) {
            parsePlaylistAsync(uri);
        } else if (request == PICK_EPG) {
            loadLocalGuide(uri);
        } else if (request == PICK_SUBTITLE) {
            subtitleUri = uri;
            if (currentUri != null) {
                long position = player.getCurrentPosition();
                boolean wasPlaying = player.getPlayWhenReady();
                playUriAt(currentUri, currentTitle, Math.max(0L, position), wasPlaying);
            } else message("Subtítulo seleccionado. Abre un vídeo.");
        }
    }

    private String displayName(Uri uri) {
        try (Cursor c = getContentResolver().query(uri,
                new String[] {OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (c != null && c.moveToFirst()) return c.getString(0);
        } catch (Exception ignored) {}
        return "Archivo local";
    }

    private void playUri(Uri uri, String label) {
        if (uri == null) return;
        String scheme = uri.getScheme();
        if (!"content".equals(scheme) && !"http".equals(scheme) && !"https".equals(scheme)) {
            message("Origen no compatible.");
            return;
        }
        saveProgress();
        long previous = savedProgress(uri);
        if (previous > 5000L) {
            if (player != null) player.pause();
            new AlertDialog.Builder(this).setTitle("Continuar viendo")
                    .setMessage("Se guardó la posición " + clock(previous) +
                            ". ¿Quieres reanudar desde allí?")
                    .setPositiveButton("Reanudar", (dialog, which) ->
                            playUriAt(uri, label, previous, true))
                    .setNegativeButton("Desde el inicio", (dialog, which) ->
                            playUriAt(uri, label, 0L, true))
                    .setOnCancelListener(dialog -> playUriAt(uri, label, 0L, true))
                    .show();
            return;
        }
        playUriAt(uri, label, 0L, true);
    }

    private void playUriAt(Uri uri, String label, long resumePosition, boolean autoPlay) {
        if (player == null || uri == null) return;
        String scheme = uri.getScheme();
        if (!"content".equals(scheme) && !"http".equals(scheme) && !"https".equals(scheme)) {
            message("Origen no compatible.");
            return;
        }
        saveProgress();
        if (activeChannelIndex >= 0 && activeChannelIndex < liveChannels.size() &&
                !liveChannels.get(activeChannelIndex).uri.equals(uri)) {
            activeChannelIndex = -1;
            updateLiveStatus();
        }
        currentUri = uri;
        currentTitle = label == null ? "Reproducción" : label;
        title.setText(currentTitle);
        captions.setText("");
        lastVideoWidth = lastVideoHeight = 0;
        lastPixelRatio = 1f;
        try {
            MediaItem.Builder item = new MediaItem.Builder().setUri(uri);
            String path = uri.getPath() == null ? "" : uri.getPath().toLowerCase(Locale.ROOT);
            if (path.endsWith(".m3u8")) item.setMimeType(MimeTypes.APPLICATION_M3U8);
            if (path.endsWith(".mpd")) item.setMimeType(MimeTypes.APPLICATION_MPD);
            if (subtitleUri != null) {
                String subPath = subtitleUri.getPath() == null ? "" :
                        subtitleUri.getPath().toLowerCase(Locale.ROOT);
                String mime = subPath.endsWith(".vtt") ? MimeTypes.TEXT_VTT :
                        MimeTypes.APPLICATION_SUBRIP;
                MediaItem.SubtitleConfiguration subtitle =
                        new MediaItem.SubtitleConfiguration.Builder(subtitleUri)
                                .setMimeType(mime).setLanguage("es")
                                .setSelectionFlags(C.SELECTION_FLAG_DEFAULT).build();
                item.setSubtitleConfigurations(Collections.singletonList(subtitle));
            }
            // New item -> quality returns to adaptive/automatic; other settings
            // (speed, image mode, subtitle size) remain user-controlled.
            TrackSelectionParameters parameters =
                    player.getTrackSelectionParameters().buildUpon()
                            .clearOverridesOfType(C.TRACK_TYPE_VIDEO)
                            .clearOverridesOfType(C.TRACK_TYPE_AUDIO)
                            .clearOverridesOfType(C.TRACK_TYPE_TEXT)
                            .setTrackTypeDisabled(C.TRACK_TYPE_TEXT, false)
                            .build();
            player.setTrackSelectionParameters(parameters);
            manualQuality = false;
            updateQualityBadge();
            player.setMediaItem(item.build());
            if (resumePosition > 0) player.seekTo(resumePosition);
            player.prepare();
            if (autoPlay) player.play();
            else player.pause();
            if (canSaveSource(uri)) remember("recents", uri.toString());
            showControls();
        } catch (RuntimeException ex) {
            state.setText("No se pudo abrir este origen: " + ex.getClass().getSimpleName());
            showControls();
        }
    }

    private void parsePlaylistAsync(Uri uri) {
        loadLocalPlaylist(uri, false);
    }

    private void loadLocalPlaylist(Uri uri, boolean restore) {
        if (uri == null || !"content".equals(uri.getScheme())) return;
        state.setText("Leyendo lista IPTV…");
        background.execute(() -> {
            try (InputStream stream = getContentResolver().openInputStream(uri)) {
                Tv360IptvCatalog.Playlist catalog = Tv360IptvCatalog.parsePlaylist(stream);
                runOnUiThread(() -> finishPlaylistLoad(catalog, uri, restore));
            } catch (Exception error) {
                runOnUiThread(() -> state.setText(
                        "No se pudo leer la lista local. Revisa acceso y formato M3U."));
            }
        });
    }

    private void loadRemotePlaylist(String url) {
        loadRemotePlaylist(url, false);
    }

    private void loadRemotePlaylist(String url, boolean restore) {
        if (!isRemote(url)) { message("Introduce una URL HTTP(S) válida."); return; }
        state.setText("Cargando canales IPTV…");
        background.execute(() -> {
            HttpURLConnection connection = null;
            try {
                connection = (HttpURLConnection) new URL(url).openConnection();
                connection.setConnectTimeout(8000);
                connection.setReadTimeout(10000);
                connection.setInstanceFollowRedirects(false);
                if (connection.getResponseCode() != 200)
                    throw new IllegalArgumentException("HTTP no disponible");
                try (InputStream stream = connection.getInputStream()) {
                    Tv360IptvCatalog.Playlist catalog = Tv360IptvCatalog.parsePlaylist(stream);
                    runOnUiThread(() -> finishPlaylistLoad(catalog, Uri.parse(url), restore));
                }
            } catch (Exception error) {
                runOnUiThread(() -> state.setText(
                        "No se pudo cargar la lista IPTV. Comprueba el enlace o la conexión."));
            } finally {
                if (connection != null) connection.disconnect();
            }
        });
    }

    private void finishPlaylistLoad(Tv360IptvCatalog.Playlist catalog, Uri source, boolean restore) {
        liveChannels.clear();
        liveChannels.addAll(catalog.channels);
        liveGuide = null;
        playlistEpgUrl = catalog.guideUrl;
        activeChannelIndex = -1;
        if (!restore) {
            // Never retain URLs with credential-bearing query strings.
            getPreferences(MODE_PRIVATE).edit()
                    .putString("last_playlist", canSaveSource(source) ? source.toString() : "")
                    .apply();
        }
        state.setText(liveChannels.size() + " canales cargados · Lista IPTV");
        updateLiveStatus();

        if (restore) {
            if (currentUri != null) {
                for (int index = 0; index < liveChannels.size(); index++) {
                    if (liveChannels.get(index).uri.equals(currentUri)) {
                        activeChannelIndex = index;
                        updateLiveStatus();
                        break;
                    }
                }
            }
            if (restoreAutoLastChannel && autoPlayLastChannel) {
                String url = getPreferences(MODE_PRIVATE).getString("last_live_url", "");
                for (int index = 0; index < liveChannels.size(); index++) {
                    Tv360IptvCatalog.Channel channel = liveChannels.get(index);
                    if (isSafeSavedUrl(channel.uri) && channel.uri.toString().equals(url)) {
                        playChannel(index);
                        return;
                    }
                }
            }
            return;
        }
        showChannelBrowser();
    }

    private boolean canSaveSource(Uri uri) {
        if (uri == null || uri.getQuery() != null || uri.getFragment() != null) return false;
        if ("content".equals(uri.getScheme())) return true;
        return isSafeSavedUrl(uri);
    }

    private void restoreLastPlaylist() {
        restoreLastPlaylist(true);
    }

    private void restoreLastPlaylist(boolean allowAutoPlay) {
        restoreAutoLastChannel = allowAutoPlay;
        String previous = getPreferences(MODE_PRIVATE).getString("last_playlist", "");
        if (previous.isEmpty()) return;
        Uri uri = Uri.parse(previous);
        if (!canSaveSource(uri)) return;
        if ("content".equals(uri.getScheme())) loadLocalPlaylist(uri, true);
        else if (isRemote(previous)) loadRemotePlaylist(previous, true);
    }

    private static boolean isRemote(String url) {
        return Tv360IptvCatalog.isRemote(url);
    }

    private void playChannel(int index) {
        if (index < 0 || index >= liveChannels.size()) return;
        Tv360IptvCatalog.Channel channel = liveChannels.get(index);
        activeChannelIndex = index;
        if (isSafeSavedUrl(channel.uri)) {
            getPreferences(MODE_PRIVATE).edit()
                    .putString("last_live_url", channel.uri.toString())
                    .putString("last_live_name", channel.name).apply();
        } else {
            getPreferences(MODE_PRIVATE).edit().remove("last_live_url")
                    .remove("last_live_name").apply();
        }
        // IPTV/live channels should play immediately, not invoke the VOD resume dialog.
        playUriAt(channel.uri, channel.name, 0L, true);
        updateLiveStatus();
        showHud("CANAL " + (index + 1) + " · " + channel.name);
    }

    private void switchChannel(int offset) {
        if (liveChannels.isEmpty()) {
            showPlaylistSources();
            return;
        }
        int index = activeChannelIndex < 0 ? 0 :
                (activeChannelIndex + offset + liveChannels.size()) % liveChannels.size();
        playChannel(index);
    }

    private void updateLiveStatus() {
        if (tvQuickControls != null)
            tvQuickControls.setVisibility(activeChannelIndex >= 0 ? View.VISIBLE : View.GONE);
        if (liveStatus == null) return;
        if (liveChannels.isEmpty()) {
            liveStatus.setText("TV en vivo · Añade una lista M3U para ver tus canales.");
            return;
        }
        String text = liveChannels.size() + " canales · " +
                (liveGuide == null ? "EPG no cargada" :
                        "Guía EPG disponible");
        if (activeChannelIndex >= 0 && activeChannelIndex < liveChannels.size()) {
            Tv360IptvCatalog.Channel current = liveChannels.get(activeChannelIndex);
            text = "EN DIRECTO  ·  " + current.name + "\n" +
                    currentProgramme(current);
        }
        liveStatus.setText(text);
    }

    private String currentProgramme(Tv360IptvCatalog.Channel channel) {
        if (liveGuide == null || channel.id.isEmpty()) return channel.group;
        Tv360IptvCatalog.Programme p = liveGuide.current(
                channel.id, System.currentTimeMillis());
        return p != null && !p.title.isEmpty() ? "Ahora · " + p.title : channel.group;
    }

    private String nextProgramme(Tv360IptvCatalog.Channel channel) {
        if (liveGuide == null || channel.id.isEmpty()) return "";
        Tv360IptvCatalog.Programme p = liveGuide.next(
                channel.id, System.currentTimeMillis());
        return p == null || p.title.isEmpty() ? "" : "Después · " + p.title;
    }

    private void showChannelBrowser() {
        if (liveChannels.isEmpty()) {
            showPlaylistSources();
            return;
        }
        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(14), dp(8), dp(14), dp(12));
        content.setBackgroundColor(Color.BLACK);

        LinearLayout tools = new LinearLayout(this);
        tools.setGravity(Gravity.CENTER_VERTICAL);
        Button before = addButton(tools, "◀ CH", v -> switchChannel(-1));
        before.setContentDescription("Canal anterior");
        Button guide = addButton(tools, "EPG", v -> promptEpgSource());
        guide.setContentDescription("Cargar guía de programación");
        Button after = addButton(tools, "CH ▶", v -> switchChannel(1));
        after.setContentDescription("Canal siguiente");
        content.addView(tools);

        EditText query = new EditText(this);
        query.setSingleLine(true);
        query.setTextColor(Color.WHITE);
        query.setHintTextColor(MUTED);
        query.setHint("Buscar por nombre o categoría…");
        query.setInputType(InputType.TYPE_CLASS_TEXT);
        content.addView(query);

        LinkedHashSet<String> found = new LinkedHashSet<>();
        for (Tv360IptvCatalog.Channel channel : liveChannels)
            found.add(channel.group);
        List<String> categories = new ArrayList<>(found);
        Collections.sort(categories, String.CASE_INSENSITIVE_ORDER);
        categories.add(0, "Todos los canales");

        Spinner filter = new Spinner(this);
        ArrayAdapter<String> categoryAdapter = new ArrayAdapter<String>(
                this, android.R.layout.simple_spinner_item, categories) {
            @Override public View getView(int position, View recycled, ViewGroup parent) {
                TextView label = (TextView) super.getView(position, recycled, parent);
                label.setTextColor(Color.WHITE);
                label.setTextSize(14);
                return label;
            }
            @Override public View getDropDownView(int position, View recycled, ViewGroup parent) {
                TextView label = (TextView) super.getDropDownView(position, recycled, parent);
                label.setTextColor(Color.WHITE);
                label.setBackgroundColor(0xFF111114);
                return label;
            }
        };
        categoryAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        filter.setAdapter(categoryAdapter);
        content.addView(filter);

        ListView list = new ListView(this);
        list.setBackgroundColor(Color.BLACK);
        list.setDivider(new android.graphics.drawable.ColorDrawable(0xFF252529));
        list.setDividerHeight(dp(1));
        list.setSelector(new android.graphics.drawable.ColorDrawable(0xFF431C26));
        list.setChoiceMode(ListView.CHOICE_MODE_SINGLE);
        List<Integer> visible = new ArrayList<>();
        ArrayAdapter<String> channelsAdapter = new ArrayAdapter<String>(
                this, android.R.layout.simple_list_item_1, new ArrayList<String>()) {
            @Override public View getView(int position, View recycled, ViewGroup parent) {
                TextView label = (TextView) super.getView(position, recycled, parent);
                label.setTextColor(Color.WHITE);
                label.setTextSize(14);
                label.setPadding(dp(12), dp(10), dp(12), dp(10));
                label.setMinHeight(dp(58));
                // Keep the row transparent so remote DPAD selection is visible.
                label.setBackgroundColor(Color.TRANSPARENT);
                return label;
            }
        };
        list.setAdapter(channelsAdapter);
        content.addView(list, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(340)));

        final Runnable updateFilter = () -> {
            String search = query.getText().toString().trim().toLowerCase(Locale.ROOT);
            String category = categories.get(filter.getSelectedItemPosition() < 0
                    ? 0 : filter.getSelectedItemPosition());
            visible.clear();
            channelsAdapter.clear();
            for (int i = 0; i < liveChannels.size(); i++) {
                Tv360IptvCatalog.Channel item = liveChannels.get(i);
                if (!"Todos los canales".equals(category) && !category.equals(item.group))
                    continue;
                if (!search.isEmpty() && !item.name.toLowerCase(Locale.ROOT).contains(search)
                        && !item.group.toLowerCase(Locale.ROOT).contains(search)) continue;
                visible.add(i);
                String current = currentProgramme(item);
                String next = nextProgramme(item);
                String label = (i == activeChannelIndex ? "●  " : "") +
                        item.name + "\n" + current + (next.isEmpty() ? "" : "\n" + next);
                channelsAdapter.add(label);
            }
            channelsAdapter.notifyDataSetChanged();
        };
        query.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence value, int start,
                    int count, int after) {}
            @Override public void onTextChanged(CharSequence value, int start,
                    int before, int count) { updateFilter.run(); }
            @Override public void afterTextChanged(Editable value) {}
        });
        filter.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override public void onItemSelected(AdapterView<?> parent, View view,
                    int index, long id) { updateFilter.run(); }
            @Override public void onNothingSelected(AdapterView<?> parent) {}
        });

        AlertDialog dialog = new AlertDialog.Builder(this)
                .setTitle("TV EN VIVO · " + liveChannels.size() + " canales")
                .setView(content)
                .setPositiveButton("Auto: " + (autoPlayLastChannel ? "ON" : "OFF"),
                        (d, which) -> {
                            autoPlayLastChannel = !autoPlayLastChannel;
                            getPreferences(MODE_PRIVATE).edit()
                                    .putBoolean("auto_live", autoPlayLastChannel).apply();
                            message("Último canal automático: " +
                                    (autoPlayLastChannel ? "activado" : "desactivado") +
                                    ". Funciona con canales públicos sin tokens.");
                        })
                .setNeutralButton("Mis listas", (d, which) -> showPlaylistSources())
                .setNegativeButton("Cerrar", null)
                .create();
        list.setOnItemClickListener((parent, view, position, id) -> {
            if (position >= 0 && position < visible.size()) {
                int channelIndex = visible.get(position);
                dialog.dismiss();
                playChannel(channelIndex);
            }
        });
        updateFilter.run();
        dialog.show();
        list.setFocusableInTouchMode(true);
        list.requestFocus();
    }

    private void showPlaylistSources() {
        String previous = getPreferences(MODE_PRIVATE).getString("last_playlist", "");
        List<String> labels = new ArrayList<>();
        List<Runnable> actions = new ArrayList<>();
        if (!liveChannels.isEmpty()) {
            labels.add("Explorar " + liveChannels.size() + " canales cargados");
            actions.add(this::showChannelBrowser);
        }
        labels.add("Añadir lista IPTV desde enlace M3U");
        actions.add(this::promptPlaylistUrl);
        labels.add("Añadir lista M3U desde archivo");
        actions.add(() -> openDocument(PICK_LIST));
        if (!previous.isEmpty()) {
            labels.add("Recargar mi última lista");
            actions.add(this::restoreLastPlaylist);
        }
        labels.add("Guía de programación EPG (XMLTV)");
        actions.add(this::promptEpgSource);
        new AlertDialog.Builder(this).setTitle("MIS LISTAS · IPTV")
                .setItems(labels.toArray(new String[0]), (dialog, which) ->
                        actions.get(which).run())
                .setNegativeButton("Cerrar", null).show();
    }

    private void promptPlaylistUrl() {
        EditText input = new EditText(this);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
        input.setHint("https://ejemplo.com/lista.m3u");
        new AlertDialog.Builder(this).setTitle("Añadir lista IPTV")
                .setView(input)
                .setNegativeButton("Cancelar", null)
                .setPositiveButton("Cargar", (dialog, which) -> {
                    String url = input.getText().toString().trim();
                    if (!isRemote(url)) message("Introduce una URL HTTP(S) válida.");
                    else loadRemotePlaylist(url);
                }).show();
    }

    private void promptEpgSource() {
        if (liveChannels.isEmpty()) {
            message("Primero carga una lista IPTV.");
            return;
        }
        final boolean hasHint = playlistEpgUrl != null && isRemote(playlistEpgUrl);
        final String[] options = hasHint ?
                new String[]{"Usar guía XMLTV incluida en la lista",
                        "Introducir URL de guía EPG", "Seleccionar archivo XMLTV"} :
                new String[]{"Introducir URL de guía EPG", "Seleccionar archivo XMLTV"};
        new AlertDialog.Builder(this).setTitle("Guía de programación (EPG)")
                .setItems(options, (dialog, which) -> {
                    int choice = hasHint ? which : which + 1;
                    if (choice == 0) loadRemoteGuide(playlistEpgUrl);
                    if (choice == 1) promptEpgUrl();
                    if (choice == 2) openDocument(PICK_EPG);
                })
                .setNegativeButton("Cerrar", null).show();
    }

    private void promptEpgUrl() {
        EditText input = new EditText(this);
        input.setSingleLine(true);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_URI);
        input.setHint("https://ejemplo.com/guia.xml");
        new AlertDialog.Builder(this).setTitle("Importar guía XMLTV")
                .setView(input).setNegativeButton("Cancelar", null)
                .setPositiveButton("Importar", (dialog, which) ->
                        loadRemoteGuide(input.getText().toString().trim()))
                .show();
    }

    private void loadRemoteGuide(String url) {
        if (!isRemote(url) || liveChannels.isEmpty()) {
            message("Comprueba la URL y carga una lista de canales.");
            return;
        }
        state.setText("Actualizando programación EPG…");
        List<Tv360IptvCatalog.Channel> snapshot = new ArrayList<>(liveChannels);
        background.execute(() -> {
            HttpURLConnection connection = null;
            try {
                connection = (HttpURLConnection) new URL(url).openConnection();
                connection.setConnectTimeout(8000);
                connection.setReadTimeout(12000);
                connection.setInstanceFollowRedirects(false);
                if (connection.getResponseCode() != 200)
                    throw new IllegalArgumentException("EPG HTTP not available");
                try (InputStream stream = connection.getInputStream()) {
                    Tv360IptvCatalog.Guide guide = Tv360IptvCatalog.parseGuide(stream, snapshot);
                    runOnUiThread(() -> finishEpg(guide));
                }
            } catch (Exception error) {
                runOnUiThread(() -> {
                    state.setText("No se pudo leer EPG XMLTV. Verifica el formato y tamaño.");
                    message("La guía debe ser XMLTV sin comprimir y contener tvg-id coincidentes.");
                });
            } finally {
                if (connection != null) connection.disconnect();
            }
        });
    }

    private void loadLocalGuide(Uri uri) {
        if (liveChannels.isEmpty()) { message("Carga primero los canales."); return; }
        state.setText("Importando guía XMLTV…");
        List<Tv360IptvCatalog.Channel> snapshot = new ArrayList<>(liveChannels);
        background.execute(() -> {
            try (InputStream input = getContentResolver().openInputStream(uri)) {
                Tv360IptvCatalog.Guide guide = Tv360IptvCatalog.parseGuide(input, snapshot);
                runOnUiThread(() -> finishEpg(guide));
            } catch (Exception error) {
                runOnUiThread(() -> state.setText(
                        "Guía EPG no válida. Selecciona un XMLTV sin comprimir."));
            }
        });
    }

    private void finishEpg(Tv360IptvCatalog.Guide guide) {
        liveGuide = guide;
        state.setText("EPG importada · programación para " +
                guide.channelCount() + " canales");
        updateLiveStatus();
        message("Guía EPG cargada. Abre TV en vivo para ver la programación.");
    }

    // Never persist access tokens in signed query strings or URL credentials.
    private boolean isSafeSavedUrl(Uri uri) {
        return ("https".equals(uri.getScheme()) || "http".equals(uri.getScheme())) &&
                uri.getQuery() == null && uri.getUserInfo() == null &&
                uri.getFragment() == null && uri.toString().indexOf('\n') < 0;
    }

    private void remember(String key, String url) {
        String previous = getPreferences(MODE_PRIVATE).getString(key, "");
        List<String> items = new ArrayList<>();
        items.add(url);
        for (String item : previous.split("\n")) {
            if (!item.isEmpty() && !item.equals(url) && items.size() < 15) items.add(item);
        }
        getPreferences(MODE_PRIVATE).edit().putString(key, String.join("\n", items)).apply();
    }

    private void saveFavorite() {
        if (currentUri == null || !canSaveSource(currentUri)) {
            message("Solo se guardan enlaces públicos y archivos autorizados sin tokens.");
            return;
        }
        remember("favorites", currentUri.toString());
        message("Guardado en favoritos.");
    }

    private void chooseSaved(String key) {
        String stored = getPreferences(MODE_PRIVATE).getString(key, "");
        if (stored.isEmpty()) {
            message("No hay elementos guardados.");
            return;
        }
        String[] items = stored.split("\n");
        String[] labels = new String[items.length];
        for (int i = 0; i < items.length; i++) {
            Uri uri = Uri.parse(items[i]);
            String label;
            if ("content".equals(uri.getScheme())) {
                label = displayName(uri);
            } else {
                String segment = uri.getLastPathSegment();
                label = segment == null || segment.isEmpty() ?
                        (uri.getHost() == null ? "Vídeo" : uri.getHost()) : segment;
            }
            long progress = savedProgress(uri);
            labels[i] = label + (progress > 5000 ? " · Continuar en " + clock(progress) : "");
        }
        new AlertDialog.Builder(this)
                .setTitle(key.equals("favorites") ? "FAVORITOS" : "RECIENTES · HISTORIAL")
                .setItems(labels, (dialog, index) -> {
                    Uri uri = Uri.parse(items[index]);
                    playUri(uri, labels[index].split(" · ")[0]);
                })
                .setNeutralButton("Borrar lista", (dialog, which) ->
                        getPreferences(MODE_PRIVATE).edit().remove(key).apply())
                .setNegativeButton("Cerrar", null).show();
    }

    private void toggleRotation() {
        int orientation = getRequestedOrientation();
        setRequestedOrientation(orientation == ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE ?
                ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED : ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE);
    }

    private void message(String text) {
        Toast.makeText(this, text, Toast.LENGTH_SHORT).show();
    }

    @Override protected void onSaveInstanceState(Bundle out) {
        if (currentUri != null) out.putString("media3Uri", currentUri.toString());
        if (subtitleUri != null) out.putString("subtitleUri", subtitleUri.toString());
        out.putString("title", currentTitle);
        out.putBoolean("fullScreen", fullScreen);
        out.putBoolean("cinemaMode", cinemaMode);
        out.putInt("aspectMode", aspectMode);
        out.putFloat("subtitleSp", subtitleSp);
        out.putInt("subtitleStyle", subtitleStyle);
        saveProgress();
        if (player != null) {
            out.putFloat("speed", player.getPlaybackParameters().speed);
            out.putLong("position", player.getCurrentPosition());
            out.putBoolean("playing", player.getPlayWhenReady());
        }
        super.onSaveInstanceState(out);
    }

    @Override protected void onStop() {
        saveProgress();
        if (player != null && !isInPictureInPictureMode()) player.pause();
        super.onStop();
    }

    @Override protected void onDestroy() {
        saveProgress();
        handler.removeCallbacks(ticker);
        handler.removeCallbacks(hideControls);
        handler.removeCallbacks(hideHud);
        if (player != null) {
            player.release();
            player = null;
        }
        background.shutdownNow();
        super.onDestroy();
    }
}
