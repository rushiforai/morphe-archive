package app.yydarlinker.deepseekcaptions;

/** Pure clock policy: callback positions plus independently fresh, same-player media evidence. */
final class RebuildClock {
  private long confirmed, at, epoch, lastOutput;
  private boolean known;

  synchronized void reset(long now) {
    confirmed = 0;
    at = 0;
    epoch = now;
    lastOutput = 0;
    known = false;
  }

  synchronized boolean update(long position, long now) {
    position = Math.max(0, position);
    boolean seek =
        known
            && (position < confirmed - 250
                || position - confirmed > Math.max(2500, (now - at) * 4 + 500));
    if (!known || seek) lastOutput = position;
    confirmed = position;
    at = now;
    known = true;
    return seek;
  }

  synchronized long position(long now, long mediaPosition, long updated, float speed, int state) {
    if (!known) return 0;
    long result = confirmed;
    boolean valid =
        updated >= epoch
            && updated > 0
            && updated <= now
            && now - updated <= 1500
            && now - at <= 1500
            && Math.abs(mediaPosition - confirmed) <= 1800;
    if (valid) {
      if (state == 3 && Float.isFinite(speed) && speed > 0 && speed <= 4)
        result = mediaPosition + Math.round(Math.min(800, now - updated) * speed);
      else if (state == 2) result = mediaPosition;
    }
    // Do not allow stale accumulated extrapolation to survive a pause or seek.
    if (valid && state == 2) {
      lastOutput = result;
      return result;
    }
    lastOutput = Math.max(lastOutput, result);
    return lastOutput;
  }

  /** Both hook callbacks and timer ticks must render from this same reconciled clock. */
  synchronized long presentation(long now) {
    return position(now, -1, 0, 0, 0);
  }

  synchronized long confirmed() {
    return confirmed;
  }

  synchronized boolean fresh(long now) {
    return known && now - at <= 1800;
  }
}
