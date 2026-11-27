package app.jimaku.extension.jobs;

/**
 * A bar's movement from one status read on, as shares of the whole job from 0 to 1, ported from the
 * extension's {@code lib/time-left.ts}. It stands at {@code from} at {@code at} (ms) and runs evenly at
 * {@code speed} (shares a second) to {@code to}, which it reaches after {@code seconds}. Its tail follows:
 * the bar keeps going past {@code to}, slowing as speed / (1 + u / tau)² over the u seconds since, down to
 * the crawl, and crawls on until {@code ceiling}, where it stops.
 */
public final class Glide {
    public final double from;
    public final double to;
    public final double at;
    public final double seconds;
    public final double speed;
    public final double tau;
    public final double ceiling;

    public Glide(double from, double to, double at, double seconds, double speed, double tau, double ceiling) {
        this.from = from;
        this.to = to;
        this.at = at;
        this.seconds = seconds;
        this.speed = speed;
        this.tau = tau;
        this.ceiling = ceiling;
    }
}
