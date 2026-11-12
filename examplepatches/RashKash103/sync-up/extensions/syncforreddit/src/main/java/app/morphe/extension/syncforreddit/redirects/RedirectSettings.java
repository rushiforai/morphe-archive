package app.morphe.extension.syncforreddit.redirects;

import android.content.Context;
import android.content.SharedPreferences;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.syncforreddit.settings.SyncUpSettings;

/**
 * What the redirect settings say, and where each of them is kept.
 *
 * <p>Imgur refuses whole regions — the United Kingdom among them — and answers a picture with a
 * notice instead of the picture. Nothing in Sync can be set to do anything about that, so these
 * settings choose another route to the same picture.
 *
 * <p><b>Two stores, on purpose.</b> Whether a route is turned on, and which Rimgo instances are
 * known, are of no consequence to anyone: those live in Sync's own settings, which is what lets
 * them be ordinary rows the app draws and writes for us. The address of a proxy, what it is
 * logged into with, and a client certificate are another matter — Sync's Backup walks the
 * settings it knows and writes them out, and that file is handed to whoever is helping and
 * copied between devices. Those are kept in a file of our own that Sync has never heard of and
 * therefore cannot write out, exactly as the client id and the account PIN are.
 *
 * @noinspection unused
 */
public final class RedirectSettings {
    // region Kept in Sync's own settings: nothing here identifies anyone.

    /**
     * The one switch that turns the whole thing off, for every service at once.
     *
     * <p>On by default, and on its own it does nothing: each service has a switch of its own
     * and every one of those is off until it is asked for. So turning a service on is one tap
     * rather than two, and this is still there to stop the lot without undoing the settings
     * underneath it.
     */
    public static final String ON = "sync_up_redirect";

    /** Imgur in particular. Every service added later gets one of these. */
    public static final String IMGUR = "sync_up_redirect_imgur";

    /** Whether to take another route always, or only once Imgur itself has refused. */
    public static final String IMGUR_WHEN = "sync_up_redirect_imgur_when";

    public static final String WHEN_ALWAYS = "always";
    public static final String WHEN_REFUSED = "refused";

    public static final String DDG = "sync_up_redirect_imgur_ddg";

    /**
     * Whether an address handed out — shared or copied — is the route's rather than Imgur's.
     *
     * <p>One for each route that has an address of its own to give. Off until it is asked for:
     * what the app fetches is its own business, and what is sent to somebody else is theirs.
     * There is none for the proxy, which carries the request rather than changing the address
     * and so has nothing else to hand out.
     */
    public static final String DDG_SHARE = "sync_up_redirect_imgur_ddg_share";

    public static final String RIMGO = "sync_up_redirect_imgur_rimgo";

    public static final String RIMGO_SHARE = "sync_up_redirect_imgur_rimgo_share";

    /** The instances asked, one to a line. Public addresses; nothing to keep back. */
    public static final String RIMGO_CHOSEN = "sync_up_redirect_imgur_rimgo_chosen";

    /** Instances typed in here rather than taken from the published list. */
    public static final String RIMGO_OWN = "sync_up_redirect_imgur_rimgo_own";

    /** The published list as it was last fetched, so the screen has something to show offline. */
    public static final String RIMGO_PUBLISHED = "sync_up_redirect_imgur_rimgo_published";

    /** When that list was last fetched. */
    public static final String RIMGO_PUBLISHED_AT = "sync_up_redirect_imgur_rimgo_published_at";

    /** Whether opening the instances asks each of them whether it is working. */
    public static final String RIMGO_CHECK = "sync_up_redirect_imgur_rimgo_check";

    public static final String PROXY = "sync_up_redirect_imgur_proxy";

    /** Whether the proxy is spoken to as an HTTP proxy or as a SOCKS one. */
    public static final String PROXY_KIND = "sync_up_redirect_imgur_proxy_kind";

    public static final String KIND_HTTP = "http";
    public static final String KIND_SOCKS = "socks";

    /** Whether a client certificate is sent to the proxy. */
    public static final String PROXY_MTLS = "sync_up_redirect_imgur_proxy_mtls";

    /**
     * Which Rimgo instances had a certificate attached, one to a line, and whether the proxy
     * did.
     *
     * <p><b>A mark, never the thing itself.</b> The certificates are kept in a file of our own
     * precisely so that Sync's Backup cannot write them out, and that is what makes a restored
     * copy silently different from the one it came from: the instance list comes back, the
     * switches come back, and the certificate that made any of it work does not. These two say
     * no more than that there was one, which is what lets the front page of the settings say so
     * rather than leaving the reader to work out why an instance stopped answering. They are
     * ordinary settings and travel in a backup as everything else does.
     */
    public static final String RIMGO_CERTIFIED = "sync_up_redirect_imgur_rimgo_certified";

    public static final String PROXY_CERTIFIED = "sync_up_redirect_imgur_proxy_certified";

    /** What a mark says. Anything else, including nothing, means there was no certificate. */
    private static final String MARKED = "1";

    /** What the last request was answered by, shown on the screen and kept nowhere. */
    public static final String LAST_USED = "sync_up_redirect_imgur_last";

    // endregion

    // region Kept in a file of our own, because a backup must not carry these.

    /** Where they are kept. Sync neither reads nor writes this file. */
    private static final String OURS = "sync_up_redirects";

    /** host:port, which names a machine that may well be someone's own. */
    public static final String PROXY_ADDRESS = "sync_up_redirect_imgur_proxy_address";

    public static final String PROXY_USER = "sync_up_redirect_imgur_proxy_user";

    public static final String PROXY_PASSWORD = "sync_up_redirect_imgur_proxy_password";

    /** A client certificate, pasted in as PKCS#12 or as PEM. */
    public static final String PROXY_CERTIFICATE = "sync_up_redirect_imgur_proxy_certificate";

    public static final String PROXY_CERTIFICATE_PASSWORD =
            "sync_up_redirect_imgur_proxy_certificate_password";

    /**
     * A Rimgo instance's own certificate, under this and the instance's address.
     *
     * <p><b>One per instance, never one for Rimgo.</b> A client certificate names whoever holds
     * it, and a server decides when to ask for one — so a single certificate kept for "Rimgo"
     * would be handed to whichever instance asked, including one asking precisely in order to
     * find out who is reading. An instance is only ever offered the certificate attached to it.
     */
    private static final String RIMGO_CERTIFICATE = "sync_up_redirect_imgur_rimgo_cert|";

    private static final String RIMGO_CERTIFICATE_PASSWORD =
            "sync_up_redirect_imgur_rimgo_cert_pw|";

    /** Every one of them, for saying what is set without naming any of it. */
    public static final String[] PRIVATE_KEYS = {
            PROXY_ADDRESS, PROXY_USER, PROXY_PASSWORD,
            PROXY_CERTIFICATE, PROXY_CERTIFICATE_PASSWORD,
    };

    // endregion

    private RedirectSettings() {}

    /** @return Whether the patch was applied at all. Overridden by the patch. */
    public static boolean isPatchIncluded() {
        // Overridden by patch.
        return false;
    }

    /** @return Whether anything here should be doing anything. */
    public static boolean redirecting() {
        return isPatchIncluded()
                && SyncUpSettings.flag(ON, true)
                && SyncUpSettings.flag(IMGUR, false);
    }

    public static boolean usingDuckDuckGo() {
        return SyncUpSettings.flag(DDG, true);
    }

    public static boolean usingRimgo() {
        return SyncUpSettings.flag(RIMGO, false);
    }

    public static boolean sharingThroughDuckDuckGo() {
        return SyncUpSettings.flag(DDG_SHARE, false);
    }

    public static boolean sharingThroughRimgo() {
        return SyncUpSettings.flag(RIMGO_SHARE, false);
    }

    public static boolean usingProxy() {
        return SyncUpSettings.flag(PROXY, false);
    }

    /** @return Whether to leave Imgur to answer first and only step in once it has refused. */
    public static boolean onlyOnceRefused() {
        return WHEN_REFUSED.equals(text(IMGUR_WHEN, WHEN_ALWAYS));
    }

    public static boolean sendingACertificate() {
        return SyncUpSettings.flag(PROXY_MTLS, false);
    }

    // region A Rimgo instance's certificate, which belongs to that instance alone.

    /** @return The certificate attached to this instance, or an empty string where none is. */
    public static String certificateFor(String instance) {
        return privately(RIMGO_CERTIFICATE + instance);
    }

    public static String certificatePasswordFor(String instance) {
        return privately(RIMGO_CERTIFICATE_PASSWORD + instance);
    }

    public static boolean hasCertificate(String instance) {
        return !certificateFor(instance).trim().isEmpty();
    }

    public static void setCertificateFor(String instance, String pasted, String password) {
        putPrivately(RIMGO_CERTIFICATE + instance, pasted);
        putPrivately(RIMGO_CERTIFICATE_PASSWORD + instance, password);
        mark(instance, true);
    }

    public static void clearCertificateFor(String instance) {
        putPrivately(RIMGO_CERTIFICATE + instance, "");
        putPrivately(RIMGO_CERTIFICATE_PASSWORD + instance, "");
        mark(instance, false);
    }

    /** @return Whether a certificate was attached to this instance at some point. */
    public static boolean wasCertified(String instance) {
        return lines(RIMGO_CERTIFIED).contains(instance);
    }

    /**
     * @return The instances that had a certificate and no longer have one, which is what a copy
     *         restored from a backup looks like.
     */
    public static java.util.List<String> instancesMissingACertificate() {
        java.util.List<String> missing = new java.util.ArrayList<>();
        for (String instance : lines(RIMGO_CERTIFIED)) {
            if (!hasCertificate(instance)) {
                missing.add(instance);
            }
        }
        return missing;
    }

    private static void mark(String instance, boolean had) {
        java.util.LinkedHashSet<String> marked =
                new java.util.LinkedHashSet<>(lines(RIMGO_CERTIFIED));
        if (had ? marked.add(instance) : marked.remove(instance)) {
            putLines(RIMGO_CERTIFIED, marked);
        }
    }

    // endregion

    // region The proxy's certificate, which is kept the same way.

    public static void setTheProxyCertificate(String pasted, String password) {
        putPrivately(PROXY_CERTIFICATE, pasted);
        putPrivately(PROXY_CERTIFICATE_PASSWORD, password);
        put(PROXY_CERTIFIED, MARKED);
    }

    public static void clearTheProxyCertificate() {
        putPrivately(PROXY_CERTIFICATE, "");
        putPrivately(PROXY_CERTIFICATE_PASSWORD, "");
        put(PROXY_CERTIFIED, "");
    }

    public static boolean proxyWasCertified() {
        return MARKED.equals(text(PROXY_CERTIFIED, ""));
    }

    /** @return Whether the proxy is to send a certificate and has none to send. */
    public static boolean proxyIsMissingItsCertificate() {
        return sendingACertificate() && !isSet(PROXY_CERTIFICATE);
    }

    /** @return Whether a proxy is turned on with no address for it to be at. */
    public static boolean proxyIsMissingItsAddress() {
        return usingProxy() && !isSet(PROXY_ADDRESS);
    }

    // endregion

    /** @return A setting Sync keeps as text, which is how its own list rows are written. */
    public static String text(String key, String fallback) {
        SharedPreferences settings = SyncUpSettings.store();
        if (settings == null) {
            return fallback;
        }
        try {
            String held = settings.getString(key, null);
            return held == null ? fallback : held;
        } catch (Exception ex) {
            Logger.printInfo(() -> "redirects: could not read " + key + ": " + ex);
            return fallback;
        }
    }

    public static void put(String key, String value) {
        SharedPreferences settings = SyncUpSettings.store();
        if (settings == null) {
            return;
        }
        try {
            settings.edit().putString(key, value).apply();
        } catch (Exception ex) {
            Logger.printInfo(() -> "redirects: could not write " + key + ": " + ex);
        }
    }

    public static long when(String key) {
        SharedPreferences settings = SyncUpSettings.store();
        if (settings == null) {
            return 0L;
        }
        try {
            return settings.getLong(key, 0L);
        } catch (Exception ex) {
            return 0L;
        }
    }

    public static void putWhen(String key, long at) {
        SharedPreferences settings = SyncUpSettings.store();
        if (settings == null) {
            return;
        }
        try {
            settings.edit().putLong(key, at).apply();
        } catch (Exception ex) {
            Logger.printInfo(() -> "redirects: could not write " + key + ": " + ex);
        }
    }

    // region Our own file.

    @Nullable
    private static SharedPreferences ours() {
        Context context = Utils.getContext();
        if (context == null) {
            return null;
        }
        try {
            return context.getSharedPreferences(OURS, Context.MODE_PRIVATE);
        } catch (Exception ex) {
            Logger.printInfo(() -> "redirects: our own settings could not be reached: " + ex);
            return null;
        }
    }

    /** @return One of the things kept back from a backup, or the empty string. */
    public static String privately(String key) {
        SharedPreferences settings = ours();
        if (settings == null) {
            return "";
        }
        try {
            String held = settings.getString(key, "");
            return held == null ? "" : held;
        } catch (Exception ex) {
            Logger.printInfo(() -> "redirects: could not read " + key + ": " + ex);
            return "";
        }
    }

    public static void putPrivately(String key, String value) {
        SharedPreferences settings = ours();
        if (settings == null) {
            return;
        }
        try {
            if (value == null || value.isEmpty()) {
                settings.edit().remove(key).apply();
            } else {
                settings.edit().putString(key, value).apply();
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "redirects: could not write " + key + ": " + ex);
        }
    }

    public static boolean isSet(String key) {
        return !privately(key).trim().isEmpty();
    }

    // endregion

    /** @return The lines of a setting that holds a list of them, with the blank ones dropped. */
    public static java.util.List<String> lines(String key) {
        java.util.List<String> held = new java.util.ArrayList<>();
        for (String line : text(key, "").split("\n")) {
            String trimmed = line.trim();
            if (!trimmed.isEmpty()) {
                held.add(trimmed);
            }
        }
        return held;
    }

    public static void putLines(String key, java.util.Collection<String> values) {
        StringBuilder written = new StringBuilder();
        for (String value : values) {
            if (value == null || value.trim().isEmpty()) {
                continue;
            }
            if (written.length() > 0) {
                written.append('\n');
            }
            written.append(value.trim());
        }
        put(key, written.toString());
    }
}
