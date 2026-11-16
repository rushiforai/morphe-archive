package app.morphed.extension.twitch.musicfilter;

/**
 * How many Shazam requests may go out now: SIZE at once, one more every EVERY_S seconds. Shazam's own limit,
 * measured: 2 at once, then about 3.5 a minute; a refusal costs a minute and more, so all requests share one budget
 * just under it.
 */
public final class Budget {
    public static final int SIZE = 2;
    public static final double EVERY_S = 20;

    private final Clock clock;
    private final double size, every;
    private double left;
    private double at;

    public Budget(Clock clock) {
        this(clock, SIZE, EVERY_S);
    }

    Budget(Clock clock, double size, double every) {
        this.clock = clock;
        this.size = size;
        this.every = every;
        left = size;
        at = clock.seconds();
    }

    private void refill() {
        double now = clock.seconds();
        left = Math.min(size, left + (now - at) / every);
        at = now;
    }

    /** Seconds until a request may go out (0: now). */
    public synchronized double waitSeconds() {
        refill();
        return left >= 1 - 1e-6 ? 0.0 : (1 - left) * every; // (a hair short is rounding)
    }

    public synchronized void take() {
        refill();
        left -= 1;
    }
}
