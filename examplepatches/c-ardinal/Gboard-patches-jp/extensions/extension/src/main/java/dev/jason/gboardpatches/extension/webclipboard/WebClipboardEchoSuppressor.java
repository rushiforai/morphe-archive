package dev.jason.gboardpatches.extension.webclipboard;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

final class WebClipboardEchoSuppressor {
    private static final int DEFAULT_MAX_PENDING_ECHOES = 32;

    private final long suppressionWindowMs;
    private final int maxPendingEchoes;
    private final List<PendingEcho> pendingEchoes = new ArrayList<>();

    WebClipboardEchoSuppressor(long suppressionWindowMs) {
        this(suppressionWindowMs, DEFAULT_MAX_PENDING_ECHOES);
    }

    WebClipboardEchoSuppressor(long suppressionWindowMs, int maxPendingEchoes) {
        this.suppressionWindowMs = Math.max(0L, suppressionWindowMs);
        this.maxPendingEchoes = Math.max(1, maxPendingEchoes);
    }

    synchronized void markWebApplied(String text, long nowMs) {
        String normalized = normalize(text);
        if (normalized.isEmpty()) {
            return;
        }
        long timestampMs = sanitizeTimestamp(nowMs);
        pruneExpired(timestampMs);
        removePendingText(normalized);
        pendingEchoes.add(new PendingEcho(normalized, timestampMs));
        while (pendingEchoes.size() > maxPendingEchoes) {
            pendingEchoes.remove(0);
        }
    }

    synchronized void clearWebApplied() {
        pendingEchoes.clear();
    }

    synchronized boolean shouldSuppressClipboardEvent(String text, long nowMs) {
        String normalized = normalize(text);
        if (normalized.isEmpty()) {
            return false;
        }
        long timestampMs = sanitizeTimestamp(nowMs);
        pruneExpired(timestampMs);
        Iterator<PendingEcho> iterator = pendingEchoes.iterator();
        while (iterator.hasNext()) {
            PendingEcho echo = iterator.next();
            if (!echo.text.equals(normalized)) {
                continue;
            }
            iterator.remove();
            return true;
        }
        return false;
    }

    private void pruneExpired(long nowMs) {
        Iterator<PendingEcho> iterator = pendingEchoes.iterator();
        while (iterator.hasNext()) {
            PendingEcho echo = iterator.next();
            if (nowMs - echo.appliedAtMs > suppressionWindowMs) {
                iterator.remove();
            }
        }
    }

    private void removePendingText(String normalized) {
        Iterator<PendingEcho> iterator = pendingEchoes.iterator();
        while (iterator.hasNext()) {
            if (iterator.next().text.equals(normalized)) {
                iterator.remove();
            }
        }
    }

    private long sanitizeTimestamp(long timestampMs) {
        return Math.max(0L, timestampMs);
    }

    private String normalize(String text) {
        return text == null ? "" : text;
    }

    private static final class PendingEcho {
        final String text;
        final long appliedAtMs;

        PendingEcho(String text, long appliedAtMs) {
            this.text = text;
            this.appliedAtMs = appliedAtMs;
        }
    }
}

