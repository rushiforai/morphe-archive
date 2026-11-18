package app.afterglow.extension.playback;

/** Implemented on YouTube's native watch fullscreen controller by the patch. */
public interface FullscreenController {
    void afterglow_enterFullscreen();
    void afterglow_exitFullscreen();
}
