package dev.jason.gboardpatches.extension.japaneseqwertyglide;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;

import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Future;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.WeakHashMap;

/** Decodes English glide strokes on Gboard Japanese QWERTY ABC through Mozc. */
public final class GboardJapaneseQwertyGlideRuntime {
    static final String TAG = "GboardJaGlide";
    static final int ABC_KEYBOARD_DEF = 0x7f1706ec;
    static final int KANA_KEYBOARD_DEF = 0x7f1706ed;
    static final String BODY_VIEW_TYPE = "BODY";
    static final String GESTURE_HANDLER_CLASS =
            "com.google.android.apps.inputmethod.libs.latin5.handler.LatinGestureMotionEventHandler";
    static final String GESTURE_PREFERENCE_KEY = "enable_gesture_input";
    private static final String GESTURE_HANDLER_SUFFIX = ".LatinGestureMotionEventHandler";
    private static final String SPATIAL_MODEL_SUFFIX = ".SpatialModelMotionEventHandler";
    private static final String HANDLER_CONTEXT_CLASS = "pml";
    private static final String XML_KEYBOARD_SOURCE =
            "com.google.android.libraries.inputmethod.metadata.KeyboardSource$Xml";
    private static final String DELIGHT5_CLASS =
            "com.google.android.apps.inputmethod.libs.delight5.Delight5Facilitator";
    private static final int GESTURE_IN_PROGRESS = -10028;
    private static final int GESTURE_FINAL = -10029;
    private static final int USE_STOCK = -1;
    private static final int FORCE_READY = 1;
    private static final int MAX_FAILURE_LOGS = 5;

    private static final Map<Object, String> JAPANESE_MANAGERS = new WeakHashMap<Object, String>();
    private static final Map<Object, String> LAST_READY_STATE = new WeakHashMap<Object, String>();
    private static final Map<Object, int[]> STROKE_UPDATES = new WeakHashMap<Object, int[]>();
    private static final Map<String, Field> FIELDS = new ConcurrentHashMap<String, Field>();
    private static final AtomicInteger FAILURE_LOGS = new AtomicInteger();
    private static volatile boolean japaneseManagerSeen;
    private static final Map<Object, BridgeState> BRIDGES = new WeakHashMap<Object, BridgeState>();
    private static final Map<Long, DecodeRequest> PENDING = new ConcurrentHashMap<Long, DecodeRequest>();
    private static final Map<Object, CenteredPreview> CENTERED_PREVIEWS = new WeakHashMap<Object, CenteredPreview>();
    private static final long DECODE_TIMEOUT_MS = 10000;
    private static final AtomicLong REQUEST_IDS = new AtomicLong();
    private static final ThreadPoolExecutor DECODE_EXECUTOR = new ThreadPoolExecutor(
            1, 1, 0, TimeUnit.MILLISECONDS, new ArrayBlockingQueue<Runnable>(1), new ThreadFactory() {
                @Override
                public Thread newThread(Runnable task) {
                    Thread worker = new Thread(task, "GboardJaGlideDecoder");
                    worker.setDaemon(true);
                    return worker;
                }
            }, new ThreadPoolExecutor.AbortPolicy());
    private static volatile long inputEpoch;
    private static final ThreadLocal<Boolean> OWN_INPUT = new ThreadLocal<Boolean>();

    private static final class MainThread {
        static final Handler HANDLER = new Handler(Looper.getMainLooper());
    }

    private static final class CenteredPreview implements ViewTreeObserver.OnPreDrawListener {
        final ViewGroup view;
        CenteredPreview(ViewGroup view) {
            this.view = view;
        }
        @Override
        public boolean onPreDraw() {
            centerPreviewChildren(view);
            return true;
        }
        void close() {
            if (view.getViewTreeObserver().isAlive()) view.getViewTreeObserver().removeOnPreDrawListener(this);
            for (int i = 0; i < view.getChildCount(); i++) {
                view.getChildAt(i).setTranslationX(0);
            }
        }
    }

    static void centerPreviewChildren(ViewGroup view) {
        if (view.getChildCount() == 0 || view.getWidth() <= 0) {
            return;
        }
        int left = Integer.MAX_VALUE;
        int right = Integer.MIN_VALUE;
        for (int i = 0; i < view.getChildCount(); i++) {
            View child = view.getChildAt(i);
            left = Math.min(left, child.getLeft());
            right = Math.max(right, child.getRight());
        }
        float offset = right - left <= view.getWidth() ? (view.getWidth() - (right - left)) / 2f - left : 0;
        for (int i = 0; i < view.getChildCount(); i++) {
            view.getChildAt(i).setTranslationX(offset);
        }
    }

    private static void alignPreview(Object keyboard, boolean visible) {
        CenteredPreview previous = CENTERED_PREVIEWS.remove(keyboard);
        if (previous != null) previous.close();
        if (!visible) {
            return;
        }
        try {
            // JapaneseHeaderViewController.p owns the stock header candidate strip.
            Object controller = field(keyboard, "a");
            Object root = controller == null ? null : field(controller, "p");
            if (!(root instanceof View)) {
                return;
            }
            View strip = ((View) root).findViewById(0x7f0b14e8);
            if (!(strip instanceof ViewGroup)) {
                return;
            }
            CenteredPreview centered = new CenteredPreview((ViewGroup) strip);
            CENTERED_PREVIEWS.put(keyboard, centered);
            strip.getViewTreeObserver().addOnPreDrawListener(centered);
        } catch (ReflectiveOperationException failure) {
            logFailure("ABC preview alignment unavailable", failure);
        }
    }

    private static final class BridgeState {
        volatile Object layout;
        volatile long generation;
        volatile long editVersion;
        final ArrayDeque<FinalStroke> finals = new ArrayDeque<FinalStroke>();
        boolean gliding;
        boolean previewBusy;
        boolean previewVisible;
        Object latestTouch;
        volatile Object previewSnapshot;
        long lastPreview;
    }

    private static final class FinalStroke {
        final DecodeRequest request;
        final Object touch;
        FinalStroke(DecodeRequest request, Object touch) {
            this.request = request;
            this.touch = touch;
        }
    }

    private static final class DecodeRequest {
        final Object context;
        final Object manager;
        final Object keyboard;
        final Object editor;
        final Object view;
        final Object layout;
        final long keyboardState;
        final long epoch;
        final long generation;
        final long editVersion;
        final long deadline;
        volatile Future<?> dispatch;

        void cancel() {
            if (dispatch != null) dispatch.cancel(false);
        }

        DecodeRequest(Object context, Object manager, BridgeState bridge)
                throws ReflectiveOperationException {
            this.context = context;
            this.manager = manager;
            keyboard = field(manager, "e");
            editor = field(keyboard, "H");
            view = field(manager, "j");
            layout = bridge.layout;
            keyboardState = ((Number) field(keyboard, "F")).longValue();
            epoch = inputEpoch;
            generation = bridge.generation;
            editVersion = bridge.editVersion;
            deadline = SystemClock.uptimeMillis() + DECODE_TIMEOUT_MS;
        }
    }

    /** Called at every keyboard input activation/deactivation, including Latin keyboards. */
    public static void onInputSessionChanged() {
        inputEpoch++;
        GboardJapaneseQwertyGlideSpacing.reset();
        for (DecodeRequest request : PENDING.values()) {
            request.cancel();
        }
        PENDING.clear();
        synchronized (BRIDGES) {
            for (Map.Entry<Object, BridgeState> entry : BRIDGES.entrySet()) {
                BridgeState bridge = entry.getValue();
                clearPreview(entry.getKey(), bridge);
                bridge.generation++;
                bridge.editVersion++;
                bridge.finals.clear();
                bridge.layout = null;
                bridge.gliding = false;
                bridge.latestTouch = null;
                bridge.previewSnapshot = null;
            }
        }
    }

    private static BridgeState bridge(Object manager) {
        synchronized (BRIDGES) {
            return BRIDGES.get(manager);
        }
    }

    /** Consumes only ABC gesture events; normal keys and layout notifications retain their stock route. */
    public static boolean handleHandlerEvent(Object context, Object event) {
        if (Boolean.TRUE.equals(OWN_INPUT.get())) {
            return false;
        }
        boolean gesture = false;
        try {
            if (context == null || event == null) {
                return false;
            }
            Object manager = field(context, "b");
            BridgeState bridge = bridge(manager);
            if (bridge == null) {
                return false;
            }
            Object[] actions = (Object[]) field(event, "b");
            if (actions == null || actions.length != 1 || actions[0] == null) {
                bridge.generation++;
                bridge.editVersion++;
                GboardJapaneseQwertyGlideSpacing.cancel(manager);
                bridge.gliding = false;
                clearPreview(manager, bridge);
                return false;
            }
            Object action = actions[0];
            int code = ((Number) field(action, "c")).intValue();
            gesture = code == GESTURE_IN_PROGRESS || code == GESTURE_FINAL;
            if (code == -10044) {
                bridge.generation++;
                Object layout = field(action, "e");
                bridge.layout = validAlphabetLayout(layout) ? layout : null;
                Log.i(TAG, "bridge: ABC layout " + (bridge.layout == null ? "rejected" : "accepted"));
                if (bridge.layout != null) {
                    Log.i(TAG, "bridge: geometry " + field(layout, "e") + "x" + field(layout, "f")
                            + ", inputDevice=" + field(layout, "q")
                            + ", devicePresent=" + ((((Number) field(layout, "b")).intValue() & 4096) != 0)
                            + ", group=" + field(layout, "m") + ", layout=" + field(layout, "r"));
                }
                return false;
            }
            if (!gesture) {
                bridge.generation++;
                if (code != 62 && code != 66) {
                    bridge.editVersion++;
                    GboardJapaneseQwertyGlideSpacing.cancel(manager);
                }
                bridge.gliding = false;
                clearPreview(manager, bridge);
                return false;
            }
            observeHandlerEvent(manager, event);
            if (code == GESTURE_IN_PROGRESS) {
                if (!bridge.gliding) {
                    bridge.generation++;
                    bridge.gliding = true;
                    bridge.previewSnapshot = null;
                    bridge.lastPreview = 0;
                }
                bridge.latestTouch = field(action, "e");
                submitPreview(context, manager, bridge);
                return true;
            }
            bridge.gliding = false;
            bridge.generation++;
            bridge.latestTouch = null;
            bridge.previewSnapshot = null;
            clearPreview(manager, bridge);
            submitDecode(context, manager, bridge, field(action, "e"));
            return true;
        } catch (Throwable failure) {
            logFailure("bridge event failed; dropping ABC stroke", failure);
            return gesture;
        }
    }

    private static void clearPreview(Object manager, BridgeState bridge) {
        if (!bridge.previewVisible) {
            return;
        }
        bridge.previewVisible = false;
        try {
            renderPreview(field(manager, "e"), Collections.<String>emptyList());
        } catch (Throwable failure) {
            logFailure("ABC preview cleanup failed", failure);
        }
    }

    private static void submitPreview(final Object context, final Object manager, final BridgeState bridge)
            throws ReflectiveOperationException {
        if (!bridge.gliding || bridge.previewBusy || bridge.latestTouch == null
                || !PENDING.isEmpty() || SystemClock.uptimeMillis() - bridge.lastPreview < 120) return;
        final ClassLoader loader = context.getClass().getClassLoader();
        if (bridge.layout == null) {
            return;
        }
        final Object touch = bridge.latestTouch;
        final DecodeRequest request = new DecodeRequest(context, manager, bridge);
        if (!current(request)) {
            return;
        }
        bridge.previewBusy = true;
        bridge.lastPreview = SystemClock.uptimeMillis();
        final long started = bridge.lastPreview;
        final long id = REQUEST_IDS.incrementAndGet();
        try {
            DECODE_EXECUTOR.execute(new Runnable() {
                @Override
                public void run() {
                    List<String> words = Collections.emptyList();
                    try {
                        if (inputEpoch == request.epoch && bridge.generation == request.generation) {
                            Object snapshot = bridge.previewSnapshot;
                            if (snapshot == null) {
                                snapshot = snapshotFor(request);
                                if (bridge.generation == request.generation) {
                                    bridge.previewSnapshot = snapshot;
                                }
                            }
                            Object diff = GboardJapaneseQwertyGlideDecoder.decodeWithFallback(
                                    loader, applicationContext(request), snapshot, request.layout, touch, id);
                            words = previewWords(diff);
                        }
                    } catch (Throwable failure) {
                        logFailure("ABC preview decode failed", failure);
                    }
                    final List<String> result = words;
                    MainThread.HANDLER.post(new Runnable() {
                        @Override
                        public void run() {
                            bridge.previewBusy = false;
                            try {
                                if (!bridge.gliding || !current(request)) {
                                    return;
                                }
                                if (!result.isEmpty()) {
                                    renderPreview(request.keyboard, result);
                                    bridge.previewVisible = true;
                                    Log.i(TAG, "bridge: live ABC candidates count=" + result.size()
                                            + ", latencyMs=" + (SystemClock.uptimeMillis() - started));
                                }
                                if (bridge.latestTouch != touch) submitPreview(context, manager, bridge);
                            } catch (Throwable failure) {
                                logFailure("ABC preview discarded", failure);
                            }
                        }
                    });
                }
            });
        } catch (RuntimeException failure) {
            bridge.previewBusy = false;
            throw failure;
        }
    }

    static List<String> previewWords(Object diff) throws ReflectiveOperationException {
        List<String> words = new ArrayList<String>();
        if (diff == null) {
            return words;
        }
        Object suggestions = field(diff, "e");
        if (suggestions != null) {
            Object candidates = field(suggestions, "d");
            if (candidates instanceof List) {
                for (Object candidate : (List<?>) candidates) {
                    String word = alphabetWord(field(candidate, "e"));
                    if (word != null && !words.contains(word)) words.add(word);
                    if (words.size() == 3) break;
                }
            }
        }
        if (words.isEmpty()) {
            String word = gestureWord(diff);
            if (word != null) words.add(word);
        }
        return words;
    }

    private static void renderPreview(Object keyboard, List<String> words) throws ReflectiveOperationException {
        alignPreview(keyboard, false);
        ClassLoader loader = keyboard.getClass().getClassLoader();
        Class<?> candidateType = Class.forName("owu", false, loader);
        Class<?> builderType = Class.forName("owr", false, loader);
        List<Object> candidates = new ArrayList<Object>();
        for (String word : words) {
            Object builder = builderType.getConstructor().newInstance();
            builderType.getField("a").set(builder, word);
            candidates.add(invoke(builder, "a", new Class<?>[0]));
        }
        // pkr.c renders candidates only. A null selected candidate avoids auto-selection.
        invoke(keyboard, "c", new Class<?>[] {List.class, candidateType, boolean.class},
                candidates, null, false);
        alignPreview(keyboard, !words.isEmpty());
    }

    private static void submitDecode(Object context, Object manager, BridgeState bridge, final Object touch)
            throws ReflectiveOperationException {
        if (touch == null || bridge.layout == null) {
            return;
        }
        if (bridge.finals.size() >= 8) {
            Log.w(TAG, "bridge: final stroke queue full");
            return;
        }
        bridge.finals.addLast(new FinalStroke(new DecodeRequest(context, manager, bridge), touch));
        dispatchNext(bridge);
    }

    private static void dispatchNext(BridgeState bridge) throws ReflectiveOperationException {
        if (!PENDING.isEmpty()) {
            return;
        }
        FinalStroke next;
        do {
            next = bridge.finals.pollFirst();
            if (next == null) {
                return;
            }
        } while (!currentFinal(next.request));
        final DecodeRequest request = next.request;
        final Object touch = next.touch;
        final ClassLoader loader = request.context.getClass().getClassLoader();
        final long id = REQUEST_IDS.incrementAndGet();
        PENDING.put(id, request);
        Log.i(TAG, "bridge: submitting isolated ABC decode id=" + id);
        MainThread.HANDLER.postDelayed(new Runnable() {
            @Override
            public void run() {
                DecodeRequest expired = PENDING.remove(id);
                if (expired != null) {
                    expired.cancel();
                    resumeFinals(expired);
                }
            }
        }, DECODE_TIMEOUT_MS);
        try {
            Future<?> dispatch = DECODE_EXECUTOR.submit(new Runnable() {
                @Override
                public void run() {
                    try {
                        BridgeState live = bridge(request.manager);
                        if (inputEpoch != request.epoch || PENDING.get(id) != request || live == null
                                || live.editVersion != request.editVersion || live.layout != request.layout) {
                            deliverWord(request, null, id);
                            return;
                        }
                        Object snapshot = snapshotFor(request);
                        Object diff = GboardJapaneseQwertyGlideDecoder.decodeWithFallback(
                                loader, applicationContext(request), snapshot, request.layout, touch, id);
                        String word = gestureWord(diff);
                        Log.i(TAG, "bridge: isolated result id=" + id
                                + ", wordLength=" + (word == null ? 0 : word.length()));
                        deliverWord(request, word, id);
                    } catch (Throwable failure) {
                        logFailure("ABC decode failed", failure);
                        deliverWord(request, null, id);
                    }
                }
            });
            retainFuture(request, id, dispatch);
        } catch (RuntimeException failure) {
            PENDING.remove(id);
            resumeFinals(request);
            throw failure;
        }
    }

    private static Object snapshotFor(DecodeRequest request) throws Exception {
        return GboardJapaneseQwertyGlideDecoder.snapshot(
                request.context.getClass().getClassLoader(), applicationContext(request));
    }

    private static Context applicationContext(DecodeRequest request) throws Exception {
        Object context = field(request.manager, "a");
        if (!(context instanceof Context)) {
            throw new IllegalStateException("Missing keyboard application context");
        }
        Context application = ((Context) context).getApplicationContext();
        return application != null ? application : (Context) context;
    }

    private static void resumeFinals(DecodeRequest request) {
        try {
            BridgeState bridge = bridge(request.manager);
            if (bridge != null) dispatchNext(bridge);
        } catch (Throwable failure) {
            logFailure("ABC queued decode failed", failure);
        }
    }

    private static void deliverWord(final DecodeRequest request, final String word, final long id) {
        MainThread.HANDLER.post(new Runnable() {
            @Override
            public void run() {
                try {
                    if (PENDING.get(id) != request || word == null || !currentFinal(request)) {
                        return;
                    }
                    GboardJapaneseQwertyGlideSpacing.submitPrevious(request.manager, inputEpoch);
                    ClassLoader loader = request.context.getClass().getClassLoader();
                    Class<?> actionType = Class.forName("qbc", false, loader);
                    Object action = actionType.getConstructor(int.class,
                            Class.forName("qbb", false, loader), Object.class, int.class)
                            .newInstance(-10009, null, word, Integer.MAX_VALUE);
                    Class<?> eventType = Class.forName("ohe", false, loader);
                    Object event = eventType.getMethod("d", actionType).invoke(null, action);
                    OWN_INPUT.set(Boolean.TRUE);
                    try {
                        GboardJapaneseQwertyGlideSpacing.beginDelivery(request.manager,
                                request.keyboard, request.editor, inputEpoch);
                        invoke(request.context, "n", new Class<?>[] {eventType}, event);
                    } finally {
                        GboardJapaneseQwertyGlideSpacing.endDelivery();
                        OWN_INPUT.remove();
                    }
                    Log.i(TAG, "bridge: delivered ABC word to Mozc (length=" + word.length() + ")");
                } catch (Throwable failure) {
                    logFailure("ABC result discarded", failure);
                } finally {
                    if (PENDING.remove(id, request)) resumeFinals(request);
                }
            }
        });
    }

    private static void retainFuture(DecodeRequest request, long id, Future<?> future) {
        request.dispatch = future;
        if (inputEpoch != request.epoch || SystemClock.uptimeMillis() >= request.deadline
                || PENDING.get(id) != request) future.cancel(false);
    }

    private static boolean current(DecodeRequest request) throws ReflectiveOperationException {
        BridgeState bridge = bridge(request.manager);
        return request.epoch == inputEpoch && SystemClock.uptimeMillis() < request.deadline
                && bridge != null && bridge.generation == request.generation && bridge.layout == request.layout
                && request.editor != null && request.view != null
                && Boolean.TRUE.equals(field(request.manager, "m"))
                && Boolean.TRUE.equals(field(request.keyboard, "G"))
                && field(request.keyboard, "H") == request.editor
                && field(request.manager, "j") == request.view
                && layoutMatchesView(request.layout, request.view)
                && ((Number) field(request.keyboard, "F")).longValue() == request.keyboardState;
    }

    private static boolean currentFinal(DecodeRequest request) throws ReflectiveOperationException {
        BridgeState bridge = bridge(request.manager);
        return request.epoch == inputEpoch && SystemClock.uptimeMillis() < request.deadline
                && bridge != null && bridge.editVersion == request.editVersion && bridge.layout == request.layout
                && request.editor != null && request.view != null
                && Boolean.TRUE.equals(field(request.manager, "m"))
                && Boolean.TRUE.equals(field(request.keyboard, "G"))
                && field(request.keyboard, "H") == request.editor
                && field(request.manager, "j") == request.view
                && layoutMatchesView(request.layout, request.view);
    }

    static String gestureWord(Object diff) throws ReflectiveOperationException {
        if (diff == null) {
            return null;
        }
        Object text = field(diff, "d");
        // The stock gao proxy applies yvp.e as committed insertion and yvp.h as composing-before-cursor.
        if (text != null) {
            String word = alphabetWord(field(text, "e"));
            if (word != null) {
                return word;
            }
            word = alphabetWord(field(text, "h"));
            if (word != null) {
                return word;
            }
        }
        Object suggestions = field(diff, "e");
        if (suggestions != null) {
            Object candidates = field(suggestions, "d");
            if (candidates instanceof List && !((List<?>) candidates).isEmpty()) {
                return alphabetWord(field(((List<?>) candidates).get(0), "e"));
            }
        }
        return null;
    }

    static String alphabetWord(Object value) {
        if (!(value instanceof String)) {
            return null;
        }
        String word = ((String) value).trim();
        return word.length() <= 64 && word.matches("[A-Za-z]+(?:['-][A-Za-z]+)*") ? word : null;
    }

    static boolean validAlphabetLayout(Object layout) throws ReflectiveOperationException {
        if (layout == null) {
            return false;
        }
        float width = ((Number) field(layout, "e")).floatValue();
        float height = ((Number) field(layout, "f")).floatValue();
        if (!(width > 0 && width < 10000 && height > 0 && height < 10000)) {
            return false;
        }
        Object keys = field(layout, "g");
        if (!(keys instanceof List)) {
            return false;
        }
        int letters = 0;
        for (Object key : (List<?>) keys) {
            int code = ((Number) field(key, "d")).intValue();
            if (code >= 'A' && code <= 'Z') code += 'a' - 'A';
            if (code >= 'a' && code <= 'z') letters |= 1 << (code - 'a');
        }
        return letters == (1 << 26) - 1;
    }

    static boolean layoutMatchesView(Object layout, Object view) throws ReflectiveOperationException {
        if (layout == null || !(view instanceof View)) {
            return false;
        }
        View keyboardView = (View) view;
        return keyboardView.getWidth() > 0 && keyboardView.getHeight() > 0
                && ((Number) field(layout, "e")).floatValue() == keyboardView.getWidth()
                && ((Number) field(layout, "f")).floatValue() == keyboardView.getHeight();
    }

    private static Object facilitator(ClassLoader loader) throws ReflectiveOperationException {
        return Class.forName(DELIGHT5_CLASS, false, loader).getMethod("f").invoke(null);
    }

    private static boolean decoderReady(ClassLoader loader) throws ReflectiveOperationException {
        Object facilitator = facilitator(loader);
        if (facilitator == null) {
            return false;
        }
        Object locale = invoke(facilitator, "n", new Class<?>[0]);
        if (!(locale instanceof Locale) || !"en".equals(((Locale) locale).getLanguage())) {
            return false;
        }
        Object decoder = field(facilitator, "k");
        if (decoder == null || !Boolean.TRUE.equals(invoke(decoder, "t", new Class<?>[0]))) {
            return false;
        }
        return true;
    }

    private static Object invoke(Object target, String name, Class<?>[] types, Object... arguments)
            throws ReflectiveOperationException {
        Method method = target.getClass().getMethod(name, types);
        method.setAccessible(true);
        return method.invoke(target, arguments);
    }

    private GboardJapaneseQwertyGlideRuntime() {
    }

    /** Adds the Latin gesture handler to Japanese QWERTY ABC bodies. */
    public static Object augmentMotionEventHandlers(
            Object manager, Object handlerInfos, Object keyboardDef, Object viewDef, Object keyboard) {
        if (manager == null || !(handlerInfos instanceof Object[])
                || keyboardDef == null || viewDef == null) {
            return handlerInfos;
        }
        try {
            String mode = japaneseMode(keyboardDefResourceIds(keyboardDef));
            if (!"ABC".equals(mode)) {
                return handlerInfos;
            }
            Object[] stock = (Object[]) handlerInfos;
            String viewType = String.valueOf(field(viewDef, "b"));
            Object[] augmented = augmentedHandlerInfos(stock, viewType);
            if (augmented == null) {
                return handlerInfos;
            }
            synchronized (JAPANESE_MANAGERS) {
                JAPANESE_MANAGERS.put(manager, mode);
            }
            japaneseManagerSeen = true;
            synchronized (BRIDGES) {
                BRIDGES.put(manager, new BridgeState());
            }
            Log.i(TAG, "attach: LatinGestureMotionEventHandler declared for Japanese QWERTY "
                    + mode + " (keyboardDef=" + hexIds(keyboardDefResourceIds(keyboardDef))
                    + ", keyboardType=" + field(keyboardDef, "m")
                    + ", keyboardClass=" + field(keyboardDef, "e")
                    + ", host=" + className(keyboard)
                    + ", view=" + viewType
                    + ", handlers " + stock.length + "->" + augmented.length + ")");
            return augmented;
        } catch (Throwable failure) {
            logFailure("attach failed; keeping stock handlers", failure);
            return handlerInfos;
        }
    }

    /** Keeps ABC trails active independently of decoder readiness. */
    public static int overrideGestureReady(Object handler) {
        if (!japaneseManagerSeen || handler == null) {
            if (handler != null) logReadyFallback(handler, "no Japanese manager seen");
            return USE_STOCK;
        }
        try {
            String mode = japaneseModeOfHandler(handler);
            if (mode == null) {
                logReadyFallback(handler, "untracked handler context");
                return USE_STOCK;
            }
            Object manager = field(field(handler, "p"), "b");
            logGestureReadiness(handler, manager, mode);
            return gestureReadyForManager(manager);
        } catch (Throwable failure) {
            logFailure("ready override failed; using stock r()", failure);
            return USE_STOCK;
        }
    }

    static void logGestureReadiness(Object handler, Object manager, String mode) {
        try {
            BridgeState bridge = bridge(manager);
            boolean decodeReady = bridge != null && bridge.layout != null
                    && layoutMatchesView(bridge.layout, field(manager, "j"))
                    && decoderReady(handler.getClass().getClassLoader());
            logReadyStateOnChange(handler, mode, decodeReady);
        } catch (Throwable failure) {
            logFailure("gesture readiness diagnostics failed", failure);
        }
    }

    static int gestureReadyForManager(Object manager) {
        synchronized (JAPANESE_MANAGERS) {
            return "ABC".equals(JAPANESE_MANAGERS.get(manager)) ? FORCE_READY : USE_STOCK;
        }
    }

    /** Uses the ABC keyboard body as the gesture input area; null preserves stock lookup. */
    public static ViewGroup overrideInputArea(Object handler, View view) {
        if (!japaneseManagerSeen || handler == null || !(view instanceof ViewGroup)) {
            return null;
        }
        try {
            String mode = japaneseModeOfHandler(handler);
            if (mode == null) {
                return null;
            }
            ViewGroup root = (ViewGroup) view;
            Log.i(TAG, "bind: LatinGestureMotionEventHandler created on Japanese QWERTY " + mode
                    + "; c() input_area replaced by " + root.getClass().getName()
                    + " (" + root.getWidth() + "x" + root.getHeight()
                    + ", visibility=" + root.getVisibility() + ")");
            return root;
        } catch (Throwable failure) {
            logFailure("input area override failed; using stock c()", failure);
            return null;
        }
    }

    /** Observer, from pml.n(ohe): logs glide events a Japanese-host handler sends to the IME. */
    public static void observeHandlerEvent(Object manager, Object event) {
        if (!japaneseManagerSeen || manager == null || event == null) {
            return;
        }
        try {
            String mode;
            synchronized (JAPANESE_MANAGERS) {
                mode = JAPANESE_MANAGERS.get(manager);
            }
            if (mode == null) {
                return;
            }
            Object[] actions = (Object[]) field(event, "b");
            if (actions == null || actions.length == 0 || actions[0] == null) {
                return;
            }
            int code = ((Integer) field(actions[0], "c")).intValue();
            if (code != GESTURE_IN_PROGRESS && code != GESTURE_FINAL) {
                return;
            }
            boolean hasTouchData = field(actions[0], "e") != null;
            int previousUpdates = recordStroke(manager, code);
            if (code == GESTURE_IN_PROGRESS && previousUpdates == 0) {
                Log.i(TAG, "gesture: start on Japanese QWERTY " + mode
                        + ", sent -10028 to IME (touchData=" + hasTouchData + ")");
            } else if (code == GESTURE_FINAL) {
                Log.i(TAG, "gesture: end on Japanese QWERTY " + mode
                        + ", sent -10029 to IME after " + previousUpdates
                        + " x -10028 (touchData=" + hasTouchData + ")");
            }
        } catch (Throwable failure) {
            logFailure("event observation failed", failure);
        }
    }

    /** XML resource ids of KeyboardDef.d; source kinds without an XML id are skipped. */
    static int[] keyboardDefResourceIds(Object keyboardDef) throws ReflectiveOperationException {
        Object sources = field(keyboardDef, "d");
        if (!(sources instanceof List)) {
            return new int[0];
        }
        List<Integer> ids = new ArrayList<Integer>();
        for (Object source : (List<?>) sources) {
            if (source != null && XML_KEYBOARD_SOURCE.equals(source.getClass().getName())) {
                ids.add(((Number) field(source, "a")).intValue());
            }
        }
        int[] result = new int[ids.size()];
        for (int index = 0; index < result.length; index++) {
            result[index] = ids.get(index);
        }
        return result;
    }

    static String japaneseMode(int[] keyboardDefResourceIds) {
        if (keyboardDefResourceIds == null) {
            return null;
        }
        for (int id : keyboardDefResourceIds) {
            if (id == ABC_KEYBOARD_DEF) {
                return "ABC";
            }
            if (id == KANA_KEYBOARD_DEF) {
                return "kana";
            }
        }
        return null;
    }

    /** Returns a copy with the gesture handler after SpatialModel, or null when nothing changes. */
    static Object[] augmentedHandlerInfos(Object[] infos, String viewType)
            throws ReflectiveOperationException {
        if (!BODY_VIEW_TYPE.equals(viewType)) {
            return null;
        }
        int insertAt = infos.length;
        for (int index = 0; index < infos.length; index++) {
            Object name = infos[index] != null ? field(infos[index], "a") : null;
            if (!(name instanceof String)) {
                continue;
            }
            String handlerClass = (String) name;
            if (handlerClass.endsWith(GESTURE_HANDLER_SUFFIX)) {
                return null;
            }
            if (handlerClass.endsWith(SPATIAL_MODEL_SUFFIX)) {
                insertAt = index + 1;
            }
        }
        Class<?> infoType = infos.getClass().getComponentType();
        Object gestureInfo = infoType
                .getConstructor(String.class, String.class, boolean.class)
                .newInstance(GESTURE_HANDLER_CLASS, GESTURE_PREFERENCE_KEY, false);
        Object[] augmented = (Object[]) Array.newInstance(infoType, infos.length + 1);
        System.arraycopy(infos, 0, augmented, 0, insertAt);
        augmented[insertAt] = gestureInfo;
        System.arraycopy(infos, insertAt, augmented, insertAt + 1, infos.length - insertAt);
        return augmented;
    }

    private static String japaneseModeOfHandler(Object handler) throws ReflectiveOperationException {
        Object context = field(handler, "p");
        if (context == null || !HANDLER_CONTEXT_CLASS.equals(context.getClass().getName())) {
            return null;
        }
        Object manager = field(context, "b");
        synchronized (JAPANESE_MANAGERS) {
            return manager != null ? JAPANESE_MANAGERS.get(manager) : null;
        }
    }

    private static void logReadyStateOnChange(Object handler, String mode, boolean decodeReady) {
        boolean armed = isArmed(handler);
        String delight5 = delight5State(handler);
        boolean stock = armed && "ready".equals(delight5);
        String state = "armed(-20001)=" + armed + ", delight5=" + delight5 + ", decodeReady=" + decodeReady
                + readinessDiagnostics(handler);
        synchronized (LAST_READY_STATE) {
            if (state.equals(LAST_READY_STATE.get(handler))) {
                return;
            }
            LAST_READY_STATE.put(handler, state);
        }
        Log.i(TAG, "ready: r() -> true (Japanese QWERTY " + mode
                + "); stock would be " + stock + " [" + state + "]");
    }

    private static void logReadyFallback(Object handler, String reason) {
        try {
            Object context = field(handler, "p");
            String state = "stock fallback: " + reason + ", context=" + className(context)
                    + readinessDiagnostics(handler);
            synchronized (LAST_READY_STATE) {
                if (state.equals(LAST_READY_STATE.get(handler))) {
                    return;
                }
                LAST_READY_STATE.put(handler, state);
            }
            Log.i(TAG, "ready: " + state);
        } catch (Throwable failure) {
            logFailure("ready fallback diagnostics failed", failure);
        }
    }

    private static String readinessDiagnostics(Object handler) {
        StringBuilder details = new StringBuilder();
        Object layout = null;
        try {
            Object manager = field(field(handler, "p"), "b");
            BridgeState bridge = bridge(manager);
            layout = bridge != null ? bridge.layout : null;
            details.append(", trackedBridge=").append(bridge != null)
                    .append(", layoutPresent=").append(layout != null);
            Object view = field(manager, "j");
            details.append(", view=");
            if (view instanceof View) {
                details.append(((View) view).getWidth()).append('x').append(((View) view).getHeight());
            } else {
                details.append(view == null ? "null" : "not-View");
            }
        } catch (Throwable failure) {
            details.append(", bridgeProbe=").append(probeFailure(failure));
        }
        try {
            details.append(", layout=");
            if (layout == null) {
                details.append("null");
            } else {
                details.append(field(layout, "e")).append('x').append(field(layout, "f"));
            }
        } catch (Throwable failure) {
            details.append(probeFailure(failure));
        }
        Object facilitator = null;
        Object decoder = null;
        try {
            facilitator = facilitator(handler.getClass().getClassLoader());
            details.append(", facilitatorPresent=").append(facilitator != null);
        } catch (Throwable failure) {
            details.append(", facilitatorProbe=").append(probeFailure(failure));
        }
        try {
            Object locale = facilitator != null ? invoke(facilitator, "n", new Class<?>[0]) : null;
            details.append(", primaryLocale=").append(locale instanceof Locale
                    ? ((Locale) locale).toLanguageTag() : locale == null ? "null" : "not-Locale");
        } catch (Throwable failure) {
            details.append(", primaryLocale=").append(probeFailure(failure));
        }
        try {
            decoder = facilitator != null ? field(facilitator, "k") : null;
            details.append(", decoderPresent=").append(decoder != null);
            details.append(", decoderReady=").append(decoder != null
                    ? invoke(decoder, "t", new Class<?>[0]) : "unavailable");
        } catch (Throwable failure) {
            details.append(", decoderProbe=").append(probeFailure(failure));
        }
        try {
            Object proxy = decoder != null ? field(decoder, "y") : null;
            details.append(", proxyPresent=").append(proxy != null);
            details.append(", proxyValid=").append(proxy != null ? field(proxy, "f") : "unavailable");
        } catch (Throwable failure) {
            details.append(", proxyProbe=").append(probeFailure(failure));
        }
        details.append(", pendingDecodes=").append(PENDING.size());
        return details.toString();
    }

    private static String probeFailure(Throwable failure) {
        return "probe-failed(" + failure.getClass().getSimpleName() + ")";
    }

    private static boolean isArmed(Object handler) {
        try {
            Object armed = field(handler, "k");
            return armed instanceof AtomicBoolean && ((AtomicBoolean) armed).get();
        } catch (Throwable failure) {
            return false;
        }
    }

    private static String delight5State(Object handler) {
        try {
            Class<?> facilitatorType =
                    Class.forName(DELIGHT5_CLASS, false, handler.getClass().getClassLoader());
            Object facilitator = facilitatorType.getMethod("f").invoke(null);
            if (facilitator == null) {
                return "null";
            }
            Object readiness = field(facilitator, "k");
            if (readiness == null) {
                return "no-readiness";
            }
            Method isReady = readiness.getClass().getMethod("t");
            return Boolean.TRUE.equals(isReady.invoke(readiness)) ? "ready" : "not-ready";
        } catch (Throwable failure) {
            return "probe-failed(" + failure.getClass().getSimpleName() + ")";
        }
    }

    private static int recordStroke(Object manager, int code) {
        synchronized (STROKE_UPDATES) {
            int[] updates = STROKE_UPDATES.get(manager);
            if (updates == null) {
                updates = new int[1];
                STROKE_UPDATES.put(manager, updates);
            }
            int previous = updates[0];
            updates[0] = code == GESTURE_FINAL ? 0 : previous + 1;
            return previous;
        }
    }

    private static Object field(Object target, String name) throws ReflectiveOperationException {
        Class<?> type = target instanceof Class ? (Class<?>) target : target.getClass();
        String key = type.getName() + '#' + name;
        Field field = FIELDS.get(key);
        if (field == null) {
            field = findField(type, name);
            field.setAccessible(true);
            FIELDS.put(key, field);
        }
        return field.get(target instanceof Class ? null : target);
    }

    private static Field findField(Class<?> type, String name) throws NoSuchFieldException {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                return current.getDeclaredField(name);
            } catch (NoSuchFieldException ignored) {
                // Continue with the superclass.
            }
        }
        throw new NoSuchFieldException(type.getName() + "." + name);
    }

    private static String hexIds(int[] ids) {
        StringBuilder builder = new StringBuilder();
        for (int id : ids) {
            if (builder.length() > 0) {
                builder.append(',');
            }
            builder.append("0x").append(Integer.toHexString(id));
        }
        return builder.toString();
    }

    private static String className(Object value) {
        return value != null ? value.getClass().getName() : "null";
    }

    private static void logFailure(String message, Throwable failure) {
        int count = FAILURE_LOGS.incrementAndGet();
        if (count <= MAX_FAILURE_LOGS) {
            Log.w(TAG, message, failure);
        } else if (count == MAX_FAILURE_LOGS + 1) {
            Log.w(TAG, "further runtime failures suppressed");
        }
    }
}
