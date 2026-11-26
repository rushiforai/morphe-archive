package app.hushmessenger.extension;

import android.app.Activity;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import java.lang.ref.WeakReference;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * #240 Smaller stories row. The row of stories and notes above the chats is a sideways list of tiles at one fixed size.
 * With this on, the whole list is drawn smaller, by the size picked under the switch, from its left edge and around its
 * middle, so the faces, names and notes shrink together, more tiles fit across the screen and the row keeps its place.
 *
 * Messenger keeps the list in a holder that lays it out inside the holder's own padding. To still reach the right edge
 * once it's drawn smaller, the list is laid out wider by the same amount, through a negative right padding on the
 * holder. Android maps a touch through the list's scale, so a tap still lands on the tile under the finger. A holder
 * that won't lay the list out wider gets everything put back and the row stays as Messenger draws it.
 *
 * The row is the first sideways list in the top rows of the chat list, looked for while the chat list is scrolled to
 * the top and nothing on screen is a chat's message box, and after that in the chat list row it was found in. That one
 * list is sized until it leaves the screen, and then put back, since Messenger hands the same views to other lists.
 *
 * Every Messenger screen calls [resumed] as it comes to the front. Public, since the call comes from Messenger's code.
 */
public final class StoryRowSize {
    static final String KEY = "story_row_size";
    /** The size picked, one of [LEVELS]. Nothing saved means [STANDARD]. */
    static final String LEVEL = "story_row_size_level";
    /** The sizes, in percent of Messenger's own, the largest first. */
    static final String[] LEVELS = {"95", "90", "85", "80", "75"};
    static final String STANDARD = "90";
    /** How many rows from the top of the chat list the stories row can sit in: the search box and a header come first. */
    static final int TOP_ROWS = 4;
    /** How deep under a chat list row the stories row's list can sit. */
    private static final int DEPTH = 8;
    /** How often the holder may drop the padding before the row is left alone. */
    static final int RETRIES = 3;
    /** The least time between two looks for the row while the screen scrolls. */
    static final long SCROLL_LOOK_MS = 250;
    private static final String[] COMPOSER = {"ComposerBarLeftPrimaryButtonsView", "ComposerActionButton"};

    private static final Map<View, Boolean> watched = new WeakHashMap<>();
    private static final Map<View, Sized> sized = new WeakHashMap<>();
    /** The list being sized. */
    private static WeakReference<View> row;
    /** The chat list row the stories row was last found in, which can be found again anywhere on the list. */
    private static WeakReference<View> home;
    private static long lastScrollLook;
    /** A holder that wouldn't lay the list out wider. Nothing more is tried until Messenger restarts. */
    static volatile boolean refused;

    private StoryRowSize() {}

    static void resetForTests() {
        watched.clear();
        sized.clear();
        row = null;
        home = null;
        lastScrollLook = 0;
        refused = false;
    }

    /** What the holder had before it was sized, to put back, the padding it was given, and how often it's dropped it. */
    private static final class Sized {
        final ViewGroup holder;
        final int holderRight;
        /** The right padding last given to the holder. A new size or width moves it, and that isn't the holder dropping it. */
        int given = Integer.MIN_VALUE;
        int retries;

        Sized(ViewGroup holder) {
            this.holder = holder;
            this.holderRight = holder.getPaddingRight();
        }
    }

    /** A Messenger screen coming to the front. */
    public static void resumed(Activity activity) {
        try {
            if (activity == null || refused || !Settings.enabled(KEY)) return;
            Window window = activity.getWindow();
            View screen = window == null ? null : window.peekDecorView();
            if (screen == null) return;
            watch(screen);
            if (screen.isAttachedToWindow()) look(screen);
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't watch for the stories row", error);
        }
    }

    /**
     * Looks for the row on each of [screen]'s layouts, and while it scrolls: a list scrolling lays its rows out by
     * itself, with no layout of the screen, so the stories row can come back into view with only a scroll.
     */
    private static void watch(View screen) {
        if (watched.containsKey(screen)) return;
        watched.put(screen, Boolean.TRUE);
        ViewTreeObserver.OnGlobalLayoutListener onLayout = () -> look(screen);
        ViewTreeObserver.OnScrollChangedListener onScroll = () -> scrolled(screen);
        screen.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override public void onViewAttachedToWindow(View attached) {
                listen(attached, onLayout, onScroll);
            }

            @Override public void onViewDetachedFromWindow(View detached) {
                ViewTreeObserver observer = detached.getViewTreeObserver();
                observer.removeOnGlobalLayoutListener(onLayout);
                observer.removeOnScrollChangedListener(onScroll);
            }
        });
        if (screen.isAttachedToWindow()) listen(screen, onLayout, onScroll);
    }

    private static void listen(View screen, ViewTreeObserver.OnGlobalLayoutListener onLayout,
            ViewTreeObserver.OnScrollChangedListener onScroll) {
        ViewTreeObserver observer = screen.getViewTreeObserver();
        observer.addOnGlobalLayoutListener(onLayout);
        observer.addOnScrollChangedListener(onScroll);
    }

    /** A scroll on [screen]: the row being sized needs nothing, and otherwise it's looked for a few times a second. */
    static void scrolled(View screen) {
        View found = row == null ? null : row.get();
        if (found != null && found.isAttachedToWindow()) return;
        long now = SystemClock.uptimeMillis();
        if (now - lastScrollLook < SCROLL_LOOK_MS && now >= lastScrollLook) return;
        lastScrollLook = now;
        look(screen);
    }

    /** Sizes the row that's on [screen], finding it first when the one found before has gone. Off puts it back. */
    static void look(View screen) {
        try {
            if (refused) return;
            View found = row == null ? null : row.get();
            if (!Settings.enabled(KEY)) {
                if (found != null) restore(found);
                return;
            }
            if (found == null || !found.isAttachedToWindow() || found.getRootView() != screen.getRootView()) {
                found = Settings.hideStories() ? null : find(screen);
                if (found == null) return;
                row = new WeakReference<>(found);
            }
            size(found);
        } catch (Throwable error) {
            Settings.hookFailed(KEY, "Can't size the stories row", error);
        }
    }

    /**
     * The stories row's list on [screen]: the first sideways list in the chat list's top rows while the chat list is at
     * its top, or in the chat list row it was found in before. Null while a chat is showing.
     */
    static View find(View screen) {
        View[] biggest = new View[1];
        if (!survey(screen, biggest)) return null;
        View chats = biggest[0];
        if (!(chats instanceof ViewGroup)) return null;
        boolean top = !chats.canScrollVertically(-1);
        View known = home == null ? null : home.get();
        ViewGroup rows = (ViewGroup) chats;
        for (int i = 0; i < rows.getChildCount() && i < TOP_ROWS; i++) {
            View child = rows.getChildAt(i);
            if (!top && child != known) continue;
            View list = sideways(child, DEPTH);
            if (list != null) {
                home = new WeakReference<>(child);
                return list;
            }
        }
        return null;
    }

    /** Walks [view] for the biggest list that runs top to bottom. False when a chat's message box is showing. */
    private static boolean survey(View view, View[] biggest) {
        if (view.getVisibility() != View.VISIBLE) return true;
        String name = view.getClass().getSimpleName();
        for (String composer : COMPOSER) if (composer.equals(name)) return false;
        if (ChatJump.isList(view.getClass()) && !runsSideways(view)
                && (biggest[0] == null || area(view) > area(biggest[0]))) {
            biggest[0] = view;
        }
        if (!(view instanceof ViewGroup)) return true;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) if (!survey(group.getChildAt(i), biggest)) return false;
        return true;
    }

    /** The first list under [view] whose tiles sit side by side, no more than [depth] levels down. */
    private static View sideways(View view, int depth) {
        if (view.getVisibility() != View.VISIBLE) return null;
        if (ChatJump.isList(view.getClass())) return runsSideways(view) ? view : null;
        if (depth == 0 || !(view instanceof ViewGroup)) return null;
        ViewGroup group = (ViewGroup) view;
        for (int i = 0; i < group.getChildCount(); i++) {
            View found = sideways(group.getChildAt(i), depth - 1);
            if (found != null) return found;
        }
        return null;
    }

    /** Whether [list]'s first two tiles sit next to each other on one line. */
    static boolean runsSideways(View list) {
        if (!(list instanceof ViewGroup)) return false;
        ViewGroup tiles = (ViewGroup) list;
        if (tiles.getChildCount() < 2) return list.canScrollHorizontally(1) || list.canScrollHorizontally(-1);
        View first = tiles.getChildAt(0);
        View second = tiles.getChildAt(1);
        return first.getWidth() > 0 && second.getLeft() >= first.getRight() - 1 && Math.abs(second.getTop() - first.getTop()) <= 1;
    }

    private static long area(View view) {
        return (long) view.getWidth() * view.getHeight();
    }

    /**
     * Lays [list] out wider through its holder's padding and draws it smaller by the picked size, so it spans the holder
     * as before. Checked again on each layout: a holder that put its padding back gets it again a few times, and one
     * that laid the list out at that padding and still not wider gets everything back.
     */
    static void size(View list) {
        if (!(list.getParent() instanceof ViewGroup)) return;
        ViewGroup holder = (ViewGroup) list.getParent();
        Sized was = sized.get(list);
        int right = was == null ? holder.getPaddingRight() : was.holderRight;
        int margins = 0;
        if (list.getLayoutParams() instanceof ViewGroup.MarginLayoutParams) {
            ViewGroup.MarginLayoutParams params = (ViewGroup.MarginLayoutParams) list.getLayoutParams();
            margins = params.leftMargin + params.rightMargin;
        }
        int room = holder.getWidth() - holder.getPaddingLeft() - right - margins;
        if (room <= 0 || list.getHeight() <= 0) return;
        float scale = scale(picked());
        int wide = Math.round(room / scale);
        int padding = right - (wide - room);
        if (was == null) {
            was = new Sized(holder);
            sized.put(list, was);
            follow(list);
        }
        if (holder.getPaddingRight() == padding) {
            if (list.getWidth() != wide && !holder.isLayoutRequested()) {
                refuse(list, "the stories row's holder didn't lay it out wider");
                return;
            }
        } else {
            boolean dropped = was.given != Integer.MIN_VALUE && holder.getPaddingRight() != was.given;
            if (dropped && ++was.retries > RETRIES) {
                refuse(list, "the stories row's holder kept dropping its padding");
                return;
            }
            holder.setPadding(holder.getPaddingLeft(), holder.getPaddingTop(), padding, holder.getPaddingBottom());
            was.given = padding;
        }
        list.setPivotX(0f);
        list.setPivotY(list.getHeight() / 2f);
        list.setScaleX(scale);
        list.setScaleY(scale);
    }

    /** Sizes [list] again on each of its layouts, and puts it back when it leaves the screen. */
    private static void follow(View list) {
        list.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
            @Override public void onLayoutChange(View changed, int l, int t, int r, int b, int ol, int ot, int or, int ob) {
                if (!sized.containsKey(changed)) {
                    changed.removeOnLayoutChangeListener(this);
                    return;
                }
                try {
                    size(changed);
                } catch (Throwable error) {
                    Settings.hookFailed(KEY, "Can't size the stories row", error);
                }
            }
        });
        list.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
            @Override public void onViewAttachedToWindow(View attached) { }

            @Override public void onViewDetachedFromWindow(View detached) {
                detached.removeOnAttachStateChangeListener(this);
                restore(detached);
            }
        });
    }

    /** Puts [list] and its holder back the way Messenger had them. */
    static void restore(View list) {
        Sized was = sized.remove(list);
        if (row != null && row.get() == list) row = null;
        if (was == null) return;
        ViewGroup holder = was.holder;
        holder.setPadding(holder.getPaddingLeft(), holder.getPaddingTop(), was.holderRight, holder.getPaddingBottom());
        list.setScaleX(1f);
        list.setScaleY(1f);
        list.resetPivot();
    }

    private static void refuse(View list, String why) {
        refused = true;
        restore(list);
        Settings.hookFailedPrivately(KEY, "Can't size the stories row", new IllegalStateException(why));
    }

    /** The saved size, or [STANDARD] when nothing or something unknown is saved. */
    static String picked() {
        String saved = Settings.preferences == null ? null : Settings.preferences.getString(LEVEL, null);
        for (String level : LEVELS) if (level.equals(saved)) return level;
        return STANDARD;
    }

    static float scale(String level) {
        return Integer.parseInt(level) / 100f;
    }
}
