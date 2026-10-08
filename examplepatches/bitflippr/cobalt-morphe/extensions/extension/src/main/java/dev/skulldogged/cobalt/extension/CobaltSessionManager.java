package dev.skulldogged.cobalt.extension;

final class CobaltSessionManager {
    private static String apiUrl;
    private static String token;
    private static long expiresAtMillis;

    private CobaltSessionManager() {
    }

    static synchronized boolean hasValidSession(String requestedApiUrl) {
        return requestedApiUrl != null
                && requestedApiUrl.equals(apiUrl)
                && token != null
                && System.currentTimeMillis() + 2_000L < expiresAtMillis;
    }

    static synchronized String bearerToken(String requestedApiUrl) {
        if (!hasValidSession(requestedApiUrl)) {
            clear();
            return "";
        }
        return token;
    }

    static synchronized void store(String requestedApiUrl, String newToken, long expiresInSeconds)
            throws CobaltException {
        if (requestedApiUrl == null || requestedApiUrl.isEmpty()
                || newToken == null || newToken.length() >= 256
                || newToken.split("\\.", -1).length != 3
                || expiresInSeconds <= 0 || expiresInSeconds > 86_400) {
            throw new CobaltException("Cobalt returned an invalid authorization session");
        }
        apiUrl = requestedApiUrl;
        token = newToken;
        expiresAtMillis = System.currentTimeMillis() + expiresInSeconds * 1_000L;
    }

    static synchronized void clear() {
        apiUrl = null;
        token = null;
        expiresAtMillis = 0;
    }
}
