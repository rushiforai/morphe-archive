package app.hushmessenger.extension;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * #169 Mark as seen button: while View stories anonymously holds a story's seen back, the story viewer gets an eye. It
 * shows a slash while the story on screen is held back. A tap sends the seen Messenger was about to send for that
 * story, once, through Messenger's own mark-read handler, so the person sees you in their viewer list. The eye then
 * shows without the slash.
 */
public final class StoryEye {
    /** The switch under View stories anonymously. */
    static final String KEY = "story_seen_button";
    /** The control the switch belongs to, which holds the seen back and counts its hook errors. */
    static final String OWNER = "anonymous_stories";
    static final String VIEW_TAG = "hush_story_eye";
    /** The eye's size, and its place in dp below the window's top inset and in from its end. */
    static final int SIZE_DP = 40;
    static final int TOP_DP = 64;
    static final int END_DP = 12;

    private StoryEye() { }

    /** The story card a seen was held back for, Messenger's handler that would have sent it, and its flag. */
    static final class Held {
        final WeakReference<Object> handler;
        final WeakReference<Object> card;
        final boolean flag;

        Held(Object handler, Object card, boolean flag) {
            this.handler = new WeakReference<>(handler);
            this.card = new WeakReference<>(card);
            this.flag = flag;
        }
    }

    /** The card on screen: the last one whose seen was held back, or null. */
    static volatile Held held;
    /** Cards the eye sent this run, so coming back to one shows it as sent. */
    static final Map<Object, Boolean> sent = new WeakHashMap<>();
    /** The open story viewer's eye, or null with none open. Read and written on the main thread. */
    static WeakReference<Eye> shownEye;
    private static final ThreadLocal<Boolean> replaying = new ThreadLocal<>();
    private static Handler main;

    /** Whether the eye shows: View stories anonymously in effect and this switch on. */
    static boolean shown() {
        return Settings.wouldUse(OWNER) && Settings.preferences != null && Settings.preferences.getBoolean(KEY, false);
    }

    /** True while a tap is sending a held seen, so View stories anonymously lets that one call through. */
    static boolean replaying() { return Boolean.TRUE.equals(replaying.get()); }

    /** View stories anonymously kept this card's seen from going out. The newest one is the card on screen. */
    static void hold(Object handler, Object card, boolean flag) {
        if (handler == null || card == null || !shown()) return;
        held = new Held(handler, card, flag);
        onMain(StoryEye::refresh);
    }

    /**
     * The story viewer's onViewCreated runs this first with the viewer's view. The eye goes on the viewer's window
     * once the view is attached, and leaves with it.
     */
    public static void viewerCreated(Object viewer, View view) {
        if (view == null) return;
        try {
            if (!Settings.installed.contains(OWNER)) return;
            view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                // After the window finishes attaching its views, not in the middle of it.
                @Override public void onViewAttachedToWindow(View attached) {
                    attached.post(() -> { if (attached.isAttachedToWindow()) attach(attached); });
                }

                @Override public void onViewDetachedFromWindow(View detached) { detach(detached); }
            });
            if (view.isAttachedToWindow()) attach(view);
        } catch (RuntimeException | LinkageError error) {
            Settings.hookFailed(OWNER, "Can't add the Mark as seen button", error);
        }
    }

    /** Puts the eye over the viewer's window, hidden until a card is held back. */
    static void attach(View view) {
        try {
            View root = view.getRootView();
            if (!(root instanceof FrameLayout)) return;
            FrameLayout window = (FrameLayout) root;
            Eye eye = window.findViewWithTag(VIEW_TAG);
            if (eye == null) {
                eye = new Eye(window.getContext());
                eye.setTag(VIEW_TAG);
                eye.setOnClickListener(StoryEye::clicked);
                float density = window.getResources().getDisplayMetrics().density;
                int size = Math.round(SIZE_DP * density);
                FrameLayout.LayoutParams place = new FrameLayout.LayoutParams(size, size, Gravity.TOP | Gravity.END);
                WindowInsets insets = window.getRootWindowInsets();
                @SuppressWarnings("deprecation") int top = insets == null ? 0 : insets.getSystemWindowInsetTop();
                place.topMargin = top + Math.round(TOP_DP * density);
                place.setMarginEnd(Math.round(END_DP * density));
                window.addView(eye, place);
            }
            shownEye = new WeakReference<>(eye);
            refresh();
        } catch (RuntimeException error) {
            Settings.hookFailed(OWNER, "Can't add the Mark as seen button", error);
        }
    }

    /** The viewer closed: its eye goes, and so does the card it held. */
    static void detach(View view) {
        try {
            View root = view.getRootView();
            Eye eye = root == null ? null : root.findViewWithTag(VIEW_TAG);
            Eye current = shownEye == null ? null : shownEye.get();
            if (current == null || current == eye) {
                shownEye = null;
                held = null;
            }
            if (eye == null) return;
            eye.setVisibility(View.GONE);
            // A closing dialog detaches its whole window in one walk over each parent's children, and taking the eye
            // out in the middle of that walk would leave the window a missing child. It goes once the walk is done,
            // unless the viewer came back and took it again.
            mainHandler().post(() -> {
                Eye now = shownEye == null ? null : shownEye.get();
                if (now != eye && eye.getParent() instanceof ViewGroup) ((ViewGroup) eye.getParent()).removeView(eye);
            });
        } catch (RuntimeException error) {
            Settings.hookFailed(OWNER, "Can't take the Mark as seen button off", error);
        }
    }

    /** Shows the eye for the card on screen: slashed while held back, open once sent. Hidden with nothing held. */
    static void refresh() {
        Eye eye = shownEye == null ? null : shownEye.get();
        if (eye == null) return;
        Held seen = held;
        Object card = seen == null ? null : seen.card.get();
        if (card == null || !shown()) {
            eye.setVisibility(View.GONE);
            return;
        }
        boolean done;
        synchronized (sent) { done = sent.containsKey(card); }
        eye.show(done, label(eye.getContext(), done ? "story_seen_done" : "story_seen"));
        eye.setVisibility(View.VISIBLE);
    }

    static void clicked(View view) {
        try {
            boolean done = markSeen();
            refresh();
            Context context = view.getContext();
            Toast.makeText(context, label(context, done ? "story_seen_done" : "story_seen_nothing"), Toast.LENGTH_SHORT).show();
        } catch (Throwable error) {
            Settings.hookFailed(OWNER, "Can't mark the story seen", error);
        }
    }

    /** Sends the held card's seen through Messenger's own handler. False when no card is held or it was sent already. */
    static boolean markSeen() throws ReflectiveOperationException {
        Held seen = held;
        Object handler = seen == null ? null : seen.handler.get();
        Object card = seen == null ? null : seen.card.get();
        if (handler == null || card == null) return false;
        synchronized (sent) { if (sent.containsKey(card)) return false; }
        Method send = markRead(handler.getClass(), card);
        if (send == null) return false;
        replaying.set(Boolean.TRUE);
        try {
            send.invoke(handler, card, seen.flag);
        } finally {
            replaying.remove();
        }
        synchronized (sent) { sent.put(card, Boolean.TRUE); }
        return true;
    }

    /** The handler's one instance (card, boolean) void method, which the seen hook sits in. Null with none or more. */
    static Method markRead(Class<?> handler, Object card) {
        Method found = null;
        for (Class<?> type = handler; type != null && type != Object.class; type = type.getSuperclass()) {
            for (Method method : type.getDeclaredMethods()) {
                Class<?>[] parameters = method.getParameterTypes();
                if (Modifier.isStatic(method.getModifiers()) || method.isSynthetic() || method.getReturnType() != void.class
                    || parameters.length != 2 || !parameters[0].isInstance(card) || parameters[1] != boolean.class) continue;
                if (found != null) return null;
                found = method;
            }
        }
        if (found != null) found.setAccessible(true);
        return found;
    }

    static String label(Context context, String key) {
        return context == null ? SettingsText.ENGLISH.get(key) : new SettingsText(context).get(key);
    }

    private static Handler mainHandler() {
        Handler handler = main;
        if (handler == null) main = handler = new Handler(Looper.getMainLooper());
        return handler;
    }

    private static void onMain(Runnable work) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            work.run();
            return;
        }
        mainHandler().post(() -> {
            try {
                work.run();
            } catch (RuntimeException error) {
                Settings.hookFailed(OWNER, "Can't show the Mark as seen button", error);
            }
        });
    }

    /** A round eye over the story: slashed while the story's seen is held back, open once it's sent. */
    static final class Eye extends View {
        private final Paint back = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint line = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint pupil = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path outline = new Path();
        boolean done;

        Eye(Context context) {
            super(context);
            back.setColor(0x66000000);
            line.setColor(0xFFFFFFFF);
            line.setStyle(Paint.Style.STROKE);
            line.setStrokeCap(Paint.Cap.ROUND);
            line.setStrokeJoin(Paint.Join.ROUND);
            pupil.setColor(0xFFFFFFFF);
            setClickable(true);
            setFocusable(true);
            setImportantForAccessibility(IMPORTANT_FOR_ACCESSIBILITY_YES);
        }

        void show(boolean done, String label) {
            this.done = done;
            setContentDescription(label);
            setAlpha(done ? 0.6f : 1f);
            invalidate();
        }

        @Override protected void onDraw(Canvas canvas) {
            float w = getWidth(), h = getHeight(), r = Math.min(w, h) / 2f, cx = w / 2f, cy = h / 2f;
            canvas.drawCircle(cx, cy, r, back);
            float half = r * 0.58f, lift = r * 0.62f;
            line.setStrokeWidth(r * 0.11f);
            outline.reset();
            outline.moveTo(cx - half, cy);
            outline.quadTo(cx, cy - lift, cx + half, cy);
            outline.quadTo(cx, cy + lift, cx - half, cy);
            outline.close();
            canvas.drawPath(outline, line);
            canvas.drawCircle(cx, cy, r * 0.17f, pupil);
            if (!done) canvas.drawLine(cx - half * 0.8f, cy - half * 0.8f, cx + half * 0.8f, cy + half * 0.8f, line);
        }
    }
}
