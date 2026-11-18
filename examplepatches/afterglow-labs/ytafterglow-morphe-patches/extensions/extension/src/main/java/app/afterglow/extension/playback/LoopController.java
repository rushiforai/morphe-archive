package app.afterglow.extension.playback;

/** Implemented on the native watch loop-menu host by the patch. */
public interface LoopController {
    void afterglow_setLoopMode(int mode);
}
