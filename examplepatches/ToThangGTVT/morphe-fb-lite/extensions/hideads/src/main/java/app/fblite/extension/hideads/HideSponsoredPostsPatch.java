package app.fblite.extension.hideads;

import android.content.Context;

/**
 * Facebook Lite's feed is a server-driven component tree. The server inserts sponsored posts into it,
 * so they are hidden on the client after decoding: X.$1DY (renamed to X.1DY at build time) replaces
 * the app's props decoder, delegates to the original, then hides sponsored posts, see {@link SponsoredPosts}.
 */
@SuppressWarnings("unused")
public final class HideSponsoredPostsPatch {

    /**
     * Called at the start of attachBaseContext, before the secondary dex is unpacked, so the replacement
     * X.1DY is defined from the APK dex and takes precedence (the app's class loader searches its dex
     * files most recently used first, so loading it later would find the original).
     */
    public static void loadDecoder(Context context) {
        try {
            OriginalClass.dataDir = context.getApplicationInfo().dataDir;
            Class.forName("X.1DY", false, HideSponsoredPostsPatch.class.getClassLoader());
        } catch (Throwable ignored) {
            // The app keeps its own decoder and shows sponsored posts.
        }
    }
}
