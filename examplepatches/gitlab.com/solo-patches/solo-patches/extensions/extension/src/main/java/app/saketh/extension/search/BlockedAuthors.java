package app.saketh.extension.search;

import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 * Removes books whose author the user has blocked from WebNovel's search, tag and genre results.
 * Search results name the author but carry no author ID, so the blocked users' own book lists
 * decide which books to remove.
 */
public final class BlockedAuthors {
    private static final String TAG = "SoloPatches";
    private static final String SEARCH_RESULTS = "com.qidian.QDReader.components.entity.SearchBookListModel";
    // ponytail: blocks made in the native profile screen refresh the list at once. Blocks made on the
    // website or in a Flutter screen show up within a minute. Hook those screens if that lags.
    private static final long REFRESH_MILLIS = 60_000;

    private static Map<Long, Set<Long>> booksByAuthor = new HashMap<>();
    private static volatile Set<Long> blockedBooks = Collections.emptySet();
    private static long refreshedAt = -REFRESH_MILLIS;
    // ponytail: remembers only the latest emptied page. If two list screens load at once, the other
    // one falls back to the app's "No results" view; keep a set if that ever matters.
    private static volatile Object emptiedPage;

    private BlockedAuthors() {}

    /** Called with every typed API response before native list screens unwrap it. */
    public static void filterResponse(Object response) {
        try {
            Object data = call(response, "getData");
            if (data == null || !data.getClass().getName().equals(SEARCH_RESULTS)) return;
            List<?> books = (List<?>) call(data, "getBookInfos");
            if (books == null || books.isEmpty()) return;
            Set<Long> blocked = blockedBooks();
            for (Iterator<?> book = books.iterator(); book.hasNext(); ) {
                if (blocked.contains(call(book.next(), "getBookId"))) book.remove();
            }
            if (books.isEmpty() && !Boolean.TRUE.equals(call(data, "getLast"))) emptiedPage = data;
        } catch (ReflectiveOperationException | RuntimeException failed) {
            Log.w(TAG, "Search results left unfiltered", failed);
        }
    }

    /**
     * Called by the native book list screen when a page arrives with no books. Returns true when
     * this filter removed every book and more pages follow, so the screen loads the next page
     * instead of showing "No results" and stopping.
     */
    public static boolean skipsEmptiedPage(Object page) {
        if (page == null || page != emptiedPage) return false;
        emptiedPage = null;
        return true;
    }

    /** Called when the user blocks or unblocks someone in the app, so the next results use the new list. */
    public static synchronized void blockChanged() {
        refreshedAt = SystemClock.elapsedRealtime() - REFRESH_MILLIS;
    }

    /** Called with every JSON response that the native HTTP bridge passes to Flutter screens. */
    public static void filterJson(JSONObject response) {
        JSONObject data = response.optJSONObject("Data");
        JSONArray books = data == null ? null : data.optJSONArray("BookInfos");
        if (books == null || books.length() == 0) return;
        Set<Long> blocked = blockedBooks();
        for (int i = books.length() - 1; i >= 0; i--) {
            JSONObject book = books.optJSONObject(i);
            if (book != null && blocked.contains(book.optLong("BookId"))) books.remove(i);
        }
    }

    /**
     * Returns the book IDs of every blocked author. Responses are unwrapped on network threads, so
     * this fetches synchronously; on the main thread it only returns what is already known.
     */
    private static synchronized Set<Long> blockedBooks() {
        long now = SystemClock.elapsedRealtime();
        if (Looper.myLooper() == Looper.getMainLooper() || now - refreshedAt < REFRESH_MILLIS) return blockedBooks;
        refreshedAt = now;
        try {
            Object api = networkApi();
            Map<Long, Set<Long>> authors = new HashMap<>();
            Set<Long> books = new HashSet<>();
            for (Object user : (List<?>) call(fetch(api, "getBlockedUsersApi"), "getItems")) {
                Long userId = (Long) call(user, "getUserId");
                if (userId == null) continue;
                Set<Long> written = booksByAuthor.get(userId);
                // ponytail: one request per newly blocked user, in sequence. Most blocked users are
                // readers with no books; parallelize if long block lists slow the first search.
                if (written == null) written = booksOf(api, userId);
                authors.put(userId, written);
                books.addAll(written);
            }
            booksByAuthor = authors;
            blockedBooks = books;
        } catch (ReflectiveOperationException | RuntimeException failed) {
            Log.w(TAG, "Could not load blocked authors' books", failed);
        }
        return blockedBooks;
    }

    private static Set<Long> booksOf(Object api, long userId) throws ReflectiveOperationException {
        Set<Long> books = new HashSet<>();
        List<?> items = (List<?>) call(fetch(api, "getAuthorHomePage", userId, 0), "getBookListItems");
        if (items != null) {
            for (Object item : items) books.add((Long) call(item, "getBookId"));
        }
        return books;
    }

    /** The patch replaces this body with WebNovel's own getter for its API client. */
    private static Object networkApi() {
        throw new IllegalStateException("Hide blocked authors' books is not patched in");
    }

    /**
     * Runs one request of WebNovel's API client and returns its data. Its Retrofit observables
     * run the request on the subscribing thread, so the result is ready when subscribe returns.
     */
    private static Object fetch(Object api, String request, Object... arguments) throws ReflectiveOperationException {
        Method method = null;
        for (Method candidate : api.getClass().getMethods()) {
            if (candidate.getName().equals(request)) method = candidate;
        }
        if (method == null) throw new NoSuchMethodException(request);
        Object observable = method.invoke(api, arguments);
        Method subscribe = subscribeMethod(observable.getClass());
        Class<?> observerType = subscribe.getParameterTypes()[0];
        Object[] response = new Object[1];
        Throwable[] error = new Throwable[1];
        Object observer = Proxy.newProxyInstance(observerType.getClassLoader(), new Class<?>[]{observerType},
                (proxy, called, values) -> {
                    switch (called.getName()) {
                        case "onNext": response[0] = values[0]; return null;
                        case "onError": error[0] = (Throwable) values[0]; return null;
                        case "equals": return proxy == values[0];
                        case "hashCode": return System.identityHashCode(proxy);
                        case "toString": return "BlockedAuthors observer";
                        default: return null;
                    }
                });
        subscribe.invoke(observable, observer);
        if (error[0] != null) throw new IllegalStateException(request + " failed", error[0]);
        if (response[0] == null || !Integer.valueOf(0).equals(call(response[0], "getResult"))) {
            throw new IllegalStateException(request + " returned no data");
        }
        return call(response[0], "getData");
    }

    /** RxJava's subscribe(Observer) is obfuscated; it is the public void method taking an Observer. */
    private static Method subscribeMethod(Class<?> observable) throws NoSuchMethodException {
        for (Method method : observable.getMethods()) {
            Class<?>[] parameters = method.getParameterTypes();
            if (method.getReturnType() == void.class && !Modifier.isStatic(method.getModifiers())
                    && parameters.length == 1 && parameters[0].isInterface() && isObserver(parameters[0])) {
                return method;
            }
        }
        throw new NoSuchMethodException("RxJava subscribe");
    }

    private static boolean isObserver(Class<?> type) {
        Set<String> names = new HashSet<>();
        for (Method method : type.getDeclaredMethods()) names.add(method.getName());
        return names.contains("onSubscribe") && names.contains("onNext") && names.contains("onError");
    }

    private static Object call(Object target, String getter) throws ReflectiveOperationException {
        return target.getClass().getMethod(getter).invoke(target);
    }
}
