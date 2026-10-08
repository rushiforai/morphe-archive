package dev.skulldogged.cobalt.extension;

import java.util.Collections;
import java.util.List;

final class CobaltResponse {
    enum Kind {
        DIRECT,
        MERGE
    }

    final Kind kind;
    final String url;
    final List<String> tunnels;
    final String filename;

    private CobaltResponse(Kind kind, String url, List<String> tunnels, String filename) {
        this.kind = kind;
        this.url = url;
        this.tunnels = tunnels;
        this.filename = filename;
    }

    static CobaltResponse direct(String url, String filename) {
        return new CobaltResponse(
                Kind.DIRECT,
                url,
                Collections.emptyList(),
                filename
        );
    }

    static CobaltResponse merge(List<String> tunnels, String filename) {
        return new CobaltResponse(
                Kind.MERGE,
                null,
                Collections.unmodifiableList(tunnels),
                filename
        );
    }
}
