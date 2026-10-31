package app.bitchord.telegram;

import java.util.Locale;

/** Validated application configuration; never exposes the hash through toString. */
public final class ApplicationCredentials {
    public final int apiId;
    public final String apiHash;

    private ApplicationCredentials(int id, String hash) {
        apiId = id;
        apiHash = hash;
    }

    public static ApplicationCredentials empty() {
        return new ApplicationCredentials(0, "");
    }

    public static ApplicationCredentials parse(String id, String hash) {
        String number = id == null ? "" : id.trim();
        String secret = hash == null ? "" : hash.trim();
        if (!number.matches("[0-9]+"))
            throw new IllegalArgumentException("Enter the numeric App API ID.");
        int value;
        try {
            value = Integer.parseInt(number);
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("The App API ID is outside the supported range.");
        }
        if (value <= 0)
            throw new IllegalArgumentException("Enter an App API ID greater than zero.");
        if (!secret.matches("[a-fA-F0-9]{32}"))
            throw new IllegalArgumentException(
                    "App API hash must contain exactly 32 hexadecimal characters.");
        return new ApplicationCredentials(value, secret.toLowerCase(Locale.ROOT));
    }

    public boolean configured() {
        return apiId > 0 && !apiHash.isEmpty();
    }

    public boolean sameAs(ApplicationCredentials other) {
        return other != null && apiId == other.apiId && apiHash.equals(other.apiHash);
    }

    @Override
    public String toString() {
        return "ApplicationCredentials(apiId=" + apiId + ", hash=hidden)";
    }
}
