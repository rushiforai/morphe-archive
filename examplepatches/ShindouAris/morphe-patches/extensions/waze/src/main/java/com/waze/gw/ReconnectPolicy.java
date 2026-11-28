package com.waze.gw;

import java.util.Random;

final class ReconnectPolicy {
    private final Random random = new Random();
    private int attempt;

    synchronized void reset() { attempt = 0; }

    synchronized long nextDelayMs() {
        int shift = Math.min(attempt++, 5);
        long base = Math.min(60_000L, 1_500L << shift);
        long jitter = Math.max(100L, base / 5L);
        return Math.max(250L, base - jitter + random.nextInt((int) Math.min(Integer.MAX_VALUE, jitter * 2L + 1L)));
    }

    synchronized int attempt() { return attempt; }
}
