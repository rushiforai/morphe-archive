package io.github.liongalahad.nuviotv.extension.playback.localmedia;

/** Stable Local Media facade for injected hooks and focused tests. */
public final class Extension {
    private Extension() {}

    public static boolean isEnabled() {
        return LocalMediaRuntime.isEnabled();
    }
}
