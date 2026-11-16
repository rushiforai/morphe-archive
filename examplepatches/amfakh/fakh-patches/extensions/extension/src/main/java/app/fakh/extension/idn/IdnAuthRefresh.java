package app.fakh.extension.idn;

import android.os.SystemClock;
import android.util.Log;

import java.lang.reflect.Method;

/**
 * Makes the app's OkHttp authenticator wait for its token refresh.
 *
 * <p>On a 401 the authenticator launches a coroutine that refreshes the Cognito session and builds the retry request,
 * then returns at once, before the coroutine has filled the request in. OkHttp sees no retry request and hands the 401
 * to the screen, which shows "kesalahan server" on the first open after the token has expired.
 */
@SuppressWarnings("unused")
public final class IdnAuthRefresh {
    private static final String TAG = "FakhAuth";

    private IdnAuthRefresh() {
    }

    /**
     * Blocks until the refresh coroutine finishes, or 20 seconds pass. The authenticator runs on an OkHttp thread,
     * never the main one, so blocking here is what a runBlocking call would do.
     *
     * @param job the kotlinx.coroutines Job the authenticator launched; its class names are obfuscated, but
     *            JobSupport keeps isCompleted().
     */
    public static void await(Object job) {
        try {
            Method isCompleted = job.getClass().getMethod("isCompleted");
            long deadline = SystemClock.elapsedRealtime() + 20_000;
            while (!(Boolean) isCompleted.invoke(job)) {
                if (SystemClock.elapsedRealtime() > deadline) {
                    Log.w(TAG, "The token refresh did not finish in time");
                    return;
                }
                Thread.sleep(20);
            }
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        } catch (Throwable t) {
            Log.w(TAG, "Could not wait for the token refresh", t);
        }
    }
}
