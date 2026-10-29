package android.net;

import java.net.URI;

public final class Uri {
    private final URI uri;
    private final String raw;

    private Uri(String raw, URI uri) {
        this.raw = raw;
        this.uri = uri;
    }

    public static Uri parse(String str) {
        if (str == null) return null;
        try {
            return new Uri(str, new URI(str));
        } catch (Exception e) {
            return new Uri(str, null);
        }
    }

    public String getScheme() { return uri != null ? uri.getScheme() : null; }
    public String getHost() { return uri != null ? uri.getHost() : null; }
    public String getPath() { return uri != null ? uri.getPath() : null; }
    @Override public String toString() { return raw; }
}
