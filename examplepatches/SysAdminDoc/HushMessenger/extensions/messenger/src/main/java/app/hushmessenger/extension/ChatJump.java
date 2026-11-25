package app.hushmessenger.extension;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.DecelerateInterpolator;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

/**
 * Jump to the first message or a date (#130). A long press on the chat's name in its top bar asks where to go, and a
 * tap on one of the dates between the messages opens the day picker on that day (#177).
 * Messenger loads a chat a page at a time and its list's own methods are renamed, so the jump pages the list back
 * through the View API the list overrides (scrollBy, canScrollVertically and the accessibility row count), with a
 * count and Cancel on screen, until older messages stop coming or the day turns up. The chat fragment hands its view
 * over from onViewCreated. The long press is read off the window's callback, so Messenger's top bar stays as it was.
 * Public, since the call comes from Messenger's own chat fragment in another package.
 */
public final class ChatJump {
    static final String KEY = "chat_jump";
    /** Page up and down buttons over the chat, a switch under this one (#207). */
    static final String PAGES = "chat_page_buttons";
    /** How much of the list a page moves, leaving the last lines in sight so you don't lose your place. */
    static final float PAGE_SHARE = 0.85f;
    static final long PAGE_MS = 220;
    static final long TICK_MS = 450;
    /** Looks at the very top with the count unchanged before the chat counts as fully loaded. */
    static final int STALL_LOOKS = 8;
    /** Looks without one readable date before a date jump gives up. */
    static final int DATELESS_LOOKS = 5;
    /** Half-screen steps forward a date jump takes from where it went past the day. */
    static final int SEEK_LOOKS = 80;
    static final String LIST = "androidx.recyclerview.widget.RecyclerView";
    /** 2004-01-01. Nothing in a Messenger chat is older. */
    static final long EARLIEST = 1072915200000L;
    static final long DAY = 86_400_000L;
    static final int WALK_DEPTH = 7;
    static final int WALK_OBJECTS = 1500;
    static final int WALK_ITEMS = 50;

    enum Outcome { START, FOUND, NEXT_DAY, NOTHING_AFTER, NO_DATES, CANCELLED, LOST }

    /** Where to go: 0 for the first message, otherwise local midnight of the day picked. */
    interface Target {
        void jump(long day);
    }

    /** How the question is put on screen. Tests swap it for one that answers straight away. */
    interface Chooser {
        void choose(Context context, Target target);
    }

    /** How the day is asked for, starting at [day], or at today when that's 0. Tests swap it. */
    interface Picker {
        void pick(Context context, long day, Target target);
    }

    static volatile Chooser chooser = ChatJump::choose;
    static volatile Picker picker = ChatJump::pickDay;

    /** Chat views Messenger has shown. Only touched on the main thread. */
    private static final List<WeakReference<View>> chats = new ArrayList<>();
    /** The arrow on each chat on screen, so one chat only ever gets one. Only touched on the main thread. */
    private static final Map<View, Arrow> arrows = new IdentityHashMap<>();
    static Jump running;

    private ChatJump() { }

    /** The chat fragment's view is ready. Watches its window for a long press on the chat's name. Never throws. */
    public static void chatShown(Object fragment, View view) {
        try {
            if (view == null || !Settings.enabled(KEY)) return;
            if (remember(view)) {
                view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                    @Override public void onViewAttachedToWindow(View attached) {
                        try {
                            watch(attached);
                        } catch (Throwable error) {
                            Settings.hookFailed(KEY, "Can't watch the chat for a jump", error);
                        }
                        showArrow(attached);
                    }

                    @Override public void onViewDetachedFromWindow(View detached) {
                        hideArrow(detached);
                        Jump jump = running;
                        if (jump != null && jump.chat == detached) jump.lose();
                    }
                });
            }
            if (view.isAttachedToWindow()) {
                watch(view);
                showArrow(view);
            }
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't watch the chat for a jump", error);
        }
    }

    /** Keeps [view] among the chats, and says whether it's new. */
    private static boolean remember(View view) {
        for (Iterator<WeakReference<View>> it = chats.iterator(); it.hasNext(); ) {
            View known = it.next().get();
            if (known == null) it.remove();
            else if (known == view) return false;
        }
        chats.add(new WeakReference<>(view));
        return true;
    }

    /** Puts our window callback in front of the chat's activity once. */
    static void watch(View chat) {
        Activity activity = activity(chat.getContext());
        if (activity == null) return;
        Window window = activity.getWindow();
        Window.Callback current = window.getCallback();
        if (current == null || watching(current) != null) return;
        window.setCallback((Window.Callback) Proxy.newProxyInstance(ChatJump.class.getClassLoader(),
            new Class<?>[]{Window.Callback.class}, new Watching(window, current)));
    }

    static Activity activity(Context context) {
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    /**
     * Shows [dialog] over the chat [context] belongs to. A chat head draws from Messenger's own chat head service,
     * where no activity holds a window a dialog can hang on, so the dialog goes up over other apps the way the chat
     * head itself does. Without this nothing reached the screen there and whatever the dialog was asking went ahead
     * unasked (#172). Every question Hush asks over a chat comes through here, so this is also where each one takes
     * Hush's own look instead of the platform's flat alert sheet (#179).
     */
    static void showOverChat(Dialog dialog, Context context) {
        if (activity(context) == null) {
            Window window = dialog.getWindow();
            if (window != null) window.setType(WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY);
        }
        ChatDialogs.dress(dialog);
        dialog.show();
        ChatDialogs.dressButtons(dialog);
    }

    /** The watcher behind [callback] when it's ours, else null. */
    static Watching watching(Object callback) {
        if (callback == null || !Proxy.isProxyClass(callback.getClass())) return null;
        InvocationHandler handler = Proxy.getInvocationHandler(callback);
        return handler instanceof Watching ? (Watching) handler : null;
    }

    /** The deepest view under (x, y) on screen that looks like a chat's name, trying the topmost child first. */
    static View titleAt(View view, int x, int y) {
        if (view.getVisibility() != View.VISIBLE || !contains(view, x, y)) return null;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = group.getChildCount() - 1; i >= 0; i--) {
                View found = titleAt(group.getChildAt(i), x, y);
                if (found != null) return found;
            }
        }
        return isTitle(view) ? view : null;
    }

    /** A wide tappable view with a spoken name, like the chat's name button. Square ones are the back and call buttons. */
    static boolean isTitle(View view) {
        if (view instanceof EditText || !(view.isClickable() || view.isLongClickable())) return false;
        int width = view.getWidth(), height = view.getHeight();
        if (height <= 0 || width * 4 < height * 5) return false;
        return !TextUtils.isEmpty(description(view));
    }

    private static CharSequence description(View view) {
        CharSequence said = view.getContentDescription();
        if (!TextUtils.isEmpty(said)) return said;
        AccessibilityNodeInfo info = view.createAccessibilityNodeInfo();
        try {
            return info.getContentDescription();
        } finally {
            info.recycle();
        }
    }

    /**
     * The shown chat [title] heads: it sits in the chat's top quarter, or right above the chat. Never a message, since
     * a long press there is Messenger's message menu.
     */
    static View chatFor(View title) {
        for (Object parent = title.getParent(); parent instanceof View; parent = ((View) parent).getParent()) {
            if (isList(parent.getClass())) return null;
        }
        Rect name = screenRect(title);
        for (WeakReference<View> held : chats) {
            View chat = held.get();
            if (chat == null || !chat.isShown() || chat.getRootView() != title.getRootView()) continue;
            Rect area = screenRect(chat);
            if (name.centerX() < area.left || name.centerX() >= area.right) continue;
            if (inside(title, chat) ? name.centerY() < area.top + area.height() / 4
                : name.bottom <= area.top + 1 && name.bottom >= area.top - name.height()) return chat;
        }
        return null;
    }

    private static boolean inside(View view, View ancestor) {
        for (Object parent = view.getParent(); parent != null; parent = ((android.view.ViewParent) parent).getParent()) {
            if (parent == ancestor) return true;
        }
        return false;
    }

    private static boolean contains(View view, int x, int y) {
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        return x >= at[0] && y >= at[1] && x < at[0] + view.getWidth() && y < at[1] + view.getHeight();
    }

    private static Rect screenRect(View view) {
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        return new Rect(at[0], at[1], at[0] + view.getWidth(), at[1] + view.getHeight());
    }

    /** The chat's message list: the largest shown list in it. */
    static View listIn(View chat) {
        View best = null;
        ArrayDeque<View> todo = new ArrayDeque<>();
        todo.add(chat);
        while (!todo.isEmpty()) {
            View view = todo.poll();
            if (!view.isShown()) continue;
            if (isList(view.getClass()) && (best == null || area(view) > area(best))) best = view;
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) todo.add(group.getChildAt(i));
            }
        }
        return best;
    }

    /**
     * The day a tap at (x, y) landed on in [chat]'s message list, or 0 when it landed anywhere else. The dates between
     * a chat's messages are rows nothing listens to, so a tap on one does nothing in Messenger today and the day it
     * names is read off the row the same way the jump reads a message's own send time (#177). A row that takes taps,
     * a message among them, is left to Messenger.
     */
    static long dateAt(View chat, int x, int y) {
        // The arrow floats over the messages, so the row under it keeps its hands off that touch.
        Arrow arrow = arrows.get(chat);
        if (arrow != null && arrow.holds(x, y)) return 0;
        View list = listIn(chat);
        if (list == null || !contains(list, x, y)) return 0;
        View row = rowAt(list, x, y);
        if (row == null || listens(row)) return 0;
        return times(Collections.singletonList(row), System.currentTimeMillis(), new HashMap<>())[0];
    }

    /** The row of [list] under (x, y), topmost first, or null. */
    static View rowAt(View list, int x, int y) {
        if (!(list instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) list;
        for (int i = group.getChildCount() - 1; i >= 0; i--) {
            View row = group.getChildAt(i);
            if (row.getVisibility() == View.VISIBLE && contains(row, x, y)) return row;
        }
        return null;
    }

    /** Whether [row] or anything in it answers a tap, in which case that touch stays Messenger's. */
    static boolean listens(View row) {
        if (row.isClickable() || row.isLongClickable()) return true;
        if (row instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) row;
            for (int i = 0; i < group.getChildCount(); i++) {
                if (listens(group.getChildAt(i))) return true;
            }
        }
        return false;
    }

    static boolean isList(Class<?> type) {
        for (; type != null; type = type.getSuperclass()) {
            if (LIST.equals(type.getName())) return true;
        }
        return false;
    }

    private static long area(View view) {
        return (long) view.getWidth() * view.getHeight();
    }

    /** Starts a jump in [chat], stopping one already going. */
    static void start(View chat, long day) {
        Jump old = running;
        if (old != null) old.stop(Outcome.CANCELLED);
        View list = listIn(chat);
        if (list == null) {
            Toast.makeText(chat.getContext(), new SettingsText(chat.getContext()).get("chat_jump_no_list"), Toast.LENGTH_SHORT).show();
            return;
        }
        Jump jump = new Jump(chat, new Loader(new ListSource(list), day));
        running = jump;
        try {
            jump.start();
        } catch (RuntimeException | Error error) {
            // A bar that never showed would stay running, holding the chat and its screen until the next jump.
            jump.stop(Outcome.LOST);
            throw error;
        }
    }

    /** Asks where to go, then for the day when it's a date. */
    private static void choose(Context context, Target target) {
        SettingsText text = new SettingsText(context);
        showOverChat(new AlertDialog.Builder(context, MaterialYouTheme.chatDialogTheme())
            .setTitle(text.get("chat_jump_title"))
            .setItems(new CharSequence[]{text.get("chat_jump_first"), text.get("chat_jump_date")}, (dialog, which) -> {
                try {
                    if (which == 0) target.jump(0);
                    else picker.pick(context, 0, target);
                } catch (Throwable error) {
                    Settings.hookFailed(KEY, "Can't start the jump", error);
                }
            })
            .create(), context);
    }

    /** The day picker, open on [day] or on today when that's 0, and never past today. */
    static void pickDay(Context context, long day, Target target) {
        Calendar today = Calendar.getInstance();
        Calendar open = Calendar.getInstance();
        if (day > 0) open.setTimeInMillis(Math.min(day, today.getTimeInMillis()));
        DatePickerDialog dialog = new DatePickerDialog(context, MaterialYouTheme.chatDialogTheme(),
            (view, year, month, picked) -> {
                try {
                    target.jump(midnight(year, month, picked));
                } catch (Throwable error) {
                    Settings.hookFailed(KEY, "Can't start the jump", error);
                }
            }, open.get(Calendar.YEAR), open.get(Calendar.MONTH), open.get(Calendar.DAY_OF_MONTH));
        dialog.getDatePicker().setMaxDate(today.getTimeInMillis());
        showOverChat(dialog, context);
    }

    /** Local midnight at the start of the day. [month] counts from 0, like the picker's. */
    static long midnight(int year, int month, int day) {
        Calendar calendar = Calendar.getInstance();
        calendar.clear();
        calendar.set(year, month, day);
        return calendar.getTimeInMillis();
    }

    /** One row of the list on screen: where it starts, and when its message was sent (0 when that can't be read). */
    static final class Row {
        final int top;
        final long time;

        Row(int top, long time) {
            this.top = top;
            this.time = time;
        }
    }

    /** The list as the pager sees it. */
    interface Source {
        /** The rows Messenger has loaded, or -1 when the list won't say. */
        int count();

        boolean atStart();

        boolean atEnd();

        /** Moves toward older messages. */
        void older();

        /** Moves toward newer messages. */
        void newer();

        /** The rows on screen, top to bottom. */
        List<Row> rows();

        /** Puts [row] at the top of the list. */
        void scrollTo(Row row);
    }

    /**
     * Pages a chat back one look at a time. Toward the first message it scrolls until the list is at the top and its
     * count has stopped growing. Toward a day it scrolls back until a message older than the day shows, then steps
     * forward to the first message on or after it.
     */
    static final class Loader {
        final Source source;
        final long day;
        final long dayEnd;
        boolean seeking;
        private boolean sawDate;
        private int looks, stalls, seeks;
        private int lastCount = Integer.MIN_VALUE;

        Loader(Source source, long day) {
            this.source = source;
            this.day = day;
            Calendar next = Calendar.getInstance();
            next.setTimeInMillis(day);
            next.add(Calendar.DAY_OF_MONTH, 1);
            this.dayEnd = next.getTimeInMillis();
        }

        /** The last count the list gave, or -1. */
        int count() {
            return lastCount == Integer.MIN_VALUE ? -1 : lastCount;
        }

        /** One look: moves the list on, and returns where it ended or null to look again. */
        Outcome tick() {
            looks++;
            if (seeking) return seek();
            if (day > 0) {
                long oldest = oldest(source.rows());
                if (oldest > 0) {
                    sawDate = true;
                    if (oldest < day) {
                        seeking = true;
                        return seek();
                    }
                } else if (!sawDate && looks >= DATELESS_LOOKS) {
                    return Outcome.NO_DATES;
                }
            }
            int count = source.count();
            if (source.atStart()) {
                stalls = count == lastCount ? stalls + 1 : 0;
                lastCount = count;
                if (stalls >= STALL_LOOKS) {
                    if (day <= 0) return Outcome.START;
                    seeking = true;
                    return seek();
                }
            } else {
                stalls = 0;
                lastCount = count;
            }
            // At the top this nudges Messenger, which loads older messages as the list is pulled.
            source.older();
            return null;
        }

        private Outcome seek() {
            for (Row row : source.rows()) {
                if (row.time < day) continue;
                source.scrollTo(row);
                return row.time < dayEnd ? Outcome.FOUND : Outcome.NEXT_DAY;
            }
            if (source.atEnd() || ++seeks > SEEK_LOOKS) return Outcome.NOTHING_AFTER;
            source.newer();
            return null;
        }

        private static long oldest(List<Row> rows) {
            long oldest = 0;
            for (Row row : rows) {
                if (row.time > 0 && (oldest == 0 || row.time < oldest)) oldest = row.time;
            }
            return oldest;
        }
    }

    /** Messenger's message list, through the View methods it overrides. */
    static final class ListSource implements Source {
        final View list;
        private final Map<Class<?>, Field[]> fields = new HashMap<>();

        ListSource(View list) {
            this.list = list;
        }

        @Override public int count() {
            AccessibilityNodeInfo info = list.createAccessibilityNodeInfo();
            try {
                AccessibilityNodeInfo.CollectionInfo collection = info.getCollectionInfo();
                return collection != null ? collection.getRowCount() : -1;
            } finally {
                info.recycle();
            }
        }

        @Override public boolean atStart() {
            return !list.canScrollVertically(-1);
        }

        @Override public boolean atEnd() {
            return !list.canScrollVertically(1);
        }

        @Override public void older() {
            list.scrollBy(0, -3 * Math.max(1, list.getHeight()));
        }

        @Override public void newer() {
            list.scrollBy(0, Math.max(1, list.getHeight() / 2));
        }

        @Override public List<Row> rows() {
            List<View> views = new ArrayList<>();
            if (list instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) list;
                for (int i = 0; i < group.getChildCount(); i++) {
                    View child = group.getChildAt(i);
                    if (child.getVisibility() == View.VISIBLE) views.add(child);
                }
            }
            Collections.sort(views, (a, b) -> Integer.compare(a.getTop(), b.getTop()));
            long[] times = times(views, System.currentTimeMillis(), fields);
            List<Row> rows = new ArrayList<>(views.size());
            for (int i = 0; i < views.size(); i++) rows.add(new Row(views.get(i).getTop(), times[i]));
            return rows;
        }

        @Override public void scrollTo(Row row) {
            list.scrollBy(0, row.top - list.getPaddingTop() - covered(list));
        }
    }

    /**
     * How far down from its top edge the list is hidden under views drawn over it, like the "A reminder about deleted
     * messages" card some chats lay across their first screen. A row put at the very top would land under it. Cards
     * stacked one under another add up. A layer taller than half the list only counts through what's inside it.
     */
    static int covered(View list) {
        int[] at = new int[2];
        list.getLocationOnScreen(at);
        int x = at[0] + list.getWidth() / 2, top = at[1] + list.getPaddingTop(), edge = top;
        List<View> above = above(list);
        for (int card = 0; card < 4; card++) {
            int below = edge;
            for (View view : above) below = Math.max(below, bottomOver(view, x, edge, list.getHeight() / 2));
            if (below == edge) break;
            edge = below;
        }
        return edge - top;
    }

    /**
     * The views drawn on top of [view] in each of its parents. A parent draws its children by Z, then in order, so a
     * sibling counts when it's raised higher or level and later. A card added ahead of the list's frame, such as the
     * reminder card, can be lifted over it with elevation.
     */
    private static List<View> above(View view) {
        List<View> above = new ArrayList<>();
        View child = view;
        for (Object parent = view.getParent(); parent instanceof ViewGroup; parent = ((ViewGroup) parent).getParent()) {
            ViewGroup group = (ViewGroup) parent;
            int at = group.indexOfChild(child);
            float z = child.getZ();
            for (int i = 0; i < group.getChildCount(); i++) {
                View sibling = group.getChildAt(i);
                if (i != at && (sibling.getZ() > z || (sibling.getZ() == z && i > at))) above.add(sibling);
            }
            child = group;
        }
        return above;
    }

    /** The lowest screen edge of a shown view at (x, y) inside [view], no taller than [tallest], or y when none is. */
    private static int bottomOver(View view, int x, int y, int tallest) {
        if (view.getVisibility() != View.VISIBLE || view.getAlpha() <= 0f) return y;
        int[] at = new int[2];
        view.getLocationOnScreen(at);
        if (x < at[0] || x >= at[0] + view.getWidth() || y < at[1] || y >= at[1] + view.getHeight()) return y;
        if (view.getHeight() <= tallest) return at[1] + view.getHeight();
        int bottom = y;
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                bottom = Math.max(bottom, bottomOver(group.getChildAt(i), x, y, tallest));
            }
        }
        return bottom;
    }

    /**
     * When each row's message was sent, read out of whatever Messenger keeps behind the row, or 0. Each row gives the
     * epoch times found nearest to it. A time most rows share belongs to the chat, not a message, so it's dropped.
     * A row with several times keeps the earliest, which is when it was sent.
     */
    static long[] times(List<View> rows, long now, Map<Class<?>, Field[]> cache) {
        List<Set<Long>> found = new ArrayList<>(rows.size());
        Map<Long, Integer> shared = new HashMap<>();
        for (View row : rows) {
            Set<Long> values = candidates(row, now, cache);
            found.add(values);
            for (Long value : values) shared.merge(value, 1, Integer::sum);
        }
        long[] times = new long[rows.size()];
        for (int i = 0; i < rows.size(); i++) {
            for (Long value : found.get(i)) {
                if (rows.size() >= 4 && shared.get(value) * 2 > rows.size()) continue;
                if (times[i] == 0 || value < times[i]) times[i] = value;
            }
        }
        return times;
    }

    /** The epoch times nearest to [row]: a breadth-first walk over its fields, its tag, its holder and its children. */
    static Set<Long> candidates(View row, long now, Map<Class<?>, Field[]> cache) {
        long latest = now + DAY;
        Set<Long> found = new TreeSet<>();
        IdentityHashMap<Object, Boolean> seen = new IdentityHashMap<>();
        ArrayDeque<Object> todo = new ArrayDeque<>();
        ArrayDeque<Integer> depths = new ArrayDeque<>();
        seen.put(row, true);
        todo.add(row);
        depths.add(0);
        int foundAt = -1;
        while (!todo.isEmpty()) {
            Object object = todo.poll();
            int depth = depths.poll();
            if (foundAt >= 0 && depth > foundAt) break;
            List<Object> next = new ArrayList<>();
            if (object instanceof View) {
                View view = (View) object;
                next.add(view.getTag());
                next.add(view.getLayoutParams());
                if (view instanceof ViewGroup) {
                    ViewGroup group = (ViewGroup) view;
                    for (int i = 0; i < group.getChildCount() && i < WALK_ITEMS; i++) next.add(group.getChildAt(i));
                }
            }
            if (object instanceof Object[]) {
                Object[] items = (Object[]) object;
                for (int i = 0; i < items.length && i < WALK_ITEMS; i++) next.add(items[i]);
            } else if (object instanceof Collection || object instanceof Map) {
                items(object instanceof Map ? ((Map<?, ?>) object).values() : (Collection<?>) object, next);
            } else {
                fields(object, cache, next);
            }
            for (Object value : next) {
                if (value instanceof Long) {
                    long time = (Long) value;
                    if (time >= EARLIEST && time <= latest) {
                        found.add(time);
                        foundAt = depth;
                    }
                } else if (depth < WALK_DEPTH && walkable(value, row) && seen.size() < WALK_OBJECTS && seen.put(value, true) == null) {
                    todo.add(value);
                    depths.add(depth + 1);
                }
            }
        }
        return found;
    }

    private static void items(Collection<?> items, List<Object> next) {
        try {
            int taken = 0;
            for (Object item : items) {
                if (taken++ >= WALK_ITEMS) break;
                next.add(item);
            }
        } catch (RuntimeException changing) {
            // A collection Messenger is changing right now: what was read so far is enough.
        }
    }

    /** The values of [object]'s own fields, longs boxed, for every class of it that isn't the platform's. */
    private static void fields(Object object, Map<Class<?>, Field[]> cache, List<Object> next) {
        for (Class<?> type = object.getClass(); type != null && !platform(type.getName()); type = type.getSuperclass()) {
            Field[] declared = cache.get(type);
            if (declared == null) {
                declared = readable(type);
                cache.put(type, declared);
            }
            for (Field field : declared) {
                try {
                    next.add(field.getType() == long.class ? (Object) field.getLong(object) : field.get(object));
                } catch (IllegalAccessException | RuntimeException unreadable) {
                    // One field that won't read doesn't stop the walk.
                }
            }
        }
    }

    private static Field[] readable(Class<?> type) {
        List<Field> kept = new ArrayList<>();
        try {
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers())) continue;
                Class<?> kind = field.getType();
                if (kind.isPrimitive() && kind != long.class) continue;
                field.setAccessible(true);
                kept.add(field);
            }
        } catch (LinkageError | RuntimeException missing) {
            // A class whose field types aren't all loadable has nothing to give.
        }
        return kept.toArray(new Field[0]);
    }

    static boolean platform(String name) {
        return name.startsWith("android.") || name.startsWith("java.") || name.startsWith("javax.")
            || name.startsWith("kotlin.") || name.startsWith("dalvik.") || name.startsWith("libcore.")
            || name.startsWith("sun.") || name.startsWith("com.android.");
    }

    /** Worth walking into. Views only when they're inside the row, so the walk never climbs into other rows. */
    private static boolean walkable(Object value, View row) {
        if (value == null || value instanceof CharSequence || value instanceof Number || value instanceof Boolean
            || value instanceof Character || value instanceof Class || value instanceof Enum || value instanceof Context
            || value instanceof Thread) return false;
        if (value instanceof View) return value == row || inside((View) value, row);
        return true;
    }

    /** A jump on screen: ticks the loader, shows the count and Cancel, and says where it ended. */
    static final class Jump implements Runnable {
        final View chat;
        final Loader loader;
        final Bar bar;
        private final Handler handler = new Handler(Looper.getMainLooper());
        private boolean done;

        Jump(View chat, Loader loader) {
            this.chat = chat;
            this.loader = loader;
            this.bar = new Bar(chat, this);
        }

        void start() {
            bar.show();
            handler.post(this);
        }

        @Override public void run() {
            if (done) return;
            try {
                if (!chat.isAttachedToWindow()) {
                    stop(Outcome.LOST);
                    return;
                }
                Outcome outcome = loader.tick();
                if (outcome != null) {
                    stop(outcome);
                    return;
                }
                bar.update();
                handler.postDelayed(this, TICK_MS);
            } catch (Throwable error) {
                stop(Outcome.LOST);
                Settings.hookFailedPrivately(KEY, "The jump stopped", error);
            }
        }

        void stop(Outcome outcome) {
            if (done) return;
            done = true;
            handler.removeCallbacks(this);
            bar.hide();
            if (running == this) running = null;
            refreshArrow(chat);
            String said = said(outcome);
            if (said != null) Toast.makeText(chat.getContext(), new SettingsText(chat.getContext()).get(said), Toast.LENGTH_SHORT).show();
        }

        /** The chat left the screen. Stops after the detach, since the bar may share the chat's parent. */
        void lose() {
            handler.post(() -> stop(Outcome.LOST));
        }

        boolean done() {
            return done;
        }

        static String said(Outcome outcome) {
            switch (outcome) {
                case START: return "chat_jump_start";
                case FOUND: return "chat_jump_found";
                case NEXT_DAY: return "chat_jump_next";
                case NOTHING_AFTER: return "chat_jump_none";
                case NO_DATES: return "chat_jump_no_dates";
                default: return null;
            }
        }
    }

    /** Puts the arrow on [chat] unless it's already there. Never throws. */
    static void showArrow(View chat) {
        try {
            if (!Settings.enabled(KEY) || arrows.containsKey(chat)) return;
            Arrow arrow = new Arrow(chat);
            arrows.put(chat, arrow);
            arrow.show();
        } catch (Throwable error) {
            arrows.remove(chat);
            Settings.hookFailed(KEY, "Can't put the jump arrow on the chat", error);
        }
    }

    /** Takes the arrow off [chat]. */
    static void hideArrow(View chat) {
        Arrow arrow = arrows.remove(chat);
        if (arrow != null) arrow.hide();
    }

    /** The arrow on [chat], for the tests. */
    static Arrow arrowOn(View chat) {
        return arrows.get(chat);
    }

    /** Whether the arrow brings page buttons along: its own switch, read while the jump's is on. */
    static boolean pagesWanted() {
        SharedPreferences prefs = Settings.preferences;
        return prefs != null && Settings.running() && prefs.getBoolean(PAGES, false);
    }

    /**
     * Moves [chat]'s messages most of a screen toward older ones ([direction] -1) or newer ones (1), in one short
     * slide. The list only answers to the View API, so the slide is a run of scrollBy calls.
     */
    static void page(View chat, int direction) {
        View list = listIn(chat);
        if (list == null || !list.canScrollVertically(direction)) return;
        int distance = Math.max(1, Math.round(list.getHeight() * PAGE_SHARE)) * direction;
        ValueAnimator slide = ValueAnimator.ofInt(0, distance);
        slide.setDuration(PAGE_MS);
        slide.setInterpolator(new DecelerateInterpolator());
        int[] moved = {0};
        slide.addUpdateListener(step -> {
            try {
                int at = (int) step.getAnimatedValue();
                if (at != moved[0]) list.scrollBy(0, at - moved[0]);
                moved[0] = at;
            } catch (Throwable error) {
                step.cancel();
                Settings.hookFailed(KEY, "Can't turn the page", error);
            }
        });
        slide.start();
    }

    /** A plain chevron pointing up or down, so the page buttons don't look like the arrow to the first message. */
    static final class Chevron extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        final boolean up;

        Chevron(int color, float width, boolean up) {
            this.up = up;
            paint.setColor(color);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(width);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override public void draw(Canvas canvas) {
            Rect bounds = getBounds();
            float x = bounds.exactCenterX(), y = bounds.exactCenterY();
            float half = bounds.width() * 0.3f, rise = bounds.height() * 0.15f * (up ? 1 : -1);
            path.reset();
            path.moveTo(x - half, y + rise);
            path.lineTo(x, y - rise);
            path.lineTo(x + half, y + rise);
            canvas.drawPath(path, paint);
        }

        @Override public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
        }

        @Override public void setColorFilter(ColorFilter filter) {
            paint.setColorFilter(filter);
        }

        @Override public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    /**
     * Takes [view] off [parent] once whatever is going on now is done. A window handing its children their detach
     * walks the very list our view sits in, so taking it out right there leaves a hole the walk then trips over.
     */
    private static void takeOut(ViewGroup parent, View view) {
        if (parent == null || view == null) return;
        view.setVisibility(View.GONE);
        new Handler(Looper.getMainLooper()).post(() -> {
            if (view.getParent() == parent) parent.removeView(view);
        });
    }

    /** Has [chat]'s arrow look again, for when the count bar comes and goes without a layout of its own. */
    static void refreshArrow(View chat) {
        Arrow arrow = arrows.get(chat);
        if (arrow != null) arrow.update();
    }

    /**
     * A round arrow at the bottom left of a chat that goes to its first message, the other way round from
     * Messenger's own arrow down to the newest one, since a long press on the chat's name is easy to miss (#177).
     * A long press on the arrow asks for a day instead. It's only up once you've scrolled away from the newest messages
     * and there are older ones to go to, and it stands down while the count bar or a message's menu is on screen.
     */
    static final class Arrow implements ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnScrollChangedListener {
        private final View chat;
        private final Rect visible = new Rect();
        private final int[] where = new int[2];
        private ViewGroup content;
        /** How far up from the bottom the arrow sits, clearing the chat box. */
        private int above;
        /** How far each page button sits above the one under it. */
        private int step;
        ImageView button;
        /** The page buttons, stacked over the arrow, or null with their switch off. */
        ImageView pageUp, pageDown;

        Arrow(View chat) {
            this.chat = chat;
        }

        void show() {
            View found = chat.getRootView().findViewById(android.R.id.content);
            if (!(found instanceof FrameLayout)) return;
            content = (ViewGroup) found;
            Context context = chat.getContext();
            SettingsUi ui = new SettingsUi(context, MaterialYouTheme.chatIsLight());
            int size = ui.dp(40), pad = ui.dp(11);
            above = ui.dp(64);
            button = new ImageView(context);
            // The icon points back, so a quarter turn clockwise points it at the top of the chat.
            button.setImageDrawable(SettingsIcons.icon(context, SettingsIcons.BACK, ui.text));
            button.setRotation(90);
            button.setScaleType(ImageView.ScaleType.FIT_CENTER);
            button.setPadding(pad, pad, pad, pad);
            button.setBackground(ui.interactive(ui.surface, ui.line, size / 2));
            button.setElevation(ui.dp(3));
            button.setContentDescription(new SettingsText(context).get("chat_jump_first"));
            button.setOnClickListener(tapped -> {
                try {
                    start(chat, 0);
                } catch (Throwable error) {
                    Settings.hookFailed(KEY, "Can't start the jump", error);
                }
            });
            button.setOnLongClickListener(held -> {
                try {
                    held.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
                    chooser.choose(held.getContext(), day -> start(chat, day));
                } catch (Throwable error) {
                    Settings.hookFailed(KEY, "Can't ask where to jump", error);
                }
                return true;
            });
            button.setVisibility(View.GONE);
            FrameLayout.LayoutParams params =
                new FrameLayout.LayoutParams(size, size, Gravity.BOTTOM | Gravity.START);
            params.setMarginStart(ui.dp(12));
            params.bottomMargin = above;
            content.addView(button, params);
            if (pagesWanted()) {
                step = size + ui.dp(10);
                pageDown = pageButton(ui, size, 1, "chat_page_down", above + step);
                pageUp = pageButton(ui, size, -1, "chat_page_up", above + 2 * step);
            }
            content.getViewTreeObserver().addOnGlobalLayoutListener(this);
            content.getViewTreeObserver().addOnScrollChangedListener(this);
            update();
        }

        private ImageView pageButton(SettingsUi ui, int size, int direction, String name, int bottom) {
            Context context = chat.getContext();
            ImageView view = new ImageView(context);
            view.setImageDrawable(new Chevron(ui.text, ui.dp(5) / 2f, direction < 0));
            view.setScaleType(ImageView.ScaleType.FIT_XY);
            int pad = ui.dp(12);
            view.setPadding(pad, pad, pad, pad);
            view.setBackground(ui.interactive(ui.surface, ui.line, size / 2));
            view.setElevation(ui.dp(3));
            view.setContentDescription(new SettingsText(context).get(name));
            view.setOnClickListener(tapped -> {
                try {
                    page(chat, direction);
                } catch (Throwable error) {
                    Settings.hookFailed(KEY, "Can't turn the page", error);
                }
            });
            view.setVisibility(View.GONE);
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(size, size, Gravity.BOTTOM | Gravity.START);
            params.setMarginStart(ui.dp(12));
            params.bottomMargin = bottom;
            content.addView(view, params);
            return view;
        }

        /** Whether the arrow is up and takes the touch at (x, y), which the date rows under it then leave alone. */
        boolean holds(int x, int y) {
            return up(button, x, y) || up(pageUp, x, y) || up(pageDown, x, y);
        }

        private boolean up(View view, int x, int y) {
            return view != null && view.getVisibility() == View.VISIBLE && contains(view, x, y);
        }

        /** Up on a chat scrolled away from its newest messages with older ones to go to, down while a jump holds the bar. */
        void update() {
            if (button == null || content == null) return;
            View list = chat.isShown() ? listIn(chat) : null;
            Jump jump = running;
            boolean free = list != null && (jump == null || jump.chat != chat) && !InChatMenu.isUp(button);
            boolean up = free && list.canScrollVertically(-1) && list.canScrollVertically(1);
            raise(button, up);
            // Each page button stays up while its way has more to show, so the pair works from the newest message too.
            raise(pageUp, free && list.canScrollVertically(-1));
            raise(pageDown, free && list.canScrollVertically(1));
        }

        private static void raise(View view, boolean up) {
            if (view == null) return;
            int wanted = up ? View.VISIBLE : View.GONE;
            if (view.getVisibility() != wanted) view.setVisibility(wanted);
        }

        @Override public void onScrollChanged() {
            update();
        }

        @Override public void onGlobalLayout() {
            if (button == null || content == null) return;
            content.getWindowVisibleDisplayFrame(visible);
            content.getLocationOnScreen(where);
            int covered = Math.max(0, where[1] + content.getHeight() - visible.bottom);
            place(button, covered + above);
            place(pageDown, covered + above + step);
            place(pageUp, covered + above + 2 * step);
            update();
        }

        private static void place(View view, int bottom) {
            if (view == null) return;
            FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) view.getLayoutParams();
            if (params.bottomMargin != bottom) {
                params.bottomMargin = bottom;
                view.setLayoutParams(params);
            }
        }

        void hide() {
            if (content == null) return;
            content.getViewTreeObserver().removeOnGlobalLayoutListener(this);
            content.getViewTreeObserver().removeOnScrollChangedListener(this);
            takeOut(content, button);
            takeOut(content, pageUp);
            takeOut(content, pageDown);
            content = null;
            button = null;
            pageUp = null;
            pageDown = null;
        }
    }

    /** The count and Cancel along the bottom of the chat, above the keyboard. */
    static final class Bar implements ViewTreeObserver.OnGlobalLayoutListener {
        private final View chat;
        private final Jump jump;
        private final Rect visible = new Rect();
        private final int[] where = new int[2];
        private ViewGroup content;
        LinearLayout bar;
        TextView status;
        Button cancel;

        Bar(View chat, Jump jump) {
            this.chat = chat;
            this.jump = jump;
        }

        void show() {
            View found = chat.getRootView().findViewById(android.R.id.content);
            if (!(found instanceof FrameLayout)) return;
            content = (ViewGroup) found;
            Context context = chat.getContext();
            SettingsUi ui = new SettingsUi(context, MaterialYouTheme.chatIsLight());
            bar = ui.row();
            // A line along its top, like a sheet's buttons, so the bar reads apart from the messages under it.
            bar.setBackground(ui.topEdge(ui.background));
            bar.setGravity(Gravity.CENTER_VERTICAL);
            bar.setPadding(ui.dp(16), ui.dp(9), ui.dp(16), ui.dp(8));
            // A tap beside Cancel stops here instead of opening the chat box the bar covers.
            bar.setOnTouchListener((view, event) -> true);
            status = ui.text("", 15, ui.text, false);
            bar.addView(status, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            cancel = ui.button(new SettingsText(context).get("chat_jump_cancel"));
            cancel.setOnClickListener(tapped -> jump.stop(Outcome.CANCELLED));
            bar.addView(cancel);
            update();
            // TalkBack says the count once as the bar comes up, without reading out every page it loads.
            bar.setAccessibilityPaneTitle(status.getText());
            content.addView(bar, new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.BOTTOM));
            content.getViewTreeObserver().addOnGlobalLayoutListener(this);
            refreshArrow(chat);
        }

        void update() {
            if (status == null) return;
            SettingsText text = new SettingsText(chat.getContext());
            int count = jump.loader.count();
            status.setText(jump.loader.seeking ? text.get("chat_jump_seeking")
                : count > 0 ? text.get("chat_jump_loading", count) : text.get("chat_jump_loading_plain"));
        }

        @Override public void onGlobalLayout() {
            if (bar == null || content == null) return;
            content.getWindowVisibleDisplayFrame(visible);
            content.getLocationOnScreen(where);
            int covered = Math.max(0, where[1] + content.getHeight() - visible.bottom);
            FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) bar.getLayoutParams();
            if (params.bottomMargin == covered) return;
            params.bottomMargin = covered;
            bar.setLayoutParams(params);
        }

        void hide() {
            if (content == null) return;
            content.getViewTreeObserver().removeOnGlobalLayoutListener(this);
            // A chat leaving a window that's going away stops the jump from inside that window's own detach.
            takeOut(content, bar);
            content = null;
            bar = null;
            status = null;
            cancel = null;
        }
    }

    /**
     * Stands in for the chat activity's window callback. Every call passes through. A long press on the chat's name
     * is taken: Messenger's views get a cancel, the rest of that touch goes nowhere, and the question goes up.
     */
    static final class Watching implements InvocationHandler {
        final Window window;
        final Window.Callback original;
        private final Handler handler = new Handler(Looper.getMainLooper());
        private final Runnable fire = this::fire;
        private View chat, title;
        private MotionEvent last;
        private float downX, downY;
        private boolean held;
        /** The chat whose date a touch went down on, and the day that date names. */
        private View dateChat;
        private long date;

        Watching(Window window, Window.Callback original) {
            this.window = window;
            this.original = original;
        }

        @Override
        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
            if (method.getDeclaringClass() == Object.class) {
                switch (method.getName()) {
                    case "equals":
                        Watching other = watching(args[0]);
                        return args[0] == proxy || original.equals(other != null ? other.original : args[0]);
                    case "hashCode":
                        return original.hashCode();
                    default:
                        return original.toString();
                }
            }
            if ("dispatchTouchEvent".equals(method.getName()) && args != null && args.length == 1 && args[0] instanceof MotionEvent) {
                try {
                    if (touch((MotionEvent) args[0])) return true;
                } catch (Throwable error) {
                    forget();
                    held = false;
                    Settings.hookFailed(KEY, "Can't read the long press on the chat's name", error);
                }
            }
            method.setAccessible(true);
            try {
                return method.invoke(original, args);
            } catch (InvocationTargetException wrapped) {
                throw wrapped.getCause();
            }
        }

        /** Follows one touch. True when the touch is ours and Messenger shouldn't see it. */
        boolean touch(MotionEvent event) {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                forget();
                held = false;
                View decor = window.peekDecorView();
                if (decor == null || chats.isEmpty() || !Settings.wouldUse(KEY)) return false;
                downX = event.getRawX();
                downY = event.getRawY();
                View name = titleAt(decor, (int) downX, (int) downY);
                View heads = name != null ? chatFor(name) : null;
                if (heads == null) {
                    dated(decor, (int) downX, (int) downY);
                    return false;
                }
                title = name;
                chat = heads;
                keep(event);
                handler.postDelayed(fire, ViewConfiguration.getLongPressTimeout());
                return false;
            }
            if (held) {
                if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) held = false;
                return true;
            }
            if (title == null && dateChat == null) return false;
            if (action == MotionEvent.ACTION_MOVE) {
                Context context = (title != null ? title : dateChat).getContext();
                int slop = ViewConfiguration.get(context).getScaledTouchSlop();
                if (Math.abs(event.getRawX() - downX) > slop || Math.abs(event.getRawY() - downY) > slop) forget();
                else if (title != null) keep(event);
            } else if (action == MotionEvent.ACTION_UP) {
                View chat = dateChat;
                long day = date;
                forget();
                // The touch goes on to Messenger either way: a date row does nothing with it.
                if (chat != null) tapped(chat, day);
            } else if (action != MotionEvent.ACTION_POINTER_UP) {
                forget();
            }
            return false;
        }

        /** Keeps the chat and the day when the touch went down on a date between a chat's messages. */
        private void dated(View decor, int x, int y) {
            for (WeakReference<View> held : chats) {
                View chat = held.get();
                if (chat == null || !chat.isShown() || chat.getRootView() != decor.getRootView()) continue;
                long day = dateAt(chat, x, y);
                if (day != 0) {
                    dateChat = chat;
                    date = day;
                    return;
                }
            }
        }

        /** A tap on a date: the day picker opens on that day, and the jump goes where it's left. */
        private void tapped(View chat, long day) {
            if (!Settings.enabled(KEY)) return;
            picker.pick(window.getContext(), day, picked -> start(chat, picked));
        }

        private void keep(MotionEvent event) {
            if (last != null) last.recycle();
            last = MotionEvent.obtain(event);
        }

        private void forget() {
            handler.removeCallbacks(fire);
            if (last != null) last.recycle();
            last = null;
            title = null;
            chat = null;
            dateChat = null;
            date = 0;
        }

        private void fire() {
            View chat = this.chat, title = this.title;
            MotionEvent last = this.last;
            if (chat == null || title == null || last == null) return;
            try {
                this.last = null;
                forget();
                if (!Settings.enabled(KEY)) return;
                held = true;
                MotionEvent cancel = MotionEvent.obtain(last);
                cancel.setAction(MotionEvent.ACTION_CANCEL);
                try {
                    original.dispatchTouchEvent(cancel);
                } finally {
                    cancel.recycle();
                }
                title.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
                chooser.choose(window.getContext(), day -> start(chat, day));
            } catch (Throwable error) {
                Settings.hookFailed(KEY, "Can't ask where to jump", error);
            } finally {
                last.recycle();
            }
        }
    }
}
