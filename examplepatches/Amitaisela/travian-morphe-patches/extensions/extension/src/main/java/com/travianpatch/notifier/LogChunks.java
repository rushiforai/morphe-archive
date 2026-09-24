package com.travianpatch.notifier;

import java.util.ArrayList;
import java.util.List;

/**
 * Splits long text into pieces that fit one Android log line (which is cut off near 4 KB), so a big
 * game response can be logged in full, in order. Pure logic (no Android APIs) so it can be checked
 * off-device.
 */
final class LogChunks {

    private LogChunks() {
    }

    /** Pieces of at most maxChars characters, in order; an empty list for null/empty text or maxChars <= 0. */
    static List<String> split(String text, int maxChars) {
        List<String> out = new ArrayList<String>();
        if (text == null || text.length() == 0 || maxChars <= 0) {
            return out;
        }
        for (int start = 0; start < text.length(); start += maxChars) {
            out.add(text.substring(start, Math.min(text.length(), start + maxChars)));
        }
        return out;
    }
}
