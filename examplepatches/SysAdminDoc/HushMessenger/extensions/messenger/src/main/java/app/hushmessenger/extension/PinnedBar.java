package app.hushmessenger.extension;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/**
 * A bar under a chat's name with the chat's newest pinned message (#213). A tap jumps to the message.
 *
 * Messenger's own pinned bar is a banner msys only writes for the chats it picks, and it never wrote one for an
 * end-to-end encrypted chat on the S22's 588 build, so this bar is Hush's own. It reads the same list See all opens:
 * the patch builds {@link #loadPins}, {@link #pinCount} and {@link #pinRow} from that list's load and the message row
 * getters, and {@link #jumpToPin} from the jump Messenger's own pinned bar asks the chat for. Shipped, they're stubs
 * that answer nothing, so an unpatched or changed build gets no bar.
 *
 * The list is read when the chat opens and whenever its window gets focus back, which is how a menu or the See all
 * sheet closing over it shows up, and once more a moment later, since a pin made from the menu reaches the list after
 * the menu closes. Off, Pause and safe mode take the bar away at the next read and read nothing. Only the count goes to
 * the log, never a message. Public, since the call comes from the chat's own view setup.
 */
public final class PinnedBar {
    static final String KEY = "pinned_bar";
    /** The callback msys answers a load with, in every build. */
    static final String CALLBACK = "com.facebook.msys.mca.MailboxCallback";
    /** How long after the chat gets focus back the list is read again. */
    static final long AGAIN_MS = 1500;
    /** How long apart the bar looks for its place while the chat is still being laid out, and how many times. */
    static final long PLACE_MS = 250;
    static final int PLACE_TRIES = 8;
    private static final String TAG = "HushMessenger";

    private static final Map<View, Boolean> watched = new WeakHashMap<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    /** Where loads start. Messenger's own reads of a chat's lists run off the main thread too. */
    static Executor worker = Executors.newSingleThreadExecutor(task -> {
        Thread thread = new Thread(task, "HushMessenger pinned bar");
        thread.setDaemon(true);
        return thread;
    });
    static Source source = new MessengerSource();

    private PinnedBar() { }

    /** The chat fragment's view, on its way in. Called whether the switch is on or off, so turning it on mid-chat works. */
    public static void chatShown(Object fragment, View view) {
        try {
            watch(fragment, view);
        } catch (Throwable error) {
            Settings.hookFailedPrivately(KEY, "Can't follow the chat for its pinned messages", error);
        }
    }

    static Chat watch(Object fragment, View view) {
        if (fragment == null || view == null || watched.containsKey(view)) return null;
        watched.put(view, true);
        Chat chat = new Chat(fragment, view);
        view.addOnAttachStateChangeListener(chat);
        if (view.isAttachedToWindow()) chat.onViewAttachedToWindow(view);
        return chat;
    }

    /** Whether [view] is a bar this class put in a chat. */
    static boolean isBar(View view) {
        return view instanceof Bar;
    }

    // --- The stubs the patch fills in. ---

    /** Starts the chat's pinned list loading and adds [callback] to its answer, or null for a chat that isn't encrypted. */
    static Object loadPins(Object chat, Object callback) { return null; }

    /** How many pins an answer holds, or -1 when it isn't one. */
    static int pinCount(Object result) { return -1; }

    /** One pin of an answer: its message id, its text (null for an attachment) and its time, boxed. */
    static Object[] pinRow(Object result, int index) { return null; }

    /** Asks the chat to jump to message [id]. */
    static void jumpToPin(Object chat, String id) { }

    // --- Reading the list. ---

    /** One pinned message. */
    static final class Pin {
        final String id, text;
        final long time;

        Pin(String id, String text, long time) {
            this.id = id;
            this.text = text;
            this.time = time;
        }
    }

    /** Gets a chat's pins, on any thread. */
    interface Answer {
        /** The chat's pins, or null when the answer couldn't be read. */
        void pins(List<Pin> pins);
    }

    /** Where the pins come from and where a tap goes. Swapped in tests. */
    interface Source {
        /** Starts reading [chat]'s pins for [answer]. False when the chat has no list to read. */
        boolean load(Object chat, Answer answer) throws Exception;

        void jump(Object chat, String id);
    }

    /** Messenger's own list, through the stubs. */
    static final class MessengerSource implements Source {
        @Override public boolean load(Object chat, Answer answer) throws Exception {
            Class<?> type = Class.forName(CALLBACK, false, PinnedBar.class.getClassLoader());
            Object callback = Proxy.newProxyInstance(type.getClassLoader(), new Class<?>[] {type}, (proxy, method, args) -> {
                switch (method.getName()) {
                    case "equals": return args != null && args.length == 1 && proxy == args[0];
                    case "hashCode": return System.identityHashCode(proxy);
                    case "toString": return "HushMessenger pinned bar";
                    default: break;
                }
                if ("onCompletion".equals(method.getName()) && args != null && args.length == 1) {
                    try {
                        answer.pins(read(args[0]));
                    } catch (Throwable error) {
                        Settings.hookFailedPrivately(KEY, "Can't read the chat's pinned messages", error);
                    }
                }
                return nothing(method.getReturnType());
            });
            return loadPins(chat, callback) != null;
        }

        @Override public void jump(Object chat, String id) {
            jumpToPin(chat, id);
        }

        /** The pins in an answer, or null when it isn't one. */
        static List<Pin> read(Object result) {
            int count = pinCount(result);
            if (count < 0) return null;
            List<Pin> pins = new ArrayList<>();
            for (int i = 0; i < count; i++) {
                Object[] row = pinRow(result, i);
                if (row == null || row.length < 3 || !(row[0] instanceof String) || ((String) row[0]).isEmpty()) continue;
                pins.add(new Pin((String) row[0], row[1] instanceof String ? (String) row[1] : null,
                    row[2] instanceof Long ? (Long) row[2] : 0));
            }
            return pins;
        }

        private static Object nothing(Class<?> type) {
            if (type == boolean.class) return false;
            if (type == int.class || type == short.class || type == byte.class) return 0;
            if (type == long.class) return 0L;
            if (type == float.class) return 0f;
            if (type == double.class) return 0d;
            if (type == char.class) return (char) 0;
            return null;
        }
    }

    /** The pin the bar shows: the newest message among them. */
    static Pin newest(List<Pin> pins) {
        Pin best = null;
        for (Pin pin : pins) if (best == null || pin.time > best.time) best = pin;
        return best;
    }

    // --- The bar. ---

    /** The bar under the chat's name. */
    static final class Bar extends LinearLayout {
        final TextView title, body;
        String id;

        Bar(Context context) {
            super(context);
            SettingsUi ui = new SettingsUi(context, MaterialYouTheme.chatIsLight());
            setOrientation(VERTICAL);
            setLayoutDirection(new SettingsText(context).layoutDirection());
            LinearLayout row = new LinearLayout(context);
            row.setOrientation(HORIZONTAL);
            row.setGravity(Gravity.CENTER_VERTICAL);
            row.setMinimumHeight(ui.dp(48));
            row.setPadding(ui.dp(16), ui.dp(6), ui.dp(16), ui.dp(6));
            View stripe = new View(context);
            stripe.setBackground(ui.shape(ui.accent, 0, 2));
            LinearLayout.LayoutParams stripeAt = new LinearLayout.LayoutParams(ui.dp(3), ui.dp(32));
            stripeAt.setMarginEnd(ui.dp(12));
            row.addView(stripe, stripeAt);
            LinearLayout words = new LinearLayout(context);
            words.setOrientation(VERTICAL);
            title = ui.text("", 12, ui.accent, true);
            title.setSingleLine(true);
            title.setEllipsize(TextUtils.TruncateAt.END);
            body = ui.text("", 14, ui.text, false);
            body.setSingleLine(true);
            body.setEllipsize(TextUtils.TruncateAt.END);
            words.addView(title, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            LinearLayout.LayoutParams bodyAt = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            bodyAt.topMargin = ui.dp(2);
            words.addView(body, bodyAt);
            row.addView(words, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            addView(row, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            View line = new View(context);
            line.setBackgroundColor(ui.line);
            addView(line, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, ui.dp(1) / 2)));
            setBackground(ui.interactive(ui.surface, 0, 0));
            setClickable(true);
            setFocusable(true);
            // Above the messages, which slide under the chat's name when the bars are see-through, but with no shadow.
            setOutlineProvider(null);
            setTranslationZ(ui.dp(1));
            InvisibleButtons.ownView(this);
        }

        void show(Pin pin, int count) {
            SettingsText text = new SettingsText(getContext());
            id = pin.id;
            title.setText(text.count("pinned_bar", count));
            body.setText(pin.text == null || pin.text.trim().isEmpty() ? text.get("pinned_bar_attachment") : pin.text);
        }
    }

    /** One open chat. Held only by its own view's listeners and the loads it started, so it goes when the chat does. */
    static final class Chat implements View.OnAttachStateChangeListener, ViewTreeObserver.OnWindowFocusChangeListener {
        private final Object fragment;
        private final View root;
        private final Runnable again = this::refresh;
        private Bar bar;
        /** The read whose answer counts. An answer to an older one is dropped. */
        private int generation;
        private int loggedCount = -1;
        private boolean saidNotEncrypted, saidNoPlace;

        Chat(Object fragment, View root) {
            this.fragment = fragment;
            this.root = root;
        }

        @Override public void onViewAttachedToWindow(View view) {
            view.getViewTreeObserver().addOnWindowFocusChangeListener(this);
            refresh();
        }

        @Override public void onViewDetachedFromWindow(View view) {
            view.getViewTreeObserver().removeOnWindowFocusChangeListener(this);
            view.removeCallbacks(again);
            generation++;
        }

        @Override public void onWindowFocusChanged(boolean focused) {
            if (!focused) return;
            refresh();
            root.removeCallbacks(again);
            root.postDelayed(again, AGAIN_MS);
        }

        /** Reads the chat's pins again, or takes the bar away with the switch off. */
        void refresh() {
            try {
                int asked = ++generation;
                if (!Settings.wouldUse(KEY)) {
                    hide();
                    return;
                }
                worker.execute(() -> ask(asked));
            } catch (Throwable error) {
                Settings.hookFailedPrivately(KEY, "Can't read the chat's pinned messages", error);
            }
        }

        private void ask(int asked) {
            try {
                if (!source.load(fragment, pins -> MAIN.post(() -> answered(asked, pins, 0))))
                    MAIN.post(() -> notEncrypted(asked));
            } catch (Throwable error) {
                Settings.hookFailedPrivately(KEY, "Can't read the chat's pinned messages", error);
            }
        }

        private void notEncrypted(int asked) {
            if (asked != generation) return;
            hide();
            if (!saidNotEncrypted) android.util.Log.i(TAG, "pinned_bar: not an encrypted chat");
            saidNotEncrypted = true;
        }

        /** The answer to read [asked], on the main thread; [tries] counts the looks for the bar's place. */
        void answered(int asked, List<Pin> pins, int tries) {
            try {
                if (asked != generation || !root.isAttachedToWindow()) return;
                if (pins == null || !Settings.wouldUse(KEY)) {
                    hide();
                    return;
                }
                if (pins.size() != loggedCount) android.util.Log.i(TAG, "pinned_bar: " + pins.size() + " pinned in this chat");
                loggedCount = pins.size();
                if (pins.isEmpty()) {
                    hide();
                    return;
                }
                if (place(newest(pins), pins.size())) return;
                if (tries + 1 < PLACE_TRIES) {
                    root.postDelayed(() -> answered(asked, pins, tries + 1), PLACE_MS);
                } else {
                    if (!saidNoPlace) android.util.Log.i(TAG, "pinned_bar: no place for the bar under the chat's name");
                    saidNoPlace = true;
                }
            } catch (Throwable error) {
                Settings.hookFailedPrivately(KEY, "Can't show the chat's pinned message", error);
            }
        }

        /**
         * Puts the bar right under the chat's top bar, which Messenger keeps in a column with the rest of the chat
         * under it. False while the chat has no top bar laid out, or it sits somewhere else.
         */
        private boolean place(Pin pin, int count) {
            IosBars.Bars bars = IosBars.barsIn(root);
            View top = bars == null ? null : bars.top;
            ViewParent parent = top == null ? null : top.getParent();
            if (!(parent instanceof LinearLayout) || ((LinearLayout) parent).getOrientation() != LinearLayout.VERTICAL) return false;
            LinearLayout column = (LinearLayout) parent;
            boolean fresh = bar == null || bar.getParent() == null;
            if (bar == null) {
                bar = new Bar(root.getContext());
                bar.setOnClickListener(this::tapped);
            }
            if (bar.getParent() != column || column.indexOfChild(bar) != column.indexOfChild(top) + 1) {
                if (bar.getParent() instanceof ViewGroup) ((ViewGroup) bar.getParent()).removeView(bar);
                column.addView(bar, column.indexOfChild(top) + 1,
                    new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
            }
            bar.show(pin, count);
            Settings.enabled(KEY);
            if (fresh) android.util.Log.i(TAG, "pinned_bar: bar shown");
            return true;
        }

        private void tapped(View view) {
            try {
                if (bar == null || bar.id == null || !Settings.enabled(KEY)) return;
                android.util.Log.i(TAG, "pinned_bar: jump to the pinned message");
                source.jump(fragment, bar.id);
            } catch (Throwable error) {
                Settings.hookFailedPrivately(KEY, "Can't jump to the pinned message", error);
            }
        }

        private void hide() {
            if (bar != null && bar.getParent() instanceof ViewGroup) ((ViewGroup) bar.getParent()).removeView(bar);
        }

        Bar bar() {
            return bar;
        }
    }
}
