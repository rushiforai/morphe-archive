package com.waze.gw;

import java.util.ArrayDeque;
import java.util.Iterator;

/** Completion-driven queue. All times supplied by the caller use elapsedRealtime. */
final class VoiceQueue {
    static final long GAP_MS = 700L;
    static final int MAX_PENDING = 8;

    static final class Request {
        final String slot, asset;
        final boolean preview;
        final long expiresAt;

        Request(String slot, String asset, boolean preview, long now) {
            this.slot = slot;
            this.asset = asset;
            this.preview = preview;
            expiresAt = now + (preview ? 30000L : slot.equals("overspeed") ? 6000L : 10000L);
        }

        String group() {
            if (preview) return "preview";
            if (slot.startsWith("current_")) return "current";
            if (slot.startsWith("next_")) return "next";
            return slot;
        }
    }

    private final ArrayDeque<Request> pending = new ArrayDeque<Request>();
    private Request active;
    private long readyAt;

    synchronized void offer(Request request, long now) {
        for (Iterator<Request> i = pending.iterator(); i.hasNext();) {
            Request old = i.next();
            if (old.expiresAt <= now || old.group().equals(request.group())) i.remove();
        }
        if (active != null && active.slot.equals(request.slot)
                && active.preview == request.preview) return;
        if (pending.size() == MAX_PENDING) pending.removeFirst();
        pending.addLast(request);
    }

    synchronized Request poll(long now) {
        if (active != null || now < readyAt) return null;
        while (!pending.isEmpty()) {
            Request request = pending.removeFirst();
            if (request.expiresAt > now) return active = request;
        }
        return null;
    }

    synchronized void finish(Request request, long now, boolean played) {
        if (active != request) return; // late/duplicate callback cannot release a newer clip
        active = null;
        if (played) readyAt = now + GAP_MS;
    }

    synchronized void retry(Request request, long now) {
        if (active != request) return;
        active = null;
        readyAt = now + 500L;
        for (Request newer : pending) {
            if (newer.group().equals(request.group())) return;
        }
        if (request.expiresAt > now && pending.size() < MAX_PENDING) pending.addFirst(request);
    }

    synchronized long delay(long now) {
        return active != null || pending.isEmpty() ? -1L : Math.max(0L, readyAt - now);
    }

    synchronized void clear() { pending.clear(); }
}
