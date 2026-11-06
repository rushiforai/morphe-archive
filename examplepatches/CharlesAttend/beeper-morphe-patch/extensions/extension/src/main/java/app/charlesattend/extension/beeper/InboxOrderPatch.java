package app.charlesattend.extension.beeper;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import android.widget.Toast;

import java.util.Collections;
import java.util.Locale;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Lets the user show the main inbox with the oldest chats first.
 * The "Inbox order option" patch calls these methods from the app code.
 */
@SuppressWarnings("unused")
public final class InboxOrderPatch {
    private static final String TAG = "MorpheInboxOrder";

    private static final String PREFERENCES_NAME = "morphe_inbox_order";
    private static final String KEY_OLDEST_FIRST = "oldest_first";

    /**
     * Replaces "ORDER BY R.isInvite = 1 DESC, timestamp DESC" for the main inbox.
     * Invites stay first, and chats without a timestamp stay last.
     */
    static final String ORDER_BY_OLDEST_FIRST =
            "    ORDER BY R.isInvite = 1 DESC, timestamp IS NULL, timestamp ASC";

    /** toString() of the built-in main inbox space. */
    static final String MAIN_INBOX_SPACE = "Inbox";

    private static final Object LOCK = new Object();

    private static volatile Context context;
    private static volatile Boolean oldestFirst;
    private static volatile Object menuSpace;

    private static final Set<Object> pagingSources = Collections.newSetFromMap(new WeakHashMap<>());

    private InboxOrderPatch() {
    }

    // region Called by the patched app code.

    /** Called at the start of BooperApplication.onCreate(). */
    public static void setContext(Context appContext) {
        context = appContext;
    }

    /**
     * Called by the inbox query builders instead of the ORDER BY constant.
     *
     * @param isMainInboxQuery the result of {@link #isMainInboxQuery} for this query.
     * @return the new ORDER BY clause, or null to keep the original one.
     */
    public static String orderBy(boolean isMainInboxQuery) {
        try {
            if (isMainInboxQuery && isOldestFirst()) {
                return ORDER_BY_OLDEST_FIRST;
            }
        } catch (Throwable throwable) {
            Log.e(TAG, "Could not read the inbox order setting", throwable);
        }
        return null;
    }

    /**
     * Called by a helper method that the patch adds to each inbox query lambda.
     * The helper reads these values from the lambda and from its Inbox4SpaceQuery.
     *
     * @return true for the list of the main inbox, but not for its pinned chats
     * and not for the Archive, Low priority and Requests filters.
     */
    public static boolean isMainInboxQuery(boolean filterForMainInbox, Boolean filterIsPinned,
                                           Boolean filterArchived, Boolean filterLowPriority,
                                           Boolean filterMessageRequests) {
        return filterForMainInbox
                // The pinned chats use their own query (pinned = TRUE).
                && Boolean.FALSE.equals(filterIsPinned)
                && !Boolean.TRUE.equals(filterArchived)
                && !Boolean.TRUE.equals(filterLowPriority)
                && !Boolean.TRUE.equals(filterMessageRequests);
    }

    /** Called by the inbox paging source constructor, right after its superclass constructor. */
    public static void registerPagingSource(Object pagingSource) {
        synchronized (pagingSources) {
            pagingSources.add(pagingSource);
        }
    }

    /** Called by the inbox title menu before it shows its last items. */
    public static void setMenuSpace(Object space) {
        menuSpace = space;
    }

    /** The inbox title menu shows the item only for the main inbox. */
    public static boolean shouldShowMenuItem() {
        return MAIN_INBOX_SPACE.equals(String.valueOf(menuSpace));
    }

    public static String getMenuLabel() {
        return isFrench() ? "Plus anciens d'abord" : "Oldest first";
    }

    /** @return the check icon when the option is on, else null (no trailing icon). */
    public static Object getMenuTrailingIcon(Object checkIcon) {
        return isOldestFirst() ? checkIcon : null;
    }

    // endregion

    // region Placeholders. The patch replaces their bodies with calls to obfuscated app code.

    /** Calls PagingSource.invalidate() on the given paging source. */
    public static void invalidatePagingSource(Object pagingSource) {
    }

    /** Calls invoke() on the given Kotlin Function0 and returns its result. */
    public static Object invokeFunction0(Object function) {
        return null;
    }

    // endregion

    static boolean isOldestFirst() {
        Boolean value = oldestFirst;
        if (value != null) {
            return value;
        }
        Context appContext = context;
        if (appContext == null) {
            return false;
        }
        // The inbox queries run on background threads. The lock makes sure that a first load
        // of the saved value cannot overwrite a value that toggle() sets at the same time.
        synchronized (LOCK) {
            if (oldestFirst == null) {
                oldestFirst = preferences(appContext).getBoolean(KEY_OLDEST_FIRST, false);
            }
            return oldestFirst;
        }
    }

    /** Called when the user taps the menu item. */
    static void toggle() {
        boolean value;
        Context appContext = context;
        synchronized (LOCK) {
            value = !isOldestFirst();
            oldestFirst = value;
            if (appContext != null) {
                preferences(appContext).edit().putBoolean(KEY_OLDEST_FIRST, value).apply();
            }
        }

        if (appContext != null) {
            Toast.makeText(appContext, toastText(value), Toast.LENGTH_SHORT).show();
        }

        // Load the list again, so that all pages use the new order.
        invalidatePagingSources();
    }

    private static void invalidatePagingSources() {
        Object[] sources;
        synchronized (pagingSources) {
            sources = pagingSources.toArray();
        }
        for (Object source : sources) {
            try {
                invalidatePagingSource(source);
            } catch (Throwable throwable) {
                Log.e(TAG, "Could not reload the inbox", throwable);
            }
        }
    }

    private static SharedPreferences preferences(Context appContext) {
        return appContext.getSharedPreferences(PREFERENCES_NAME, Context.MODE_PRIVATE);
    }

    private static String toastText(boolean value) {
        if (isFrench()) {
            return value ? "Boîte de réception : plus anciens d'abord"
                    : "Boîte de réception : plus récents d'abord";
        }
        return value ? "Inbox: oldest first" : "Inbox: newest first";
    }

    private static boolean isFrench() {
        return "fr".equals(Locale.getDefault().getLanguage());
    }
}
