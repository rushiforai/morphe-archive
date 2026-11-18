// SPDX-License-Identifier: AGPL-3.0-or-later
package okhttp3;

/** Compile-only stand-in for the OkHttp URL bundled in the app. */
public final class HttpUrl {
    private HttpUrl() {}

    /** A canonical host: a name, a dotted IPv4 address, or an IPv6 address without brackets. */
    public final String host() {
        throw new UnsupportedOperationException("stub");
    }

    public final java.net.URI uri() {
        throw new UnsupportedOperationException("stub");
    }

    /** Null when the link isn't a well-formed http or https URL. */
    public final HttpUrl resolve(String link) {
        throw new UnsupportedOperationException("stub");
    }
}
