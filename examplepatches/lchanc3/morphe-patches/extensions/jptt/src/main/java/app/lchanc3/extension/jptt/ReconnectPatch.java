package app.lchanc3.extension.jptt;

import android.os.Handler;
import android.os.Looper;
import android.util.Log;

import com.joshua.jptt.ArticleBaseFragment;
import com.joshua.jptt.ContentPagerAdapter;
import com.joshua.jptt.MainActivity;

import java.lang.ref.WeakReference;
import java.util.ArrayList;

/**
 * Decides when a dropped connection is made again: at once, or once the user
 * next needs it.
 *
 * <p>Every automatic reconnect is a fresh login, and PTT bans an account for a
 * while when it sees too many of those in a row. Opening a link while reading
 * an article hands the screen to the browser, the system cuts the backgrounded
 * app's connection, and coming back used to log in again straight away -- a few
 * links in a row were enough for the ban. An article that is already on screen
 * needs no connection to be read, so while one is showing the reconnect is held
 * instead: the banner stays at 斷線了，點此立即重新連線 and the login happens when
 * the user taps it, leaves the article (by the page going back, or by the
 * sidebar sliding open over it), or does something that needs PTT.
 *
 * <p>MainActivity keeps the state. Its countdown field is non-null from the
 * moment a reconnect is scheduled until it runs, and a held reconnect is a
 * cancelled countdown left in that field: the banner's own tap handler still
 * runs it, and setDisconnected() still sees one pending and does not stack
 * another.
 */
@SuppressWarnings("unused")
public final class ReconnectPatch {

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /**
     * Whether the content pane's current page is an article. Only touched on the
     * main thread, like the two below.
     */
    private static boolean articleInContent;

    /**
     * Whether the sidebar (J熱門, 我的最愛 and the rest) is slid open over the
     * content pane. An article opened from the sidebar is the only page of the
     * content pane, so going back from it opens the sidebar and leaves the page
     * as it was.
     */
    private static boolean sidebarOpen;

    private static boolean readingArticle() {
        return articleInContent && !sidebarOpen;
    }

    private static WeakReference<MainActivity> activity = new WeakReference<>(null);

    /** Called from the patched {@code MainActivity.onResume()}. */
    public static void onResume(MainActivity mainActivity) {
        activity = new WeakReference<>(mainActivity);
        try {
            if (!mainActivity.patchHasPendingReconnect()) {
                return;
            }
            if (readingArticle()) {
                mainActivity.patchHoldReconnect();
            } else {
                mainActivity.patchReconnectNow();
            }
        } catch (Throwable ex) {
            Log.e(JpttContext.LOG_TAG, "Could not reconnect on resume", ex);
        }
    }

    /**
     * Called from the reconnect countdown's {@code onFinish()} in place of the
     * reconnect it would run.
     */
    public static void onCountdownFinished(MainActivity mainActivity) {
        activity = new WeakReference<>(mainActivity);
        try {
            if (readingArticle()) {
                mainActivity.patchHoldReconnect();
                return;
            }
        } catch (Throwable ex) {
            Log.e(JpttContext.LOG_TAG, "Could not hold the reconnect", ex);
        }
        mainActivity.patchReconnectNow();
    }

    /** Called from the patched {@code ContentPagerAdapter.onPageSelected()}. */
    public static void onPageSelected(ContentPagerAdapter adapter, int position) {
        try {
            ArrayList<?> fragments = adapter.getFragmentArrayList();
            articleInContent = fragments != null && position >= 0 && position < fragments.size()
                    && fragments.get(position) instanceof ArticleBaseFragment;
            if (!readingArticle()) {
                reconnectIfHeld();
            }
        } catch (Throwable ex) {
            Log.e(JpttContext.LOG_TAG, "Could not follow the page change", ex);
        }
    }

    /** Called from MainActivity's sliding pane listener when the sidebar is open. */
    public static void onSidebarOpened() {
        sidebarOpen = true;
        try {
            reconnectIfHeld();
        } catch (Throwable ex) {
            Log.e(JpttContext.LOG_TAG, "Could not reconnect as the sidebar opened", ex);
        }
    }

    /** Called from MainActivity's sliding pane listener when the sidebar is closed. */
    public static void onSidebarClosed() {
        sidebarOpen = false;
    }

    /**
     * Called from the patched {@code MainActivity.notifyNotConnected()}, which
     * JPTT calls from any thread whenever something needed a connection that was
     * not there.
     */
    public static void onNotConnected(MainActivity mainActivity) {
        activity = new WeakReference<>(mainActivity);
        MAIN.post(new Runnable() {
            @Override
            public void run() {
                reconnectIfHeld();
            }
        });
    }

    /**
     * Called first thing in {@code ArticleFragment.getMorePush()}, which checks
     * for new pushes without first checking for a connection. Run while one is
     * being made, it would type into the login screen, so it is skipped then and
     * the missing connection reported like everywhere else.
     *
     * @param mode   the article's mode; 'p' is read from the web, not from PTT
     * @param after  what the caller runs once the check is done
     * @return true to skip the check
     */
    public static boolean skipMorePush(char mode, Runnable after) {
        try {
            MainActivity mainActivity = activity.get();
            if (mode == 'p' || mainActivity == null || mainActivity.isConnected()) {
                return false;
            }
            mainActivity.notifyNotConnected();
            if (after != null) {
                after.run();
            }
            return true;
        } catch (Throwable ex) {
            Log.e(JpttContext.LOG_TAG, "Could not check the connection before loading pushes", ex);
            return false;
        }
    }

    private static void reconnectIfHeld() {
        MainActivity mainActivity = activity.get();
        if (mainActivity != null && mainActivity.patchHasPendingReconnect()) {
            mainActivity.patchReconnectNow();
        }
    }

    private ReconnectPatch() {
    }
}
