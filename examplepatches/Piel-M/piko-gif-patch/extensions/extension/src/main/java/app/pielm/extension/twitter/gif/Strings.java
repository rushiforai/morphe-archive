package app.pielm.extension.twitter.gif;

import java.util.Locale;

/**
 * Tiny self-contained localisation (FR / EN) so the add-on does not need to inject resources.
 */
final class Strings {
    private Strings() {
    }

    private static boolean fr() {
        return "fr".equals(Locale.getDefault().getLanguage());
    }

    // Download flow
    static String downloadStarted() {
        return fr() ? "Téléchargement du GIF…" : "Downloading GIF…";
    }

    static String alreadyDownloaded(String file) {
        return (fr() ? "Déjà téléchargé : " : "Already downloaded: ") + file;
    }

    static String downloading(String file) {
        return (fr() ? "Téléchargement : " : "Downloading: ") + file;
    }

    static String converting(String file) {
        return (fr() ? "Conversion en GIF : " : "Converting to GIF: ") + file;
    }

    static String stepDownloading() {
        return fr() ? "Récupération de la vidéo…" : "Fetching video stream…";
    }

    static String stepDecoding() {
        return fr() ? "Décodage des images…" : "Decoding frames…";
    }

    static String stepEncoding(int current, int total) {
        return (fr() ? "Encodage image " : "Encoding frame ") + current + "/" + total;
    }

    static String completed(String file) {
        return (fr() ? "GIF enregistré : " : "GIF saved: ") + file;
    }

    static String failed(String file) {
        return (fr() ? "Échec du GIF : " : "GIF failed: ") + file;
    }

    static String failedToast(String reason) {
        return (fr() ? "Échec du téléchargement du GIF : " : "GIF download failed: ") + reason;
    }

    static String channelName() {
        return fr() ? "Téléchargements GIF" : "GIF downloads";
    }

    static String channelDescription() {
        return fr() ? "Progression de la conversion des GIF (Piko GIF Patch)" : "GIF conversion progress (Piko GIF Patch)";
    }

    // Patch information screen
    static String addonsCategory() {
        return fr() ? "Add-ons" : "Add-ons";
    }

    static String addonTitle() {
        return fr() ? "Téléchargement natif des GIF" : "Native GIF download";
    }

    static String included() {
        return fr() ? "Inclus" : "Included";
    }

    static String addonDetails(String version) {
        return "Piko GIF Patch v" + version + (fr() ? " • par Piel-M" : " • by Piel-M");
    }

    static String integrationTitle() {
        return fr() ? "Intégrations GIF" : "GIF integrations";
    }
}
