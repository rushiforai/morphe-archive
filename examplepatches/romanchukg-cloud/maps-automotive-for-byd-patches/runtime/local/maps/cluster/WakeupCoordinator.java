// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import java.util.concurrent.Executor;

/**
 * One readiness probe at a time, with no wait in a lifecycle callback.
 *
 * Construct and call request/cancel/recheck on the UI thread. The callback
 * executor must dispatch to that same serial UI thread; the worker executor
 * must dispatch off it. Gate and recovery calls run only on the UI thread and
 * must be short. A blocked Binder call cannot be cancelled safely, so a new
 * request replaces its pending successor instead of creating another worker.
 */
public final class WakeupCoordinator {
    public enum Navigation { UNKNOWN, ACTIVE, IDLE }
    public interface Clock { long nowMillis(); }
    public interface Probe {
        boolean ready() throws Exception;
        /** Android adapters can bind side effects to the exact immutable request identity. */
        default boolean ready(Gate request) throws Exception { return ready(); }
    }
    public interface Gate {
        boolean alive();
        Navigation navigation();
    }
    public interface Recovery { void restart() throws Exception; }

    private static final class Request {
        final long generation, started;
        final Gate gate;
        boolean ready;
        Request(long generation, long started, Gate gate) {
            this.generation=generation; this.started=started; this.gate=gate;
        }
    }

    private final Executor worker, callbacks;
    private final Clock clock;
    private final Probe probe;
    private final Recovery recovery;
    private final long timeoutMillis, guardMillis;
    // UI-thread state only. Worker tasks capture an immutable Request identity.
    private Request current;
    private long generation, lastRecovery;
    private boolean inFlight, recovered;

    public WakeupCoordinator(Executor worker, Executor callbacks, Clock clock,
            Probe probe, Recovery recovery, long timeoutMillis, long guardMillis) {
        if (worker==null || callbacks==null || clock==null || probe==null || recovery==null)
            throw new NullPointerException("Wakeup dependencies");
        if (timeoutMillis<=0 || guardMillis<0) throw new IllegalArgumentException("Wakeup timing");
        this.worker=worker; this.callbacks=callbacks; this.clock=clock;
        this.probe=probe; this.recovery=recovery;
        this.timeoutMillis=timeoutMillis; this.guardMillis=guardMillis;
    }

    /** Replaces the previous generation without waiting for its probe to return. */
    public void request(Gate gate) {
        if (gate==null) throw new NullPointerException("gate");
        current=new Request(++generation,clock.nowMillis(),gate);
        launchIfPossible();
    }

    /** Invalidate results immediately; the one in-flight Binder call may remain blocked. */
    public void cancel() { generation++; current=null; }

    /** Call after navigation becomes known/idle; this never launches a second probe. */
    public void recheck() {
        if (current==null) return;
        if (expired(current) || !current.gate.alive()) { current=null; return; }
        if (current.ready) recoverIfSafe(current);
        else launchIfPossible();
    }

    private boolean expired(Request request) {
        long now=clock.nowMillis();
        return now<request.started || now-request.started>=timeoutMillis;
    }

    private boolean guarded(long now) {
        return recovered && (now<lastRecovery || now-lastRecovery<guardMillis);
    }

    private void launchIfPossible() {
        if (inFlight || current==null) return;
        Request request=current;
        if (expired(request) || !request.gate.alive() || guarded(clock.nowMillis())) {
            current=null;
            return;
        }
        inFlight=true;
        try {
            worker.execute(() -> {
                boolean value=false;
                try { value=probe.ready(request.gate); }
                catch (InterruptedException e) { Thread.currentThread().interrupt(); }
                catch (Exception ignored) { /* Unavailable provider is not a Maps crash. */ }
                final boolean ready=value;
                callbacks.execute(() -> completed(request,ready));
            });
        } catch (RuntimeException rejected) {
            // Executor rejection must not turn application startup into a crash.
            inFlight=false;
            if (current==request) current=null;
        }
    }

    private void completed(Request request, boolean ready) {
        inFlight=false;
        if (current==request && request.generation==generation) {
            // Check the actual completion/callback time, not the time at which
            // an uninterruptible Binder call was submitted.
            if (!ready || expired(request) || !request.gate.alive()) current=null;
            else { request.ready=true; recoverIfSafe(request); }
        }
        if (current!=null && current!=request) launchIfPossible();
    }

    private void recoverIfSafe(Request request) {
        if (current!=request || request.generation!=generation || expired(request)
                || !request.gate.alive()) {
            if (current==request) current=null;
            return;
        }
        if (request.gate.navigation()!=Navigation.IDLE) return;
        long now=clock.nowMillis();
        if (guarded(now)) { current=null; return; }
        // Mark consumed before invoking application code: repeated lifecycle
        // callbacks and a failing restart cannot cause duplicate recovery.
        current=null;
        recovered=true;
        lastRecovery=now;
        try { recovery.restart(); }
        catch (Exception ignored) { /* No process crash from a failed recovery. */ }
    }
}
