package app.merak.extension.authenticator;

import android.app.Activity;
import android.os.CountDownTimer;
import android.util.Log;
import android.view.View;

import java.lang.ref.WeakReference;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

/**
 * Entry points for the "Account organizer" patch.
 * <p>
 * The app's account list controller builds a list of displayed codes and hands it to its
 * RecyclerView adapter. The patch calls {@link #onBeforeDisplay(List)} right before that,
 * so the list can be sorted (cards) or filtered (folders) in place. The full account list
 * used by the app's search is never modified.
 */
@SuppressWarnings("unused")
public final class AccountOrganizerPatch {

    private static final String TAG = "MorpheOrganizer";

    /** One account of the most recent list update. */
    static final class Entry {
        final Object account;
        final String key;
        final String name;
        final String categoryId;

        Entry(Object account, String key, String name, String categoryId) {
            this.account = account;
            this.key = key;
            this.name = name;
            this.categoryId = categoryId;
        }
    }

    private static WeakReference<Activity> activityRef = new WeakReference<>(null);
    private static WeakReference<Object> controllerRef = new WeakReference<>(null);
    /** The app's own (immutable) account list from the most recent update. */
    private static Object lastAccounts;
    private static OrganizerStore store;

    /** The list instance the main adapter displays. Used to tell main list rows from search rows. */
    private static List<?> mainList;
    /** All accounts of the most recent update, in app order, before any filtering. */
    static final List<Entry> entries = new ArrayList<>();
    private static final IdentityHashMap<Object, Entry> entryByAccount = new IdentityHashMap<>();

    /** Open folder in folder mode, or null when the folder grid is shown. */
    static String openFolder;

    private AccountOrganizerPatch() {
    }

    // region Bridges. Method bodies are replaced by the patch with calls into the app.

    /** @return The account object of a displayed code. */
    static Object getAccount(Object displayedOtp) {
        return null;
    }

    /** @return "Issuer: name", or the name if there is no issuer. */
    static String getAccountDisplayName(Object account) {
        return null;
    }

    /** @return The account secret. Only used to derive a hashed key, never stored. */
    static String getAccountSecret(Object account) {
        return null;
    }

    /** @return The list controller refresh timer, which must be cancelled before a re-render. */
    static CountDownTimer getUpdateTimer(Object controller) {
        return null;
    }

    /** Calls the list controller update method with the given account list. */
    static void invokeListUpdate(Object controller, Object accounts) {
    }

    // endregion

    // region Hooks called from patched app code.

    /** Injected at the start of {@code MainActivity.onCreate()}. */
    public static void onMainActivityCreated(Activity activity) {
        try {
            activityRef = new WeakReference<>(activity);
            if (store == null) store = new OrganizerStore(activity);
        } catch (Throwable ex) {
            logError("onMainActivityCreated failure", ex);
        }
    }

    /**
     * Injected at the start of {@code MainActivity.onBackPressed()}.
     *
     * @return True if the press was consumed (an open folder was closed).
     */
    public static boolean onBackPressed(Activity activity) {
        try {
            return OrganizerUi.isSearchOpen(activity) ? false : closeOpenFolder();
        } catch (Throwable ex) {
            logError("onBackPressed failure", ex);
            return false;
        }
    }

    /** Injected at the start of the list controller update method. */
    public static void onAccountsLoaded(Object controller, Object accounts) {
        try {
            controllerRef = new WeakReference<>(controller);
            lastAccounts = accounts;
            if (accounts instanceof Collection && ((Collection<?>) accounts).isEmpty()) {
                // The app shows its "no accounts" screen and skips the code below.
                entries.clear();
                entryByAccount.clear();
                mainList = null;
                Activity activity = activityRef.get();
                if (activity != null) OrganizerUi.hide(activity);
            }
        } catch (Throwable ex) {
            logError("onAccountsLoaded failure", ex);
        }
    }

    /**
     * Injected right before the list controller passes the displayed codes to the adapter.
     * Sorts (cards) or filters (folders) the list in place.
     */
    public static void onBeforeDisplay(List<Object> displayed) {
        try {
            Activity activity = activityRef.get();
            if (activity == null || store == null) return;

            entries.clear();
            entryByAccount.clear();
            for (Object item : displayed) {
                Object account = getAccount(item);
                if (account == null) continue;
                String key = accountKey(account);
                String name = getAccountDisplayName(account);
                Entry entry = new Entry(account, key, name == null ? "" : name, store.categoryOf(key));
                entries.add(entry);
                entryByAccount.put(account, entry);
            }

            if (store.isFolderMode()) {
                filterForFolder(displayed);
            } else {
                openFolder = null;
                sortForCards(displayed);
            }
            mainList = displayed;

            OrganizerUi.render(activity);
        } catch (Throwable ex) {
            logError("onBeforeDisplay failure", ex);
        }
    }

    /** Injected at the end of the account row binder. */
    public static void onBindOtpRow(View row, Object displayedOtp) {
        try {
            List<?> list = mainList;
            int index = (store != null && !store.isFolderMode() && list != null)
                    ? indexOfIdentity(list, displayedOtp)
                    : -1;
            if (index < 0) {
                // Folder mode, or a search result row: keep the original look.
                CardRowStyler.restore(row);
                return;
            }

            String category = categoryAt(list, index);
            boolean first = index == 0 || !same(categoryAt(list, index - 1), category);
            boolean last = index == list.size() - 1 || !same(categoryAt(list, index + 1), category);

            int count = 0;
            for (int i = 0, size = list.size(); i < size; i++) {
                if (same(categoryAt(list, i), category)) count++;
            }

            OrganizerStore.Category c = store.find(category);
            String title = c != null ? c.name : (store.categories.isEmpty() ? "Accounts" : "Uncategorized");
            int accent = c != null
                    ? Ui.accentFor(row.getContext(), c.colorValue())
                    : Ui.onSurfaceVariant(row.getContext());

            CardRowStyler.apply(row, first, last, index == 0, title, count, accent,
                    c != null ? c.icon : CategoryIcons.NONE);
        } catch (Throwable ex) {
            logError("onBindOtpRow failure", ex);
        }
    }

    // endregion

    // region Organizing.

    private static void sortForCards(List<Object> displayed) {
        if (store.categories.isEmpty()) return;
        final int uncategorizedRank = store.categories.size();
        // Stable sort: keeps the app order inside each category.
        Collections.sort(displayed, (a, b) -> Integer.compare(
                rank(a, uncategorizedRank), rank(b, uncategorizedRank)));
    }

    private static int rank(Object displayedOtp, int uncategorizedRank) {
        Entry entry = entryByAccount.get(getAccount(displayedOtp));
        if (entry == null || entry.categoryId == null) return uncategorizedRank;
        int index = store.indexOf(entry.categoryId);
        return index < 0 ? uncategorizedRank : index;
    }

    private static void filterForFolder(List<Object> displayed) {
        if (openFolder != null
                && !OrganizerStore.FOLDER_ALL.equals(openFolder)
                && !OrganizerStore.FOLDER_UNCATEGORIZED.equals(openFolder)
                && store.find(openFolder) == null) {
            openFolder = null; // Folder was deleted.
        }

        if (openFolder == null) {
            displayed.clear(); // The folder grid is shown instead of the list.
            return;
        }
        if (OrganizerStore.FOLDER_ALL.equals(openFolder)) return;

        String wanted = OrganizerStore.FOLDER_UNCATEGORIZED.equals(openFolder) ? null : openFolder;
        Iterator<Object> iterator = displayed.iterator();
        while (iterator.hasNext()) {
            Entry entry = entryByAccount.get(getAccount(iterator.next()));
            String category = entry == null ? null : entry.categoryId;
            if (!same(category, wanted)) iterator.remove();
        }
    }

    private static String categoryAt(List<?> list, int index) {
        Entry entry = entryByAccount.get(getAccount(list.get(index)));
        return entry == null ? null : entry.categoryId;
    }

    private static int indexOfIdentity(List<?> list, Object item) {
        for (int i = 0, size = list.size(); i < size; i++) {
            if (list.get(i) == item) return i;
        }
        return -1;
    }

    private static boolean same(String a, String b) {
        return a == null ? b == null : a.equals(b);
    }

    /** Number of accounts in a category (null = uncategorized) in the most recent update. */
    static int countIn(String categoryId) {
        int count = 0;
        for (Entry entry : entries) {
            if (same(entry.categoryId, categoryId)) count++;
        }
        return count;
    }

    /**
     * Stable key of an account: a salted SHA-256 of the normalized secret.
     * Survives renaming the account, and never exposes the secret itself.
     * Falls back to the display name if the secret is unavailable.
     */
    static String accountKey(Object account) {
        String secret = getAccountSecret(account);
        String material = (secret != null && !secret.isEmpty())
                ? "secret:" + secret.replaceAll("\\s+", "").toUpperCase(Locale.US)
                : "name:" + getAccountDisplayName(account);
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            digest.update("morphe-account-organizer:".getBytes(StandardCharsets.UTF_8));
            byte[] hash = digest.digest(material.getBytes(StandardCharsets.UTF_8));
            StringBuilder builder = new StringBuilder(32);
            for (int i = 0; i < 16; i++) {
                builder.append(String.format(Locale.US, "%02x", hash[i]));
            }
            return builder.toString();
        } catch (Exception ex) {
            logError("SHA-256 unavailable", ex);
            return Integer.toHexString(material.hashCode());
        }
    }

    // endregion

    // region State changes from the UI.

    static OrganizerStore store() {
        return store;
    }

    static void openFolder(String folderId) {
        openFolder = folderId;
        reload();
    }

    /** @return True if a folder was open and is now closed. */
    static boolean closeOpenFolder() {
        if (store == null || !store.isFolderMode() || openFolder == null) return false;
        openFolder = null;
        reload();
        return true;
    }

    static void setFolderMode(boolean folders) {
        if (store == null || store.isFolderMode() == folders) return;
        store.setFolderMode(folders);
        openFolder = null;
        reload();
    }

    /** Re-runs the app's list update with the last account list, so changes show immediately. */
    static void reload() {
        Object controller = controllerRef.get();
        Object accounts = lastAccounts;
        if (controller == null || accounts == null) return;
        try {
            // The update method starts a new self-restarting timer without stopping the old one.
            CountDownTimer timer = getUpdateTimer(controller);
            if (timer != null) timer.cancel();
            invokeListUpdate(controller, accounts);
        } catch (Throwable ex) {
            logError("reload failure", ex);
        }
    }

    // endregion

    static void logError(String message, Throwable ex) {
        Log.e(TAG, message, ex);
    }
}
