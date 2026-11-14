/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-13.
 */
package app.morphe.extension.music.patches.crossfade;

/** Main-owner request reducer. A pending mode load never owns a later queue command. */
public class ModeSwitchRequest {
    public final Object coordinator;
    public final Object player;
    public final long loadGeneration;
    public final long transitionGeneration;
    public final String sourceId;
    public final String targetId;
    public volatile boolean loadStarted;
    public boolean ended;
    private long queueGeneration;
    private boolean dispatching = true;

    public ModeSwitchRequest(Object coordinator, Object player, long loadGeneration, long transitionGeneration,
                             long queueGeneration, String sourceId, String targetId) {
        this.coordinator = coordinator;
        this.player = player;
        this.loadGeneration = loadGeneration;
        this.transitionGeneration = transitionGeneration;
        this.queueGeneration = queueGeneration;
        this.sourceId = sourceId;
        this.targetId = targetId;
    }

    public void dispatched() {
        dispatching = false;
    }

    /** Only the queue command invoked inside this request's native dispatch belongs to it. */
    public boolean queueCommand(long generation) {
        if (ended) return false;
        if (!dispatching) {
            ended = true;
            return false;
        }
        queueGeneration = generation;
        return true;
    }

    public boolean matches(Object owner, Object identity, long load, long transition, long queue) {
        if (ended) return false;
        if (coordinator != owner || player != identity || loadGeneration != load
                || transitionGeneration != transition || queueGeneration != queue) {
            ended = true;
            return false;
        }
        return true;
    }

    public boolean loaded(Object owner, Object identity, long load, long transition, long queue, String videoId) {
        if (!matches(owner, identity, load, transition, queue)) return false;
        if (targetId != null && !targetId.equals(videoId) || targetId == null && !dispatching) {
            ended = true;
            return false;
        }
        loadStarted = true;
        ended = true;
        return true;
    }

    public boolean finish() {
        boolean changed = !ended;
        ended = true;
        dispatching = false;
        return changed;
    }
}
