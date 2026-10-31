package app.xitter.extension;

/**
 * A Xitter session as the app keeps it. The app stores an OAuth token and secret per account
 * and sends the token with every request; the token handed to it at sign-in is the session
 * cookie and csrf value joined, so each request carries its own session and several signed-in
 * accounts keep working without anything stored beside the app's own account data.
 */
final class Session {
    private static final char SEPARATOR = '-';

    final String authToken;
    final String csrf;

    Session(String authToken, String csrf) {
        this.authToken = authToken;
        this.csrf = csrf;
    }

    String oauthToken() {
        return authToken + SEPARATOR + csrf;
    }

    static Session fromOAuthToken(String token) {
        if (token == null) return null;
        int i = token.indexOf(SEPARATOR);
        if (i <= 0 || i == token.length() - 1) return null;
        String auth = token.substring(0, i);
        String csrf = token.substring(i + 1);
        if (!auth.matches("[0-9a-fA-F]+") || !csrf.matches("[0-9a-fA-F]+")) return null;
        return new Session(auth, csrf);
    }
}
