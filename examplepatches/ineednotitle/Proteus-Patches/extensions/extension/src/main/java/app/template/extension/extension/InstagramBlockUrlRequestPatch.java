/*
 * Adapted from https://github.com/brosssh/instagram-morphe-patches-library
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.extension.extension;

import java.io.IOException;
import java.net.URI;
import java.util.HashSet;
import java.util.Set;

@SuppressWarnings("unused")
public final class InstagramBlockUrlRequestPatch {
    private static final String SENTINEL = "BOGUS";
    public static final Set<String> BLOCKED_URLS;

    // Populated at patch time; the sentinel entry keeps <clinit> registers allocated.
    static {
        BLOCKED_URLS = new HashSet<>();
        BLOCKED_URLS.add(SENTINEL);
    }

    private InstagramBlockUrlRequestPatch() {
    }

    /**
     * Injection point — called at the start of TigonServiceLayer.startRequest().
     */
    public static void checkAndBlockUrl(URI uri) throws IOException {
        if (uri == null) return;

        String uriString = uri.toString();
        if (InstagramGhostRequestFilter.shouldBlockUrl(uriString)) {
            System.out.println("[Proteus][Instagram] Ghost Mode blocked request to: " + uriString);
            throw new IOException("InstagramBlockUrlRequestPatch: ghost mode blocked request to: " + uriString);
        }
        for (String blocked : BLOCKED_URLS) {
            if (!SENTINEL.equals(blocked) && uriString.contains(blocked)) {
                System.out.println("[Proteus][Instagram] Blocking request to: " + uriString);
                throw new IOException("InstagramBlockUrlRequestPatch: blocked request to: " + uriString);
            }
        }
    }
}
