package app.afterglow.extension.playback;

/** Bridge to the native reactive component's current model and update callback. */
public interface WatchActionsController {
    void afterglow_rememberActions(Object model, Object context);
    boolean afterglow_refreshActions();
}
