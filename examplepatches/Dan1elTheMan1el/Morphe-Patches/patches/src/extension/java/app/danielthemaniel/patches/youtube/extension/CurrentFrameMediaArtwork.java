package app.danielthemaniel.patches.youtube.extension;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.SurfaceTexture;
import android.media.MediaMetadata;
import android.media.session.MediaSession;
import android.media.session.PlaybackState;
import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLSurface;
import android.opengl.GLES11Ext;
import android.opengl.GLES20;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import android.util.Log;
import android.view.PixelCopy;
import android.view.Surface;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.util.function.Consumer;

/**
 * Periodically replaces the media-session artwork with a frame of the playing
 * video, including
 * while the screen is off, and can blank the media title and subtitle.
 *
 * <p>
 * Threading model:
 * <ul>
 * <li>Main thread: scheduling, view lookup, button and menu UI, and the final
 * setMetadata call
 * (so it is serialized with YouTube's own setMetadata calls).</li>
 * <li>Worker thread: PixelCopy callbacks and artwork composition.</li>
 * <li>GL thread: receives decoded frames from the player while the app is
 * hidden and reads
 * back a small downscaled copy.</li>
 * </ul>
 *
 * <p>
 * This class must be compiled against the Android SDK (android.jar) but kept
 * out of the patch
 * jar, because the patcher loads that jar on a desktop JVM without Android
 * classes. Only the
 * Morphe classes (AddOnApi, PlayerOverlayButton) are reached through
 * reflection, because they
 * live in the patched app and are not available at compile time.
 */
public final class CurrentFrameMediaArtwork {
    private static final String TAG = "CurrentFrameArtwork";

    private static final String ADD_ON_API = "app.morphe.extension.youtube.addon.AddOnApi";
    private static final String PLAYER_OVERLAY_BUTTON = "app.morphe.extension.youtube.videoplayer.PlayerOverlayButton";

    private static final int[] FPS_OPTIONS = { 1, 2, 5, 15, 30, 60 };
    private static final int[] QUALITIES = { 360, 480, 720, 1080 };

    private static final String PREFS_NAME = "current_frame_artwork";
    private static final String KEY_ENABLED = "enabled";
    private static final String KEY_FPS = "fps";
    private static final String KEY_QUALITY = "quality";
    private static final String KEY_SQUARE = "square";
    private static final String KEY_BACKGROUND = "background_frames";
    private static final String KEY_HIDE_TEXT = "hide_text";

    /**
     * Media controls treat an empty or whitespace-only title as missing and
     * substitute their own
     * text ("<app> is running"), so "blank" is a zero-width space, which is not
     * whitespace.
     */
    private static final String BLANK_TEXT = "\u200B";
    private static final String[] TEXT_KEYS = {
            MediaMetadata.METADATA_KEY_TITLE,
            MediaMetadata.METADATA_KEY_DISPLAY_TITLE,
            MediaMetadata.METADATA_KEY_ARTIST,
            MediaMetadata.METADATA_KEY_DISPLAY_SUBTITLE,
            MediaMetadata.METADATA_KEY_ALBUM,
            MediaMetadata.METADATA_KEY_ALBUM_ARTIST,
            MediaMetadata.METADATA_KEY_DISPLAY_DESCRIPTION,
    };

    /** Ticks without a usable video surface before the loop stops itself. */
    private static final int MAX_SURFACE_MISSES = 5;
    /** A PixelCopy that never calls back must not block capturing forever. */
    private static final long PIXEL_COPY_TIMEOUT_MS = 3000L;

    // Settings (written on the main thread, read on worker threads).
    private static volatile boolean captureEnabled = true;
    private static volatile int fps = 1;
    private static volatile int quality = 360;
    private static volatile boolean squareArtwork;
    /**
     * Keep receiving real video frames while the app is hidden or the screen is
     * off.
     */
    private static volatile boolean backgroundFrames = true;
    /** Replace the media title and subtitle with blank text. */
    private static volatile boolean hideText;
    /**
     * Whether the patch managed to apply the background-frame hooks to this YouTube
     * version. Those
     * hooks target obfuscated code and are applied all-or-nothing, so on a version
     * where they could
     * not be matched the rest of the feature still works and the background option
     * is hidden.
     * Set when the first of those hooks runs, since only the patched code ever
     * calls them.
     */
    private static volatile boolean backgroundSupported;

    // The newest frame we published and the YouTube metadata it belongs to (main
    // thread only).
    private static Bitmap lastArtwork;
    private static MediaMetadata lastArtworkBase;

    /**
     * Read by the patched player code (smali sget-object) whenever the video view
     * has no
     * surface of its own. Null reproduces the original behavior; a non-null value
     * makes the
     * player keep rendering into {@link FallbackSurface} instead of dropping the
     * output.
     */
    public static volatile Surface backgroundSurface;

    // Latest session and metadata seen by the setMetadata hook (any thread writes).
    private static volatile MediaSession session;
    private static volatile MediaMetadata metadata;

    // Capture bookkeeping (any thread).
    private static volatile boolean captureInFlight;
    private static volatile long captureStartedAt;

    private static final Handler mainHandler = new Handler(Looper.getMainLooper());
    private static Handler workerHandler; // guarded by class lock

    // Main thread only, except that scheduled is read from the GL thread.
    private static volatile boolean scheduled;
    private static int surfaceMisses;
    private static boolean lifecycleRegistered;
    private static WeakReference<View> surfaceRef = new WeakReference<>(null);
    private static WeakReference<Activity> activityRef = new WeakReference<>(null);
    private static WeakReference<TextView> buttonRef = new WeakReference<>(null);
    private static Method addButtonMethod;

    private CurrentFrameMediaArtwork() {
    }

    // ---------------------------------------------------------------------------------------
    // Injection points
    // ---------------------------------------------------------------------------------------

    /**
     * Injection point: called before every MediaSession.setMetadata call in the
     * app.
     */
    public static void onMetadata(MediaSession mediaSession, MediaMetadata mediaMetadata) {
        session = mediaSession;
        metadata = mediaMetadata;
        if (mediaSession != null && mediaMetadata != null) {
            // This hook runs just before YouTube's own setMetadata call. Republish right
            // after it
            // so a new title or thumbnail does not stay visible until the next frame is
            // captured.
            mainHandler.post(REPUBLISH);
            requestStart();
        }
    }

    /**
     * Injection point: called with the foreground flag the app passes to its player
     * engine.
     * While background frames are enabled, the engine is told it is still in the
     * foreground, so
     * it does not start its background handling (delayed pause timers and the
     * native fetch
     * controller's "app entered background" notification).
     */
    public static boolean engineForeground(boolean foreground) {
        markBackgroundSupported();
        return foreground || (backgroundFrames && captureEnabled);
    }

    /**
     * Injection point: the player's track selection is told whether a video view
     * exists. With the
     * activity stopped the view is detached, and the selector then drops the video
     * track and
     * disables the video renderer. While background frames are enabled, report that
     * a view exists
     * so video keeps being selected and decoded (into the fallback surface).
     */
    public static boolean hasVideoView(boolean hasView) {
        markBackgroundSupported();
        return hasView || (backgroundFrames && captureEnabled);
    }

    /**
     * Called from the background hooks, which only exist when the patch applied
     * them.
     */
    private static void markBackgroundSupported() {
        if (backgroundSupported)
            return;
        backgroundSupported = true;
        updateBackgroundSurface(); // starts the off-screen surface now that it is known to be used
    }

    /**
     * Injection point: called from AddOnManager.registerAddOns(). Subscribes to
     * Morphe's
     * player overlay button hook, which hands us the fullscreen button as a layout
     * anchor.
     */
    public static void register() {
        loadPrefs(findApplicationContext());
        updateBackgroundSurface();
        try {
            Class.forName(ADD_ON_API)
                    .getMethod("addPlayerOverlayButtonsListener", Consumer.class)
                    .invoke(null, new Consumer<View>() {
                        @Override
                        public void accept(View sourceButton) {
                            onPlayerOverlayButtons(sourceButton);
                        }
                    });
        } catch (ReflectiveOperationException | RuntimeException ex) {
            Log.w(TAG, "Could not register overlay button listener", ex);
        }
    }

    // ---------------------------------------------------------------------------------------
    // Metadata
    // ---------------------------------------------------------------------------------------

    private static final Runnable REPUBLISH = new Runnable() {
        @Override
        public void run() {
            republishNow(false);
        }
    };

    /**
     * Publishes the current YouTube metadata with our changes (blank text, and the
     * newest frame
     * if it belongs to the same track). Without force, does nothing when there is
     * nothing to
     * change.
     */
    private static void republishNow(boolean force) {
        final MediaSession currentSession = session;
        final MediaMetadata current = metadata;
        if (currentSession == null || current == null)
            return;

        final Bitmap artwork = captureEnabled && lastArtwork != null && lastArtworkBase != null
                && sameTrack(current, lastArtworkBase) ? lastArtwork : null;
        final MediaMetadata decorated = decorate(current, artwork);
        // force: a setting just changed, so what is currently showing may be stale (for
        // example a
        // blanked title that must be put back) even though the result equals YouTube's
        // metadata.
        if (decorated == current && !force)
            return;

        try {
            currentSession.setMetadata(decorated);
        } catch (RuntimeException ex) {
            Log.w(TAG, "Could not republish metadata", ex);
        }
    }

    /**
     * Returns the metadata to publish: the base with the artwork put on it, if any,
     * and the text
     * blanked, if enabled. Returns the base object itself when nothing changes.
     */
    private static MediaMetadata decorate(MediaMetadata base, Bitmap artwork) {
        final boolean blank = hideText;
        if (artwork == null && !blank)
            return base;

        MediaMetadata.Builder builder = new MediaMetadata.Builder(base);
        if (artwork != null) {
            builder.putBitmap(MediaMetadata.METADATA_KEY_ART, artwork);
            builder.putBitmap(MediaMetadata.METADATA_KEY_ALBUM_ART, artwork);
        }
        if (blank) {
            for (String key : TEXT_KEYS) {
                builder.putString(key, BLANK_TEXT);
            }
        }
        return builder.build();
    }

    private static boolean sameTrack(MediaMetadata a, MediaMetadata b) {
        return equalsNullable(a.getString(MediaMetadata.METADATA_KEY_MEDIA_ID),
                b.getString(MediaMetadata.METADATA_KEY_MEDIA_ID))
                && equalsNullable(a.getString(MediaMetadata.METADATA_KEY_TITLE),
                        b.getString(MediaMetadata.METADATA_KEY_TITLE));
    }

    private static boolean equalsNullable(String a, String b) {
        return a == null ? b == null : a.equals(b);
    }

    // ---------------------------------------------------------------------------------------
    // Capture loop
    // ---------------------------------------------------------------------------------------

    private static void requestStart() {
        mainHandler.post(START);
    }

    private static final Runnable START = new Runnable() {
        @Override
        public void run() {
            surfaceMisses = 0;
            if (!captureEnabled || scheduled)
                return;
            scheduled = true;
            mainHandler.post(TICK);
        }
    };

    private static final Runnable TICK = new Runnable() {
        @Override
        public void run() {
            boolean again;
            try {
                again = tick();
            } catch (RuntimeException ex) {
                Log.w(TAG, "Capture tick failed", ex);
                again = false;
            }
            if (again && captureEnabled) {
                mainHandler.postDelayed(this, 1000L / fps);
            } else {
                scheduled = false;
            }
        }
    };

    /** @return true to keep the loop running. */
    private static boolean tick() {
        final MediaSession currentSession = session;
        final MediaMetadata currentMetadata = metadata;
        if (!captureEnabled || currentSession == null || currentMetadata == null) {
            return false;
        }

        final View surface = findVideoSurface();
        // No visible video view (screen off or app hidden): use the frames the player
        // renders
        // into our off-screen surface, if it is still producing any.
        final boolean useFallback = surface == null && backgroundFrames
                && FallbackSurface.hasFrame();
        if (surface == null && !useFallback) {
            // Layout not ready yet or nothing is rendering. Give it a few ticks, then stop.
            // The
            // loop restarts on activity resume, new metadata, controls inflation, or the
            // next
            // fallback frame.
            return ++surfaceMisses <= MAX_SURFACE_MISSES;
        }
        surfaceMisses = 0;

        // The session can report PAUSED while audio plays in the background. On the
        // fallback
        // path, fresh frames already prove video is playing, so only gate the real
        // surface.
        if (!useFallback && !isPlaying(currentSession)) {
            return true; // Keep a cheap poll alive so playback resuming is picked up.
        }

        if (captureInFlight) {
            if (SystemClock.elapsedRealtime() - captureStartedAt < PIXEL_COPY_TIMEOUT_MS) {
                return true;
            }
            captureInFlight = false;
        }

        if (useFallback) {
            captureFromFallback(currentSession, currentMetadata);
        } else {
            capture(surface, currentSession, currentMetadata);
        }
        return true;
    }

    private static boolean isPlaying(MediaSession mediaSession) {
        try {
            PlaybackState state = mediaSession.getController().getPlaybackState();
            return state == null || state.getState() == PlaybackState.STATE_PLAYING;
        } catch (RuntimeException ex) {
            return true;
        }
    }

    /** Captures a frame from the visible video view. */
    private static void capture(View surface, MediaSession currentSession,
            MediaMetadata baseMetadata) {
        int width = surface.getWidth();
        int height = surface.getHeight();
        FallbackSurface.aspect = (float) width / height;
        final int longest = Math.max(width, height);
        final int target = quality;
        if (longest > target) {
            width = Math.max(1, width * target / longest);
            height = Math.max(1, height * target / longest);
        }

        final Bitmap frame = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);

        if (surface instanceof SurfaceView) {
            captureInFlight = true;
            captureStartedAt = SystemClock.elapsedRealtime();
            try {
                PixelCopy.request((SurfaceView) surface, frame,
                        new FrameListener(frame, currentSession, baseMetadata),
                        getWorkerHandler());
            } catch (IllegalArgumentException ex) {
                // Surface became invalid between the check and the request.
                captureInFlight = false;
                surfaceRef = new WeakReference<>(null);
            }
        } else if (surface instanceof TextureView) {
            // Scaled readback into a small bitmap; cheap enough for the main thread.
            if (((TextureView) surface).getBitmap(frame) != null) {
                getWorkerHandler().post(new Runnable() {
                    @Override
                    public void run() {
                        processFrame(frame, currentSession, baseMetadata);
                    }
                });
            }
        }
    }

    private static final class FrameListener implements PixelCopy.OnPixelCopyFinishedListener {
        private final Bitmap frame;
        private final MediaSession frameSession;
        private final MediaMetadata baseMetadata;

        FrameListener(Bitmap frame, MediaSession frameSession, MediaMetadata baseMetadata) {
            this.frame = frame;
            this.frameSession = frameSession;
            this.baseMetadata = baseMetadata;
        }

        @Override
        public void onPixelCopyFinished(int result) {
            try {
                if (result == PixelCopy.SUCCESS) {
                    processFrame(frame, frameSession, baseMetadata);
                }
            } catch (RuntimeException ex) {
                Log.w(TAG, "Frame processing failed", ex);
            } finally {
                captureInFlight = false;
            }
        }
    }

    /**
     * Captures a frame from the off-screen surface the player renders into while
     * hidden.
     */
    private static void captureFromFallback(final MediaSession currentSession,
            final MediaMetadata baseMetadata) {
        captureInFlight = true;
        captureStartedAt = SystemClock.elapsedRealtime();
        FallbackSurface.requestBitmap(quality, new Consumer<Bitmap>() {
            @Override
            public void accept(Bitmap frame) {
                try {
                    if (frame != null)
                        processFrame(frame, currentSession, baseMetadata);
                } catch (RuntimeException ex) {
                    Log.w(TAG, "Fallback frame processing failed", ex);
                } finally {
                    captureInFlight = false;
                }
            }
        });
    }

    /** Starts or disables the fallback surface according to the current setting. */
    private static void updateBackgroundSurface() {
        if (backgroundSupported && backgroundFrames) {
            FallbackSurface.ensureStarted(); // async; publishes backgroundSurface when ready
        } else {
            backgroundSurface = null;
        }
    }

    /** Runs on a worker thread. */
    private static void processFrame(Bitmap frame, final MediaSession targetSession,
            final MediaMetadata baseMetadata) {
        final Bitmap artwork = squareArtwork ? toSquare(frame) : frame;

        // Apply on the main thread so this is ordered against YouTube's own setMetadata
        // calls.
        // If YouTube published newer metadata for the same track while we were
        // capturing
        // (it may re-send it often in the background), put our frame on that newer
        // metadata.
        // If it is a different track, drop the frame rather than overwrite the new
        // title.
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                if (!captureEnabled || session != targetSession)
                    return;

                final MediaMetadata current = metadata;
                final MediaMetadata target;
                if (current == baseMetadata) {
                    target = baseMetadata;
                } else if (current != null && sameTrack(current, baseMetadata)) {
                    target = current;
                } else {
                    return;
                }

                try {
                    targetSession.setMetadata(decorate(target, artwork));
                    lastArtwork = artwork;
                    lastArtworkBase = baseMetadata;
                } catch (RuntimeException ex) {
                    Log.w(TAG, "Could not publish artwork", ex);
                }
            }
        });
    }

    private static Bitmap toSquare(Bitmap frame) {
        final int width = frame.getWidth();
        final int height = frame.getHeight();
        final int side = Math.max(width, height);
        Bitmap square = Bitmap.createBitmap(side, side, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(square);
        canvas.drawColor(Color.BLACK);
        canvas.drawBitmap(frame, (side - width) / 2f, (side - height) / 2f, null);
        return square;
    }

    private static synchronized Handler getWorkerHandler() {
        if (workerHandler == null) {
            HandlerThread thread = new HandlerThread(TAG, Process.THREAD_PRIORITY_BACKGROUND);
            thread.start();
            workerHandler = new Handler(thread.getLooper());
        }
        return workerHandler;
    }

    // ---------------------------------------------------------------------------------------
    // Off-screen surface that keeps receiving decoded frames while the app is
    // hidden.
    //
    // Decoder output is consumed on the GPU (SurfaceTexture + GLES) and only a
    // small,
    // downscaled copy is read back. Reading decoder buffers on the CPU (ImageReader
    // planes)
    // is not safe: on some devices the buffers are not CPU-mappable and the runtime
    // aborts.
    // ---------------------------------------------------------------------------------------

    private static final class FallbackSurface {
        private static final int HINT_WIDTH = 1280;
        private static final int HINT_HEIGHT = 720;
        private static final long FRAME_FRESH_MS = 3000L;

        private static final String VERTEX_SHADER = "attribute vec4 aPosition;\n"
                + "attribute vec4 aTexCoord;\n"
                + "uniform mat4 uTexMatrix;\n"
                + "varying vec2 vTexCoord;\n"
                + "void main() {\n"
                // Flip vertically so glReadPixels (bottom row first) yields a
                // top-row-first image that can be copied straight into a Bitmap.
                + "  gl_Position = vec4(aPosition.x, -aPosition.y, 0.0, 1.0);\n"
                + "  vTexCoord = (uTexMatrix * aTexCoord).xy;\n"
                + "}\n";
        private static final String FRAGMENT_SHADER = "#extension GL_OES_EGL_image_external : require\n"
                + "precision mediump float;\n"
                + "varying vec2 vTexCoord;\n"
                + "uniform samplerExternalOES uTexture;\n"
                + "void main() {\n"
                + "  gl_FragColor = texture2D(uTexture, vTexCoord);\n"
                + "}\n";
        // x, y, u, v per vertex (triangle strip).
        private static final float[] QUAD = {
                -1f, -1f, 0f, 0f,
                1f, -1f, 1f, 0f,
                -1f, 1f, 0f, 1f,
                1f, 1f, 1f, 1f,
        };

        /**
         * Aspect ratio (width / height) of the video; updated from the visible view.
         */
        static volatile float aspect = 16f / 9f;

        private static Handler glHandler; // guarded by class lock
        private static Surface surface; // guarded by class lock
        private static volatile long lastFrameAt; // elapsedRealtime of the newest frame
        private static boolean loggedUpdateFailure; // GL thread only

        // Everything below is only touched on the GL thread.
        private static boolean glReady;
        private static SurfaceTexture surfaceTexture;
        private static EGLDisplay eglDisplay = EGL14.EGL_NO_DISPLAY;
        private static EGLContext eglContext = EGL14.EGL_NO_CONTEXT;
        private static EGLSurface eglSurface = EGL14.EGL_NO_SURFACE;
        private static int program;
        private static int positionLocation;
        private static int texCoordLocation;
        private static int texMatrixLocation;
        private static int textureLocation;
        private static int oesTexture;
        private static int framebuffer;
        private static int framebufferTexture;
        private static int framebufferWidth;
        private static int framebufferHeight;
        private static ByteBuffer pixels;
        private static FloatBuffer vertexBuffer;
        private static final float[] texMatrix = new float[16];
        private static long frameSerial;
        private static long renderedSerial;

        /**
         * Creates the GL thread and surface once; later calls just republish the
         * surface.
         */
        static synchronized void ensureStarted() {
            if (surface != null) {
                if (backgroundFrames)
                    backgroundSurface = surface;
                return;
            }
            if (glHandler != null)
                return; // initialization already in progress

            HandlerThread thread = new HandlerThread("CurrentFrameGL",
                    Process.THREAD_PRIORITY_BACKGROUND);
            thread.start();
            glHandler = new Handler(thread.getLooper());
            glHandler.post(new Runnable() {
                @Override
                public void run() {
                    try {
                        initGl();
                    } catch (RuntimeException ex) {
                        Log.w(TAG, "Could not initialize the fallback renderer", ex);
                        glReady = false;
                    }
                }
            });
        }

        /**
         * True when the player has rendered a frame into the fallback surface recently.
         */
        static boolean hasFrame() {
            return glReady && SystemClock.elapsedRealtime() - lastFrameAt < FRAME_FRESH_MS;
        }

        /**
         * Renders the newest frame, downscaled so its longest side is at most maxSide,
         * and
         * passes it to the callback on the GL thread. The callback always runs; the
         * bitmap is
         * null when there is no new frame or rendering failed.
         */
        static void requestBitmap(final int maxSide, final Consumer<Bitmap> callback) {
            final Handler handler;
            synchronized (FallbackSurface.class) {
                handler = glHandler;
            }
            if (handler == null) {
                callback.accept(null);
                return;
            }
            handler.post(new Runnable() {
                @Override
                public void run() {
                    Bitmap bitmap = null;
                    try {
                        bitmap = renderFrame(maxSide);
                    } catch (RuntimeException ex) {
                        Log.w(TAG, "Fallback render failed", ex);
                    }
                    callback.accept(bitmap);
                }
            });
        }

        // ----- GL thread -----

        private static void initGl() {
            eglDisplay = EGL14.eglGetDisplay(EGL14.EGL_DEFAULT_DISPLAY);
            if (eglDisplay == EGL14.EGL_NO_DISPLAY)
                throw new IllegalStateException("No EGL display");
            int[] version = new int[2];
            if (!EGL14.eglInitialize(eglDisplay, version, 0, version, 1)) {
                throw new IllegalStateException("eglInitialize failed");
            }

            int[] configAttributes = {
                    EGL14.EGL_RED_SIZE, 8,
                    EGL14.EGL_GREEN_SIZE, 8,
                    EGL14.EGL_BLUE_SIZE, 8,
                    EGL14.EGL_ALPHA_SIZE, 8,
                    EGL14.EGL_RENDERABLE_TYPE, EGL14.EGL_OPENGL_ES2_BIT,
                    EGL14.EGL_SURFACE_TYPE, EGL14.EGL_PBUFFER_BIT,
                    EGL14.EGL_NONE,
            };
            EGLConfig[] configs = new EGLConfig[1];
            int[] configCount = new int[1];
            if (!EGL14.eglChooseConfig(eglDisplay, configAttributes, 0, configs, 0, 1,
                    configCount, 0) || configCount[0] < 1) {
                throw new IllegalStateException("No suitable EGL config");
            }

            int[] contextAttributes = { EGL14.EGL_CONTEXT_CLIENT_VERSION, 2, EGL14.EGL_NONE };
            eglContext = EGL14.eglCreateContext(eglDisplay, configs[0], EGL14.EGL_NO_CONTEXT,
                    contextAttributes, 0);
            if (eglContext == EGL14.EGL_NO_CONTEXT)
                throw new IllegalStateException("No EGL context");

            int[] surfaceAttributes = { EGL14.EGL_WIDTH, 1, EGL14.EGL_HEIGHT, 1, EGL14.EGL_NONE };
            eglSurface = EGL14.eglCreatePbufferSurface(eglDisplay, configs[0], surfaceAttributes, 0);
            if (eglSurface == EGL14.EGL_NO_SURFACE)
                throw new IllegalStateException("No EGL surface");

            if (!EGL14.eglMakeCurrent(eglDisplay, eglSurface, eglSurface, eglContext)) {
                throw new IllegalStateException("eglMakeCurrent failed");
            }

            program = linkProgram(VERTEX_SHADER, FRAGMENT_SHADER);
            positionLocation = GLES20.glGetAttribLocation(program, "aPosition");
            texCoordLocation = GLES20.glGetAttribLocation(program, "aTexCoord");
            texMatrixLocation = GLES20.glGetUniformLocation(program, "uTexMatrix");
            textureLocation = GLES20.glGetUniformLocation(program, "uTexture");

            vertexBuffer = ByteBuffer.allocateDirect(QUAD.length * 4)
                    .order(ByteOrder.nativeOrder()).asFloatBuffer();
            vertexBuffer.put(QUAD);

            int[] textures = new int[1];
            GLES20.glGenTextures(1, textures, 0);
            oesTexture = textures[0];
            GLES20.glBindTexture(GLES11Ext.GL_TEXTURE_EXTERNAL_OES, oesTexture);
            GLES20.glTexParameteri(GLES11Ext.GL_TEXTURE_EXTERNAL_OES,
                    GLES20.GL_TEXTURE_MIN_FILTER, GLES20.GL_LINEAR);
            GLES20.glTexParameteri(GLES11Ext.GL_TEXTURE_EXTERNAL_OES,
                    GLES20.GL_TEXTURE_MAG_FILTER, GLES20.GL_LINEAR);
            GLES20.glTexParameteri(GLES11Ext.GL_TEXTURE_EXTERNAL_OES,
                    GLES20.GL_TEXTURE_WRAP_S, GLES20.GL_CLAMP_TO_EDGE);
            GLES20.glTexParameteri(GLES11Ext.GL_TEXTURE_EXTERNAL_OES,
                    GLES20.GL_TEXTURE_WRAP_T, GLES20.GL_CLAMP_TO_EDGE);

            Handler handler;
            synchronized (FallbackSurface.class) {
                handler = glHandler;
            }
            surfaceTexture = new SurfaceTexture(oesTexture);
            surfaceTexture.setDefaultBufferSize(HINT_WIDTH, HINT_HEIGHT);
            // Frames must be latched as they arrive so the producer never stalls.
            surfaceTexture.setOnFrameAvailableListener(new SurfaceTexture.OnFrameAvailableListener() {
                @Override
                public void onFrameAvailable(SurfaceTexture texture) {
                    onFrame(texture);
                }
            }, handler);

            glReady = true;
            synchronized (FallbackSurface.class) {
                surface = new Surface(surfaceTexture);
                if (backgroundFrames)
                    backgroundSurface = surface;
            }
        }

        private static void onFrame(SurfaceTexture texture) {
            try {
                texture.updateTexImage();
                texture.getTransformMatrix(texMatrix);
            } catch (RuntimeException ex) {
                if (!loggedUpdateFailure) {
                    loggedUpdateFailure = true;
                    Log.w(TAG, "updateTexImage failed", ex);
                }
                return;
            }
            frameSerial++;
            lastFrameAt = SystemClock.elapsedRealtime();
            if (!scheduled)
                requestStart();
        }

        private static Bitmap renderFrame(int maxSide) {
            if (!glReady || frameSerial == renderedSerial)
                return null;

            final float ratio = aspect;
            final int width;
            final int height;
            if (ratio >= 1f) {
                width = maxSide;
                height = Math.max(2, Math.round(maxSide / ratio));
            } else {
                height = maxSide;
                width = Math.max(2, Math.round(maxSide * ratio));
            }
            ensureFramebuffer(width, height);

            GLES20.glBindFramebuffer(GLES20.GL_FRAMEBUFFER, framebuffer);
            GLES20.glViewport(0, 0, width, height);
            GLES20.glUseProgram(program);
            GLES20.glActiveTexture(GLES20.GL_TEXTURE0);
            GLES20.glBindTexture(GLES11Ext.GL_TEXTURE_EXTERNAL_OES, oesTexture);
            GLES20.glUniform1i(textureLocation, 0);
            GLES20.glUniformMatrix4fv(texMatrixLocation, 1, false, texMatrix, 0);

            final int stride = 4 * 4;
            vertexBuffer.position(0);
            GLES20.glVertexAttribPointer(positionLocation, 2, GLES20.GL_FLOAT, false, stride,
                    vertexBuffer);
            GLES20.glEnableVertexAttribArray(positionLocation);
            vertexBuffer.position(2);
            GLES20.glVertexAttribPointer(texCoordLocation, 2, GLES20.GL_FLOAT, false, stride,
                    vertexBuffer);
            GLES20.glEnableVertexAttribArray(texCoordLocation);

            GLES20.glDrawArrays(GLES20.GL_TRIANGLE_STRIP, 0, 4);

            final int byteCount = width * height * 4;
            if (pixels == null || pixels.capacity() < byteCount) {
                pixels = ByteBuffer.allocateDirect(byteCount).order(ByteOrder.nativeOrder());
            }
            pixels.clear();
            pixels.limit(byteCount);
            GLES20.glReadPixels(0, 0, width, height, GLES20.GL_RGBA, GLES20.GL_UNSIGNED_BYTE,
                    pixels);
            GLES20.glBindFramebuffer(GLES20.GL_FRAMEBUFFER, 0);

            final int error = GLES20.glGetError();
            if (error != GLES20.GL_NO_ERROR) {
                Log.w(TAG, "GL error while rendering fallback frame: 0x" + Integer.toHexString(error));
                return null;
            }
            renderedSerial = frameSerial;

            Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
            pixels.rewind();
            bitmap.copyPixelsFromBuffer(pixels);
            return bitmap;
        }

        private static void ensureFramebuffer(int width, int height) {
            if (framebuffer != 0 && framebufferWidth == width && framebufferHeight == height) {
                return;
            }
            if (framebuffer != 0) {
                GLES20.glDeleteFramebuffers(1, new int[] { framebuffer }, 0);
                GLES20.glDeleteTextures(1, new int[] { framebufferTexture }, 0);
            }

            int[] texture = new int[1];
            GLES20.glGenTextures(1, texture, 0);
            framebufferTexture = texture[0];
            GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, framebufferTexture);
            GLES20.glTexImage2D(GLES20.GL_TEXTURE_2D, 0, GLES20.GL_RGBA, width, height, 0,
                    GLES20.GL_RGBA, GLES20.GL_UNSIGNED_BYTE, null);
            GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_MIN_FILTER,
                    GLES20.GL_LINEAR);
            GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_MAG_FILTER,
                    GLES20.GL_LINEAR);

            int[] buffer = new int[1];
            GLES20.glGenFramebuffers(1, buffer, 0);
            framebuffer = buffer[0];
            GLES20.glBindFramebuffer(GLES20.GL_FRAMEBUFFER, framebuffer);
            GLES20.glFramebufferTexture2D(GLES20.GL_FRAMEBUFFER, GLES20.GL_COLOR_ATTACHMENT0,
                    GLES20.GL_TEXTURE_2D, framebufferTexture, 0);
            framebufferWidth = width;
            framebufferHeight = height;

            if (GLES20.glCheckFramebufferStatus(GLES20.GL_FRAMEBUFFER) != GLES20.GL_FRAMEBUFFER_COMPLETE) {
                throw new IllegalStateException("Framebuffer incomplete");
            }
        }

        private static int linkProgram(String vertexSource, String fragmentSource) {
            final int vertex = compileShader(GLES20.GL_VERTEX_SHADER, vertexSource);
            final int fragment = compileShader(GLES20.GL_FRAGMENT_SHADER, fragmentSource);
            final int linked = GLES20.glCreateProgram();
            GLES20.glAttachShader(linked, vertex);
            GLES20.glAttachShader(linked, fragment);
            GLES20.glLinkProgram(linked);
            int[] status = new int[1];
            GLES20.glGetProgramiv(linked, GLES20.GL_LINK_STATUS, status, 0);
            if (status[0] != GLES20.GL_TRUE) {
                throw new IllegalStateException("Link failed: " + GLES20.glGetProgramInfoLog(linked));
            }
            return linked;
        }

        private static int compileShader(int type, String source) {
            final int shader = GLES20.glCreateShader(type);
            GLES20.glShaderSource(shader, source);
            GLES20.glCompileShader(shader);
            int[] status = new int[1];
            GLES20.glGetShaderiv(shader, GLES20.GL_COMPILE_STATUS, status, 0);
            if (status[0] != GLES20.GL_TRUE) {
                throw new IllegalStateException("Shader failed: " + GLES20.glGetShaderInfoLog(shader));
            }
            return shader;
        }
    }

    // ---------------------------------------------------------------------------------------
    // Video surface lookup (main thread). The result is cached; the view tree is
    // only walked
    // when the cached surface is gone or no longer visible.
    // ---------------------------------------------------------------------------------------

    private static View findVideoSurface() {
        View cached = surfaceRef.get();
        if (isCapturable(cached))
            return cached;

        Activity activity = activityRef.get();
        if (activity == null || activity.getWindow() == null)
            return null;

        View best = findLargestSurface(activity.getWindow().getDecorView(), null);
        surfaceRef = new WeakReference<>(best);
        return best;
    }

    private static boolean isCapturable(View view) {
        if (view == null || !view.isAttachedToWindow() || !view.isShown()
                || view.getWidth() <= 0 || view.getHeight() <= 0) {
            return false;
        }
        return !(view instanceof SurfaceView)
                || ((SurfaceView) view).getHolder().getSurface().isValid();
    }

    private static View findLargestSurface(View view, View best) {
        if (view == null || view.getVisibility() != View.VISIBLE)
            return best;

        if (view instanceof SurfaceView || view instanceof TextureView) {
            if (isCapturable(view) && (best == null || area(view) > area(best))) {
                return view;
            }
            return best;
        }

        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0, count = group.getChildCount(); i < count; i++) {
                best = findLargestSurface(group.getChildAt(i), best);
            }
        }
        return best;
    }

    private static long area(View view) {
        return (long) view.getWidth() * view.getHeight();
    }

    // ---------------------------------------------------------------------------------------
    // Player overlay button (main thread)
    // ---------------------------------------------------------------------------------------

    private static void onPlayerOverlayButtons(View sourceButton) {
        try {
            trackActivity(sourceButton.getContext());
            loadPrefs(sourceButton.getContext());

            if (addButtonMethod == null) {
                addButtonMethod = Class.forName(PLAYER_OVERLAY_BUTTON).getMethod(
                        "addButtonWithTextOverlay",
                        View.class, View.OnClickListener.class, View.OnLongClickListener.class);
            }

            Object created = addButtonMethod.invoke(
                    null, sourceButton, CLICK_LISTENER, LONG_CLICK_LISTENER);
            if (!(created instanceof TextView))
                return;

            TextView button = (TextView) created;
            button.setContentDescription("Current frame media artwork");
            buttonRef = new WeakReference<>(button);
            updateButtonText();
            requestStart();
        } catch (ReflectiveOperationException | RuntimeException ex) {
            Log.w(TAG, "Could not add player overlay button", ex);
        }
    }

    private static final View.OnClickListener CLICK_LISTENER = new View.OnClickListener() {
        @Override
        public void onClick(View view) {
            toggleCapture();
        }
    };

    private static final View.OnLongClickListener LONG_CLICK_LISTENER = new View.OnLongClickListener() {
        @Override
        public boolean onLongClick(View view) {
            showMenu(view.getContext());
            return true;
        }
    };

    private static void toggleCapture() {
        captureEnabled = !captureEnabled;
        savePrefs();
        updateButtonText();

        if (captureEnabled) {
            requestStart();
            return;
        }

        // Put YouTube's own artwork back instead of leaving the last captured frame.
        MediaSession currentSession = session;
        MediaMetadata original = metadata;
        if (currentSession != null && original != null) {
            try {
                currentSession.setMetadata(decorate(original, null));
            } catch (RuntimeException ex) {
                Log.w(TAG, "Could not restore original metadata", ex);
            }
        }
    }

    private static void updateButtonText() {
        TextView button = buttonRef.get();
        if (button != null) {
            button.setText(captureEnabled ? "ART \u2713" : "ART \u2715");
        }
    }

    // ---------------------------------------------------------------------------------------
    // Settings menu (main thread)
    // ---------------------------------------------------------------------------------------

    private static void showMenu(Context context) {
        final Activity activity = unwrapActivity(context);
        if (activity == null || activity.isFinishing())
            return;
        loadPrefs(activity);

        try {
            AlertDialog.Builder builder = new AlertDialog.Builder(activity);
            // Use the dialog's own themed context so the spinners match its colors.
            Context themed = builder.getContext();
            final int pad = dp(themed, 20);

            LinearLayout content = new LinearLayout(themed);
            content.setOrientation(LinearLayout.VERTICAL);
            content.setPadding(pad, dp(themed, 8), pad, 0);

            String[] fpsLabels = new String[FPS_OPTIONS.length];
            for (int i = 0; i < FPS_OPTIONS.length; i++) {
                fpsLabels[i] = FPS_OPTIONS[i] + " fps";
            }
            addDropdown(content, themed, "Frame rate", fpsLabels, indexOf(FPS_OPTIONS, fps),
                    new AdapterView.OnItemSelectedListener() {
                        @Override
                        public void onItemSelected(AdapterView<?> parent, View view,
                                int position, long id) {
                            fps = FPS_OPTIONS[position];
                            savePrefs();
                        }

                        @Override
                        public void onNothingSelected(AdapterView<?> parent) {
                        }
                    });

            String[] qualityLabels = new String[QUALITIES.length];
            for (int i = 0; i < QUALITIES.length; i++) {
                qualityLabels[i] = QUALITIES[i] + "p";
            }
            addDropdown(content, themed, "Quality", qualityLabels,
                    indexOf(QUALITIES, quality),
                    new AdapterView.OnItemSelectedListener() {
                        @Override
                        public void onItemSelected(AdapterView<?> parent, View view,
                                int position, long id) {
                            quality = QUALITIES[position];
                            savePrefs();
                        }

                        @Override
                        public void onNothingSelected(AdapterView<?> parent) {
                        }
                    });

            if (backgroundSupported) {
                addDropdown(content, themed, "Frames while screen off / app hidden",
                        new String[] { "On", "Off" },
                        backgroundFrames ? 0 : 1,
                        new AdapterView.OnItemSelectedListener() {
                            @Override
                            public void onItemSelected(AdapterView<?> parent, View view,
                                    int position, long id) {
                                final boolean enabled = position == 0;
                                if (enabled != backgroundFrames) {
                                    backgroundFrames = enabled;
                                    updateBackgroundSurface();
                                    savePrefs();
                                }
                            }

                            @Override
                            public void onNothingSelected(AdapterView<?> parent) {
                            }
                        });
            }

            addDropdown(content, themed, "Title and subtitle",
                    new String[] { "Show", "Hide (blank)" },
                    hideText ? 1 : 0,
                    new AdapterView.OnItemSelectedListener() {
                        @Override
                        public void onItemSelected(AdapterView<?> parent, View view,
                                int position, long id) {
                            final boolean hide = position == 1;
                            if (hide != hideText) {
                                hideText = hide;
                                savePrefs();
                                republishNow(true);
                            }
                        }

                        @Override
                        public void onNothingSelected(AdapterView<?> parent) {
                        }
                    });

            addDropdown(content, themed, "Aspect",
                    new String[] { "Original", "Fit square (black bars)" },
                    squareArtwork ? 1 : 0,
                    new AdapterView.OnItemSelectedListener() {
                        @Override
                        public void onItemSelected(AdapterView<?> parent, View view,
                                int position, long id) {
                            squareArtwork = position == 1;
                            savePrefs();
                        }

                        @Override
                        public void onNothingSelected(AdapterView<?> parent) {
                        }
                    });

            builder.setTitle("Current frame artwork")
                    .setView(content)
                    .setPositiveButton("Done", null)
                    .show();
        } catch (RuntimeException ex) {
            Log.w(TAG, "Could not show menu", ex);
        }
    }

    private static void addDropdown(LinearLayout parent, Context context, String label,
            String[] options, int selected,
            AdapterView.OnItemSelectedListener listener) {
        TextView title = new TextView(context);
        title.setText(label);
        title.setPadding(0, dp(context, 12), 0, 0);
        parent.addView(title);

        Spinner spinner = new Spinner(context, Spinner.MODE_DROPDOWN);
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(
                context, android.R.layout.simple_spinner_item, options);
        adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(adapter);
        // Select before attaching the listener (and without animating) so opening the
        // dialog does not fire a spurious selection callback.
        spinner.setSelection(Math.max(0, selected), false);
        spinner.setOnItemSelectedListener(listener);
        parent.addView(spinner, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
    }

    private static int dp(Context context, int value) {
        return (int) (value * context.getResources().getDisplayMetrics().density + 0.5f);
    }

    private static int indexOf(int[] values, int current) {
        for (int i = 0; i < values.length; i++) {
            if (values[i] == current)
                return i;
        }
        return 0;
    }

    // ---------------------------------------------------------------------------------------
    // Persistence
    // ---------------------------------------------------------------------------------------

    private static SharedPreferences prefs; // guarded by class lock
    private static boolean prefsLoaded; // guarded by class lock

    /**
     * Best-effort application context for early startup, before any view or
     * activity exists.
     */
    private static Context findApplicationContext() {
        try {
            return (Context) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
        } catch (ReflectiveOperationException | RuntimeException ex) {
            return null;
        }
    }

    /**
     * Loads the saved settings once, from whichever Context becomes available
     * first.
     */
    private static void loadPrefs(Context context) {
        synchronized (CurrentFrameMediaArtwork.class) {
            if (prefsLoaded || context == null)
                return;
            try {
                final Context app = context.getApplicationContext();
                final SharedPreferences loaded = (app != null ? app : context)
                        .getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
                captureEnabled = loaded.getBoolean(KEY_ENABLED, true);
                fps = nearest(FPS_OPTIONS, loaded.getInt(KEY_FPS, 1));
                quality = nearest(QUALITIES, loaded.getInt(KEY_QUALITY, 360));
                squareArtwork = loaded.getBoolean(KEY_SQUARE, false);
                backgroundFrames = loaded.getBoolean(KEY_BACKGROUND, true);
                hideText = loaded.getBoolean(KEY_HIDE_TEXT, false);
                prefs = loaded;
                prefsLoaded = true;
            } catch (RuntimeException ex) {
                Log.w(TAG, "Could not load settings", ex);
                return;
            }
        }

        // Apply what was loaded.
        updateBackgroundSurface();
        mainHandler.post(new Runnable() {
            @Override
            public void run() {
                updateButtonText();
                republishNow(false);
            }
        });
    }

    private static void savePrefs() {
        final SharedPreferences target;
        synchronized (CurrentFrameMediaArtwork.class) {
            target = prefs;
        }
        if (target == null)
            return;
        try {
            target.edit()
                    .putBoolean(KEY_ENABLED, captureEnabled)
                    .putInt(KEY_FPS, fps)
                    .putInt(KEY_QUALITY, quality)
                    .putBoolean(KEY_SQUARE, squareArtwork)
                    .putBoolean(KEY_BACKGROUND, backgroundFrames)
                    .putBoolean(KEY_HIDE_TEXT, hideText)
                    .apply();
        } catch (RuntimeException ex) {
            Log.w(TAG, "Could not save settings", ex);
        }
    }

    /**
     * The option closest to the saved value, so a stale or edited value can't break
     * the menu.
     */
    private static int nearest(int[] options, int value) {
        int best = options[0];
        for (int option : options) {
            if (Math.abs(option - value) < Math.abs(best - value))
                best = option;
        }
        return best;
    }

    // ---------------------------------------------------------------------------------------
    // Activity tracking (main thread)
    // ---------------------------------------------------------------------------------------

    private static void trackActivity(Context context) {
        Activity activity = unwrapActivity(context);
        if (activity != null) {
            activityRef = new WeakReference<>(activity);
            surfaceRef = new WeakReference<>(null);
        }

        if (!lifecycleRegistered) {
            Context applicationContext = context.getApplicationContext();
            if (applicationContext instanceof Application) {
                ((Application) applicationContext).registerActivityLifecycleCallbacks(LIFECYCLE);
                lifecycleRegistered = true;
            }
        }
    }

    private static Activity unwrapActivity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity)
                return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    private static final Application.ActivityLifecycleCallbacks LIFECYCLE = new Application.ActivityLifecycleCallbacks() {
        @Override
        public void onActivityResumed(Activity activity) {
            // Coming back to the foreground: the loop stopped itself while hidden.
            activityRef = new WeakReference<>(activity);
            surfaceRef = new WeakReference<>(null);
            requestStart();
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
            if (activityRef.get() == activity) {
                activityRef = new WeakReference<>(null);
                surfaceRef = new WeakReference<>(null);
            }
        }

        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        }

        @Override
        public void onActivityStarted(Activity activity) {
        }

        @Override
        public void onActivityPaused(Activity activity) {
        }

        @Override
        public void onActivityStopped(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        }
    };
}