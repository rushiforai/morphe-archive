/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Modified by lavinhoque33, 2026-11-13.
 * Written by lavinhoque33, 2026-11-12.
 */
package app.morphe.extension.music.patches.crossfade;

import java.util.ArrayList;
import java.util.List;

/** Main-thread reducer. Audio callbacks publish facts; only this owner changes player roles. */
public final class CrossfadeEngine {
    public enum State { IDLE, STEADY, PREPARING, OVERLAPPING, PAUSED, DRAINING, RECOVERING, DISPOSED }
    public enum Kind { MANUAL_SKIP, AUTO_ADVANCE, REPEAT_ONE, MODE_SWITCH }
    public enum Role { CURRENT, PENDING, OUTGOING, DRAINING, RELEASED }
    public enum NextAvailability { UNKNOWN, AVAILABLE, UNAVAILABLE }

    public interface Output {
        void anchor(Object player, float gain);
        void envelope(Object player, float target, long durationMs, int curve);
        void play(Object player, boolean playing);
        void select(Object previous, Object current);
        void release(Object player);
        void role(Object player, Role role);
    }

    public static final class Player {
        public final Object identity;
        public long trackGeneration;
        public long transitionGeneration;
        public Role role;
        public float normalization;
        public float gain;
        public boolean playIntent;
        public boolean suppressed;
        public long sinkGeneration = -1;
        public long submittedFrames;
        public long playedFrames;
        public long audibleFrames;
        public int sampleRate;
        public int audioSessionId;
        public boolean negotiated;
        public boolean supported;
        public boolean ended;
        public boolean stopped;
        public boolean released;
        private long drainFrame = -1;
        private long fadeEndFrame = -1;
        private boolean envelopeStarted;
        private boolean endDelivered;

        private Player(Object identity, long track, long transition, float normalization,
                       float gain, boolean playIntent, Role role) {
            this.identity = identity;
            trackGeneration = track;
            transitionGeneration = transition;
            this.normalization = normalization;
            this.gain = gain;
            this.playIntent = playIntent;
            this.role = role;
        }
    }

    public static final class Frames {
        public final long sinkGeneration, submitted, played, audible;
        public final int sampleRate;
        public final boolean negotiated, supported, ended, stopped;
        public final float gain;

        public Frames(long sinkGeneration, long submitted, long played, long audible, int sampleRate,
                      boolean negotiated, boolean supported, boolean ended, boolean stopped, float gain) {
            this.sinkGeneration = sinkGeneration;
            this.submitted = submitted;
            this.played = played;
            this.audible = audible;
            this.sampleRate = sampleRate;
            this.negotiated = negotiated;
            this.supported = supported;
            this.ended = ended;
            this.stopped = stopped;
            this.gain = gain;
        }
    }

    private final Thread owner;
    private final Output output;
    private final List<Player> players = new ArrayList<>();
    private Player current;
    private Player previous;
    private State state = State.IDLE;
    private Kind kind;
    private long generation;
    private long trackGeneration;
    private long durationMs;
    private int curve;
    private boolean paused;
    private boolean sleepingAtEnd;
    private boolean repeatOne;
    private NextAvailability nextAvailability = NextAvailability.UNKNOWN;
    private boolean reserved;

    public CrossfadeEngine(Output output) {
        this(output, Thread.currentThread());
    }

    public CrossfadeEngine(Output output, Thread owner) {
        this.output = output;
        this.owner = owner;
    }

    private void own() {
        if (Thread.currentThread() != owner) throw new IllegalStateException("Crossfade owner thread changed");
    }

    public State state() { return state; }
    public Kind kind() { return kind; }
    public long generation() { return generation; }
    public Player current() { return current; }
    public boolean transitioning() {
        return previous != null || reserved || current != null && current.role == Role.PENDING;
    }
    public boolean hasRetiredPlayers() {
        for (Player player : players) {
            if (!player.released && player != current) return true;
        }
        return false;
    }
    public List<Player> players() { return new ArrayList<>(players); }

    public Player observe(Object identity, float normalization, boolean playIntent) {
        own();
        if (current != null && current.identity == identity) {
            current.normalization = normalization;
            current.playIntent = playIntent;
            return current;
        }
        dispose(identity);
        state = State.STEADY;
        current = new Player(identity, ++trackGeneration, generation, normalization, 1, playIntent, Role.CURRENT);
        players.add(current);
        output.role(identity, Role.CURRENT);
        return current;
    }

    /** Reserve before allocation so a chained skip invalidates every stale prepare callback. */
    public long reserve(Kind requested, long duration, int requestedCurve) {
        own();
        if (requested == Kind.MODE_SWITCH) {
            modeSwitch();
            return generation;
        }
        if (current == null || sleepingAtEnd && requested != Kind.MANUAL_SKIP) return -1;
        if (requested == Kind.AUTO_ADVANCE && !canAutoAdvance()) return -1;
        generation++;
        kind = requested;
        durationMs = duration;
        curve = requestedCurve;
        reserved = true;
        state = paused ? State.PAUSED : State.PREPARING;
        return generation;
    }

    public boolean prepared(long transition, Object identity, float normalization) {
        own();
        if (!reserved || transition != generation) return false;
        reserved = false;
        previous = current;
        previous.transitionGeneration = transition;
        role(previous, Role.OUTGOING);
        current = new Player(identity, ++trackGeneration, transition, normalization, 0,
                previous.playIntent, Role.PENDING);
        nextAvailability = NextAvailability.UNKNOWN;
        players.add(current);
        output.anchor(identity, 0);
        output.role(identity, Role.PENDING);
        output.select(previous.identity, identity);
        // The actual outgoing intent is authoritative. A paused/silent player cannot become audible at READY.
        if (!previous.playIntent || previous.suppressed || previous.gain <= 0) {
            previous.gain = 0;
            output.anchor(previous.identity, 0);
        }
        output.play(previous.identity, previous.playIntent && !paused && !previous.suppressed);
        output.play(identity, current.playIntent && !paused);
        return true;
    }

    public void allocationFailed(long transition) {
        own();
        if (transition != generation) return;
        reserved = false;
        settle();
    }

    public void normalization(Object identity, float normalization) {
        own();
        Player player = find(identity);
        if (player != null) player.normalization = normalization;
    }

    public void intent(Player player, long transition, boolean playing, boolean suppressed) {
        own();
        if (!accept(player, transition)) return;
        player.playIntent = playing;
        player.suppressed = suppressed;
        if (player == current && playing && !suppressed && paused) pause(false);
        if (player != current && (!playing || suppressed)) {
            retire(player);
            settle();
        }
    }

    public void pause(boolean pause) {
        own();
        paused = pause;
        for (Player player : players) {
            if (player.released) continue;
            if (pause && player.role == Role.DRAINING) retire(player);
            else output.play(player.identity, !pause && player.playIntent && !player.suppressed);
        }
        settle();
    }

    /** Sink generation changes are seek/flush events; old acknowledgements cannot complete a drain. */
    public void frames(Player player, long transition, Frames facts) {
        own();
        if (!accept(player, transition) || facts.sinkGeneration < player.sinkGeneration) return;
        if (facts.sinkGeneration != player.sinkGeneration) {
            if (player.role == Role.DRAINING) {
                // A flush/replacement discarded this epoch's buffered tail, not a new drain to wait for.
                retire(player);
                settle();
                return;
            }
            player.sinkGeneration = facts.sinkGeneration;
            player.submittedFrames = 0;
            player.playedFrames = 0;
            player.audibleFrames = 0;
            player.fadeEndFrame = -1;
        }
        player.submittedFrames = Math.max(player.submittedFrames, facts.submitted);
        player.playedFrames = Math.max(player.playedFrames, facts.played);
        player.audibleFrames = Math.max(player.audibleFrames, facts.audible);
        player.sampleRate = facts.sampleRate;
        player.negotiated = facts.negotiated;
        player.supported = facts.supported;
        player.ended = facts.ended;
        player.stopped = facts.stopped;
        player.gain = facts.gain;

        if (player != current && (!paused || player.role == Role.DRAINING)
                && (facts.stopped || !player.playIntent || player.suppressed)) {
            retire(player);
            settle();
            return;
        }

        if (transitioning() && facts.negotiated && !facts.supported) {
            // Encoded/offloaded output takes an ordinary native transition, never two unity players.
            ordinaryTransition();
            return;
        }
        if (player == current && player.role == Role.PENDING && facts.supported && facts.submitted > 0
                && !player.envelopeStarted && !paused) {
            player.envelopeStarted = true;
            role(player, Role.CURRENT);
            output.envelope(player.identity, 1, durationMs, curve);
            for (Player outgoing : players) {
                if (outgoing == player || outgoing.released || outgoing.role == Role.DRAINING) continue;
                if (outgoing.gain > 0 && outgoing.playIntent && !outgoing.suppressed) {
                    outgoing.envelopeStarted = true;
                    output.envelope(outgoing.identity, 0, durationMs, curve);
                } else {
                    drain(outgoing);
                }
            }
        }
        if (player != current && player.role == Role.OUTGOING
                && (player.envelopeStarted && facts.gain <= 0 || facts.ended)) drain(player);
        if (player.role == Role.DRAINING) finishDrain(player);
        if (player == current && player.envelopeStarted && facts.gain >= 1) {
            if (player.fadeEndFrame < 0) player.fadeEndFrame = player.submittedFrames;
            if (!paused && player.playedFrames >= player.fadeEndFrame) {
                // The incoming envelope is audibly complete even if an outgoing sink stopped reporting.
                for (Player outgoing : players) {
                    if (outgoing != player && !outgoing.released) retire(outgoing);
                }
            }
        }
        settle();
    }

    public void failed(Player player, long transition) {
        own();
        if (!accept(player, transition) || player != current || previous == null) return;
        state = State.RECOVERING;
        Player failed = current;
        current = previous;
        previous = null;
        generation++;
        current.transitionGeneration = generation;
        role(current, Role.CURRENT);
        // Preserve its actual partial gain, including silence. Recovery never restarts a retired envelope.
        output.anchor(current.identity, current.gain);
        output.select(failed.identity, current.identity);
        retire(failed);
        reserved = false;
        settle();
    }

    public void modeSwitch() {
        own();
        generation++;
        kind = Kind.MODE_SWITCH;
        reserved = false;
        // A display-only toggle retains exactly the native current player and does not allocate or fade.
        for (Player player : players) {
            if (player != current && !player.released) retire(player);
        }
        previous = null;
        if (current != null) {
            current.transitionGeneration = generation;
            current.gain = 1;
            output.anchor(current.identity, 1);
            role(current, Role.CURRENT);
        }
        settle();
    }

    public void nativeLoad() {
        own();
        if (current == null || current.role == Role.PENDING) return;
        current.trackGeneration = ++trackGeneration;
        current.transitionGeneration = ++generation;
        current.endDelivered = false;
        nextAvailability = NextAvailability.UNKNOWN;
    }

    public boolean repeatOne() { return repeatOne; }

    /** The main owner samples real queue availability before each automatic admission. */
    public void nextAvailability(NextAvailability availability) {
        own();
        nextAvailability = availability;
    }

    public boolean canAutoAdvance() {
        return repeatOne || nextAvailability != NextAvailability.UNAVAILABLE;
    }

    public void loopState(String name) {
        own();
        switch (name) {
            case "LOOP_ONE" -> repeatOne = true;
            case "LOOP_OFF", "LOOP_ALL", "LOOP_DISABLED" -> repeatOne = false;
            default -> { }
        }
    }

    public void sleepEnd(boolean active) {
        own();
        sleepingAtEnd = active;
    }

    /** Media end may be delivered repeatedly by an outgoing native listener. */
    public boolean ended(Player player, long transition) {
        own();
        if (!accept(player, transition) || player != current || player.endDelivered) return false;
        player.endDelivered = true;
        if (sleepingAtEnd) pause(true);
        return !sleepingAtEnd && !transitioning();
    }

    public void dispose(Object nativeOwned) {
        own();
        generation++;
        reserved = false;
        for (Player player : players) {
            if (!player.released && player.identity != nativeOwned) retire(player);
        }
        players.clear();
        current = null;
        previous = null;
        paused = false;
        nextAvailability = NextAvailability.UNKNOWN;
        state = State.DISPOSED;
    }

    private void ordinaryTransition() {
        for (Player player : players) {
            if (player != current && !player.released) retire(player);
        }
        previous = null;
        current.gain = 1;
        output.anchor(current.identity, 1);
        role(current, Role.CURRENT);
        settle();
    }

    private boolean accept(Player player, long transition) {
        return player != null && !player.released && players.contains(player)
                && player.transitionGeneration == transition;
    }

    private Player find(Object identity) {
        for (Player player : players) if (player.identity == identity && !player.released) return player;
        return null;
    }

    private void role(Player player, Role role) {
        player.role = role;
        output.role(player.identity, role);
    }

    private void drain(Player player) {
        if (player.role == Role.DRAINING || player.released) return;
        player.gain = 0;
        output.anchor(player.identity, 0);
        player.drainFrame = player.audibleFrames;
        role(player, Role.DRAINING);
        finishDrain(player);
    }

    private void finishDrain(Player player) {
        if (paused || !player.playIntent || player.suppressed || player.stopped
                || player.playedFrames >= player.drainFrame) retire(player);
    }

    private void retire(Player player) {
        if (player.released) return;
        player.released = true;
        if (player == previous) previous = null;
        role(player, Role.RELEASED);
        output.release(player.identity);
    }

    private void settle() {
        for (int index = players.size() - 1; index >= 0; index--) {
            if (players.get(index).released) players.remove(index);
        }
        if (paused) state = State.PAUSED;
        else if (current == null) state = State.IDLE;
        else if (reserved || current.role == Role.PENDING) state = State.PREPARING;
        else if (previous != null) {
            state = previous.role == Role.DRAINING ? State.DRAINING : State.OVERLAPPING;
        }
        else state = hasRetiredPlayers() ? State.DRAINING : State.STEADY;
    }
}
