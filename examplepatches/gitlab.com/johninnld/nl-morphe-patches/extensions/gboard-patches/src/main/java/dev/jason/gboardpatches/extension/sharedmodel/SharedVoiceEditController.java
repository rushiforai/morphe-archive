package dev.jason.gboardpatches.extension.sharedmodel;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.widget.LinearLayout;
import java.lang.reflect.Method;
import java.util.function.Consumer;

/** Records an explicit local command without delivering any recognition result to dictation. */
public final class SharedVoiceEditController {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static Recording current;

    private static final class Recording {
        final Context context;
        final String original;
        final EditorSnapshot snapshot;
        final SharedKeyboardSurface.Panel panel;
        Runnable stop;

        Recording(Context context, String original, EditorSnapshot snapshot, SharedKeyboardSurface.Panel panel) {
            this.context = context.getApplicationContext();
            this.original = original;
            this.snapshot = snapshot;
            this.panel = panel;
        }
    }

    private SharedVoiceEditController() {}

    static void arm(Context context, EditorSnapshot snapshot) {
        try {
            if (!GboardSharedWritingRuntime.isCurrent(snapshot)) return;
            String original = NativeEditBridge.prepare();
            if (!GboardSharedWritingRuntime.isCurrent(snapshot)) return;
            if (original == null || original.trim().isEmpty()) {
                SharedTextActions.message(context, "Enter or select the text to edit first.");
                return;
            }
            LinearLayout body = SharedKeyboardSurface.body();
            SharedKeyboardSurface.label(body, "Speak an instruction for this draft.");
            SharedKeyboardSurface.label(body, "Uses the speech model selected in Local AI.");
            SharedKeyboardSurface.Panel panel = new SharedKeyboardSurface.Panel(body);
            Recording recording = new Recording(context, original, snapshot, panel);
            SharedKeyboardSurface.button(body, "Record instruction", () -> start(recording));
            SharedKeyboardSurface.button(body, "Cancel", panel::dismiss);
            panel.setOnDismissListener(() -> {
                if (current == recording) cancel();
            });
            if (panel.show()) current = recording;
            else SharedTextActions.failure(context, "NATIVE_THEME_UNAVAILABLE");
        } catch (Exception unavailable) {
            SharedTextActions.message(context, "Voice Edit is unavailable in this editor.");
        }
    }

    private static void start(Recording recording) {
        if (current != recording || !GboardSharedWritingRuntime.isCurrent(recording.snapshot)) {
            recording.panel.dismiss();
            return;
        }
        showStatus(recording, "Starting shared speech…");
        try {
            Class<?> recorder = Class.forName("nl.johninnl.gboard.ParakeetRecognizer", false,
                    SharedVoiceEditController.class.getClassLoader());
            Method record = recorder.getMethod("recordEditCommand", Context.class, Runnable.class, Consumer.class);
            Runnable ready = () -> MAIN.post(() -> {
                if (current == recording) {
                    showStatus(recording, "Listening for your edit instruction…\n"
                            + SharedSpeechController.summary(recording.context));
                }
            });
            Consumer<String> result = text -> MAIN.post(() -> finish(recording, text));
            recording.stop = (Runnable) record.invoke(null, recording.context, ready, result);
        } catch (ReflectiveOperationException | LinkageError unavailable) {
            finish(recording, null);
        }
    }

    private static void showStatus(Recording recording, String message) {
        recording.panel.replaceContent();
        recording.panel.label(message);
        recording.panel.button("Cancel", recording.panel::dismiss);
    }

    private static void finish(Recording recording, String transcript) {
        if (current != recording || !recording.panel.isShowing()) return;
        current = null;
        if (!GboardSharedWritingRuntime.isCurrent(recording.snapshot)) {
            recording.panel.dismiss();
            SharedTextActions.message(recording.context, "The draft changed. Nothing was applied.");
            return;
        }
        if (transcript == null || transcript.trim().isEmpty()) {
            recording.panel.replaceContent();
            recording.panel.label("No instruction was recognized. Check your shared speech model and microphone permission.");
            recording.panel.label(SharedSpeechController.summary(recording.context));
            recording.panel.button("Back", recording.panel::dismiss);
            return;
        }
        String command = transcript.trim();
        String operation = VoiceEditPolicy.operation(true, command);
        SharedWritingDiagnostics.event("voice.edit command-transcribed");
        SharedTextActions.request(recording.context, operation, recording.original,
                "edit".equals(operation) ? command : null, null, null, recording.snapshot, recording.panel);
    }

    public static void cancel() {
        Recording recording = current;
        current = null;
        if (recording != null && recording.stop != null) recording.stop.run();
    }
}
