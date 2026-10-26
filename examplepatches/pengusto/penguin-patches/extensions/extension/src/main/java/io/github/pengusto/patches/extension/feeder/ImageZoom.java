/* SPDX-License-Identifier: GPL-3.0-only */
package io.github.pengusto.patches.extension.feeder;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.view.GestureDetector;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.view.WindowInsets;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.lang.ref.WeakReference;
import java.lang.reflect.Proxy;

/** Article images only. Uses the app's loader, cache, Wi-Fi policy and decode cap. */
public final class ImageZoom {
    private static WeakReference<Activity> owner = new WeakReference<>(null);
    private static Dialog visible;
    private ImageZoom() { }

    private static String text(Context c, String en, String de) {
        return "de".equals(c.getResources().getConfiguration().getLocales().get(0).getLanguage()) ? de : en;
    }
    public static void bind(Activity a) { owner = new WeakReference<>(a); }
    public static void unbind(Activity a) {
        if (owner.get() != a) return;
        dismiss(); owner.clear();
    }
    private static void dismiss() {
        Dialog d = visible; visible = null;
        if (d != null) d.dismiss();
    }
    public static boolean click(Object image, Object map, Object callback) {
        Activity a = owner.get();
        if (a == null || a.isFinishing() || a.isDestroyed()) return false;
        String uri = FeederHooks.uri(image);
        if (uri == null || uri.isEmpty()) return false;
        dismiss();
        String link = FeederHooks.link(image);
        if (link == null) open(a, uri, FeederHooks.caption(image));
        else {
            AlertDialog menu = new AlertDialog.Builder(a)
                .setItems(new String[]{text(a, "View image", "Bild ansehen"), text(a, "Open link", "Link öffnen")},
                    (dialog, which) -> {
                        if (which == 0) open(a, uri, FeederHooks.caption(image));
                        else FeederHooks.follow(image, map, callback);
                    }).create();
            visible = menu;
            menu.setOnDismissListener(d -> { if (visible == menu) visible = null; });
            menu.show();
        }
        return true;
    }
    public static Object header(Object request, Object modifier, String caption) {
        String uri = FeederHooks.requestUri(request);
        if (uri == null || uri.isEmpty()) return modifier;
        Object click = Proxy.newProxyInstance(FeederHooks.clickType().getClassLoader(),
            new Class<?>[]{FeederHooks.clickType()}, (proxy, method, args) -> {
                switch (method.getName()) {
                    case "invoke": {
                        Activity a = owner.get();
                        if (a != null && !a.isFinishing() && !a.isDestroyed()) open(a, uri, caption);
                        return FeederHooks.unit();
                    }
                    case "toString": return "Penguin article image";
                    case "hashCode": return System.identityHashCode(proxy);
                    case "equals": return proxy == args[0];
                    default: throw new IllegalStateException(method.getName());
                }
            });
        Activity a = owner.get();
        return FeederHooks.clickable(modifier, click, a == null ? "View image" : text(a, "View image", "Bild ansehen"));
    }
    private static void open(Activity a, String uri, String caption) {
        dismiss(); new Session(a, uri, caption).show();
    }

    private static final class Session {
        private final Activity activity;
        private final String uri;
        private Dialog dialog;
        private ZoomView image;
        private TextView status;
        private Button retry;
        private Object job;
        private boolean closed;
        private int generation;
        Session(Activity a, String uri, String caption) {
            activity = a; this.uri = uri;
            dialog = new Dialog(a, android.R.style.Theme_Material_NoActionBar);
            LinearLayout root = new LinearLayout(a);
            root.setOrientation(LinearLayout.VERTICAL); root.setBackgroundColor(Color.BLACK);
            root.setOnApplyWindowInsetsListener((v, insets) -> {
                if (android.os.Build.VERSION.SDK_INT >= 30) {
                    android.graphics.Insets i = insets.getInsets(WindowInsets.Type.systemBars() | WindowInsets.Type.displayCutout());
                    v.setPadding(i.left, i.top, i.right, i.bottom);
                } else {
                    v.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                        insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
                }
                return insets;
            });
            LinearLayout header = new LinearLayout(a);
            TextView title = new TextView(a); title.setTextColor(Color.WHITE);
            title.setText(caption == null || caption.isEmpty() ? text(a, "Image", "Bild") : caption);
            title.setMaxLines(2); title.setPadding(16, 8, 8, 8);
            header.addView(title, new LinearLayout.LayoutParams(0, -2, 1));
            button(header, text(a, "Close", "Schließen"), () -> dialog.dismiss());
            root.addView(header);
            image = new ZoomView(a); image.setBackgroundColor(Color.BLACK);
            root.addView(image, new LinearLayout.LayoutParams(-1, 0, 1));
            status = new TextView(a); status.setTextColor(Color.WHITE); status.setGravity(Gravity.CENTER);
            root.addView(status);
            LinearLayout controls = new LinearLayout(a); controls.setGravity(Gravity.CENTER);
            button(controls, "−", () -> image.zoomAt(image.factor / 1.5f, image.getWidth()/2f, image.getHeight()/2f))
                .setContentDescription(text(a, "Zoom out", "Verkleinern"));
            button(controls, text(a, "Reset", "Zurücksetzen"), () -> image.reset());
            button(controls, "+", () -> image.zoomAt(image.factor * 1.5f, image.getWidth()/2f, image.getHeight()/2f))
                .setContentDescription(text(a, "Zoom in", "Vergrößern"));
            root.addView(controls);
            retry = button(root, text(a, "Retry", "Erneut versuchen"), this::load);
            retry.setVisibility(View.GONE);
            dialog.setContentView(root);
            dialog.setOnDismissListener(d -> close());
        }
        void show() {
            visible = dialog; dialog.show();
            dialog.getWindow().setLayout(-1, -1);
            dialog.getWindow().setStatusBarColor(Color.BLACK);
            dialog.getWindow().setNavigationBarColor(Color.BLACK);
            dialog.getWindow().getDecorView().requestApplyInsets();
            load();
        }
        void load() {
            if (closed) return;
            if (job != null) FeederHooks.cancel(job);
            job = FeederHooks.job(); int token = ++generation;
            status.setText(text(activity, "Loading image…", "Bild wird geladen…"));
            retry.setVisibility(View.GONE);
            Object requestJob = job;
            WeakReference<Session> weak = new WeakReference<>(this);
            Object continuation = Proxy.newProxyInstance(FeederHooks.continuation().getClassLoader(),
                new Class<?>[]{FeederHooks.continuation()}, (proxy, method, args) -> {
                    switch (method.getName()) {
                        case "getContext": return requestJob;
                        case "resumeWith": {
                            Object result = args[0];
                            new Handler(Looper.getMainLooper()).post(() -> {
                                Session s = weak.get(); if (s != null) s.complete(token, result);
                            }); return null;
                        }
                        case "toString": return "Penguin image continuation";
                        case "hashCode": return System.identityHashCode(proxy);
                        case "equals": return proxy == args[0];
                        default: throw new IllegalStateException(method.getName());
                    }
                });
            try {
                Object result = FeederHooks.execute(activity.getApplicationContext(), uri, continuation);
                if (result != FeederHooks.suspended()) complete(token, result);
            } catch (RuntimeException error) { complete(token, null); }
        }
        void complete(int token, Object result) {
            if (closed || token != generation) return;
            Object nativeImage = FeederHooks.image(result);
            if (nativeImage == null) {
                status.setText(text(activity, "Image unavailable. Check the connection and image settings.",
                    "Bild nicht verfügbar. Verbindung und Bildeinstellungen prüfen."));
                retry.setVisibility(View.VISIBLE); return;
            }
            Drawable drawable = FeederHooks.drawable(activity, nativeImage);
            image.setImageDrawable(drawable == null ? new NativeDrawable(nativeImage) : drawable);
            image.reset();
            status.setText(text(activity, "Pinch to zoom · Double-tap to reset or zoom", "Mit zwei Fingern zoomen · Doppeltippen zum Zoomen oder Zurücksetzen"));
            if (drawable instanceof Animatable) ((Animatable) drawable).start();
        }
        void close() {
            if (closed) return;
            closed = true; ++generation;
            if (visible == dialog) visible = null;
            if (job != null) FeederHooks.cancel(job);
            Drawable d = image.getDrawable(); if (d instanceof Animatable) ((Animatable)d).stop();
            image.setImageDrawable(null);
            job = null; dialog = null; image = null; status = null; retry = null;
        }
    }
    private static Button button(LinearLayout parent, String label, Runnable action) {
        Button b = new Button(parent.getContext()); b.setText(label); b.setOnClickListener(v -> action.run());
        parent.addView(b, new LinearLayout.LayoutParams(-2, -2)); return b;
    }
    private static final class NativeDrawable extends Drawable {
        private final Object image;
        NativeDrawable(Object image) { this.image = image; }
        @Override public int getIntrinsicWidth() { return FeederHooks.width(image); }
        @Override public int getIntrinsicHeight() { return FeederHooks.height(image); }
        @Override public void draw(Canvas canvas) { FeederHooks.draw(image, canvas); }
        @Override public void setAlpha(int alpha) { }
        @Override public void setColorFilter(ColorFilter filter) { }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    /** Bounded matrix gestures live only in the separate viewer, never the article. */
    public static final class ZoomView extends ImageView {
        private float factor = 1, x, y, base = 1;
        private final Matrix matrix = new Matrix();
        private final ScaleGestureDetector scale;
        private final GestureDetector gestures;
        public ZoomView(Context c) {
            super(c); setScaleType(ScaleType.MATRIX); setFocusable(true);
            scale = new ScaleGestureDetector(c, new ScaleGestureDetector.SimpleOnScaleGestureListener() {
                @Override public boolean onScale(ScaleGestureDetector d) {
                    zoomAt(factor * d.getScaleFactor(), d.getFocusX(), d.getFocusY()); return true;
                }
            });
            gestures = new GestureDetector(c, new GestureDetector.SimpleOnGestureListener() {
                @Override public boolean onDown(MotionEvent e) { return true; }
                @Override public boolean onDoubleTap(MotionEvent e) {
                    if (factor > 1.01f) reset(); else zoomAt(3, e.getX(), e.getY()); return true;
                }
                @Override public boolean onScroll(MotionEvent first, MotionEvent last, float dx, float dy) {
                    if (!scale.isInProgress() && last.getPointerCount() == 1) { x -= dx; y -= dy; update(); }
                    return true;
                }
            });
        }
        @Override protected void onSizeChanged(int w, int h, int oldW, int oldH) { super.onSizeChanged(w,h,oldW,oldH); reset(); }
        @Override public boolean onTouchEvent(MotionEvent e) {
            scale.onTouchEvent(e); gestures.onTouchEvent(e);
            if (e.getActionMasked() == MotionEvent.ACTION_UP) performClick();
            return true;
        }
        @Override public boolean performClick() { super.performClick(); return true; }
        void reset() { factor = 1; x = y = 0; update(); }
        void zoomAt(float target, float focusX, float focusY) {
            if (getDrawable() == null) return;
            float next = Math.max(1, Math.min(8, target));
            if (!Float.isFinite(next)) return;
            float ratio = next / factor;
            x = (focusX - getWidth()/2f) * (1-ratio) + x*ratio;
            y = (focusY - getHeight()/2f) * (1-ratio) + y*ratio;
            factor = next; update();
        }
        private void update() {
            Drawable d = getDrawable(); if (d == null || getWidth() == 0 || getHeight() == 0) return;
            int iw = d.getIntrinsicWidth(), ih = d.getIntrinsicHeight(); if (iw <= 0 || ih <= 0) return;
            base = Math.min(getWidth()/(float)iw, getHeight()/(float)ih);
            float width = iw*base*factor, height = ih*base*factor;
            float limitX = Math.max(0, (width-getWidth())/2), limitY = Math.max(0, (height-getHeight())/2);
            x = Math.max(-limitX, Math.min(limitX, x)); y = Math.max(-limitY, Math.min(limitY, y));
            matrix.setScale(base*factor, base*factor);
            matrix.postTranslate((getWidth()-width)/2+x, (getHeight()-height)/2+y);
            setImageMatrix(matrix);
            setContentDescription(text(getContext(), "Image zoom ", "Bildzoom ") + Math.round(factor*100) + "%");
        }
    }
}
