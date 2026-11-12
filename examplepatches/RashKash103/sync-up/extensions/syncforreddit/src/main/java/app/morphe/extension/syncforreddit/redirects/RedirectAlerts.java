package app.morphe.extension.syncforreddit.redirects;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.syncforreddit.settings.SettingsAlert;

/**
 * What the redirects have to say at the top of the settings.
 *
 * <p>All of it is the same thing seen from different angles: the parts that identify the reader
 * — a client certificate, the proxy's address and what it is logged into with — are kept out of
 * Sync's Backup on purpose, so a copy restored onto another device comes back set up to use
 * them and without them. Nothing on any screen says so; an instance simply stops answering and
 * a proxy simply does not connect.
 *
 * <p>Each alert takes the reader to the thing that fixes it. For a certificate that is the
 * dialog that attaches one, opened there and then rather than four screens away.
 */
public final class RedirectAlerts {
    /**
     * What each alert is called, for remembering that it has been put away.
     *
     * <p>Named after the thing rather than the words: an instance's alert carries the instance,
     * so putting one away leaves the rest alone, and rewording any of this later does not bring
     * back everything anyone had ever dismissed.
     */
    private static final String RIMGO_CERTIFICATE = "redirects.rimgo.certificate:";

    private static final String PROXY_CERTIFICATE = "redirects.proxy.certificate";

    private static final String PROXY_ADDRESS = "redirects.proxy.address";

    private RedirectAlerts() {}

    /** @return Everything wrong with the redirect settings, which is usually nothing. */
    public static List<SettingsAlert> whatIsWrong() {
        List<SettingsAlert> saying = new ArrayList<>();
        if (!RedirectSettings.isPatchIncluded()) {
            return saying;
        }
        try {
            // Only where the route is actually on. A certificate missing from a route nobody
            // is using is not something to be told about on opening the settings.
            if (RedirectSettings.redirecting() && RedirectSettings.usingRimgo()) {
                for (String instance : RedirectSettings.instancesMissingACertificate()) {
                    saying.add(missingInstanceCertificate(instance));
                }
            }
            if (RedirectSettings.redirecting() && RedirectSettings.usingProxy()) {
                if (RedirectSettings.proxyIsMissingItsCertificate()) {
                    saying.add(missingProxyCertificate());
                }
                if (RedirectSettings.proxyIsMissingItsAddress()) {
                    saying.add(missingProxyAddress());
                }
            }
        } catch (Exception ex) {
            Logger.printInfo(() -> "alerts: could not work out what is wrong: " + ex);
        }
        return saying;
    }

    private static SettingsAlert missingInstanceCertificate(String instance) {
        return new SettingsAlert(
                RIMGO_CERTIFICATE + instance,
                SettingsAlert.Level.WARNING,
                "No client certificate for " + CertificateDialog.hostOf(instance),
                "This instance was set up with one, and a backup does not carry it. "
                        + "Tap to attach it again.",
                (context, afterwards) -> CertificateDialog.ask(
                        context, CertificateDialog.forInstance(instance), afterwards));
    }

    private static SettingsAlert missingProxyCertificate() {
        return new SettingsAlert(
                PROXY_CERTIFICATE,
                SettingsAlert.Level.WARNING,
                "No client certificate for the proxy",
                "The proxy is set to send one, and a backup does not carry it. "
                        + "Tap to attach it again.",
                (context, afterwards) -> CertificateDialog.ask(
                        context, CertificateDialog.forTheProxy(), afterwards));
    }

    private static SettingsAlert missingProxyAddress() {
        return new SettingsAlert(
                PROXY_ADDRESS,
                SettingsAlert.Level.ERROR,
                "The proxy has no address",
                "A proxy is turned on with nothing to connect to. Its address is kept out of a "
                        + "backup as well. Open Redirects > Imgur > Proxy to set it.",
                null);
    }
}
