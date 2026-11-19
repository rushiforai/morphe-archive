package app.xfeedcleanup.extension.x;

import android.content.Intent;

import java.lang.reflect.Constructor;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 * Converts an external X post URL into the app's existing "FromId" post-detail navigation.
 *
 * This is intentionally handled before the original deeplink router: the router may navigate
 * through Home/For You, which can be absent when a user customizes the home tab bar.
 *
 * Unrecognized URLs and any unexpected app internals fall back to the original X router.
 */
@SuppressWarnings("unused")
public final class ExternalPostLink {
    private ExternalPostLink() {}

    /** Rewritten at patch time using the actual X APK's FromId class fingerprint. */
    private static String fromIdClassName() {
        return "";
    }

    public static List<?> route(Intent intent) {
        if (intent == null) return null;
        Long postId = parsePostId(intent.getAction(), intent.getDataString());
        return postId == null ? null : buildDestination(postId, fromIdClassName());
    }

    static List<?> buildDestination(long postId, String targetName) {
        if (targetName == null || targetName.isEmpty()) return null;
        try {
            Class<?> target = Class.forName(targetName, false, ExternalPostLink.class.getClassLoader());
            for (Constructor<?> ctor : target.getDeclaredConstructors()) {
                Class<?>[] types = ctor.getParameterTypes();
                // Kotlin's FromId(postId, showBoostNux, intentAction, defaultMask) constructor.
                if (types.length != 4 || types[0] != long.class || types[1] != boolean.class
                        || !types[2].isEnum() || types[3] != int.class) {
                    continue;
                }

                // Bit 4 selects the constructor's default IntentAction.None; no enum name is
                // hard-coded. A type mismatch safely falls back to the original route.
                Object destination = ctor.newInstance(postId, false, null, 4);
                ArrayList<Object> routes = new ArrayList<>(1);
                routes.add(destination);
                return routes;
            }
        } catch (ReflectiveOperationException | SecurityException | LinkageError ignored) {
            // Do not interfere with native routing if X changes an internal constructor.
        }
        return null;
    }

    /** URL parser is pure Java so its negative cases can be regression-tested on the host. */
    static Long parsePostId(String action, String link) {
        if (!"android.intent.action.VIEW".equals(action) || link == null) return null;
        try {
            URI uri = new URI(link);
            String scheme = uri.getScheme();
            String host = uri.getHost();
            if (scheme == null || host == null) return null;
            if (!"https".equalsIgnoreCase(scheme) && !"http".equalsIgnoreCase(scheme)) return null;
            host = host.toLowerCase(Locale.ROOT);
            if (!"x.com".equals(host) && !"www.x.com".equals(host)
                    && !"mobile.x.com".equals(host) && !"twitter.com".equals(host)
                    && !"www.twitter.com".equals(host) && !"mobile.twitter.com".equals(host)) {
                return null;
            }
            if (uri.getPort() != -1 || uri.getUserInfo() != null) return null;

            String path = uri.getRawPath();
            if (path == null || path.length() < 10) return null;
            String[] parts = path.split("/", -1);

            String id;
            if (parts.length == 4 && parts[0].isEmpty() && "status".equals(parts[2])
                    && isHandle(parts[1])) {
                id = parts[3];
            } else if (parts.length == 5 && parts[0].isEmpty() && "i".equals(parts[1])
                    && "web".equals(parts[2]) && "status".equals(parts[3])) {
                id = parts[4];
            } else {
                return null;
            }

            if (id.isEmpty() || id.length() > 19) return null;
            for (int i = 0; i < id.length(); i++) {
                if (id.charAt(i) < '0' || id.charAt(i) > '9') return null;
            }
            long postId = Long.parseLong(id);
            return postId > 0 ? postId : null;
        } catch (URISyntaxException | NumberFormatException ignored) {
            return null;
        }
    }

    private static boolean isHandle(String handle) {
        if (handle == null || handle.isEmpty() || handle.length() > 15) return false;
        for (int i = 0; i < handle.length(); i++) {
            char c = handle.charAt(i);
            if (!((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')
                    || (c >= '0' && c <= '9') || c == '_')) {
                return false;
            }
        }
        return true;
    }
}
