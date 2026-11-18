// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.extension.syncforreddit;

/** Reddit escapes {@code &} as {@code &amp;} in listing thumbnail URLs, which then answer 403. */
public final class Thumbnails {
    private Thumbnails() {}

    public static String decode(String url) {
        return url == null ? null : url.replace("&amp;", "&");
    }
}
