package dev.twitchpatches.extension.ads;

import dev.twitchpatches.extension.ads.hls.HlsPlaylist;
import java.net.URI;
import java.util.Arrays;

final class MediaAssociationEvidence {
    private final String request;
    private final String response;
    private int masters;
    private int requestMatches;
    private int responseMatches;
    private int pathMatches;
    private int queryOrderMatches;

    MediaAssociationEvidence(String request, String response) {
        this.request = request;
        this.response = response;
    }

    void observe(HlsPlaylist playlist) {
        masters++;
        for (dev.twitchpatches.extension.ads.hls.Variant variant : playlist.variants) {
            if (variant.uri.equals(request)) requestMatches++;
            if (variant.uri.equals(response)) responseMatches++;
            if (samePath(variant.uri, request) || samePath(variant.uri, response)) pathMatches++;
            if (sameQuery(variant.uri, request) || sameQuery(variant.uri, response)) queryOrderMatches++;
        }
    }

    String summary() {
        return "masters=" + masters + " requestExact=" + requestMatches + " responseExact=" + responseMatches
                + " path=" + pathMatches + " queryOrder=" + queryOrderMatches
                + " responseChanged=" + !request.equals(response);
    }

    private static boolean samePath(String left, String right) {
        try {
            URI a = URI.create(left), b = URI.create(right);
            return HlsPlaylist.twitchUri(a) && HlsPlaylist.twitchUri(b)
                    && a.getRawAuthority().equals(b.getRawAuthority())
                    && a.getRawPath().equals(b.getRawPath());
        } catch (IllegalArgumentException exception) { return false; }
    }

    private static boolean sameQuery(String left, String right) {
        if (!samePath(left, right)) return false;
        String a = URI.create(left).getRawQuery(), b = URI.create(right).getRawQuery();
        if (a == null || b == null || a.length() > 16384 || b.length() > 16384) return a == null && b == null;
        String[] first = a.split("&", -1), second = b.split("&", -1);
        Arrays.sort(first); Arrays.sort(second);
        return Arrays.equals(first, second);
    }
}
