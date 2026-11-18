// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

import java.util.Locale;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

/** Reads a DASH manifest's adaptation sets the way the manifest declares them, not by their file names. */
public final class Mpd {
    private Mpd() {}

    /** Whether an {@code AdaptationSet} holds audio. */
    public static boolean isAudio(Element set) {
        String contentType = set.getAttribute("contentType");
        if (!contentType.isEmpty()) return contentType.equalsIgnoreCase("audio");
        String mimeType = set.getAttribute("mimeType");
        if (!mimeType.isEmpty()) return isAudioMimeType(mimeType);
        NodeList representations = set.getElementsByTagName("Representation");
        for (int i = 0; i < representations.getLength(); i++) {
            String type = ((Element) representations.item(i)).getAttribute("mimeType");
            if (!type.isEmpty()) return isAudioMimeType(type);
        }
        // Older manifests declare neither and name the audio files DASH_audio.mp4.
        return set.getTextContent().toLowerCase(Locale.ROOT).contains("audio");
    }

    private static boolean isAudioMimeType(String mimeType) {
        return mimeType.toLowerCase(Locale.ROOT).startsWith("audio/");
    }
}
