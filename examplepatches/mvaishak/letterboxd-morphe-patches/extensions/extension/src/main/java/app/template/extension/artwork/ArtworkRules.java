package app.template.extension.artwork;

import java.net.URI;
import java.net.URISyntaxException;

final class ArtworkRules {
    private ArtworkRules() {}

    static String imageUrl(String input) {
        if (input == null || input.length() > 4096) return null;
        String value = input.trim();
        try {
            URI uri = new URI(value);
            if (!"https".equalsIgnoreCase(uri.getScheme()) || uri.getHost() == null
                    || uri.getUserInfo() != null || uri.getFragment() != null) return null;
            return uri.toASCIIString();
        } catch (URISyntaxException e) {
            return null;
        }
    }

    static boolean validId(String value) {
        return value != null && value.matches("[A-Za-z0-9_-]{1,80}");
    }

    static boolean useLocalArtwork(String mode, boolean nativeArtworkAvailable) {
        return "local".equals(mode) || ("automatic".equals(mode) && !nativeArtworkAvailable);
    }

    static boolean ownsProfile(String viewed, String signedIn) {
        return validId(viewed) && viewed.equals(signedIn);
    }

    static String keyProblem(String key) {
        if (key.isEmpty()) return "Enter your API Key (v3 auth).";
        if (key.startsWith("eyJ") || key.startsWith("Bearer ") || key.indexOf('.') >= 0) {
            return "That looks like an API Read Access Token. Copy API Key (v3 auth) instead.";
        }
        return key.matches("[0-9a-fA-F]{32}") ? null : "Enter the 32-character API Key (v3 auth).";
    }
}
