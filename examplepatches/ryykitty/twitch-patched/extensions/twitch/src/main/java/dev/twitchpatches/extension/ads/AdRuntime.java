package dev.twitchpatches.extension.ads;

import android.os.Looper;
import android.util.Log;
import com.amazonaws.ivs.net.HttpClient;
import java.lang.ref.WeakReference;
import java.util.concurrent.atomic.AtomicLong;

public final class AdRuntime {
    static final MasterCatalog masters = new MasterCatalog();
    private static final AtomicLong policyRevision = new AtomicLong();
    private static volatile WeakReference<Object> tokenOwner = new WeakReference<>(null);

    public static void tokenOwner(Object owner) { tokenOwner = new WeakReference<>(owner); }

    static long policyRevision() { return policyRevision.get(); }
    static void policyChanged() { policyRevision.incrementAndGet(); }

    static TokenResult requestToken(String channel, String playerType) {
        if (Looper.myLooper() == Looper.getMainLooper())
            throw new IllegalStateException("Token requests require a worker thread");
        TokenResult result = new TokenResult(accepted -> Log.i("TwitchPatchesAds",
                accepted ? "Native alternate token accepted" : "Native alternate token unavailable"));
        Object owner = tokenOwner.get();
        if (owner == null || !AdSettings.enabled(2)) result.fail();
        else {
            try { nativeToken(owner, channel, playerType, result); }
            catch (RuntimeException exception) {
                Log.i("TwitchPatchesAds", "Native token bridge exception: " + exception.getClass().getSimpleName());
                result.fail();
            }
        }
        return result;
    }

    public static HttpClient wrap(HttpClient original) { return new AdHttpClient(original); }

    public static String platform(String playerType) { return "popout".equals(playerType) ? "web" : "android"; }

    // Injected GraphQL bridge.
    public static void nativeToken(Object owner, String channel, String playerType, TokenResult result) {
        throw new IllegalStateException("Native token bridge was not installed");
    }
}
