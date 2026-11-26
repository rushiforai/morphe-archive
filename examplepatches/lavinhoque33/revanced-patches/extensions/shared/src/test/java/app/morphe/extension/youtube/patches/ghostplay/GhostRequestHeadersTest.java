/*
 * Copyright (C) 2026 lavinhoque33.
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-25.
 */

package app.morphe.extension.youtube.patches.ghostplay;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;

import org.junit.Test;

import java.util.Map;

public class GhostRequestHeadersTest {
    @Test
    public void strippingIsCaseInsensitiveAndDoesNotMutateOriginal() {
        Map<String, String> original = Map.of(
                "aUtHoRiZaTiOn", "test-value",
                "Cookie", "test-cookie",
                "X-Goog-PageId", "test-page",
                "x-goog-visitor-id", "test-visitor",
                "Content-Encoding", "gzip",
                "X-YouTube-Client-Version", "test-version");
        assertEquals(Map.of("Content-Encoding", "gzip", "X-YouTube-Client-Version", "test-version"),
                GhostRequestHeaders.strip(original));
        assertEquals(6, original.size());
    }

    @Test
    public void alreadyMinimizedHeadersAreReused() {
        Map<String, String> headers = Map.of("Content-Encoding", "gzip");
        assertSame(headers, GhostRequestHeaders.strip(headers));
    }
}
