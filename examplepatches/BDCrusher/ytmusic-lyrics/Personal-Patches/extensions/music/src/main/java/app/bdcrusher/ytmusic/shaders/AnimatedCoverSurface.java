/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.shaders;

import android.content.Context;
import android.graphics.Matrix;
import android.graphics.SurfaceTexture;
import android.media.MediaPlayer;
import android.view.MotionEvent;
import android.view.Surface;
import android.view.TextureView;
import android.widget.FrameLayout;
import app.bdcrusher.ytmusic.common.FeatureDiagnostics;

/** One native, silent looping decoder. State/layout updates never reload the same file. */
final class AnimatedCoverSurface extends FrameLayout implements TextureView.SurfaceTextureListener {
    private final TextureView texture;
    private MediaPlayer player;
    private Surface output;
    private String file;
    private long sampledAt;
    private boolean readbackLimited;
    private String loadedPath = "";
    private boolean visible, playing, reduced, prepared, rendered, closed;
    private int videoWidth, videoHeight;

    AnimatedCoverSurface(Context context) {
        super(context);
        setClickable(false);
        setFocusable(false);
        setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_NO_HIDE_DESCENDANTS);
        texture = new TextureView(context);
        texture.setOpaque(false);
        texture.setAlpha(0);
        texture.setSurfaceTextureListener(this);
        addView(texture, new LayoutParams(-1, -1));
    }

    void update(String next, boolean shown, boolean active, boolean reduceMotion) {
        if (closed) return;
        file = next;
        visible = shown;
        playing = active;
        reduced = reduceMotion;
        String path = next == null ? "" : next;
        if (!path.equals(loadedPath)) releasePlayer();
        if (!visible) {
            pause();
            return;
        }
        if (player == null && next != null && texture.isAvailable()) prepare();
        syncPlayback();
    }

    private void prepare() {
        if (closed || player != null || file == null || !visible || !texture.isAvailable()) return;
        MediaPlayer next = new MediaPlayer();
        player = next;
        loadedPath = file;
        try {
            output = new Surface(texture.getSurfaceTexture());
            next.setSurface(output);
            next.setOnVideoSizeChangedListener((p, width, height) -> {
                if (p != player || closed) return;
                videoWidth = width;
                videoHeight = height;
                fit();
            });
            next.setOnPreparedListener(p -> {
                if (p != player || closed) return;
                prepared = true;FeatureDiagnostics.event("Cover-decoder","Stream prepared; one muted decoder");
                p.setVolume(0, 0);
                p.setLooping(true);
                syncPlayback();
            });
            next.setOnInfoListener((p, what, extra) -> {
                if (p == player && what == MediaPlayer.MEDIA_INFO_VIDEO_RENDERING_START) firstFrame();
                return false;
            });
            next.setOnErrorListener((p, what, extra) -> {
                if (p == player) {
                    releasePlayer();
                    FeatureDiagnostics.record("Cover-decoder","Native error what="+what+" extra="+extra+"; still artwork retained");ShaderRuntime.mediaFailed();
                }
                return true; // Native still artwork stays visible; no platform error dialog.
            });
            if(!ArtworkRepository.validMedia(loadedPath))throw new java.io.IOException("Unsupported artwork URL");
            next.setDataSource(getContext(),android.net.Uri.parse(loadedPath),java.util.Map.of("Cache-Control","no-store"));
            next.prepareAsync();
        } catch (Exception unavailable) {
            releasePlayer();
            FeatureDiagnostics.record("Cover-decoder","Native playback failed; still artwork retained");ShaderRuntime.mediaFailed();
        }
    }

    private void syncPlayback() {
        if (!prepared || player == null) return;
        try {
            // Prime one decoded frame for paused/reduced-motion artwork, then freeze.
            boolean run = visible && ((!rendered) || (playing && !reduced));
            if (run && !player.isPlaying()) player.start();
            else if (!run && player.isPlaying()) player.pause();
        } catch (IllegalStateException ignored) { releasePlayer(); }
    }

    private void firstFrame() {
        if (closed || !prepared || rendered) return;
        rendered = true;FeatureDiagnostics.event("Cover-decoder","First decoded animation frame visible");
        texture.setAlpha(1);
        sampleFrame(true);
        syncPlayback();
    }

    private void sampleFrame(boolean first){
        long now=android.os.SystemClock.elapsedRealtime();if(!visible||!rendered||!ShaderRuntime.wantsAnimatedFrame()||!first&&(readbackLimited||reduced||!playing||now-sampledAt<250))return;sampledAt=now;try{long began=android.os.SystemClock.elapsedRealtime();android.graphics.Bitmap bitmap=texture.getBitmap(208,117);long cost=android.os.SystemClock.elapsedRealtime()-began;if(cost>4){readbackLimited=true;FeatureDiagnostics.event("Cover-readback","readbackMs="+cost+"; retaining this frame for Kawarp to protect native animation");}if(bitmap!=null)ShaderRuntime.animatedFrame(bitmap);}catch(Exception e){readbackLimited=true;FeatureDiagnostics.event("Cover-frame","Frame sampling unavailable; native still artwork retained");}
    }
    private void pause() {
        if (prepared && player != null) try {
            if (player.isPlaying()) player.pause();
        } catch (IllegalStateException ignored) { releasePlayer(); }
    }

    private void fit() {
        int width = texture.getWidth(), height = texture.getHeight();
        if (width <= 0 || height <= 0 || videoWidth <= 0 || videoHeight <= 0) return;
        // Show the complete animation within the native artwork slot, without cropping.
        float scale = Math.min((float) width / videoWidth, (float) height / videoHeight);
        Matrix transform = new Matrix();
        transform.setScale(videoWidth * scale / width, videoHeight * scale / height,
                width / 2f, height / 2f);
        texture.setTransform(transform);
    }

    private void releasePlayer() {
        MediaPlayer old = player;
        player = null;
        prepared = rendered = false;
        readbackLimited = false;
        loadedPath = "";
        texture.setAlpha(0);
        if (old != null) {
            old.setOnPreparedListener(null);
            old.setOnInfoListener(null);
            old.setOnErrorListener(null);
            old.setOnVideoSizeChangedListener(null);
            old.release();
        }
        if (output != null) { output.release(); output = null; }
    }

    void closeSurface() {
        if (closed) return;
        closed = true;
        releasePlayer();
        texture.setSurfaceTextureListener(null);
    }

    @Override protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        fit();
    }
    @Override public boolean onTouchEvent(MotionEvent event) { return false; }
    @Override public void onSurfaceTextureAvailable(SurfaceTexture value, int w, int h) { prepare(); }
    @Override public void onSurfaceTextureSizeChanged(SurfaceTexture value, int w, int h) { fit(); }
    @Override public boolean onSurfaceTextureDestroyed(SurfaceTexture value) { releasePlayer(); return true; }
    @Override public void onSurfaceTextureUpdated(SurfaceTexture value) { if (!rendered) firstFrame();else sampleFrame(false); }
}
