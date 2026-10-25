package app.morphe.library.extension.instagram.patches;

import java.io.IOException;
import java.net.URI;
import java.util.HashSet;
import java.util.Set;

import app.morphe.extension.shared.Logger;

@SuppressWarnings("unused")
public final class BlockUrlRequestPatch {
    private static final Set<String> BLOCKED_URLS;

    // Populated at patch time
    // The BOGUS key is there just to expand the static clinit registers count
    static {
        BLOCKED_URLS = new HashSet<>();

        BLOCKED_URLS.add("BOGUS");
    }

    // Injection point — called at the start of makeTigonRequest()
    public static void checkAndBlockUrl(URI uri) throws IOException {
        if (uri == null) return;

        String uriString = uri.toString();
        for (String blocked : BLOCKED_URLS) {
            if (uriString.contains(blocked)) {
                Logger.printInfo(() -> "Blocking request to: " + uriString);
                throw new IOException("BlockUrlRequestPatch: blocked request to: " + uriString);
            }
        }
    }
}
