package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.graphics.Color;
import android.net.Uri;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.view.MotionEvent;
import android.view.KeyEvent;
import android.widget.*;

/** User-visible streaming player. No WebView, login cookies or automatic retries. */
public final class VideoViewerActivity extends HaiagaruComposeActivity {
    private VideoView video;
    private MediaController controls;
    private ViewerCornerControls toolbar;
    private FrameLayout mediaFrame;
    private TextView status;
    private String url;
    private int position;
    private boolean prepared, foreground, playWhenReady = true;
    private boolean rotated;
    private boolean savePermissionPending;
    private VideoViewerGestures gestures;
    private VideoTouchControls touchControls;
    private android.media.MediaPlayer mediaPlayer;
    private final VideoSeekState seeks = new VideoSeekState();
    private androidx.media3.exoplayer.ExoPlayer gifFallback;
    private android.view.TextureView gifFallbackView;
    private boolean gifFallbackAttempted;
    private float gifAspect;
    private Runnable unregisterBack;
    private Button speedButton;
    private TextView holdSpeedIndicator;
    private Button muteButton;
    private boolean muted;
    private float playbackSpeed = 1f;
    private float speedBeforeHold = 1f;
    private boolean holdSpeedActive;
    private static final float[] PLAYBACK_SPEEDS = {0.5f, 0.75f, 1f, 1.25f, 1.5f, 1.75f, 2f};

    private static volatile Boolean installationStatus;
    public static boolean installed(Context context) {
        if (context == null) return false;
        Boolean known=installationStatus;if(known!=null)return known;
        try (java.io.InputStream marker = context.getAssets().open("haiagaru/video-viewer/installed")) {
            boolean installed=marker.read()=='1';installationStatus=installed;return installed;
        } catch (java.io.IOException ignored) { installationStatus=false;return false; }
    }

    /** Called only at native external-launch boundaries, never at the external menu below. */
    public static void prepareExternalIntent(Intent intent) {
        if (intent == null || !Intent.ACTION_VIEW.equals(intent.getAction())) return;
        Context context = Haiagaru.applicationContextForExtension();
        if (context == null || !Haiagaru.videoViewerEnabled()) return;
        Uri uri = intent.getData();
        if (uri == null) return;
        // Do not replace unrelated explicit destinations or pin to another installed app.
        if (intent.getComponent() != null || intent.getPackage() != null) return;
        if(GifViewerActivity.supported(uri.toString())?VideoViewerSettings.nativeGif(context):VideoViewerSettings.nativeVideo(context))return;
        MediaViewerNavigation.prepare(intent);
        if (YouTubeUrls.videoId(uri.toString()) != null && VideoViewerSettings.youtubeEnabled(context)) {
            intent.setClass(context, YouTubeViewerActivity.class);
        } else if (GifViewerActivity.supported(uri.toString())) {
            intent.setData(Uri.parse(PreviewUrls.normalize(uri.toString())));intent.setClass(context, GifViewerActivity.class);
        }
        else if (XMediaAttachments.isVideo(uri.toString())) intent.setClass(context, VideoViewerActivity.class);
    }

    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        unregisterBack = VideoViewerBack.register(this);
        if (!Haiagaru.videoViewerEnabled()) { finish(); return; }
        Uri uri = getIntent().getData();
        if (uri == null || !XMediaAttachments.isVideo(uri.toString())) { finish(); return; }
        url = uri.toString();
        playWhenReady = VideoViewerSettings.autoplay(this,url);
        if (state != null) {
            position = state.getInt("position", 0);
            playWhenReady = state.getBoolean("playing", true);
            rotated = state.getBoolean("rotated", false);
            savePermissionPending = state.getBoolean("savePermissionPending", false);
            playbackSpeed = state.getFloat("playbackSpeed", 1f);
            muted = state.getBoolean("muted", false);
        }
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL); root.setBackgroundColor(Color.BLACK);
        root.setOnApplyWindowInsetsListener((view, insets) -> {
            view.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                    insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            return insets;
        });
        Button back = overlayButton("戻る"); back.setOnClickListener(v -> finish());
        Button more = overlayButton("︙"); more.setContentDescription("動画メニュー");
        speedButton = overlayButton(speedLabel(playbackSpeed));
        speedButton.setContentDescription("再生速度");
        speedButton.setOnClickListener(v -> cyclePlaybackSpeed());
        speedButton.setOnLongClickListener(v -> {
            holdSpeedActive = false;
            showHoldSpeedIndicator(false);
            applyPlaybackSpeed(1f);
            return true;
        });
        muteButton=overlayButton(muted?"音声ON":"ミュート");
        muteButton.setContentDescription(muted?"ミュートを解除":"ミュートする");
        muteButton.setOnClickListener(v->{muted=!muted;applyMute();});
        more.setOnClickListener(this::showMenu);
        toolbar = new ViewerCornerControls(this, back, more);
        FrameLayout frame = new FrameLayout(this);mediaFrame=frame;
        video = new VideoView(this);
        setVolumeControlStream(android.media.AudioManager.STREAM_MUSIC);
        touchControls = new VideoTouchControls(this);
        // Confirmed taps are handled by the detector, so a double tap cannot toggle controls twice.
        video.setOnTouchListener((view, event) -> true);
        frame.addView(video, new FrameLayout.LayoutParams(-1, -1, Gravity.CENTER));
        // Overlay controls so hiding them does not resize or shift the video.
        frame.addView(toolbar, new FrameLayout.LayoutParams(-1, -1));
        frame.getViewTreeObserver().addOnPreDrawListener(() -> {
            if(controls instanceof HaiagaruMediaController) toolbar.bottomInset(((HaiagaruMediaController)controls).controlHeight());
            return true;
        });
        // Keep the temporary hold-speed badge visible even when player controls are hidden.
        holdSpeedIndicator = new TextView(this);
        holdSpeedIndicator.setText("2x");
        holdSpeedIndicator.setContentDescription("長押しで2倍速再生中");
        holdSpeedIndicator.setTextColor(Color.WHITE);
        holdSpeedIndicator.setTextSize(17);
        holdSpeedIndicator.setTypeface(android.graphics.Typeface.DEFAULT, android.graphics.Typeface.BOLD);
        holdSpeedIndicator.setGravity(Gravity.CENTER);
        float density = getResources().getDisplayMetrics().density;
        holdSpeedIndicator.setPadding(Math.round(12 * density), Math.round(6 * density),
                Math.round(12 * density), Math.round(6 * density));
        android.graphics.drawable.GradientDrawable indicatorBackground =
                new android.graphics.drawable.GradientDrawable();
        indicatorBackground.setColor(0xB8000000);
        indicatorBackground.setCornerRadius(16 * density);
        holdSpeedIndicator.setBackground(indicatorBackground);
        holdSpeedIndicator.setVisibility(View.GONE);
        FrameLayout.LayoutParams indicatorLayout =
                new FrameLayout.LayoutParams(-2, -2, Gravity.TOP | Gravity.CENTER_HORIZONTAL);
        indicatorLayout.topMargin = Math.round(12 * density);
        frame.addView(holdSpeedIndicator, indicatorLayout);
        root.addView(frame, new LinearLayout.LayoutParams(-1, 0, 1));
        status = new TextView(this); status.setTextColor(Color.WHITE); status.setPadding(16, 8, 16, 12);
        // Status overlays the player; transient messages must never resize the video.
        FrameLayout.LayoutParams statusLayout=new FrameLayout.LayoutParams(-1,-2,Gravity.BOTTOM);
        frame.addView(status,statusLayout);
        frame.getViewTreeObserver().addOnPreDrawListener(()->{
            int inset=controls instanceof HaiagaruMediaController?((HaiagaruMediaController)controls).controlHeight():0;
            FrameLayout.LayoutParams lp=(FrameLayout.LayoutParams)status.getLayoutParams();
            if(lp.bottomMargin!=inset){lp.bottomMargin=inset;status.setLayoutParams(lp);}return true;
        });
        HaiagaruUi.showPlayer(this, root); root.requestApplyInsets();
        controls = new HaiagaruMediaController(this) {
            private Runnable unregisterControllerBack;
            @Override public void setMediaPlayer(MediaController.MediaPlayerControl ignored) {
                // VideoView reattaches itself on preparation. Always retain the active-player bridge.
                super.setMediaPlayer(activePlayerControl());
            }
            @Override public void show(int timeout) {
                // VideoView and MediaController also request timed shows after touch/seek/play.
                // Ignore every timeout so none of these paths schedule automatic dismissal.
                super.show(0);
                if (unregisterControllerBack != null) unregisterControllerBack.run();
                unregisterControllerBack = VideoViewerBack.register(this, VideoViewerActivity.this);
                toolbar.setVisibility(View.VISIBLE);
            }
            @Override public boolean dispatchKeyEvent(KeyEvent event) {
                if (event.getKeyCode() == KeyEvent.KEYCODE_BACK) {
                    if (event.getAction() == KeyEvent.ACTION_UP && !event.isCanceled()) finish();
                    return true;
                }
                return super.dispatchKeyEvent(event);
            }
            @Override public void hide() {
                if (unregisterControllerBack != null) {
                    unregisterControllerBack.run(); unregisterControllerBack = null;
                }
                super.hide();
                toolbar.setVisibility(View.INVISIBLE);
            }
        };
        ((HaiagaruMediaController)controls).setPlaybackActions(speedButton,muteButton);
        controls.setAnchorView(frame); video.setMediaController(controls);
        // The save menu must work before preparation completes, or even after a playback error.
        controls.setMediaPlayer(video);
        video.setOnPreparedListener(player -> {
            prepared = true;
            mediaPlayer = player;
            player.setOnSeekCompleteListener(completed -> {
                if (completed != mediaPlayer) return;
                int next = seeks.completed();
                if (next >= 0) issueSeek(next);
            });
            applyMute();
            // X's GIFs are silent MP4s. Preserve their repeating animation behavior.
            if(VideoViewerSettings.xGif(url))player.setLooping(true);
            applyPlaybackSpeed(player, playbackSpeed);
            if (position > 0) seekAbsolute(position);
            setStatus("");
            if (foreground && playWhenReady) video.start();
            controls.show(0);
        });
        video.setOnCompletionListener(player -> {
            seeks.reset();
            playWhenReady = false; position = 0;
            setStatus("再生が終了しました。再生ボタンで最初から再生できます"); controls.show(0);
        });
        video.setOnErrorListener((player, what, extra) -> {
            seeks.reset();
            endHoldSpeed();
            prepared = false; mediaPlayer = null;
            if (startGifFallback()) return true;
            playWhenReady = false;
            setStatus("動画を再生できません（エラー " + what + "/" + extra
                    + "）。︙から再読み込み、または外部アプリで開いてください");
            return true;
        });
        video.setOnInfoListener((player, what, extra) -> {
            if (what == android.media.MediaPlayer.MEDIA_INFO_BUFFERING_START) setStatus("読み込み中…");
            else if (what == android.media.MediaPlayer.MEDIA_INFO_BUFFERING_END)
                setStatus("");
            return false;
        });
        load();
    }

    private MediaController.MediaPlayerControl activePlayerControl() {
        return new MediaController.MediaPlayerControl() {
            public void start() { if(gifFallback!=null)gifFallback.play();else video.start(); }
            public void pause() { if(gifFallback!=null)gifFallback.pause();else video.pause(); }
            public int getDuration() { return gifFallback!=null?(int)Math.max(0,gifFallback.getDuration()):video.getDuration(); }
            public int getCurrentPosition() { return playbackPosition(); }
            public void seekTo(int value) { seekAbsolute(value); }
            public boolean isPlaying() { return gifFallback!=null?gifFallback.isPlaying():video.isPlaying(); }
            public int getBufferPercentage() { return gifFallback!=null?gifFallback.getBufferedPercentage():video.getBufferPercentage(); }
            public boolean canPause() { return gifFallback!=null||video.canPause(); }
            public boolean canSeekBackward() { return gifFallback!=null||video.canSeekBackward(); }
            public boolean canSeekForward() { return gifFallback!=null||video.canSeekForward(); }
            public int getAudioSessionId() { return gifFallback!=null?gifFallback.getAudioSessionId():video.getAudioSessionId(); }
        };
    }

    private Button overlayButton(String label) {
        Button button = new Button(this);
        button.setText(label);
        button.setBackgroundColor(Color.TRANSPARENT);
        button.setTextColor(Color.WHITE);
        // A dark text shadow keeps the label readable over bright video without a button background.
        float density = getResources().getDisplayMetrics().density;
        button.setShadowLayer(2 * density, 0, density, Color.BLACK);
        return button;
    }

    private static String speedLabel(float speed) {
        return (speed == (int) speed ? Integer.toString((int) speed) : Float.toString(speed)) + "×";
    }

    private void cyclePlaybackSpeed() {
        if (!prepared && gifFallback==null) {
            Toast.makeText(this, "動画の読み込み後に変更できます", Toast.LENGTH_SHORT).show();
            return;
        }
        if (android.os.Build.VERSION.SDK_INT < 23) {
            Toast.makeText(this, "再生速度の変更にはAndroid 6.0以降が必要です", Toast.LENGTH_LONG).show();
            return;
        }
        int next = 0;
        for (int i = 0; i < PLAYBACK_SPEEDS.length; i++) {
            if (Math.abs(PLAYBACK_SPEEDS[i] - playbackSpeed) < 0.001f) {
                next = (i + 1) % PLAYBACK_SPEEDS.length;
                break;
            }
        }
        applyPlaybackSpeed(PLAYBACK_SPEEDS[next]);
    }

    private void applyPlaybackSpeed(float speed) {
        if(gifFallback!=null){gifFallback.setPlaybackSpeed(speed);playbackSpeed=speed;speedButton.setText(speedLabel(speed));refreshPlaybackActions();return;}
        if (!prepared || mediaPlayer == null || android.os.Build.VERSION.SDK_INT < 23) return;
        applyPlaybackSpeed(mediaPlayer, speed);
    }

    private void applyPlaybackSpeed(android.media.MediaPlayer player, float speed) {
        if (android.os.Build.VERSION.SDK_INT < 23) return;
        try {
            boolean playing=player.isPlaying();
            player.setPlaybackParams(player.getPlaybackParams().setSpeed(speed));
            if(!playing)player.pause();
            playbackSpeed = speed;
            if (speedButton != null) {
                speedButton.setText(speedLabel(speed));
                speedButton.setContentDescription("再生速度 " + speedLabel(speed));
                refreshPlaybackActions();
            }
        } catch (RuntimeException error) {
            Toast.makeText(this, "この動画では再生速度を変更できません", Toast.LENGTH_SHORT).show();
        }
    }

    void beginHoldSpeed() {
        if(!VideoViewerSettings.prefs(this).getBoolean(VideoViewerSettings.HOLD_SPEED,true))return;
        if (holdSpeedActive || (!prepared && gifFallback==null) || android.os.Build.VERSION.SDK_INT < 23) return;
        cancelNativeVideoGesture();
        speedBeforeHold = playbackSpeed;
        holdSpeedActive = true;
        applyPlaybackSpeed(2f);
        if (Math.abs(playbackSpeed - 2f) < 0.001f) showHoldSpeedIndicator(true);
        else holdSpeedActive = false; // No badge if the player rejected the speed change.
    }

    private void showHoldSpeedIndicator(boolean visible) {
        if (holdSpeedIndicator != null)
            holdSpeedIndicator.setVisibility(visible ? View.VISIBLE : View.GONE);
    }

    boolean isHoldSpeedActive() { return holdSpeedActive; }

    private void refreshPlaybackActions(){if(controls instanceof HaiagaruMediaController)((HaiagaruMediaController)controls).refreshPlaybackActions();}
    private void applyMute(){
        float volume=muted?0f:1f;
        if(mediaPlayer!=null)try{mediaPlayer.setVolume(volume,volume);}catch(IllegalStateException ignored){}
        if(gifFallback!=null)gifFallback.setVolume(volume);
        if(muteButton!=null){muteButton.setText(muted?"音声ON":"ミュート");muteButton.setContentDescription(muted?"ミュートを解除":"ミュートする");}
        refreshPlaybackActions();
    }

    void endHoldSpeed() {
        if (!holdSpeedActive) return;
        holdSpeedActive = false;
        showHoldSpeedIndicator(false);
        applyPlaybackSpeed(speedBeforeHold);
    }

    private void load() {
        seeks.reset();
        endHoldSpeed();
        closeGifFallback();
        gifFallbackAttempted=false;
        video.setVisibility(View.VISIBLE);
        prepared = false;
        mediaPlayer = null;
        setStatus("動画を読み込み中…（通信が発生します）");
        video.setVideoURI(Uri.parse(url));
    }

    /** One independent-extractor retry, limited to X's silent GIF MP4 format. */
    private boolean startGifFallback() {
        Uri source=Uri.parse(url);
        if(gifFallbackAttempted||gifFallback!=null||!"video.twimg.com".equalsIgnoreCase(source.getHost())
                ||source.getPath()==null||!source.getPath().startsWith("/tweet_video/")
                ||!(video.getParent() instanceof FrameLayout))return false;
        try{
            gifFallbackAttempted=true;
            video.stopPlayback();controls.hide();video.setVisibility(View.GONE);
            gifFallback=new androidx.media3.exoplayer.ExoPlayer.Builder(this).build();
            // Native surface avoids depending on Media3's separately packaged XML/theme resources.
            gifFallbackView=new android.view.TextureView(this);
            gifFallbackView.setOpaque(false);
            gifFallbackView.addOnLayoutChangeListener((v,l,t,r,b,ol,ot,or,ob)->fitGifSurface());
            gifFallback.setVideoTextureView(gifFallbackView);
            gifFallbackView.setOnClickListener(v->{if(gifFallback!=null)gifFallback.setPlayWhenReady(!gifFallback.getPlayWhenReady());});
            ((FrameLayout)video.getParent()).addView(gifFallbackView,new FrameLayout.LayoutParams(-1,-1));
            toolbar.bringToFront();
            holdSpeedIndicator.bringToFront();
            gifFallback.setRepeatMode(androidx.media3.common.Player.REPEAT_MODE_ONE);
            gifFallback.addListener(new androidx.media3.common.Player.Listener(){
                @Override public void onVideoSizeChanged(androidx.media3.common.VideoSize size){
                    if(size.width>0&&size.height>0){gifAspect=size.width*size.pixelWidthHeightRatio/size.height;fitGifSurface();}
                }
                @Override public void onPlaybackStateChanged(int state){if(state==androidx.media3.common.Player.STATE_READY)setStatus("");}
                @Override public void onPlayerError(androidx.media3.common.PlaybackException error){
                    setStatus("GIF動画を再生できません。︙から外部アプリで開けます");
                    android.util.Log.w("Haiagaru","X GIF fallback failed",error);
                }
            });
            gifFallback.setMediaItem(androidx.media3.common.MediaItem.fromUri(source));
            gifFallback.seekTo(position);gifFallback.prepare();gifFallback.setPlayWhenReady(foreground&&playWhenReady);applyMute();
            toolbar.setVisibility(View.VISIBLE);setStatus("GIF動画を読み込み中…");return true;
        }catch(RuntimeException failure){android.util.Log.w("Haiagaru","Cannot initialize X GIF fallback",failure);closeGifFallback();return false;}
    }
    private void closeGifFallback(){
        if(gifFallback!=null)gifFallback.clearVideoTextureView(gifFallbackView);
        if(gifFallbackView!=null){if(gifFallbackView.getParent() instanceof android.view.ViewGroup)((android.view.ViewGroup)gifFallbackView.getParent()).removeView(gifFallbackView);gifFallbackView=null;}
        if(gifFallback!=null){gifFallback.release();gifFallback=null;}
        gifAspect=0;
    }
    private void fitGifSurface(){
        if(gifFallbackView==null||gifAspect<=0)return;
        float width=gifFallbackView.getWidth(),height=gifFallbackView.getHeight();if(width<=0||height<=0)return;
        float sx=1,sy=1;if(width/height>gifAspect)sx=height*gifAspect/width;else sy=width/gifAspect/height;
        android.graphics.Matrix matrix=new android.graphics.Matrix();matrix.setScale(sx,sy,width/2,height/2);gifFallbackView.setTransform(matrix);
    }

    View videoGestureSurface(){
        if(mediaFrame!=null&&VideoViewerSettings.prefs(this).getBoolean(VideoViewerSettings.LETTERBOX_TOUCH,true))return mediaFrame;
        return gifFallbackView!=null?gifFallbackView:video;
    }
    @Override public boolean dispatchTouchEvent(MotionEvent event) {
        View surface=videoGestureSurface();
        if(MediaViewerNavigation.onTouch(this,event,surface))return true;
        if (touchControls != null && video != null && touchControls.dispatch(event, surface)) return true;
        if (gestures != null && gestures.dispatch(event, surface)) {
            if (touchControls != null) touchControls.cancel();
            return true;
        }
        return super.dispatchTouchEvent(event);
    }
    void toggleControls() {
        if (controls == null) return;
        if (controls.isShowing()) controls.hide(); else controls.show(0);
    }
    float videoMidpoint() {
        int[] p = new int[2]; video.getLocationOnScreen(p); return p[0] + video.getWidth() / 2f;
    }
    void cancelNativeVideoGesture() { if (gestures != null) gestures.cancel(); }
    // MediaController is a separate focused window. The uncovered video still
    // receives swipes, even though the Activity itself no longer owns focus.
    boolean hasVideoGestureFocus() {
        return foreground && !isFinishing() && !isDestroyed()
                && (hasWindowFocus() || controls != null && controls.isShowing() && controls.hasWindowFocus());
    }
    private void setStatus(String message) {
        status.setText(message);
        status.setVisibility(message.isEmpty() ? View.GONE : View.VISIBLE);
    }
    void gestureStatus(String message) { setStatus(message); }
    private int playbackPosition() {
        return gifFallback != null ? (int)gifFallback.getCurrentPosition() : seeks.position(video.getCurrentPosition());
    }
    private void seekAbsolute(int target) {
        if (gifFallback != null) { gifFallback.seekTo(Math.max(0, target)); return; }
        if (!prepared || mediaPlayer == null) return;
        int duration = video.getDuration();
        target = Math.max(0, duration > 0 ? Math.min(duration - 1, target) : target);
        int next = seeks.request(target);
        if (next >= 0) issueSeek(next);
    }
    private void issueSeek(int target) {
        try {
            // VideoView.seekTo uses SEEK_PREVIOUS_SYNC: a five-second skip can land on
            // the same keyframe repeatedly. Decode to the closest frame instead.
            if (android.os.Build.VERSION.SDK_INT >= 26)
                mediaPlayer.seekTo((long)target, android.media.MediaPlayer.SEEK_CLOSEST);
            else mediaPlayer.seekTo(target);
        } catch (IllegalStateException error) { seeks.reset(); }
    }
    void seekRelative(int seconds) {
        if(gifFallback!=null){gifFallback.seekTo(VideoPlaybackMath.seekTarget((int)gifFallback.getCurrentPosition(),(int)Math.max(0,gifFallback.getDuration()),seconds));return;}
        if (!prepared || video.getDuration() <= 0) return;
        seekAbsolute(VideoPlaybackMath.seekTarget(playbackPosition(), video.getDuration(), seconds));
        setStatus(Math.abs(seconds) + (seconds < 0 ? "秒巻き戻し" : "秒早送り"));
    }
    boolean dispatchVideoTouch(MotionEvent event) { return super.dispatchTouchEvent(event); }
    boolean isVideoToolbarTouch(float x, float y) {
        if(controls instanceof HaiagaruMediaController&&((HaiagaruMediaController)controls).containsControlTouch(x,y))return true;
        return toolbar != null && toolbar.contains(x,y);
    }
    void performVideoGesture(String key) {
        if(gifFallback!=null){
            if("gestureTop".equals(key)){gifFallback.seekTo(0);return;}
            if("gestureBottom".equals(key)){gifFallback.seekTo(Math.max(0,gifFallback.getDuration()-1));return;}
            if("gestureFullScreen".equals(key)){toggleControls();return;}
        }
        switch (key) {
            case "gestureBack": case "gestureCloseTab": finish(); break;
            case "gestureTop": if (prepared) seekAbsolute(0); break;
            case "gestureBottom": if (prepared) seekAbsolute(Math.max(0, video.getDuration() - 1)); break;
            case "gestureRefresh":
                if (prepared) position = video.getCurrentPosition();
                video.stopPlayback(); playWhenReady = true; load(); break;
            case "gestureFullScreen":
                if (controls.isShowing()) controls.hide(); else controls.show(0); break;
            case "gestureSetting":
                try { startActivity(new Intent(this, Class.forName("jp.syoboi.a2chMate.activity.SettingActivity", false, getClassLoader()))); }
                catch (ReflectiveOperationException | RuntimeException error) {
                    Toast.makeText(this, "設定を開けませんでした", Toast.LENGTH_SHORT).show();
                }
                break;
            case NgEditGesture.KEY: NgEditGesture.handle(video, 0x48690042); break;
            // No next-video/forward history exists in a single-video viewer.
            case "gestureForward": Toast.makeText(this, "次の動画はありません", Toast.LENGTH_SHORT).show(); break;
            default: break;
        }
    }
    private void showMenu(View anchor) {
        controls.show(0);
        HaiagaruPopupMenu menu = new HaiagaruPopupMenu(this, anchor);
        menu.setOnDismissListener(dismissed -> {
            if (foreground) controls.show(0);
        });
        menu.getMenu().add(0, 1, 0, "外部アプリで開く");
        menu.getMenu().add(0, 2, 1, "URLをコピー");
        menu.getMenu().add(0, 3, 2, "再読み込み");
        menu.getMenu().add(0, 4, 3, "画面を回転");
        menu.getMenu().add(0, 5, 4, "操作設定");
        menu.getMenu().add(0, 6, 5, "動画を保存");
        menu.setOnMenuItemClickListener(item -> {
            switch (item.getItemId()) {
                case 1:
                    pausePlayback();
                    try {
                        // Extension calls are excluded from the patch's launch interception.
                        Intent external = new Intent(Intent.ACTION_VIEW).setDataAndType(Uri.parse(url), "video/mp4");
                        startActivity(Intent.createChooser(external, "動画を外部アプリで開く"));
                    } catch (RuntimeException error) {
                        Toast.makeText(this, "動画を開ける外部アプリがありません", Toast.LENGTH_LONG).show();
                    }
                    return true;
                case 2:
                    ClipboardManager clipboard = (ClipboardManager)getSystemService(CLIPBOARD_SERVICE);
                    if (clipboard != null) clipboard.setPrimaryClip(ClipData.newPlainText("動画URL", url));
                    Toast.makeText(this, "URLをコピーしました", Toast.LENGTH_SHORT).show(); return true;
                case 3:
                    if (prepared) position = video.getCurrentPosition();
                    video.stopPlayback(); playWhenReady = true; load(); return true;
                case 4:
                    rotated = !rotated;
                    setRequestedOrientation(rotated ? ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE
                            : ActivityInfo.SCREEN_ORIENTATION_UNSPECIFIED); return true;
                case 5: VideoViewerSettings.show(this); return true;
                case 6: VideoDownloads.confirm(this, url, this::saveVideo); return true;
                default: return false;
            }
        });
        menu.show();
    }
    private void saveVideo() {
        if (savePermissionPending) return;
        if (VideoDownloads.needsStoragePermission(this)) {
            savePermissionPending = true;
            requestPermissions(new String[]{android.Manifest.permission.WRITE_EXTERNAL_STORAGE}, VideoDownloads.REQUEST_STORAGE);
        } else VideoDownloads.enqueue(this, url);
    }
    @Override public void onRequestPermissionsResult(int request, String[] permissions, int[] results) {
        super.onRequestPermissionsResult(request, permissions, results);
        if (request != VideoDownloads.REQUEST_STORAGE || !savePermissionPending) return;
        savePermissionPending = false;
        if (results.length > 0 && results[0] == android.content.pm.PackageManager.PERMISSION_GRANTED)
            VideoDownloads.enqueue(this, url);
        else VideoDownloads.message(this, "動画を保存するには保存先へのアクセス許可が必要です");
    }
    private void pausePlayback() {
        if(gifFallback!=null){position=(int)gifFallback.getCurrentPosition();gifFallback.pause();}
        if (prepared) {
            position = video.getCurrentPosition();
            playWhenReady = video.isPlaying();
            video.pause();
        }
    }
    @Override protected void onResume() {
        super.onResume(); foreground = true;
        if (video != null) gestures = new VideoViewerGestures(this);
        if (prepared && playWhenReady) video.start();
        if (gifFallback != null && playWhenReady) gifFallback.play();
    }
    @Override protected void onPause() {
        if (touchControls != null) touchControls.cancel();
        foreground = false; pausePlayback();
        // Returning from another app should resume only on the user's play action.
        playWhenReady = false;
        if (gestures != null) gestures.close();
        if (controls != null) controls.hide();
        super.onPause();
    }
    @Override protected void onSaveInstanceState(Bundle state) {
        state.putInt("position", prepared ? video.getCurrentPosition() : position);
        if(gifFallback!=null)state.putInt("position",(int)gifFallback.getCurrentPosition());
        state.putBoolean("playing", prepared ? video.isPlaying() : playWhenReady);
        state.putBoolean("savePermissionPending", savePermissionPending);
        state.putFloat("playbackSpeed", holdSpeedActive ? speedBeforeHold : playbackSpeed);
        state.putBoolean("muted",muted);
        state.putBoolean("rotated", rotated); super.onSaveInstanceState(state);
    }
    @Override protected void onDestroy() {
        closeGifFallback();
        if (unregisterBack != null) { unregisterBack.run(); unregisterBack = null; }
        if (touchControls != null) touchControls.cancel();
        if (gestures != null) gestures.close();
        if (controls != null) controls.hide();
        if (video != null) video.stopPlayback();
        mediaPlayer = null;
        super.onDestroy();
    }
    @Override public void onBackPressed() { finish(); }
}
