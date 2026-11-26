package app.pomee4.extension.commentswipe;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Rect;
import android.net.Uri;
import android.os.SystemClock;

import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import kotlin.jvm.functions.Function1;

/**
 * Swipe actions on posts, in every Reddit post list (feeds, subreddits, profiles, saved, history):
 * all of them draw a post with the same feed post section.
 * <p>
 * The post card tells this class its section (the post), its feed context (which takes the feed events)
 * and the state that holds the card's bounds in the window. The swipe itself is done by
 * {@link CommentSwipeActionsPatch}, and an action sends the same feed event as Reddit's own buttons.
 */
@SuppressWarnings("unused")
public final class PostSwipe {

    public enum PostAction {
        NONE,
        UPVOTE,
        DOWNVOTE,
        SAVE,
        HIDE,
        SHARE,
        OPEN_COMMENTS,
        OVERFLOW,
        PROFILE,
        SUBREDDIT
    }

    private static final int MAX_CACHED_LINKS = 1000;

    /**
     * A feed post card (FeedPostSection).
     */
    static final int KIND_FEED = 0;
    /**
     * A conversation post: a text post shown with its top comments (ConversationPostSection).
     */
    static final int KIND_CONVERSATION = 1;
    /**
     * A post preview: a text post shown with a header, a title and a preview of its text (PostPreviewSection).
     */
    static final int KIND_PREVIEW = 2;

    static final class Card {
        volatile WeakReference<Object> section;
        volatile WeakReference<Object> context;
        /**
         * The state that holds the bounds of a feed post card, or null for a conversation post.
         */
        final WeakReference<Object> bounds;
        /**
         * The kind of post section: {@link #KIND_FEED}, {@link #KIND_CONVERSATION} or {@link #KIND_PREVIEW}.
         */
        final int kind;
        long positionedAt;
        /**
         * The live layout coordinates of the card, from its last position update.
         */
        WeakReference<Object> coordinates;

        Card(Object section, Object context, Object bounds, int kind) {
            this.section = new WeakReference<>(section);
            this.context = new WeakReference<>(context);
            this.bounds = new WeakReference<>(bounds);
            this.kind = kind;
        }
    }

    /**
     * The post cards: feed post cards by the state object that holds their bounds, conversation posts by
     * their position callback.
     */
    private static final Map<Object, Card> cards = Collections.synchronizedMap(new WeakHashMap<>());

    /**
     * Posts (Link) by kind with id, to read the saved state, the vote, the author and the subreddit.
     */
    private static final Map<String, WeakReference<Object>> links = Collections.synchronizedMap(
            new LinkedHashMap<>(128, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, WeakReference<Object>> eldest) {
                    return size() > MAX_CACHED_LINKS;
                }
            });

    private PostSwipe() {
    }

    // region Accessors of the obfuscated post classes, created during patching.

    // Each has one unused parameter as a scratch register for the generated code.

    static String sectionLinkKindWithId(Object section, Object scratch) {
        return null;  // Modified during patching.
    }

    static String sectionUniqueId(Object section, Object scratch) {
        return null;  // Modified during patching.
    }

    static Object sectionIdentifier(Object section, Object scratch) {
        return null;  // Modified during patching.
    }

    static boolean sectionPromoted(Object section, Object scratch) {
        return false;  // Modified during patching.
    }

    static boolean sectionRecommended(Object section, Object scratch) {
        return false;  // Modified during patching.
    }

    static boolean sectionSubredditMember(Object section, Object scratch) {
        return false;  // Modified during patching.
    }

    static Object sectionChildren(Object section, Object scratch) {
        return null;  // Modified during patching.
    }

    /**
     * @return If a child section of a post has its own horizontal swipes (a gallery or a carousel).
     */
    static boolean isOwnSwipeSection(Object child, Object scratch) {
        return false;  // Modified during patching.
    }

    /**
     * @return The key of a feed section (unique in its feed).
     */
    static String sectionKey(Object section, Object scratch) {
        return null;  // Modified during patching.
    }

    /**
     * @return The Compose Rect of the coordinates in the window, clipped by their parents.
     */
    static Object coordinatesVisibleBounds(Object coordinates, Object scratch) {
        return null;  // Modified during patching.
    }

    static boolean isCoordinates(Object object, Object scratch) {
        return false;  // Modified during patching.
    }

    static boolean coordinatesAttached(Object coordinates, Object scratch) {
        return false;  // Modified during patching.
    }

    /**
     * @return The packed window Offset of the top left corner of the coordinates.
     */
    static long coordinatesWindowOffset(Object coordinates, Object scratch) {
        return 0;  // Modified during patching.
    }

    /**
     * @return The packed IntSize of the coordinates.
     */
    static long coordinatesSize(Object coordinates, Object scratch) {
        return 0;  // Modified during patching.
    }

    static String conversationLinkKindWithId(Object section, Object scratch) {
        return null;  // Modified during patching.
    }

    static String conversationUniqueId(Object section, Object scratch) {
        return null;  // Modified during patching.
    }

    /**
     * @return A new post identifier (PostId) of the conversation post.
     */
    static Object conversationIdentifier(Object section, Object scratch) {
        return null;  // Modified during patching.
    }

    static String previewLinkKindWithId(Object section, Object scratch) {
        return null;  // Modified during patching.
    }

    static String previewUniqueId(Object section, Object scratch) {
        return null;  // Modified during patching.
    }

    static Object previewIdentifier(Object section, Object scratch) {
        return null;  // Modified during patching.
    }

    static boolean previewPromoted(Object section, Object scratch) {
        return false;  // Modified during patching.
    }

    static boolean previewRecommended(Object section, Object scratch) {
        return false;  // Modified during patching.
    }

    static boolean previewSubredditMember(Object section, Object scratch) {
        return false;  // Modified during patching.
    }

    /**
     * @return The modifier (or the default modifier if null) with an onGloballyPositioned callback.
     */
    static Object withPositionCallback(Object modifier, Object callback) {
        return modifier;  // Modified during patching.
    }

    static Object contextEventSink(Object context, Object scratch) {
        return null;  // Modified during patching.
    }

    static Object contextTransitionParams(Object context, Object scratch) {
        return null;  // Modified during patching.
    }

    // endregion

    // region Injection points

    /**
     * Injection point.
     * <p>
     * Called when a post card is composed.
     *
     * @param section The feed post section of the card.
     * @param context The feed context, which takes the feed events.
     * @param bounds  The state that holds the card's bounds in the window.
     */
    public static void onPostCard(Object section, Object context, Object bounds) {
        try {
            if (section == null || context == null || bounds == null) return;
            Card card = cards.get(bounds);
            if (card == null || card.section.get() != section || card.context.get() != context) {
                Card newCard = new Card(section, context, bounds, KIND_FEED);
                if (card != null) {
                    newCard.positionedAt = card.positionedAt;
                    newCard.coordinates = card.coordinates;
                }
                cards.put(bounds, newCard);
            }
        } catch (Exception ex) {
            Logger.printException(() -> "onPostCard failure", ex);
        }
    }

    /**
     * Injection point.
     * <p>
     * Called when a layout position callback runs, with the state it updates. Only post cards that are
     * on screen are laid out, so the newest card at a point is the visible one.
     */
    public static void onBoundsChanged(Object bounds, Object argument) {
        if (bounds == null) return;
        Card card = cards.get(bounds);
        if (card == null) return;
        card.positionedAt = SystemClock.uptimeMillis();
        if (argument != null && isCoordinates(argument, null)) {
            card.coordinates = new WeakReference<>(argument);
        }
    }

    /**
     * Injection point.
     * <p>
     * Called when a conversation post is composed, with the modifier of its content.
     *
     * @return The modifier with a callback that keeps the post's layout coordinates.
     */
    public static Object onConversationPost(Object modifier, Object section, Object context) {
        return withCard(modifier, section, context, KIND_CONVERSATION);
    }

    /**
     * Injection point.
     * <p>
     * Called when a post preview is composed, with the modifier of its content.
     *
     * @return The modifier with a callback that keeps the post's layout coordinates.
     */
    public static Object onPreviewPost(Object modifier, Object section, Object context) {
        return withCard(modifier, section, context, KIND_PREVIEW);
    }

    /**
     * The position callback of each conversation and preview post, by post id and kind. A post keeps its
     * callback when it is composed again: Compose only replaces the callback of a laid out modifier, and a
     * replaced callback is not called until the post moves.
     */
    private static final Map<String, PositionCallback> callbacks = Collections.synchronizedMap(
            new LinkedHashMap<>(64, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, PositionCallback> eldest) {
                    return size() > MAX_CACHED_LINKS;
                }
            });

    private static Object withCard(Object modifier, Object section, Object context, int kind) {
        try {
            if (section == null || context == null) return modifier;
            String id = kind == KIND_CONVERSATION
                    ? conversationLinkKindWithId(section, null)
                    : previewLinkKindWithId(section, null);
            String key = kind + ":" + id;
            PositionCallback callback = callbacks.get(key);
            if (callback == null) {
                callback = new PositionCallback();
                Card card = new Card(section, context, null, kind);
                callback.card = card;
                callbacks.put(key, callback);
                cards.put(callback, card);
            } else {
                Card card = callback.card;
                card.section = new WeakReference<>(section);
                card.context = new WeakReference<>(context);
                cards.put(callback, card);
            }
            return withPositionCallback(modifier, callback);
        } catch (Throwable ex) {
            Logger.printException(() -> "Post position callback failure", ex);
            return modifier;
        }
    }

    private static volatile Object unit;

    /**
     * @return kotlin.Unit, by its type: Reddit renames its INSTANCE field.
     */
    private static Object unit() {
        Object value = unit;
        if (value != null) return value;
        try {
            Class<?> type = Class.forName("kotlin.Unit", true, PostSwipe.class.getClassLoader());
            for (Field field : type.getDeclaredFields()) {
                if (Modifier.isStatic(field.getModifiers()) && field.getType() == type) {
                    field.setAccessible(true);
                    value = field.get(null);
                    unit = value;
                    return value;
                }
            }
        } catch (Throwable ex) {
            Logger.printException(() -> "kotlin.Unit not found", ex);
        }
        return null;
    }

    /**
     * onGloballyPositioned callback of a conversation post or a post preview.
     */
    private static final class PositionCallback implements kotlin.jvm.functions.Function1<Object, Object> {
        Card card;

        @Override
        public Object invoke(Object coordinates) {
            Card current = card;
            if (current != null) {
                current.positionedAt = SystemClock.uptimeMillis();
                if (coordinates != null) current.coordinates = new WeakReference<>(coordinates);
            }
            return unit();
        }
    }

    /**
     * Injection point.
     * <p>
     * Called at the end of the Link constructor.
     */
    public static void onLinkCreated(Object link) {
        try {
            String kindWithId = (String) invoke(link, "getKindWithId");
            if (kindWithId != null) links.put(kindWithId, new WeakReference<>(link));
        } catch (Exception ex) {
            Logger.printException(() -> "onLinkCreated failure", ex);
        }
    }

    // endregion

    // region Finding the post under the finger

    /**
     * A post card under the finger, with its bounds in the window.
     */
    static final class Target {
        final Object context;
        final Rect bounds;
        final String linkKindWithId;
        final String uniqueId;
        final Object identifier;
        final boolean promoted;
        final boolean recommended;
        final boolean subredditMember;

        Target(Card card, Object section, Object context, Rect bounds) {
            this.context = context;
            this.bounds = bounds;
            if (card.kind == KIND_CONVERSATION) {
                linkKindWithId = conversationLinkKindWithId(section, null);
                uniqueId = conversationUniqueId(section, null);
                identifier = conversationIdentifier(section, null);
                promoted = false;
                recommended = false;
                subredditMember = false;
            } else if (card.kind == KIND_PREVIEW) {
                linkKindWithId = previewLinkKindWithId(section, null);
                uniqueId = previewUniqueId(section, null);
                identifier = previewIdentifier(section, null);
                promoted = previewPromoted(section, null);
                recommended = previewRecommended(section, null);
                subredditMember = previewSubredditMember(section, null);
            } else {
                linkKindWithId = sectionLinkKindWithId(section, null);
                uniqueId = sectionUniqueId(section, null);
                identifier = sectionIdentifier(section, null);
                promoted = sectionPromoted(section, null);
                recommended = sectionRecommended(section, null);
                subredditMember = sectionSubredditMember(section, null);
            }
        }
    }

    /**
     * @return The post card at a point of the window, or null if there is none or it has its own
     * horizontal swipes.
     */
    static Target findTarget(float x, float y) {
        try {
            List<Card> candidates;
            synchronized (cards) {
                candidates = new ArrayList<>(cards.values());
            }
            candidates.sort(Comparator.comparingLong((Card card) -> card.positionedAt).reversed());
            List<Rect> onScreen = new ArrayList<>();
            for (Card card : candidates) {
                Object bounds = card.bounds.get();
                Object section = card.section.get();
                Object context = card.context.get();
                if (section == null || context == null || (bounds == null && card.kind == KIND_FEED)) continue;
                Rect rect = cardRect(card, bounds);
                if (rect == null) continue;
                // Cards on screen never overlap. A card that overlaps a card laid out after it has
                // left the screen, and its bounds are the last ones it had there.
                boolean stale = false;
                for (Rect newer : onScreen) {
                    if (overlaps(newer, rect)) {
                        stale = true;
                        break;
                    }
                }
                if (stale) continue;
                onScreen.add(rect);
                if (!rect.contains((int) x, (int) y)) continue;
                // The part under a bar of the screen is not swiped, and a swipe on the bar is the bar's.
                Rect visible = withoutBars(rect, y);
                if (visible == null || !visible.contains((int) x, (int) y)) return null;
                // A swipe that starts on a gallery or a carousel is left to it.
                if (card.kind == KIND_FEED && inOwnSwipeArea(section, x, y)) return null;
                return new Target(card, section, context, visible);
            }
        } catch (Throwable ex) {
            Logger.printException(() -> "findTarget failure", ex);
        }
        return null;
    }

    /**
     * The card's bounds in the window now, from its live layout coordinates, or else the bounds it got at
     * its last position update. Null if the card is not on screen.
     */
    private static Rect cardRect(Card card, Object bounds) throws Exception {
        Object coordinates = card.coordinates == null ? null : card.coordinates.get();
        if (coordinates != null) return coordinatesRect(coordinates);
        return bounds == null ? null : readRect(bounds);
    }

    /**
     * Overlap of more than a few pixels, so cards that touch do not count.
     */
    private static boolean overlaps(Rect first, Rect second) {
        int slack = 4;
        return first.left < second.right - slack && second.left < first.right - slack
                && first.top < second.bottom - slack && second.top < first.bottom - slack;
    }

    /**
     * @return If the point is on a part of the post with its own horizontal swipes (a gallery or a
     * carousel), or such a part's position is not known yet.
     */
    private static boolean inOwnSwipeArea(Object section, float x, float y) throws Exception {
        Object children = sectionChildren(section, null);
        if (!(children instanceof Iterable)) return false;
        for (Object child : (Iterable<?>) children) {
            if (child == null || !isOwnSwipeSection(child, null)) continue;
            String key = sectionKey(child, null);
            AreaCallback area = key == null ? null : areas.get(key);
            Object coordinates = area == null || area.coordinates == null ? null : area.coordinates.get();
            if (coordinates == null) return true;
            Rect rect = coordinatesRect(coordinates);
            if (rect == null || rect.contains((int) x, (int) y)) return true;
        }
        return false;
    }

    /**
     * The window bounds of live layout coordinates, or null if they are not on screen.
     */
    private static Rect coordinatesRect(Object coordinates) {
        if (!coordinatesAttached(coordinates, null)) return null;
        // The part that its parents show: a post scrolled under a bar of the list is cut at the bar.
        try {
            Object visible = coordinatesVisibleBounds(coordinates, null);
            if (visible != null) return rectOf(visible);
        } catch (Throwable ex) {
            Logger.printException(() -> "Visible bounds failure", ex);
        }
        long offset = coordinatesWindowOffset(coordinates, null);
        long size = coordinatesSize(coordinates, null);
        // Packed Offset: float bits of x and y. Packed IntSize: width and height.
        float left = Float.intBitsToFloat((int) (offset >> 32));
        float top = Float.intBitsToFloat((int) offset);
        int width = (int) (size >> 32);
        int height = (int) size;
        if (width <= 0 || height <= 0) return null;
        return new Rect(Math.round(left), Math.round(top), Math.round(left) + width, Math.round(top) + height);
    }

    /**
     * The areas of the post parts with their own horizontal swipes, by section key. The callback stays
     * the same while the part is composed again, see {@link #callbacks}.
     */
    private static final Map<String, AreaCallback> areas = Collections.synchronizedMap(
            new LinkedHashMap<>(64, 0.75f, true) {
                @Override
                protected boolean removeEldestEntry(Map.Entry<String, AreaCallback> eldest) {
                    return size() > MAX_CACHED_LINKS;
                }
            });

    private static final class AreaCallback implements kotlin.jvm.functions.Function1<Object, Object> {
        volatile WeakReference<Object> coordinates;

        @Override
        public Object invoke(Object coordinates) {
            if (coordinates != null) this.coordinates = new WeakReference<>(coordinates);
            return unit();
        }
    }

    /**
     * Injection point.
     * <p>
     * Called when a post part with its own horizontal swipes (a gallery or a carousel) is composed, with
     * the modifier its content starts from.
     *
     * @return The modifier with a callback that keeps the part's layout coordinates.
     */
    /**
     * Test tags of the bars that are drawn over lists: app bars, toolbars, tab bars, the bottom navigation and
     * the bars of feeds (feed options, sort bars, sticky headers) and the "Join the conversation" bar of
     * comment pages.
     */
    private static final String[] BAR_TAGS = {
            "app_bar", "top_bar", "toolbar", "tab_bar", "bottom_nav", "feed_options", "feed_controls",
            "sort_bar", "sticky_header", "add_comment_button"
    };

    /**
     * The layout coordinates of the bars, by the bar's test tag.
     */
    private static final Map<Object, String> bars = Collections.synchronizedMap(new WeakHashMap<>());

    /**
     * One position callback per bar tag, so a bar keeps its callback when it is composed again.
     */
    private static final Map<String, BarCallback> barCallbacks = Collections.synchronizedMap(new LinkedHashMap<>());

    private static final class BarCallback implements kotlin.jvm.functions.Function1<Object, Object> {
        final String tag;

        BarCallback(String tag) {
            this.tag = tag;
        }

        @Override
        public Object invoke(Object coordinates) {
            if (coordinates != null) (isBarTag(tag) ? bars : overlays).put(coordinates, tag);
            return unit();
        }
    }

    private static boolean isBarTag(String tag) {
        for (String bar : BAR_TAGS) {
            if (tag.contains(bar)) return true;
        }
        return false;
    }

    /**
     * Test tags of what opens over a screen: bottom sheets (menus, share), modals and dialogs, scrims, popups,
     * dropdowns, tooltips and snackbars. What opens in its own window takes the window focus, which
     * {@link CommentSwipeActionsPatch} also checks.
     */
    private static final String[] OVERLAY_TAGS = {
            "sheet", "modal", "dialog", "scrim", "popup", "dropdown", "tooltip", "snackbar"
    };

    /**
     * The layout coordinates of the open sheets, modals and dialogs.
     */
    private static final Map<Object, String> overlays = Collections.synchronizedMap(new WeakHashMap<>());

    private static boolean isOverlayTag(String tag) {
        for (String overlay : OVERLAY_TAGS) {
            if (tag.contains(overlay)) return true;
        }
        return false;
    }

    /**
     * @return If a sheet, a modal or a dialog is open over the screen.
     */
    static boolean isOverlayOpen() {
        try {
            List<Object> coordinates;
            synchronized (overlays) {
                coordinates = new ArrayList<>(overlays.keySet());
            }
            for (Object overlay : coordinates) {
                if (coordinatesRect(overlay) != null) return true;
            }
        } catch (Throwable ex) {
            Logger.printException(() -> "isOverlayOpen failure", ex);
        }
        return false;
    }

    private static volatile int drawerLayoutId = -1;

    /**
     * @return If the side menu (a drawer of the drawer layout) is open.
     */
    static boolean isDrawerOpen(Activity activity) {
        try {
            int id = drawerLayoutId;
            if (id < 0) {
                id = activity.getResources().getIdentifier("drawer_layout", "id", activity.getPackageName());
                drawerLayoutId = id;
            }
            if (id == 0) return false;
            android.view.View view = activity.findViewById(id);
            if (!(view instanceof android.view.ViewGroup)) return false;
            android.view.ViewGroup layout = (android.view.ViewGroup) view;
            Rect visible = new Rect();
            // The first child is the content, the others are the drawers, which are not visible when closed.
            for (int i = 1; i < layout.getChildCount(); i++) {
                android.view.View drawer = layout.getChildAt(i);
                if (drawer.getVisibility() == android.view.View.VISIBLE
                        && drawer.getGlobalVisibleRect(visible) && visible.width() > 0) {
                    return true;
                }
            }
        } catch (Throwable ex) {
            Logger.printException(() -> "isDrawerOpen failure", ex);
        }
        return false;
    }

    /**
     * Injection point.
     * <p>
     * Called by Modifier.testTag(tag), before the tag is added to the modifier.
     *
     * @return The modifier, with a callback that keeps the layout coordinates if the tag is a bar.
     */
    public static Object onTestTag(Object modifier, String tag) {
        try {
            if (tag == null || !(isBarTag(tag) || isOverlayTag(tag))) return modifier;
            BarCallback callback = barCallbacks.get(tag);
            if (callback == null) {
                callback = new BarCallback(tag);
                barCallbacks.put(tag, callback);
            }
            return withPositionCallback(modifier, callback);
        } catch (Throwable ex) {
            Logger.printException(() -> "onTestTag failure", ex);
            return modifier;
        }
    }

    /**
     * @return The part of a rect that no bar of the screen is drawn over, or null if the finger is on a bar.
     * A bar above the finger moves the top of the rect down, a bar below it moves the bottom up.
     */
    static Rect withoutBars(Rect rect, float y) {
        Rect visible = new Rect(rect);
        try {
            List<Object> coordinates;
            synchronized (bars) {
                coordinates = new ArrayList<>(bars.keySet());
            }
            for (Object barCoordinates : coordinates) {
                Rect bar = coordinatesRect(barCoordinates);
                if (bar == null || !Rect.intersects(bar, visible)) continue;
                // A bar that holds the whole rect is a screen, not a bar over it.
                if (bar.contains(visible)) continue;
                if (bar.bottom <= y) {
                    visible.top = Math.max(visible.top, bar.bottom);
                } else if (bar.top > y) {
                    visible.bottom = Math.min(visible.bottom, bar.top);
                } else {
                    return null;
                }
                if (visible.height() <= 0) return null;
            }
        } catch (Throwable ex) {
            Logger.printException(() -> "withoutBars failure", ex);
        }
        return visible;
    }

    public static Object onOwnSwipeArea(Object modifier, Object section) {
        try {
            String key = section == null ? null : sectionKey(section, null);
            if (key == null) return modifier;
            AreaCallback callback = areas.get(key);
            if (callback == null) {
                callback = new AreaCallback();
                areas.put(key, callback);
            }
            return withPositionCallback(modifier, callback);
        } catch (Throwable ex) {
            Logger.printException(() -> "onOwnSwipeArea failure", ex);
            return modifier;
        }
    }

    private static volatile Method getValueMethod;
    private static volatile Field[] rectFields;

    /**
     * Reads the Compose Rect (left, top, right, bottom) in the bounds state.
     */
    private static Rect readRect(Object bounds) throws Exception {
        Method getValue = getValueMethod;
        if (getValue == null) {
            getValue = bounds.getClass().getMethod("getValue");
            getValue.setAccessible(true);
            getValueMethod = getValue;
        }
        Object rect = getValue.invoke(bounds);
        return rect == null ? null : rectOf(rect);
    }

    /**
     * Converts a Compose Rect (left, top, right, bottom) to a Rect, or null if it is empty.
     */
    private static Rect rectOf(Object rect) throws Exception {
        Field[] fields = rectFields;
        if (fields == null) {
            // The four float fields, in declaration order: left, top, right, bottom.
            List<Field> floats = new ArrayList<>();
            for (Field field : rect.getClass().getDeclaredFields()) {
                if (field.getType() == float.class && !Modifier.isStatic(field.getModifiers())) {
                    field.setAccessible(true);
                    floats.add(field);
                }
            }
            if (floats.size() != 4) throw new IllegalStateException("Unexpected rect " + rect.getClass());
            floats.sort(Comparator.comparing(Field::getName));
            fields = floats.toArray(new Field[0]);
            rectFields = fields;
        }
        Rect result = new Rect(Math.round(fields[0].getFloat(rect)), Math.round(fields[1].getFloat(rect)),
                Math.round(fields[2].getFloat(rect)), Math.round(fields[3].getFloat(rect)));
        return result.width() > 0 && result.height() > 0 ? result : null;
    }

    // endregion

    // region Actions

    static void perform(Activity activity, Target target, PostAction action) {
        try {
            String linkKindWithId = target.linkKindWithId;
            String uniqueId = target.uniqueId;
            Object identifier = target.identifier;
            boolean promoted = target.promoted;
            Object link = getLink(linkKindWithId);

            Object event;
            switch (action) {
                case UPVOTE:
                case DOWNVOTE: {
                    Object current = link == null ? null : invoke(link, "getVoteDirection");
                    if (current == null) current = enumValue("com.reddit.domain.model.vote.VoteDirection", "NONE");
                    event = create("com.reddit.feeds.ui.events.OnVoteClicked", 6,
                            linkKindWithId, identifier, uniqueId, promoted,
                            enumValue("com.reddit.ui.compose.ds.VoteButtonDirection",
                                    action == PostAction.UPVOTE ? "Up" : "Down"),
                            current);
                    break;
                }
                case SAVE: {
                    boolean saved = link != null && Boolean.TRUE.equals(invoke(link, "getSaved"));
                    event = create("com.reddit.feeds.impl.ui.events.IsSaved", 6,
                            identifier, withoutKind(linkKindWithId), uniqueId, linkKindWithId, promoted, !saved);
                    break;
                }
                case HIDE:
                    // The same event as Hide in the post menu.
                    event = create("com.reddit.feeds.ui.events.PostHidden", 9,
                            linkKindWithId, uniqueId, promoted, false,
                            enumValue("com.reddit.ads.analytics.HideAdCaller", "HIDE_CLICK"),
                            enumValue("com.reddit.feeds.ui.events.PostHiddenSource", "OVERFLOW_MENU"),
                            null, null, 0x198);
                    break;
                case SHARE:
                    event = create("com.reddit.feeds.impl.ui.events.OnClickShare", 6,
                            linkKindWithId, uniqueId, promoted, postIdValue(identifier), null, 48);
                    break;
                case OPEN_COMMENTS:
                    event = create("com.reddit.feeds.impl.ui.events.OnClickOpenComments", 6,
                            linkKindWithId, uniqueId, promoted, identifier,
                            contextTransitionParams(target.context, null), null);
                    break;
                case OVERFLOW:
                    // The same event as a long press on the post.
                    event = create("com.reddit.feeds.ui.events.OnOverflowMenuOpened", 7,
                            linkKindWithId, uniqueId, promoted,
                            enumValue("com.reddit.feeds.ui.OverflowMenuType",
                                    target.recommended ? "POST_RECOMMENDED" : "POST_DEFAULT"),
                            enumValue("com.reddit.feeds.ui.OverflowMenuTrigger", "LONG_PRESS"),
                            identifier, target.subredditMember);
                    break;
                case PROFILE: {
                    String author = link == null ? null : (String) invoke(link, "getAuthor");
                    if (author == null || author.isEmpty() || author.equals("[deleted]")) return;
                    open(activity, "https://www.reddit.com/user/" + author);
                    return;
                }
                case SUBREDDIT: {
                    String subreddit = link == null ? null : (String) invoke(link, "getSubreddit");
                    if (subreddit == null || subreddit.isEmpty()) return;
                    open(activity, "https://www.reddit.com/r/" + subreddit);
                    return;
                }
                default:
                    return;
            }

            @SuppressWarnings("unchecked")
            Function1<Object, Object> sink = (Function1<Object, Object>) contextEventSink(target.context, null);
            if (sink == null) throw new IllegalStateException("No event sink");
            sink.invoke(event);
            Logger.printDebug(() -> "Post swipe action " + action + " on " + linkKindWithId);
        } catch (Exception ex) {
            Logger.printException(() -> "Post swipe action failure: " + action, ex);
        }
    }

    private static Object getLink(String linkKindWithId) {
        if (linkKindWithId == null) return null;
        WeakReference<Object> reference = links.get(linkKindWithId);
        if (reference == null && !linkKindWithId.startsWith("t3_")) reference = links.get("t3_" + linkKindWithId);
        return reference == null ? null : reference.get();
    }

    private static String withoutKind(String linkKindWithId) {
        if (linkKindWithId == null) return null;
        int separator = linkKindWithId.indexOf('_');
        return separator < 0 ? linkKindWithId : linkKindWithId.substring(separator + 1);
    }

    /**
     * @return The value of the post identifier (PostId(value=...)), or null.
     */
    private static String postIdValue(Object identifier) {
        if (identifier == null) return null;
        try {
            for (Field field : identifier.getClass().getDeclaredFields()) {
                if (field.getType() == String.class && !Modifier.isStatic(field.getModifiers())) {
                    field.setAccessible(true);
                    return (String) field.get(identifier);
                }
            }
        } catch (Exception ex) {
            Logger.printException(() -> "postIdValue failure", ex);
        }
        return null;
    }

    private static void open(Activity activity, String url) {
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
        intent.setPackage(activity.getPackageName());
        activity.startActivity(intent);
    }

    private static final Map<String, Constructor<?>> constructors = Collections.synchronizedMap(new LinkedHashMap<>());

    /**
     * Creates an event with its constructor of the given parameter count. Reddit keeps the names of the
     * event classes and of the enums they take.
     */
    private static Object create(String className, int parameterCount, Object... arguments) throws Exception {
        String key = className + "/" + parameterCount;
        Constructor<?> constructor = constructors.get(key);
        if (constructor == null) {
            Class<?> type = Class.forName(className, true, PostSwipe.class.getClassLoader());
            for (Constructor<?> candidate : type.getDeclaredConstructors()) {
                if (candidate.getParameterCount() == parameterCount && !candidate.isSynthetic()) {
                    constructor = candidate;
                    break;
                }
            }
            if (constructor == null) {
                throw new IllegalStateException("No constructor with " + parameterCount + " parameters in "
                        + className + ": " + Arrays.toString(type.getDeclaredConstructors()));
            }
            constructor.setAccessible(true);
            constructors.put(key, constructor);
        }
        return constructor.newInstance(arguments);
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    private static Object enumValue(String className, String name) throws Exception {
        Class type = Class.forName(className, true, PostSwipe.class.getClassLoader());
        return Enum.valueOf(type, name);
    }

    private static Object invoke(Object target, String methodName) throws Exception {
        Method method = target.getClass().getMethod(methodName);
        return method.invoke(target);
    }

    // endregion
}
