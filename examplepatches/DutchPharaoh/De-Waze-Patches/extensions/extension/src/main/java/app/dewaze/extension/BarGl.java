package app.dewaze.extension;

import android.graphics.Bitmap;
import android.graphics.SurfaceTexture;
import android.opengl.EGL14;
import android.opengl.EGLConfig;
import android.opengl.EGLContext;
import android.opengl.EGLDisplay;
import android.opengl.EGLExt;
import android.opengl.EGLSurface;
import android.opengl.GLES11Ext;
import android.opengl.GLES20;
import android.opengl.GLUtils;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Log;
import android.view.Surface;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/**
 * Puts the alerts bar on top of the Android Auto map.
 *
 * <p>Waze's map engine creates its own EGL window surface on the car surface and swaps it natively,
 * so nothing can be drawn into its frames from Java. Instead Waze gets an intermediate surface
 * (a {@link SurfaceTexture}); this class copies every frame Waze puts there onto the real car
 * surface and draws the bar on top. One extra GPU copy per frame; touch input is not affected.
 *
 * <p>If anything fails during setup, Waze gets the original surface and the bar is simply absent.
 */
final class BarGl {

    // region Layout in dp. The Android Auto buttons have a fixed size in dp; these values match
    // both the desktop head unit (800x400) and a Hyundai 12.3" screen.

    /**
     * Centre of the bar (the centre of the right button column), measured from the right edge of
     * Android Auto's visible area. The host leaves the button column out of the visible area, and
     * moves it left together with that area in split screen.
     */
    static final float BAR_CENTER_FROM_VISIBLE_RIGHT_DP = 50f;
    /** Fallback while the visible area is not known: centre from the right edge of the surface. */
    static final float BAR_CENTER_FROM_RIGHT_DP = 38f;
    static final float BAR_WIDTH_DP = 44f;
    /** Width of the painted area: the bar plus room for the distance labels on its left. */
    static final float BAR_CANVAS_WIDTH_DP = 92f;
    /** Just below the top-right button row (search, routes, sound). */
    static final float BAR_TOP_DP = 82f;
    /** Distance from the bottom of the map: just above the +/- zoom button. */
    static final float BAR_BOTTOM_FROM_BOTTOM_DP = 158f;
    /** Average speed pill: its right edge from the visible area's right edge (above the speedometer). */
    static final float ZONE_RIGHT_FROM_VISIBLE_RIGHT_DP = 8f;
    /** Fallback while the visible area is not known: right edge from the right of the surface. */
    static final float ZONE_RIGHT_FROM_RIGHT_DP = 96f;
    /** Bottom of the pill from the bottom of the map: just above the speedometer and speed limit. */
    static final float ZONE_BOTTOM_FROM_BOTTOM_DP = 140f;

    // endregion

    /** Size of the bar in pixels on the current car surface (0 until a surface is set up). */
    static volatile int barWidthPx;
    static volatile int canvasWidthPx;
    static volatile int barHeightPx;

    private static final String VERTEX_SHADER =
            "attribute vec2 aPos;\n"
                    + "uniform vec4 uRect;\n"
                    + "uniform mat4 uTexMatrix;\n"
                    + "varying vec2 vUv;\n"
                    + "void main() {\n"
                    + "  vUv = (uTexMatrix * vec4(aPos, 0.0, 1.0)).xy;\n"
                    + "  gl_Position = vec4(mix(uRect.xy, uRect.zw, aPos), 0.0, 1.0);\n"
                    + "}\n";

    private static final String FRAGMENT_SHADER_OES =
            "#extension GL_OES_EGL_image_external : require\n"
                    + "precision mediump float;\n"
                    + "varying vec2 vUv;\n"
                    + "uniform samplerExternalOES uTex;\n"
                    + "void main() {\n"
                    + "  gl_FragColor = texture2D(uTex, vUv);\n"
                    + "}\n";

    private static final String FRAGMENT_SHADER_2D =
            "precision mediump float;\n"
                    + "varying vec2 vUv;\n"
                    + "uniform sampler2D uTex;\n"
                    + "void main() {\n"
                    + "  gl_FragColor = texture2D(uTex, vUv);\n"
                    + "}\n";

    /** Bitmap rows run top to bottom, GL texture coordinates bottom to top. */
    private static final float[] FLIP_Y = {
            1, 0, 0, 0,
            0, -1, 0, 0,
            0, 0, 1, 0,
            0, 1, 0, 1,
    };

    private BarGl() {
    }

    /**
     * Returns the surface Waze should render the car map into: an intermediate one that is
     * composited onto {@code target} with the bar on top, or {@code target} itself if setting that
     * up fails.
     */
    static Compositor start(Surface target, int width, int height, int dpi) {
        Compositor compositor = new Compositor(target, width, height, dpi);
        if (compositor.startAndWait()) {
            return compositor;
        }
        compositor.release();
        return null;
    }

    /** One car surface: its own thread, EGL context and intermediate SurfaceTexture. */
    static final class Compositor implements SurfaceTexture.OnFrameAvailableListener {

        private final Surface target;
        private final int width;
        private final int height;
        private final float px;
        private final float barTop;
        private final float barWidth;
        private final float canvasWidth;
        private final float barHeight;
        private final HandlerThread thread;
        private final Handler handler;
        private final float[] texMatrix = new float[16];
        private final int[] i1 = new int[1];

        private EGLDisplay display = EGL14.EGL_NO_DISPLAY;
        private EGLContext context = EGL14.EGL_NO_CONTEXT;
        private EGLSurface eglSurface = EGL14.EGL_NO_SURFACE;
        private SurfaceTexture surfaceTexture;
        private Surface inputSurface;
        private int oesProgram;
        private int barProgram;
        private int oesTexture;
        private int barTexture;
        private int zoneTexture;
        private Bitmap uploaded;
        private Bitmap uploadedZone;
        private FloatBuffer quad;
        private volatile boolean released;
        private boolean loggedFrame;

        Compositor(Surface target, int width, int height, int dpi) {
            this.target = target;
            this.width = width;
            this.height = height;
            px = (dpi > 0 ? dpi : 160) / 160f;
            barWidth = BAR_WIDTH_DP * px;
            canvasWidth = BAR_CANVAS_WIDTH_DP * px;
            barTop = BAR_TOP_DP * px;
            barHeight = Math.max(barWidth * 2, height - BAR_BOTTOM_FROM_BOTTOM_DP * px - barTop);
            thread = new HandlerThread(RouteAlertsBarPatch.TAG + "-gl");
            thread.start();
            handler = new Handler(thread.getLooper());
        }

        /** The surface Waze renders into. */
        Surface inputSurface() {
            return inputSurface;
        }

        boolean startAndWait() {
            CountDownLatch done = new CountDownLatch(1);
            boolean[] ok = new boolean[1];
            handler.post(() -> {
                try {
                    ok[0] = setUp();
                } catch (Throwable t) {
                    Log.e(RouteAlertsBarPatch.TAG, "Compositor setup failed", t);
                    RouteAlertsBarPatch.reportOnce("setup-error", "setup error: " + t);
                } finally {
                    done.countDown();
                }
            });
            try {
                if (!done.await(3, TimeUnit.SECONDS)) {
                    Log.e(RouteAlertsBarPatch.TAG, "Compositor setup timed out");
                    return false;
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                return false;
            }
            return ok[0];
        }

        private boolean setUp() {
            display = EGL14.eglGetDisplay(EGL14.EGL_DEFAULT_DISPLAY);
            int[] version = new int[2];
            if (!EGL14.eglInitialize(display, version, 0, version, 1)) {
                return fail("eglInitialize");
            }
            int[] attribs = {
                    EGL14.EGL_RED_SIZE, 8,
                    EGL14.EGL_GREEN_SIZE, 8,
                    EGL14.EGL_BLUE_SIZE, 8,
                    EGL14.EGL_ALPHA_SIZE, 8,
                    EGL14.EGL_RENDERABLE_TYPE, EGL14.EGL_OPENGL_ES2_BIT,
                    EGL14.EGL_SURFACE_TYPE, EGL14.EGL_WINDOW_BIT,
                    EGL14.EGL_NONE,
            };
            EGLConfig[] configs = new EGLConfig[1];
            int[] count = new int[1];
            if (!EGL14.eglChooseConfig(display, attribs, 0, configs, 0, 1, count, 0) || count[0] == 0) {
                return fail("eglChooseConfig");
            }
            context = EGL14.eglCreateContext(display, configs[0], EGL14.EGL_NO_CONTEXT,
                    new int[]{EGL14.EGL_CONTEXT_CLIENT_VERSION, 2, EGL14.EGL_NONE}, 0);
            if (context == null || context.equals(EGL14.EGL_NO_CONTEXT)) {
                return fail("eglCreateContext");
            }
            eglSurface = EGL14.eglCreateWindowSurface(display, configs[0], target,
                    new int[]{EGL14.EGL_NONE}, 0);
            if (eglSurface == null || eglSurface.equals(EGL14.EGL_NO_SURFACE)) {
                return fail("eglCreateWindowSurface");
            }
            if (!EGL14.eglMakeCurrent(display, eglSurface, eglSurface, context)) {
                return fail("eglMakeCurrent");
            }

            oesProgram = link(FRAGMENT_SHADER_OES);
            barProgram = link(FRAGMENT_SHADER_2D);
            if (oesProgram == 0 || barProgram == 0) {
                return false;
            }
            float[] corners = {0f, 0f, 1f, 0f, 0f, 1f, 1f, 1f};
            quad = ByteBuffer.allocateDirect(corners.length * 4).order(ByteOrder.nativeOrder()).asFloatBuffer();
            quad.put(corners).position(0);

            oesTexture = newTexture(GLES11Ext.GL_TEXTURE_EXTERNAL_OES);
            barTexture = newTexture(GLES20.GL_TEXTURE_2D);
            zoneTexture = newTexture(GLES20.GL_TEXTURE_2D);

            surfaceTexture = new SurfaceTexture(oesTexture);
            surfaceTexture.setDefaultBufferSize(width, height);
            surfaceTexture.setOnFrameAvailableListener(this, handler);
            inputSurface = new Surface(surfaceTexture);

            barWidthPx = Math.round(barWidth);
            canvasWidthPx = Math.round(canvasWidth);
            barHeightPx = Math.round(barHeight);
            RouteAlertsBarPatch.AlertsSource.invalidate();
            AverageSpeedZone.dpPx = px;
            AverageSpeedZone.repaint();
            RouteAlertsBarPatch.reportOnce("surface-" + width + "x" + height,
                    "car surface " + width + "x" + height + " (bar " + barWidthPx + "x" + barHeightPx + "), compositor ready");
            return true;
        }

        private boolean fail(String what) {
            int error = EGL14.eglGetError();
            Log.e(RouteAlertsBarPatch.TAG, what + " failed: 0x" + Integer.toHexString(error));
            RouteAlertsBarPatch.reportOnce("egl-" + what, what + " failed: 0x" + Integer.toHexString(error));
            return false;
        }

        @Override
        public void onFrameAvailable(SurfaceTexture st) {
            if (released) {
                return;
            }
            try {
                drawFrame();
            } catch (Throwable t) {
                Log.e(RouteAlertsBarPatch.TAG, "Compositor frame failed", t);
                RouteAlertsBarPatch.reportOnce("frame-error", "frame error: " + t);
            }
        }

        private void drawFrame() {
            if (!EGL14.eglMakeCurrent(display, eglSurface, eglSurface, context)) {
                fail("eglMakeCurrent (frame)");
                return;
            }
            surfaceTexture.updateTexImage();
            surfaceTexture.getTransformMatrix(texMatrix);

            GLES20.glViewport(0, 0, width, height);
            GLES20.glDisable(GLES20.GL_BLEND);

            // The map, full screen.
            GLES20.glUseProgram(oesProgram);
            GLES20.glActiveTexture(GLES20.GL_TEXTURE0);
            GLES20.glBindTexture(GLES11Ext.GL_TEXTURE_EXTERNAL_OES, oesTexture);
            drawQuad(oesProgram, -1f, -1f, 1f, 1f, texMatrix);

            // The bar on top.
            RouteAlertsBarPatch.onCarFrame();
            Bitmap bitmap = RouteAlertsBarPatch.shouldShowBar()
                    ? RouteAlertsBarPatch.AlertsSource.bitmapOrEmpty()
                    : null;
            if (bitmap != null) {
                GLES20.glEnable(GLES20.GL_BLEND);
                GLES20.glBlendFunc(GLES20.GL_ONE, GLES20.GL_ONE_MINUS_SRC_ALPHA); // premultiplied
                GLES20.glUseProgram(barProgram);
                GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, barTexture);
                if (uploaded != bitmap) {
                    GLUtils.texImage2D(GLES20.GL_TEXTURE_2D, 0, bitmap, 0);
                    uploaded = bitmap;
                }
                // The bitmap is wider than the bar: the bar is at its right, the labels to the left.
                float barLeft = barCenterX() + barWidth / 2f - canvasWidth;
                drawQuad(barProgram, toNdcX(barLeft), toNdcY(barTop + barHeight),
                        toNdcX(barLeft + canvasWidth), toNdcY(barTop), FLIP_Y);
                if (!loggedFrame) {
                    loggedFrame = true;
                    RouteAlertsBarPatch.reportOnce("drawn", "bar drawn at x=" + Math.round(barLeft) + " y="
                            + Math.round(barTop) + " size " + Math.round(barWidth) + "x" + Math.round(barHeight)
                            + " on " + width + "x" + height);
                }
            }

            // The average speed pill, while in a section control zone.
            Bitmap zone = AverageSpeedZone.bitmapIfFresh();
            if (zone != null) {
                GLES20.glEnable(GLES20.GL_BLEND);
                GLES20.glBlendFunc(GLES20.GL_ONE, GLES20.GL_ONE_MINUS_SRC_ALPHA);
                GLES20.glUseProgram(barProgram);
                GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, zoneTexture);
                if (uploadedZone != zone) {
                    GLUtils.texImage2D(GLES20.GL_TEXTURE_2D, 0, zone, 0);
                    uploadedZone = zone;
                }
                float right = zoneRight();
                float bottom = height - ZONE_BOTTOM_FROM_BOTTOM_DP * px;
                drawQuad(barProgram, toNdcX(right - zone.getWidth()), toNdcY(bottom),
                        toNdcX(right), toNdcY(bottom - zone.getHeight()), FLIP_Y);
            }

            EGLExt.eglPresentationTimeANDROID(display, eglSurface, surfaceTexture.getTimestamp());
            EGL14.eglSwapBuffers(display, eglSurface);
        }

        private void drawQuad(int program, float x0, float y0, float x1, float y1, float[] matrix) {
            int pos = GLES20.glGetAttribLocation(program, "aPos");
            GLES20.glUniform4f(GLES20.glGetUniformLocation(program, "uRect"), x0, y0, x1, y1);
            GLES20.glUniformMatrix4fv(GLES20.glGetUniformLocation(program, "uTexMatrix"), 1, false, matrix, 0);
            GLES20.glUniform1i(GLES20.glGetUniformLocation(program, "uTex"), 0);
            GLES20.glEnableVertexAttribArray(pos);
            GLES20.glVertexAttribPointer(pos, 2, GLES20.GL_FLOAT, false, 8, quad);
            GLES20.glDrawArrays(GLES20.GL_TRIANGLE_STRIP, 0, 4);
            GLES20.glDisableVertexAttribArray(pos);
        }

        /** Follows the button column, also when split screen moves it left. */
        private float barCenterX() {
            android.graphics.Rect visible = RouteAlertsBarPatch.visibleArea;
            if (visible != null && visible.right > visible.left && visible.right < width) {
                return Math.min(width - barWidth / 2f, visible.right + BAR_CENTER_FROM_VISIBLE_RIGHT_DP * px);
            }
            return width - BAR_CENTER_FROM_RIGHT_DP * px;
        }

        /** Right edge of the average speed pill: above the speedometer, also in split screen. */
        private float zoneRight() {
            android.graphics.Rect visible = RouteAlertsBarPatch.visibleArea;
            if (visible != null && visible.right > visible.left && visible.right <= width) {
                return visible.right - ZONE_RIGHT_FROM_VISIBLE_RIGHT_DP * px;
            }
            return width - ZONE_RIGHT_FROM_RIGHT_DP * px;
        }

        private float toNdcX(float x) {
            return 2f * x / width - 1f;
        }

        private float toNdcY(float yFromTop) {
            return 1f - 2f * yFromTop / height;
        }

        private int newTexture(int target) {
            GLES20.glGenTextures(1, i1, 0);
            int texture = i1[0];
            GLES20.glBindTexture(target, texture);
            GLES20.glTexParameteri(target, GLES20.GL_TEXTURE_MIN_FILTER, GLES20.GL_LINEAR);
            GLES20.glTexParameteri(target, GLES20.GL_TEXTURE_MAG_FILTER, GLES20.GL_LINEAR);
            GLES20.glTexParameteri(target, GLES20.GL_TEXTURE_WRAP_S, GLES20.GL_CLAMP_TO_EDGE);
            GLES20.glTexParameteri(target, GLES20.GL_TEXTURE_WRAP_T, GLES20.GL_CLAMP_TO_EDGE);
            return texture;
        }

        private int link(String fragmentSource) {
            int vs = compile(GLES20.GL_VERTEX_SHADER, VERTEX_SHADER);
            int fs = compile(GLES20.GL_FRAGMENT_SHADER, fragmentSource);
            if (vs == 0 || fs == 0) {
                return 0;
            }
            int p = GLES20.glCreateProgram();
            GLES20.glAttachShader(p, vs);
            GLES20.glAttachShader(p, fs);
            GLES20.glLinkProgram(p);
            GLES20.glDeleteShader(vs);
            GLES20.glDeleteShader(fs);
            GLES20.glGetProgramiv(p, GLES20.GL_LINK_STATUS, i1, 0);
            if (i1[0] == 0) {
                String log = GLES20.glGetProgramInfoLog(p);
                Log.e(RouteAlertsBarPatch.TAG, "Link failed: " + log);
                RouteAlertsBarPatch.reportOnce("link", "shader link error: " + log);
                GLES20.glDeleteProgram(p);
                return 0;
            }
            return p;
        }

        private int compile(int type, String source) {
            int shader = GLES20.glCreateShader(type);
            GLES20.glShaderSource(shader, source);
            GLES20.glCompileShader(shader);
            GLES20.glGetShaderiv(shader, GLES20.GL_COMPILE_STATUS, i1, 0);
            if (i1[0] == 0) {
                String log = GLES20.glGetShaderInfoLog(shader);
                Log.e(RouteAlertsBarPatch.TAG, "Shader compile failed: " + log);
                RouteAlertsBarPatch.reportOnce("shader", "shader error: " + log);
                GLES20.glDeleteShader(shader);
                return 0;
            }
            return shader;
        }

        /** Frees everything on the compositor thread, then stops it. */
        void release() {
            released = true;
            handler.post(() -> {
                try {
                    if (surfaceTexture != null) {
                        surfaceTexture.setOnFrameAvailableListener(null);
                        surfaceTexture.release();
                    }
                    if (inputSurface != null) {
                        inputSurface.release();
                    }
                    if (!display.equals(EGL14.EGL_NO_DISPLAY)) {
                        EGL14.eglMakeCurrent(display, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE,
                                EGL14.EGL_NO_CONTEXT);
                        if (!eglSurface.equals(EGL14.EGL_NO_SURFACE)) {
                            EGL14.eglDestroySurface(display, eglSurface);
                        }
                        if (!context.equals(EGL14.EGL_NO_CONTEXT)) {
                            EGL14.eglDestroyContext(display, context);
                        }
                    }
                } catch (Throwable t) {
                    Log.w(RouteAlertsBarPatch.TAG, "Compositor release failed", t);
                } finally {
                    thread.quitSafely();
                }
            });
        }
    }
}
