package app.yydarlinker.deepseekcaptions;

import android.media.session.PlaybackState;

/** Session-local selection of an observation and its paused display donor.
 * Mutations run under the session monitor; the three values read outside it stay volatile.
 * Clock sampling, seek effects and output remain with the controller.
 */
final class RebuildPlaybackSelection {
    private volatile long pausedDisplayPosition = -1;
    private volatile RebuildClock.Observation observation;
    private volatile long observedSeekSerial = -1;
    private PlaybackState pausedHookState;
    private long pauseOwnerEpoch = -1, pauseClockEpoch = -1;
    private String pauseSource = "";

    boolean hasNewSeek(long serial) {
        long observed = observedSeekSerial;
        return observed >= 0 && observed != serial;
    }

    void consumeSeek(long serial) { observedSeekSerial = serial; }

    void clearPause() {
        pausedDisplayPosition = -1;
        pausedHookState = null;
    }

    long frozenPosition() { return pausedDisplayPosition; }

    boolean paused() {
        RebuildClock.Observation selected = observation;
        return selected != null && selected.paused();
    }

    long select(RebuildClock.Observation selected, PlaybackState raw, long owner,
            boolean hook, long hookPosition) {
        observation = selected;
        if (!selected.paused()) {
            clearPause();
            pauseSource = "";
            pauseOwnerEpoch = owner;
            pauseClockEpoch = selected.epoch;
            return selected.position;
        }
        long donor = selected.position;
        boolean changed = pausedDisplayPosition < 0
                || pauseOwnerEpoch != owner || pauseClockEpoch != selected.epoch
                || !pauseSource.equals(selected.source);
        if (RebuildClock.OFFICIAL_PLAYER_QUERY.equals(selected.source)) {
            // Native jitter is held, but a matching hook can confirm even a tiny seek.
            changed |= Math.abs(donor - pausedDisplayPosition) > 16
                    || hook && hookPosition == donor && donor != pausedDisplayPosition;
            pausedHookState = null;
        } else {
            boolean oldHook = raw != null && pausedHookState != null
                    && raw.getPosition() == pausedHookState.getPosition()
                    && raw.getLastPositionUpdateTime() == pausedHookState.getLastPositionUpdateTime();
            if (hook) {
                donor = Math.max(0, hookPosition);
                changed = true;
                pausedHookState = raw;
            } else if (!oldHook && Math.abs(donor - pausedDisplayPosition) > 1500) {
                changed = true;
                pausedHookState = null;
            }
        }
        if (changed) {
            pausedDisplayPosition = donor;
            pauseOwnerEpoch = owner;
            pauseClockEpoch = selected.epoch;
            pauseSource = selected.source;
        }
        return pausedDisplayPosition >= 0 ? pausedDisplayPosition : selected.position;
    }
}
