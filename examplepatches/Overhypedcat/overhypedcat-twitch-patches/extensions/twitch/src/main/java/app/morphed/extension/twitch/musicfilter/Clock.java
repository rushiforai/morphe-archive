package app.morphed.extension.twitch.musicfilter;

/** Monotonic seconds; replaced in tests. */
public interface Clock {
    Clock SYSTEM = () -> System.nanoTime() / 1e9;

    double seconds();
}
