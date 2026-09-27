package app.lchanc3.extension.localdream;

import android.content.Context;

/**
 * The words the batch screen shows, in English like the rest of the app.
 */
final class Strings {

    final String title;
    final String upscaler;
    final String scale;
    final String start;
    final String resume;
    final String stop;
    final String saveAll;
    final String save;
    final String saved;
    final String original;
    final String waiting;
    final String upscaling;
    final String failed;
    final String cancelled;
    final String waitingForBackend;
    final String backendNotRunning;
    final String noUpscaler;
    final String connectedDeviceMode;
    final String leaveTitle;
    final String leaveRunning;
    final String leaveUnsaved;
    final String leave;
    final String stay;
    final String allSaved;
    final String nothingToSave;
    final String saveFailed;

    private Strings() {
        title = "Batch Upscale";
        upscaler = "Upscaler";
        scale = "Scale";
        start = "Start";
        resume = "Resume";
        stop = "Stop";
        saveAll = "Save all";
        save = "Save";
        saved = "Saved";
        original = "Hold for original";
        waiting = "Waiting";
        upscaling = "Upscaling";
        failed = "Failed";
        cancelled = "Stopped";
        waitingForBackend = "Waiting for the backend…";
        backendNotRunning = "The backend is not answering. Go back to the upscale screen, let it start and try again.";
        noUpscaler = "No upscaler downloaded yet. Pick one image on the upscale screen and download one from the wand button first.";
        connectedDeviceMode = "Batch upscaling does not work in connected device mode, only the first image is used";
        leaveTitle = "Leave batch upscale?";
        leaveRunning = "It is still upscaling, leaving stops it.";
        leaveUnsaved = "%d result(s) have not been saved and are lost when you leave.";
        leave = "Leave";
        stay = "Stay";
        allSaved = "Saved %d image(s) to the gallery";
        nothingToSave = "Nothing to save yet";
        saveFailed = "Could not save: %s";
    }

    private static Strings instance;

    static Strings get(Context context) {
        if (instance == null) instance = new Strings();
        return instance;
    }
}
