package app.template.extension.extension;

import android.graphics.Typeface;
import android.os.Handler;
import android.os.Looper;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextUtils;
import android.text.style.StyleSpan;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.json.JSONArray;
import org.json.JSONObject;

/** Adds SmartTube-style nested replies to the TV comment sheet. */
@SuppressWarnings("unused")
public final class NestedComments {

    private static final String TAG = "TikTokTVNested";

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService HTTP = Executors.newSingleThreadExecutor();

    private static final String REPLY_PATH = "/lite/v2/comment/reply/list/";
    private static final int PAGE_SIZE = 50;

    private static WeakReference<Object> fragmentRef = new WeakReference<>(null);
    private static final ArrayList<Pane> STACK = new ArrayList<>();
    private static Object topValue = null;
    private static List<Object> topSnapshot = null;
    private static String topTitle = null;
    private static int topFocus = 0;
    private static volatile boolean loading = false;

    private static final class Pane {
        List<Object> comments;
        String title;
        String awemeId;
        String cid;
        int focus;
        long cursor;
        boolean hasMore;
        boolean requested;
    }

    private static final class Page {
        List<Object> comments;
        long total;
        long cursor;
        boolean hasMore;
    }

    private NestedComments() {
    }

    // ---- hooks -------------------------------------------------------------------------------

    /** CommentListFragmentV2.onResume: remember the pane; a new instance starts a fresh stack. */
    public static void bindFragment(Object fragment) {
        if (fragment == null) return;
        if (fragmentRef.get() != fragment) {
            fragmentRef = new WeakReference<>(fragment);
            STACK.clear();
            topValue = null;
            topSnapshot = null;
            loading = false;
            Log.i(TAG, "bound comment pane " + fragment.getClass().getSimpleName());
        }
    }

    /** The aweme observer: a new video means a fresh comment thread. */
    public static void onAwemeChanged(Object fragment) {
        STACK.clear();
        topValue = null;
        topSnapshot = null;
        loading = false;
    }

    /** The comment grid asks the view model for the next page whenever the selected row is near the end. */
    public static boolean onLoadMoreRequested() {
        Pane pane = STACK.isEmpty() ? null : STACK.get(STACK.size() - 1);
        if (pane == null) return true;
        if (pane.hasMore && !pane.requested) fetchNextPage(pane);
        return false;
    }

    /** End of CommentAdapterV2.CommentViewHolderV2.bind: add the inline "N replies" affordance. */
    public static void bindAffordance(Object holder, Object comment) {
        if (holder == null || comment == null) return;
        try {
            long replies = replyCount(comment);
            Object binding = get(holder, "b");
            Object dateView = get(binding, "e");
            if (dateView instanceof TextView && replies > 0) {
                CharSequence current = ((TextView) dateView).getText();
                if (current == null) current = "";
                String suffix = "  \u00b7  " + replies + (replies == 1 ? " reply" : " replies");
                SpannableString text = new SpannableString(TextUtils.concat(current, suffix));
                text.setSpan(new StyleSpan(Typeface.BOLD), current.length(), text.length(),
                        Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                ((TextView) dateView).setText(text);
            }
            // SmartTube's long-press gesture: CENTER opens the replies pane, holding CENTER likes.
            Object itemView = get(holder, "itemView");
            if (itemView instanceof View) {
                ((View) itemView).setOnLongClickListener(v -> {
                    toggleLike(holder, comment);
                    return true;
                });
            }
            Log.i(TAG, "row cid=" + call0(comment, "getCid") + " replies=" + replies);
        } catch (Throwable failure) {
            Log.i(TAG, "affordance " + failure);
        }
    }

    /**
     * The row click dispatcher. Returns true when the click opened a replies pane (so the original
     * like/compose action is skipped).
     */
    public static boolean onClick(Object adapter, Object holder, Object comment, Object view) {
        try {
            if (comment == null) return false;
            long replies = replyCount(comment);
            Object inline = call0(comment, "getReplyComments");
            boolean hasReplies = replies > 0 || (inline instanceof List && !((List<?>) inline).isEmpty());
            if (!hasReplies) return false;
            if (loading) return true;

            Object fragment = fragmentRef.get();
            if (fragment == null || adapter == null) return false;

            String awemeId = (String) call0(comment, "getAwemeId");
            String cid = (String) call0(comment, "getCid");
            if (TextUtils.isEmpty(cid)) return false;

            if (STACK.isEmpty()) {
                Object current = call0(adapter, "a");
                topSnapshot = current instanceof List ? new ArrayList<>((List<?>) current) : null;
                topValue = liveValue(fragment);
                topTitle = titleOf(fragment);
                Object position = call0(holder, "getAdapterPosition");
                topFocus = position instanceof Number ? ((Number) position).intValue() : 0;
                Log.i(TAG, "saved top-level size=" + (topSnapshot == null ? -1 : topSnapshot.size())
                        + " at=" + topFocus);
            }

            openReplies(fragment, adapter, awemeId, cid, replies);
            return true;
        } catch (Throwable failure) {
            Log.i(TAG, "onClick " + failure);
            return false;
        }
    }

    /**
     * The pane BACK handler: 0 pops a replies pane (the pane manager reads 0 as consumed and stays
     * open), 1 falls through to the stock body.
     */
    public static int onBack(Object keyHandler) {
        try {
            if (STACK.isEmpty()) return 1;
            Object fragment = get(keyHandler, "a");
            STACK.remove(STACK.size() - 1);
            if (STACK.isEmpty()) {
                restoreTop(fragment);
            } else {
                Pane pane = STACK.get(STACK.size() - 1);
                Object adapter = adapterOf(fragment);
                setList(adapter, pane.comments);
                updateTitle(fragment, pane.title);
                hideEmpty(fragment, pane.comments.size());
                setCurrentPosition(fragment, pane.focus);
                scrollTo(fragment, pane.focus);
            }
            return 0;
        } catch (Throwable failure) {
            Log.i(TAG, "onBack " + failure);
            return 1;
        }
    }

    /**
     * End of the CommentItemList observer. While a replies pane is open the native observer would
     * otherwise overwrite it with top-level comments (load-more.
     */
    public static void syncList() {
        try {
            if (STACK.isEmpty()) return;
            Object fragment = fragmentRef.get();
            if (fragment == null) return;

            Pane pane = STACK.get(STACK.size() - 1);
            Object adapter = adapterOf(fragment);
            Object current = call0(adapter, "a");
            if (current != pane.comments) setList(adapter, pane.comments);
            updateTitle(fragment, pane.title);
            hideEmpty(fragment, pane.comments.size());
        } catch (Throwable failure) {
            Log.i(TAG, "syncList " + failure);
        }
    }

    // ---- replies pane ------------------------------------------------------------------------

    private static void openReplies(Object fragment, Object adapter, String awemeId, String cid,
                                    long expected) {
        loading = true;
        updateTitle(fragment, "Replies\u2026");
        String origin = Subtitles.origin();
        Log.i(TAG, "open replies cid=" + cid + " aweme=" + awemeId + " expected=" + expected
                + " origin=" + origin);
        HTTP.execute(() -> {
            Page page = origin == null ? null : fetchPage(origin, awemeId, cid, 0);
            MAIN.post(() -> {
                loading = false;
                if (page == null || page.comments.isEmpty()) {
                    updateTitle(fragment, topTitle != null ? topTitle : "Comments");
                    hideEmpty(fragment, topSnapshot == null ? 0 : topSnapshot.size());
                    scrollTo(fragment, topFocus);
                    Log.i(TAG, "no replies parsed for cid=" + cid);
                    return;
                }
                Pane pane = new Pane();
                pane.comments = page.comments;
                pane.awemeId = awemeId;
                pane.cid = cid;
                pane.cursor = page.cursor;
                pane.hasMore = page.hasMore;
                long count = expected > 0 ? expected : page.total;
                pane.title = "Replies " + count;
                pane.focus = 0;
                STACK.add(pane);
                setList(adapter, pane.comments);
                updateTitle(fragment, pane.title);
                hideEmpty(fragment, pane.comments.size());
                scrollTo(fragment, 0);
                Log.i(TAG, "showing " + page.comments.size() + " replies for cid=" + cid
                        + " hasMore=" + page.hasMore + " cursor=" + page.cursor);
            });
        });
    }

    private static Page fetchPage(String origin, String awemeId, String cid, long cursor) {
        String url = origin + REPLY_PATH + "?item_id=" + awemeId + "&comment_id=" + cid
                + "&cursor=" + cursor + "&count=" + PAGE_SIZE + "&enter_from=comment_panel";
        String body = Subtitles.signedGet(url);
        Log.i(TAG, "reply body cursor=" + cursor + " "
                + (body == null ? "null" : body.length() + "B"));
        return parsePage(body);
    }

    /** The grid reached the end of the replies pane: append the next page to the same list. */
    private static void fetchNextPage(Pane pane) {
        String origin = Subtitles.origin();
        Object fragment = fragmentRef.get();
        if (origin == null || fragment == null) return;
        pane.requested = true;
        final long cursor = pane.cursor;
        Log.i(TAG, "more replies cid=" + pane.cid + " cursor=" + cursor);
        HTTP.execute(() -> {
            Page page = fetchPage(origin, pane.awemeId, pane.cid, cursor);
            MAIN.post(() -> {
                pane.requested = false;
                if (page == null || !STACK.contains(pane)) return;
                try {
                    if (page.comments.isEmpty()) {
                        pane.hasMore = false;
                        Log.i(TAG, "end of replies cid=" + pane.cid);
                        return;
                    }
                    pane.comments.addAll(page.comments);
                    if (page.cursor == cursor && page.hasMore) {
                        pane.hasMore = false; // the cursor did not advance; stop instead of looping
                    } else {
                        pane.cursor = page.cursor;
                        pane.hasMore = page.hasMore;
                    }
                    Object adapter = adapterOf(fragment);
                    setList(adapter, pane.comments);
                    scrollTo(fragment, currentPosition(fragment));
                    updateTitle(fragment, pane.title);
                    hideEmpty(fragment, pane.comments.size());
                    Log.i(TAG, "appended " + page.comments.size() + " replies, now "
                            + pane.comments.size() + " hasMore=" + pane.hasMore);
                } catch (Throwable failure) {
                    Log.i(TAG, "fetchNextPage " + failure);
                }
            });
        });
    }

    private static void restoreTop(Object fragment) {
        try {
            int position = Math.max(topFocus, 0);
            setCurrentPosition(fragment, position);
            setHasFocused(fragment, true);
            // The live value is not a reliable restore source: a page load or a like update can
            // replace it with a page item list whose total is 0, and re-emitting that runs the
            // observer's showError(0) path, which clears the title and raises "No comments".
            // The snapshot and the title captured at click time are the authoritative state.
            if (topSnapshot != null) {
                setList(adapterOf(fragment), topSnapshot);
                updateTitle(fragment, topTitle != null ? topTitle : "Comments");
                hideEmpty(fragment, topSnapshot.size());
                scrollTo(fragment, position);
                Log.i(TAG, "restore top snapshot size=" + topSnapshot.size() + " at=" + position);
            } else if (topValue != null) {
                Object viewModel = call0(fragment, "getMViewModel");
                Object liveData = call0(viewModel, "a");
                Log.i(TAG, "restore top value total=" + call0(topValue, "getTotal") + " at=" + position);
                call(liveData, "setValue", new Class[]{Object.class}, new Object[]{topValue});
            }
            topValue = null;
            topSnapshot = null;
            Log.i(TAG, "restored top-level comments");
        } catch (Throwable failure) {
            Log.i(TAG, "restoreTop " + failure);
        }
    }

    /** Parse the reply body with the app's Gson into its CommentItemList, yielding real Comments. */
    private static Page parsePage(String body) {
        if (body == null || body.isEmpty()) return null;
        TranslateComments.scanBody(body);
        try {
            org.json.JSONObject shape = new org.json.JSONObject(body);
            org.json.JSONArray comments = shape.optJSONArray("comments");
            Log.i(TAG, "reply shape comments=" + (comments == null ? -1 : comments.length())
                    + " head=" + body.substring(0, Math.min(200, body.length())));
        } catch (Throwable failure) {
            Log.i(TAG, "reply shape failed " + failure + " head=" + body.substring(0,
                    Math.min(120, body.length())));
        }
        try {
            Class<?> itemList = Class.forName(
                    "com.ss.android.ugc.aweme.comment.model.CommentItemList");
            Class<?> commentClass = Class.forName(
                    "com.ss.android.ugc.aweme.comment.model.Comment");
            body = sanitize(body, itemList, commentClass);

            Object gson = Class.forName("com.google.gson.f").getConstructor().newInstance();
            Object parsed = gson.getClass().getMethod("a", String.class, Class.class)
                    .invoke(gson, body, itemList);
            if (parsed == null) return null;
            Object items = call0(parsed, "getItems");
            if (!(items instanceof List)) return null;

            Page page = new Page();
            page.comments = new ArrayList<>((List<?>) items);
            page.total = number(call0(parsed, "getTotal"));
            page.cursor = number(call0(parsed, "getCursor"));
            page.hasMore = Boolean.TRUE.equals(call0(parsed, "isHasMore"));
            Log.i(TAG, "parsed " + page.comments.size() + " replies, total=" + page.total
                    + " hasMore=" + page.hasMore + " cursor=" + page.cursor);
            return page;
        } catch (Throwable failure) {
            Throwable cause = failure.getCause() == null ? failure : failure.getCause();
            Log.i(TAG, "parsePage " + cause);
            Log.i(TAG, "parsePage trace " + Log.getStackTraceString(cause));
            return null;
        }
    }

    private static long number(Object value) {
        return value instanceof Number ? ((Number) value).longValue() : 0L;
    }

    // ---- reflective helpers ------------------------------------------------------------------

    /**
     * Lite and the TV model disagree on a handful of field types: the reply wire sends user.secret
     * and friends as 0/1 where the TV User declares boolean.
     */
    private static String sanitize(String body, Class<?> rootClass, Class<?> commentClass) {
        try {
            JSONObject root = new JSONObject(body);
            coerce(root, rootClass);
            JSONArray comments = root.optJSONArray("comments");
            if (comments == null) return body;
            for (int i = 0; i < comments.length(); i++) {
                JSONObject item = comments.optJSONObject(i);
                if (item != null) coerce(item, commentClass);
            }
            return root.toString();
        } catch (Throwable failure) {
            Log.i(TAG, "sanitize " + failure);
            return body;
        }
    }

    private static void coerce(JSONObject object, Class<?> type) {
        Class<?> source = type;
        while (source != null && source != Object.class) {
            for (Field field : source.getDeclaredFields()) {
                String wire = wireName(field);
                if (!object.has(wire)) continue;

                Class<?> fieldType = field.getType();
                Object value = object.opt(wire);
                try {
                    if ((fieldType == boolean.class || fieldType == Boolean.class)
                            && value instanceof Number) {
                        object.put(wire, ((Number) value).longValue() != 0L);
                    } else if ((fieldType == int.class || fieldType == Integer.class
                            || fieldType == long.class || fieldType == Long.class)
                            && value instanceof Boolean) {
                        object.put(wire, ((Boolean) value) ? 1 : 0);
                    } else if (value instanceof JSONObject && isModel(fieldType)) {
                        coerce((JSONObject) value, fieldType);
                    } else if (value instanceof JSONArray) {
                        Class<?> element = elementType(field);
                        if (element == null || !isModel(element)) continue;
                        JSONArray array = (JSONArray) value;
                        for (int i = 0; i < array.length(); i++) {
                            JSONObject child = array.optJSONObject(i);
                            if (child != null) coerce(child, element);
                        }
                    }
                } catch (Throwable failure) {
                    Log.i(TAG, "coerce " + wire + " " + failure);
                }
            }
            source = source.getSuperclass();
        }
    }

    /** The wire key Gson uses for a field: its {@code @SerializedName} when present. */
    private static String wireName(Field field) {
        try {
            Class<?> serialized = Class.forName("com.google.gson.a.c");
            java.lang.annotation.Annotation annotation = field.getAnnotation((Class) serialized);
            if (annotation != null) {
                Object value = annotation.getClass().getMethod("a").invoke(annotation);
                if (value instanceof String && !((String) value).isEmpty()) return (String) value;
            }
        } catch (Throwable ignored) {
            // fall through to the field name
        }
        return field.getName();
    }

    private static boolean isModel(Class<?> type) {
        return type != null && !type.isPrimitive() && type != String.class
                && !Number.class.isAssignableFrom(type) && !Boolean.class.isAssignableFrom(type)
                && !type.isEnum() && type.getName().startsWith("com.ss.android");
    }

    private static Class<?> elementType(Field field) {
        try {
            Type generic = field.getGenericType();
            if (generic instanceof ParameterizedType) {
                Type[] arguments = ((ParameterizedType) generic).getActualTypeArguments();
                if (arguments.length > 0 && arguments[0] instanceof Class) {
                    return (Class<?>) arguments[0];
                }
            }
        } catch (Throwable ignored) {
            // no element type
        }
        return null;
    }

    private static String titleOf(Object fragment) {
        try {
            Object title = get(fragment, "titleView");
            if (title instanceof TextView) {
                CharSequence text = ((TextView) title).getText();
                if (text != null && text.length() > 0) return text.toString();
            }
        } catch (Throwable ignored) {
            // fall through to the generic title
        }
        return "Comments";
    }

    /** Long-press CENTER on a comment toggles its like through the holder's own optimistic path. */
    private static void toggleLike(Object holder, Object comment) {
        try {
            Class<?> adapter = Class.forName("com.ss.android.ugc.aweme.tv.comment.fragment.b");
            Object loggedIn = adapter.getMethod("c").invoke(null);
            if (!Boolean.TRUE.equals(loggedIn)) {
                Log.i(TAG, "long-press like skipped: logged out");
                return;
            }
            Class<?> commentClass = Class.forName("com.ss.android.ugc.aweme.comment.model.Comment");
            java.lang.reflect.Method like = holder.getClass().getDeclaredMethod("g", commentClass);
            like.setAccessible(true);
            like.invoke(holder, comment);
            Log.i(TAG, "long-press like cid=" + call0(comment, "getCid"));
        } catch (Throwable failure) {
            Log.i(TAG, "long-press like " + failure);
        }
    }

    private static long replyCount(Object comment) throws Exception {
        Object value = call0(comment, "getReplyCommentTotal");
        return value instanceof Number ? ((Number) value).longValue() : 0L;
    }

    private static Object adapterOf(Object fragment) throws Exception {
        return get(fragment, "mAdapter");
    }

    private static Object liveValue(Object fragment) {
        try {
            Object viewModel = call0(fragment, "getMViewModel");
            Object liveData = call0(viewModel, "a");
            return call0(liveData, "getValue");
        } catch (Throwable failure) {
            Log.i(TAG, "liveValue " + failure);
            return null;
        }
    }

    /** Keep the fragment's own remembered row in sync so its observer scrolls back to it. */
    private static void setCurrentPosition(Object fragment, int position) {
        try {
            findField(fragment.getClass(), "mCurrentPosition").setInt(fragment, position);
        } catch (Throwable failure) {
            Log.i(TAG, "setCurrentPosition " + failure);
        }
    }

    private static int currentPosition(Object fragment) {
        try {
            return findField(fragment.getClass(), "mCurrentPosition").getInt(fragment);
        } catch (Throwable failure) {
            return 0;
        }
    }

    private static void setHasFocused(Object fragment, boolean focused) {
        try {
            findField(fragment.getClass(), "mHasFocused").setBoolean(fragment, focused);
        } catch (Throwable failure) {
            Log.i(TAG, "setHasFocused " + failure);
        }
    }

    /** showError(total <= 0, ...) is what raises the "No comments" state and clears the title. */
    private static void hideEmpty(Object fragment, int count) {
        try {
            java.lang.reflect.Method show = fragment.getClass()
                    .getDeclaredMethod("showError", long.class, boolean.class);
            show.setAccessible(true);
            show.invoke(fragment, (long) count, false);
        } catch (Throwable failure) {
            Log.i(TAG, "hideEmpty " + failure);
        }
    }

    private static void setList(Object adapter, List<Object> comments) {
        try {
            call(adapter, "a", new Class[]{List.class}, new Object[]{comments});
        } catch (Throwable failure) {
            Log.i(TAG, "setList " + failure);
        }
    }

    private static void updateTitle(Object fragment, String title) {
        try {
            call(fragment, "updateTitle", new Class[]{String.class}, new Object[]{title});
        } catch (Throwable failure) {
            Log.i(TAG, "updateTitle " + failure);
        }
    }

    private static void scrollTo(Object fragment, int position) {
        try {
            Object binding = call0(fragment, "getMBinding");
            Object grid = get(binding, "e");
            // WidgetUtils.a(recyclerView, position) is the app's own "focus this row" helper:
            // it posts requestFocus and scrollToPositionWithOffset(position, 0).
            Class<?> recycler = Class.forName("androidx.recyclerview.widget.RecyclerView");
            Class<?> widget = Class.forName("com.ss.android.ugc.aweme.tv.ui.k");
            widget.getMethod("a", recycler, int.class).invoke(null, grid, position);
        } catch (Throwable failure) {
            Log.i(TAG, "scrollTo " + failure);
        }
    }

    private static Field findField(Class<?> type, String name) throws NoSuchFieldException {
        while (type != null) {
            try {
                Field field = type.getDeclaredField(name);
                field.setAccessible(true);
                return field;
            } catch (NoSuchFieldException missing) {
                type = type.getSuperclass();
            }
        }
        throw new NoSuchFieldException(name);
    }

    private static Object get(Object target, String name) throws Exception {
        return findField(target.getClass(), name).get(target);
    }

    private static Object call(Object target, String name, Class<?>[] types, Object[] args)
            throws Exception {
        return target.getClass().getMethod(name, types).invoke(target, args);
    }

    private static Object call0(Object target, String name) throws Exception {
        return target.getClass().getMethod(name).invoke(target);
    }
}
