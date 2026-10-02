/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.ads;

import androidx.annotation.Nullable;

import java.util.Map;
import java.util.TreeSet;

/**
 * Copies budget-refused Relay envelopes without building a data tree. Only their direct paths
 * change. Memory is bounded by the longest known connection key and an eleven-character index.
 * Prefixes keep the server's indices even after an earlier step is rewritten.
 */
final class MarketplacePathRemapper {
    private final Map<String, TreeSet<Integer>> taken;
    private final int maxKey;
    private long depth;
    private long envelopeDepth;
    private long pathDepth;
    private boolean rootArray;
    private boolean inString;
    private boolean escaped;
    private boolean expectKey;
    private boolean keyString;
    private boolean pathString;
    private boolean pathKey;
    private boolean pathValue;
    private boolean numberOverflow;
    private final StringBuilder name = new StringBuilder(5);
    @Nullable private StringBuilder prefix;
    @Nullable private StringBuilder number;

    MarketplacePathRemapper(Map<String, TreeSet<Integer>> taken) {
        this.taken = taken;
        int longest = 0;
        for (Map.Entry<String, TreeSet<Integer>> entry : taken.entrySet()) {
            if (!entry.getValue().isEmpty()) longest = Math.max(longest, entry.getKey().length());
        }
        maxKey = longest;
    }

    void read(CharSequence text, int from, int end, StringBuilder out) {
        if (maxKey == 0) {
            out.append(text, from, end);
            return;
        }
        for (int i = from; i < end; i++) read(text.charAt(i), out);
    }

    private void step(char c) {
        if (prefix == null) return;
        if (prefix.length() == maxKey) prefix = null;
        else prefix.append(c);
    }

    private void index(StringBuilder out) {
        String original = number.toString();
        number = null;
        String changed = original;
        try {
            int index = Integer.parseInt(original);
            TreeSet<Integer> list = prefix == null ? null : taken.get(prefix.toString());
            if (list != null) {
                int moved = list.contains(index) ? MarketplaceSearchAds.NOWHERE + index
                        : index - list.headSet(index).size();
                if (moved != index) changed = Integer.toString(moved);
            }
            step('/');
            for (int i = 0; i < original.length(); i++) step(original.charAt(i));
        } catch (NumberFormatException unknown) {
            prefix = null;
        }
        out.append(changed);
    }

    private void read(char c, StringBuilder out) {
        boolean numeric = c == '-' || c == '+' || c == '.' || c == 'e' || c == 'E'
                || c >= '0' && c <= '9';
        if (numberOverflow) {
            if (numeric) {
                out.append(c);
                return;
            }
            numberOverflow = false;
        }
        if (number != null) {
            if (numeric) {
                number.append(c);
                if (number.length() > 11) {
                    out.append(number);
                    number = null;
                    prefix = null;
                    numberOverflow = true;
                }
                return;
            }
            index(out);
        }
        if (inString) {
            out.append(c);
            if (keyString && name.length() < 5) name.append(c);
            if (escaped) {
                escaped = false;
                if (pathString) step(c);
            } else if (c == '\\') {
                escaped = true;
                if (pathString) step(c);
            } else if (c == '"') {
                inString = false;
                if (keyString) {
                    pathKey = name.toString().equals("path\"");
                    expectKey = false;
                }
                keyString = false;
                pathString = false;
            } else if (pathString) {
                step(c);
            }
            return;
        }
        if (pathDepth != 0 && depth == pathDepth && (c == '-' || c >= '0' && c <= '9')) {
            number = new StringBuilder(11).append(c);
            return;
        }
        boolean opensPath = pathValue && c == '[';
        if (pathValue && !Character.isWhitespace(c)) pathValue = false;
        out.append(c);
        if (depth == 0 && c != '{' && c != '[') return;
        if (c == '"') {
            inString = true;
            keyString = depth == envelopeDepth && expectKey;
            if (keyString) name.setLength(0);
            pathString = pathDepth != 0 && depth == pathDepth;
            if (pathString) step('/');
        } else if (c == '{' || c == '[') {
            if (depth == 0) {
                rootArray = c == '[';
                envelopeDepth = c == '{' ? 1 : 0;
                expectKey = true;
            } else if (rootArray && depth == 1 && c == '{') {
                envelopeDepth = 2;
                expectKey = true;
            }
            if (pathDepth != 0) prefix = null;
            depth++;
            if (opensPath) {
                pathDepth = depth;
                prefix = new StringBuilder();
            }
        } else if (c == '}' || c == ']') {
            if (depth == pathDepth) {
                pathDepth = 0;
                prefix = null;
            }
            if (depth == envelopeDepth) envelopeDepth = 0;
            depth--;
        } else if (depth == envelopeDepth && c == ':') {
            pathValue = pathKey;
            pathKey = false;
        } else if (depth == envelopeDepth && c == ',') {
            expectKey = true;
            pathKey = false;
        } else if (pathDepth != 0 && depth == pathDepth && c != ','
                && !Character.isWhitespace(c)) {
            prefix = null;
        }
    }

    String rest() {
        if (number == null) return "";
        String rest = number.toString(); // Unfinished paths retain their original bytes.
        number = null;
        return rest;
    }
}
