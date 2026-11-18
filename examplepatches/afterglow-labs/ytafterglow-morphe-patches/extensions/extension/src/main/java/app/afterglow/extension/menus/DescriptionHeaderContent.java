package app.afterglow.extension.menus;

import android.graphics.Rect;
import android.view.Gravity;
import android.view.View;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.FrameLayout;
import java.lang.ref.WeakReference;
import java.util.concurrent.atomic.AtomicInteger;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.InstalledTweaks;
import app.afterglow.extension.diagnostics.DebugLog;
import app.afterglow.extension.video.VideoState;

/** The current title is a content cell inside the controller's returned LoadingFrameLayout. */
public final class DescriptionHeaderContent {
    private static final AtomicInteger CONTEXT_DIAGNOSTICS = new AtomicInteger();
    private DescriptionHeaderContent() {}
    private static int tag(View view, String name) {
        return view.getResources().getIdentifier(name, "id", view.getContext().getPackageName());
    }
    public static void bindPanel(DescriptionHeaderHost owner) {
        try {
            if (!InstalledTweaks.has("long-press-tools") || owner == null) return;
            View root = owner.afterglow_descriptionRoot();
            if (!(root instanceof FrameLayout)) return;
            int key = tag(root, "afterglow_description_content_panel");
            if (key == 0) return;
            Object previous = root.getTag(key);
            if (!(previous instanceof Panel) || ((Panel) previous).owner.get() != owner)
                root.setTag(key, new Panel(owner, (FrameLayout) root));
        } catch (Throwable error) { Afterglow.error("DescriptionHeader.contentPanel", error); }
    }
    public static void bindRoot(View root, Object token) {
        if (root == null || token == null) return;
        Afterglow.runOnMain(() -> {
            try {
                if (!InstalledTweaks.has("long-press-tools")) return;
                int key = tag(root, "afterglow_description_content_title");
                if (key == 0) return;
                Object previous = root.getTag(key);
                if (previous instanceof Title) ((Title) previous).dispose();
                root.setTag(key, new Title(root, token, key));
            } catch (Throwable error) { Afterglow.error("DescriptionHeader.contentRoot", error); }
        });
    }
    public static void onText(Object context) {
        try {
            if (!(context instanceof LongPressCaptureContext)) return;
            LongPressCaptureContext owner = (LongPressCaptureContext) context;
            StringBuilder path = owner.afterglow_capturePath();
            if (!DescriptionHeaderPolicy.titleHeader(owner.afterglow_captureIdentifier(), path == null ? null : path.toString())) return;
            View root = owner.afterglow_captureRoot(); Object token = owner.afterglow_captureBinding();
            if (root == null || token == null) { traceContext(root, token != null, false); return; }
            String video = VideoState.videoId();
            Afterglow.runOnMain(() -> {
                try {
                    Object value = root.getTag(tag(root, "afterglow_description_content_title"));
                    boolean current = value instanceof Title && ((Title) value).token == token;
                    traceContext(root, true, current);
                    if (current) ((Title) value).observe(video);
                } catch (Throwable error) { Afterglow.error("DescriptionHeader.contentText", error); }
            });
        } catch (Throwable error) { Afterglow.error("DescriptionHeader.contentContext", error); }
    }
    /** The active renderer may omit context.root; the native mount item supplies its actual host. */
    public static void onNativeMounted(View root, Object item, Object model) {
        try { onMounted(LongPressMountedText.contextForModel(model), root, item, model); }
        catch (Throwable error) { Afterglow.error("DescriptionHeader.mountedContext", error); }
    }
    public static void onMounted(Object context, View root, Object item) {
        onMounted(context, root, item, context);
    }
    private static void onMounted(Object context, View root, Object item, Object model) {
        if (root == null || item == null) return;
        try {
            onUnmounted(root, item);
            if (!(context instanceof LongPressCaptureContext)) return;
            LongPressCaptureContext owner = (LongPressCaptureContext) context;
            StringBuilder path = owner.afterglow_capturePath();
            if (!DescriptionHeaderPolicy.titleHeader(owner.afterglow_captureIdentifier(), path == null ? null : path.toString())) return;
            String video = VideoState.videoId();
            Afterglow.runOnMain(() -> {
                bindRoot(root, item);
                Object value = root.getTag(tag(root, "afterglow_description_content_title"));
                if (value instanceof Title && ((Title) value).token == item) {
                    ((Title) value).nativeModel = model;
                    ((Title) value).observe(video);
                }
            });
        } catch (Throwable error) { Afterglow.error("DescriptionHeader.mountedTitle", error); }
    }
    public static void onNativeUnmounted(View root, Object item, Object model) {
        if (root == null || item == null || model == null) return;
        Afterglow.runOnMain(() -> {
            try {
                Object value = root.getTag(tag(root, "afterglow_description_content_title"));
                if (value instanceof Title && ((Title) value).token == item && ((Title) value).nativeModel == model)
                    onUnmounted(root, item);
            } catch (Throwable error) { Afterglow.error("DescriptionHeader.unmountedContext", error); }
        });
    }
    public static void onUnmounted(View root, Object item) {
        if (root == null || item == null) return;
        Afterglow.runOnMain(() -> {
            try {
                int key = tag(root, "afterglow_description_content_title");
                Object value = key == 0 ? null : root.getTag(key);
                if (value instanceof Title && ((Title) value).token == item) {
                    ((Title) value).dispose(); root.setTag(key, null);
                }
            } catch (Throwable error) { Afterglow.error("DescriptionHeader.unmountedTitle", error); }
        });
    }
    private static void traceContext(View root, boolean token, boolean current) {
        if (DebugLog.shouldWrite("long-press") && CONTEXT_DIAGNOSTICS.getAndIncrement() < 12)
            DebugLog.write("long-press", "Description title context root=" + (root == null ? "none" : root.getClass().getSimpleName())
                    + " token=" + token + " current=" + current);
    }
    private static final class Panel {
        final WeakReference<DescriptionHeaderHost> owner;
        final FrameLayout root;
        Panel(DescriptionHeaderHost owner, FrameLayout root) { this.owner = new WeakReference<>(owner); this.root = root; }
        Object model() {
            DescriptionHeaderHost value = owner.get();
            return value != null && value.afterglow_descriptionRoot() == root
                    && DescriptionHeaderPolicy.PANEL.equals(value.afterglow_descriptionPanelId())
                    ? value.afterglow_descriptionPanel() : null;
        }
    }
    private static final class Title implements View.OnAttachStateChangeListener, ViewTreeObserver.OnPreDrawListener, DescriptionHeaderHost {
        final View root;
        final Object token;
        final int tag;
        final Rect visible = new Rect();
        final int[] rootLocation = new int[2], panelLocation = new int[2];
        ViewTreeObserver observer;
        String video;
        Panel panel;
        Object model, nativeModel;
        FrameLayout controls;
        boolean recognized, disposed;
        int diagnostic, diagnostics;
        Title(View root, Object token, int tag) { this.root = root; this.token = token; this.tag = tag; }
        void observe(String id) {
            if (!recognized) {
                recognized = true; video = id;
                root.addOnAttachStateChangeListener(this);
                if (root.isAttachedToWindow()) listen();
            }
            update();
        }
        void listen() {
            if (observer != null) return;
            observer = root.getViewTreeObserver(); observer.addOnPreDrawListener(this);
        }
        void unlisten() {
            if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
            observer = null;
        }
        public void onViewAttachedToWindow(View view) { listen(); update(); }
        public void onViewDetachedFromWindow(View view) { unlisten(); remove(); }
        public boolean onPreDraw() { update(); return true; }
        void dispose() { disposed = true; unlisten(); remove(); root.removeOnAttachStateChangeListener(this); }
        Panel findPanel() {
            View current = root;
            for (int depth = 0; current != null && depth < 48; depth++) {
                int key = tag(current, "afterglow_description_content_panel");
                Object value = key == 0 ? null : current.getTag(key);
                if (value instanceof Panel) return (Panel) value;
                ViewParent parent = current.getParent(); current = parent instanceof View ? (View) parent : null;
            }
            return null;
        }
        boolean current() {
            return !disposed && recognized && root.getTag(tag) == this && root.isAttachedToWindow() && root.isShown()
                    && DescriptionHeaderPolicy.videoId(video) && video.equals(VideoState.videoId())
                    && panel != null && panel == findPanel() && model != null && model == panel.model();
        }
        void update() {
            try {
                if (!recognized || disposed) return;
                Panel found = findPanel();
                if (panel == null && found != null && found.model() != null) { panel = found; model = found.model(); }
                if (!current() || !DescriptionHeaderActions.enabled() || !root.getGlobalVisibleRect(visible)) { remove(); trace(found == null ? 1 : 2); return; }
                root.getLocationInWindow(rootLocation); panel.root.getLocationInWindow(panelLocation);
                int x = rootLocation[0] - panelLocation[0], y = rootLocation[1] - panelLocation[1];
                int width = root.getWidth(), height = Math.min(root.getHeight(), dp(56));
                // Never float the button over a different recycler row when this title scrolls away.
                if (width < dp(96) || height < dp(40) || x < 0 || y < 0
                        || x + width > panel.root.getWidth() || y + height > panel.root.getHeight()) { remove(); trace(3); return; }
                if (controls != null && controls.getParent() != panel.root) remove();
                if (controls == null) {
                    controls = new FrameLayout(root.getContext());
                    FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(width, height, Gravity.TOP | Gravity.LEFT);
                    params.leftMargin = x; params.topMargin = y;
                    panel.root.addView(controls, params);
                    DescriptionHeaderActions.bind(this);
                } else {
                    FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) controls.getLayoutParams();
                    if (params.width != width || params.height != height || params.leftMargin != x || params.topMargin != y) {
                        params.width = width; params.height = height; params.leftMargin = x; params.topMargin = y;
                        controls.setLayoutParams(params);
                    }
                    if (panel.root.getChildAt(panel.root.getChildCount() - 1) != controls) controls.bringToFront();
                }
                trace(4);
            } catch (Throwable error) { remove(); Afterglow.error("DescriptionHeader.contentUpdate", error); }
        }
        int dp(int value) { return Math.round(value * root.getResources().getDisplayMetrics().density); }
        void trace(int state) {
            if (diagnostic == state || diagnostics >= 8) return; diagnostic = state; diagnostics++;
            if (DebugLog.shouldWrite("long-press")) DebugLog.write("long-press", "Description title state=" + state
                    + " root=" + root.getClass().getSimpleName() + " size=" + root.getWidth() + "x" + root.getHeight()
                    + " attached=" + root.isAttachedToWindow() + " panel=" + (panel != null));
        }
        void remove() {
            if (controls == null) return;
            FrameLayout previous = controls; controls = null;
            DescriptionHeaderActions.clear(previous);
            if (previous.getParent() instanceof android.view.ViewGroup) ((android.view.ViewGroup) previous.getParent()).removeView(previous);
        }
        public View afterglow_descriptionRoot() { return controls; }
        public Object afterglow_descriptionPanel() { return current() ? model : null; }
        public String afterglow_descriptionPanelId() { return current() ? DescriptionHeaderPolicy.PANEL : null; }
    }
}
