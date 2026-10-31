package io.github.emotionbug.patches.runtime;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.provider.Settings;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.TextView;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONArray;
import org.json.JSONObject;

/** Private settings and extension-owned result viewer; all persistence runs off the main thread. */
public final class SummarySettingsActivity extends Activity {
    private static final int REQUEST_NOTIFICATIONS = 29045;
    private static final String POST_NOTIFICATIONS = "android.permission.POST_NOTIFICATIONS";
    private static final String PROGRESS_CHANNEL = "ebpatcher_summary_processing";
    private final ExecutorService worker = Executors.newSingleThreadExecutor(runnable -> new Thread(runnable, "EBPatcher-summary-settings"));
    private final Handler main = new Handler(Looper.getMainLooper());
    private final Runnable poll = this::refresh;
    private boolean resumed, busy, rendering;
    private int generation, resultRequest;
    private Context app;
    private LinearLayout content, results;
    private RadioGroup modes;
    private RadioButton off, always, quota;
    private TextView notice, resultStatus;
    private Button clear;
    private final ModelControls[] models = new ModelControls[SummaryModel.Role.values().length];
    private String mode = SummaryStore.OFF;
    private String resultSignature = "";
    private AlertDialog resultDialog;
    private TextView notificationStatus;
    private ExtensionSettingsEntry.NativeRow allowNotifications;
    private String acknowledgedModels = "";
    private boolean acknowledgementPending;

    @Override public void onCreate(Bundle saved) {
        super.onCreate(saved);
        app = getApplicationContext();
        if (getActionBar() != null) getActionBar().hide();
        setTitle("On-device summaries");
        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        content = column();
        content.setPadding(dp(24), dp(12), dp(24), dp(24));
        scroll.addView(content, new ScrollView.LayoutParams(-1, -2));
        scroll.setOnApplyWindowInsetsListener((view, insets) -> {
            view.setPadding(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(),
                    insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
            return insets;
        });
        setContentView(scroll);
        button(content, "Back", this::finish);
        text(content, "On-device summaries", 26, true);
        text(content, "Whisper transcribes each recording channel locally. Gemma reads text only to produce a summary. "
                + "The original stereo recording is unchanged. The selected result updates ACall's normal local summary records; API originals are backed up separately. "
                + "Later API transcripts or summaries update the comparison using the saved local transcript, without running Whisper again. "
                + "Shows the five newest-created finished histories (not completion order). "
                + "Active work, pending call-history updates and API recovery backups are preserved separately.", 15, false);
        text(content, "Local AI can be wrong. Check important details against the recording. "
                + "Gemma recommends which result to keep when both sources arrive. Original API and local results can also be selected here to update the normal call history. "
                + "Local AI never uploads audio or text. ACall's existing cloud summary uses a temporary mono input; its account and quota rules still apply.", 15, false);
        text(content, "Summary progress notifications", 20, true);
        notificationStatus = text(content, "", 14, false);
        try {
            allowNotifications = ExtensionSettingsEntry.nativeRow(this, content, "Allow notifications", () -> {
                if (Build.VERSION.SDK_INT >= 33 && checkSelfPermission(POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED)
                    requestPermissions(new String[] { POST_NOTIFICATIONS }, REQUEST_NOTIFICATIONS);
            });
            content.addView(allowNotifications.view);
            ExtensionSettingsEntry.NativeRow notificationSettings = ExtensionSettingsEntry.nativeRow(this, content,
                    "Open notification settings", this::openNotificationSettings);
            content.addView(notificationSettings.view);
        } catch (RuntimeException | LinkageError unsupported) {
            android.util.Log.w("EBPatcherSettings", "Original notification settings row is unavailable", unsupported);
        }
        text(content, "Optional silent progress in the notification area. Denying notifications does not stop local processing. "
                + "Notifications contain no recording, transcript, caller or summary details.", 14, false);
        modes = new RadioGroup(this);
        off = choice("Off"); always = choice("Always"); quota = choice("When quota is exhausted");
        content.addView(modes, new LinearLayout.LayoutParams(-1, -2));
        modes.setOnCheckedChangeListener((group, checked) -> {
            if (rendering || busy || !resumed) return;
            String selected = checked == always.getId() ? SummaryStore.ALWAYS : checked == quota.getId() ? SummaryStore.QUOTA : SummaryStore.OFF;
            if (!selected.equals(mode)) changeMode(selected);
        });
        text(content, "Off stops local work. Always processes eligible saved recordings. When quota is exhausted runs only after ACall reports "
                + "the exact TICKET_ALL_USED result—not other server errors. Existing phone and recording controls are unaffected. "
                + "New work uses CPU while the device is interactive and prefers GPU otherwise. Waking the device restarts GPU work on CPU "
                + "through Android scheduling, reusing completed transcription chunks. CPU work is not restarted just because the screen turns off. "
                + "Both models, battery/storage conditions and an idle phone are still required.", 14, false);
        notice = text(content, "", 15, false);
        text(content, "Two separate model downloads", 20, true);
        text(content, "Whisper is for transcription; Gemma is for text summaries. Download each model explicitly below. "
                + "Only one model download can run at a time. Text-only updates to an existing transcript need Gemma, not Whisper.", 14, false);
        for (SummaryModel.Role role : SummaryModel.Role.values()) models[role.ordinal()] = new ModelControls(role);
        text(content, "No model weights are bundled with the patch. Each download starts only when you confirm Download or Update. "
                + "It uses HTTPS, without login, cookies or an access token. Size and SHA-256 must match the pinned metadata before atomic installation. "
                + "Update keeps the old model until the new download is verified and installed, then removes old weights automatically. "
                + "Downloads are not queued, resumed or retried automatically. Models and local results stay in this app's private, no-backup storage.", 14, false);
        text(content, "Local results", 20, true);
        resultStatus = text(content, "Loading extension results…", 14, false);
        results = column();
        content.addView(results, new LinearLayout.LayoutParams(-1, -2));
        clear = button(content, "Delete local summary data", () -> new AlertDialog.Builder(this).setTitle("Delete extension summary data?")
                .setMessage("Requires Off. Deletes this extension's jobs, AI-generated transcripts and local result history. "
                        + "Results already applied to ACall and their recovery backups are retained. Recordings and downloaded models are not deleted.")
                .setNegativeButton("Keep data", null).setPositiveButton("Delete local data", (dialog, which) -> action(() -> {
                    SummaryScheduler.stop(app);
                    try (SummaryLock ignored = SummaryLock.acquire(app)) {
                        SummaryStore store = SummaryStore.get(app);
                        if (!SummaryStore.OFF.equals(store.mode())) throw new IOException("Select Off before deleting local summary data.");
                        store.clear();
                    }
                }, "Local result history deleted. Applied ACall results and recovery backups were retained.")).show());
        setEnabled(false);
    }

    private RadioButton choice(String label) {
        RadioButton choice = new RadioButton(this);
        choice.setId(android.view.View.generateViewId());
        choice.setText(label); choice.setTextSize(16);
        modes.addView(choice, new RadioGroup.LayoutParams(-1, -2));
        return choice;
    }
    private void changeMode(String selected) {
        action(() -> {
            if (!SummaryStore.OFF.equals(selected) && !Process.is64Bit()) throw new IOException("Local summaries require a 64-bit application process.");
            SummaryScheduler.stop(app);
            SummaryStore.get(app).mode(selected);
            SummaryScheduler.schedule(app);
        }, "Local summary mode updated. Previously applied results remain in call history.");
    }
    private void confirmDownload(SummaryModel selected, boolean update) {
        if (selected == null) return;
        new AlertDialog.Builder(this).setTitle((update ? "Update " : "Download ") + selected.title + "?")
                .setMessage("Downloads " + size(selected.size) + " (" + selected.size + " bytes) from the pinned public Hugging Face model. "
                        + "Role: " + selected.role.label + ". Use Wi-Fi if mobile data is limited. License: " + selected.licenseName + ". "
                        + "The download is verified before use. No recordings or call data are sent. "
                        + (update ? "The installed older model is kept until the new model passes integrity checks and is installed. "
                                + "Old weights for this model are then removed automatically; no Delete step is needed." : ""))
                .setNegativeButton("Not now", null).setPositiveButton(update ? "Update" : "Download", (dialog, which) -> action(() -> {
                    if (!Process.is64Bit()) throw new IOException("This model requires a 64-bit application process.");
                    if (SummaryDownloadService.active(app)) throw new IOException("Another model download is active. Wait or cancel it first; downloads are not queued.");
                    app.startForegroundService(new Intent(app, SummaryDownloadService.class).setAction(SummaryDownloadService.DOWNLOAD)
                            .putExtra(SummaryDownloadService.MODEL, selected.role.key));
                }, selected.role.label + " download requested. Android will show its progress notification.")).show();
    }

    private interface Operation { void run() throws Exception; }
    private void action(Operation operation, String success) {
        if (busy || !resumed) return;
        busy = true;
        generation++;
        resultRequest++;
        main.removeCallbacks(poll);
        setEnabled(false);
        notice.setText("Working…");
        worker.execute(() -> {
            String message = success;
            try { operation.run(); }
            catch (Exception error) { message = SummaryDownloadService.message(error); }
            final String outcome = message;
            main.post(() -> {
                busy = false;
                if (isDestroyed()) return;
                notice.setText(outcome);
                if (resumed) refresh();
            });
        });
    }

    private void refresh() {
        main.removeCallbacks(poll);
        if (!resumed || busy || isDestroyed()) return;
        final int token = ++generation;
        worker.execute(() -> {
            Snapshot snapshot = null;
            String error = null;
            try { snapshot = new Snapshot(app); }
            catch (Exception failure) { error = SummaryDownloadService.message(failure); }
            final Snapshot observed = snapshot;
            final String failure = error;
            main.post(() -> {
                if (!resumed || busy || isDestroyed() || token != generation) return;
                if (observed != null) render(observed);
                else { setEnabled(false); notice.setText("Unable to load local summary settings: " + failure); }
                main.postDelayed(poll, 1500);
            });
        });
    }

    private void render(Snapshot snapshot) {
        mode = snapshot.mode;
        rendering = true;
        modes.check(SummaryStore.ALWAYS.equals(mode) ? always.getId() : SummaryStore.QUOTA.equals(mode) ? quota.getId() : off.getId());
        rendering = false;
        setEnabled(true);
        for (ModelControls controls : models) controls.render(snapshot);
        clear.setEnabled(SummaryStore.OFF.equals(mode) && (!snapshot.jobs.isEmpty() || snapshot.summaryFiles));
        resultStatus.setText(snapshot.jobs.isEmpty() ? "No local results. New eligible saved recordings appear here while local summaries are enabled."
                : "Showing " + snapshot.jobs.size() + " jobs: up to five newest-created finished histories plus active work. Tap to compare results or restore Original API.");
        StringBuilder signature = new StringBuilder(mode);
        for (SummaryStore.Job job : snapshot.jobs) signature.append('|').append(job.id).append(':').append(job.revision)
                .append(':').append(job.state).append(':').append(job.reason).append(':').append(job.summary)
                .append(':').append(job.apiDocument.hashCode()).append(':').append(job.choice)
                .append(':').append(job.selectionRevision).append(':').append(job.selfChannel).append(':').append(job.selfTalker);
        if (!signature.toString().equals(resultSignature)) {
            resultSignature = signature.toString();
            results.removeAllViews();
            DateFormat dates = DateFormat.getDateTimeInstance(DateFormat.MEDIUM, DateFormat.SHORT);
            for (SummaryStore.Job job : snapshot.jobs) {
                String title = job.recordingId > 0 ? "Recording " + job.recordingId : "Briefing " + job.briefingId;
                button(results, title + " · " + job.state + "\n" + dates.format(new Date(job.created))
                        + (job.reason.isEmpty() ? "" : "\n" + job.reason), () -> showResult(job));
            }
        }
        final String displayed = ModelUpdateBadge.identity(
                snapshot.models[SummaryModel.Role.GEMMA.ordinal()].model == null ? null
                        : snapshot.models[SummaryModel.Role.GEMMA.ordinal()].model.sha256,
                snapshot.models[SummaryModel.Role.WHISPER.ordinal()].model == null ? null
                        : snapshot.models[SummaryModel.Role.WHISPER.ordinal()].model.sha256);
        if (!displayed.isEmpty() && !displayed.equals(acknowledgedModels) && !acknowledgementPending) {
            // Only a successfully rendered, still-visible model settings screen acknowledges this pair.
            content.post(() -> {
                if (!resumed || isDestroyed() || !content.isShown() || acknowledgementPending) return;
                acknowledgementPending = true;
                worker.execute(() -> {
                    boolean saved = false;
                    try { saved = ModelUpdateBadge.acknowledge(app, displayed); }
                    catch (RuntimeException unavailable) { /* Leave N visible if persistence failed. */ }
                    final boolean committed = saved;
                    main.post(() -> {
                        acknowledgementPending = false;
                        if (committed) acknowledgedModels = displayed;
                    });
                });
            });
        }
    }

    private void showResult(SummaryStore.Job job) {
        if (busy || !resumed) return;
        final int token = ++resultRequest;
        worker.execute(() -> {
            String summary = "", transcript = "", error = "";
            JSONObject presentation = null;
            try {
                SummaryStore store = SummaryStore.get(app);
                summary = store.text(job.summary); transcript = store.text(job.transcript);
                presentation = store.presentation(job);
            } catch (Exception failure) { error = "Unable to read local result: " + SummaryDownloadService.message(failure); }
            final String generated = summary, spoken = transcript, failure = error;
            final JSONObject displayed = presentation;
            main.post(() -> {
                if (!resumed || isDestroyed() || busy || token != resultRequest) return;
                LinearLayout body = column(); body.setPadding(dp(20), dp(4), dp(20), dp(16));
                text(body, "Status: " + job.state + (job.reason.isEmpty() ? "" : "\n" + job.reason), 15, false);
                if (!failure.isEmpty()) text(body, failure, 15, false);
                if (displayed != null) {
                    text(body, "Selected source: " + displayed.optString("source").toUpperCase(Locale.US)
                            + " · Choice: " + displayed.optString("choice"), 17, true);
                    text(body, displayed.optString("reason"), 15, false);
                    if ("local".equals(displayed.optString("source")))
                        text(body, "Speaker mapping: " + displayed.optJSONObject("selected").optString("speakerMapping"), 15, false);
                    candidate(body, "Selected result", displayed.optJSONObject("selected"));
                    button(body, "Use recommended result", () -> selectResult(job, "recommended"));
                    if (!displayed.isNull("api")) button(body, "Restore Original API", () -> selectResult(job, "api"));
                    if (!displayed.isNull("local")) button(body, "Use local result", () -> selectResult(job, "local"));
                    candidate(body, "Original API summary and transcript (retained)", displayed.optJSONObject("api"));
                    JSONObject evidence = displayed.optJSONObject("speakerApi");
                    if (evidence != null && evidence.optJSONArray("segments") != null) {
                        int self = displayed.optInt("selfTalker", -1);
                        text(body, "My API speaker: " + (self < 0 ? "Original API identity" : "API speaker " + self), 17, true);
                        text(body, "Choose the API speaker whose words are yours. Your speech appears on the right. "
                                + "This changes only this recording's speaker identity in call history, without rerunning a model. "
                                + "API speaker IDs are not Whisper channel numbers.", 14, false);
                        button(body, "Use original API speaker identity", () -> selectSelfTalker(job, -1));
                        java.util.Set<Integer> speakers = new java.util.TreeSet<>();
                        JSONArray segments = evidence.optJSONArray("segments");
                        for (int i = 0; i < segments.length(); i++) {
                            JSONObject segment = segments.optJSONObject(i);
                            if (segment != null && segment.has("talkerId")) {
                                int speaker = segment.optInt("talkerId", -1);
                                if (speaker >= 0) speakers.add(speaker);
                            }
                        }
                        for (int speaker : speakers)
                            button(body, "API speaker " + speaker + " is my speech", () -> selectSelfTalker(job, speaker));
                    }
                }
                if (displayed != null && !displayed.isNull("local")) {
                    JSONObject local = displayed.optJSONObject("local");
                    candidate(body, "AI-generated local summary and transcript", local);
                    text(body, "My speech channel: " + displayed.optString("selfChannel", "auto"), 17, true);
                    text(body, "Applies only to this recording's local result. Choose your channel only if the recording separates "
                            + "your voice from the other party. This cannot separate speakers in mixed mono audio. "
                            + "Your speech appears on the right in call history.", 14, false);
                    button(body, "Identify my channel automatically", () -> selectSelfChannel(job, "auto"));
                    if (SummaryStore.hasChannel(local, "Channel 1"))
                        button(body, "Channel 1 is my speech", () -> selectSelfChannel(job, "Channel 1"));
                    if (SummaryStore.hasChannel(local, "Channel 2"))
                        button(body, "Channel 2 is my speech", () -> selectSelfChannel(job, "Channel 2"));
                } else {
                    text(body, "AI-generated local summary", 19, true);
                    text(body, generated.isEmpty() ? "No completed local summary yet." : generated, 16, false);
                }
                text(body, "AI can be wrong. Verify details against the original recording.", 14, false);
                text(body, "Original ACall summary (retained copy)", 19, true);
                text(body, job.original.isEmpty() ? "An original ACall summary is not available for this job." : job.original, 16, false);
                text(body, "AI-generated recording transcript", 19, true);
                text(body, spoken.isEmpty() ? "No transcript available yet." : spoken, 16, false);
                ScrollView scroll = new ScrollView(this); scroll.addView(body);
                AlertDialog.Builder dialog = new AlertDialog.Builder(this).setTitle("Local summary job " + job.id)
                        .setView(scroll).setPositiveButton("Close", null);
                if (("failed".equals(job.state) || "cancelled".equals(job.state)) && SummaryStore.accepts(mode, job.quota)) {
                    dialog.setNeutralButton("Retry local summary", (view, which) -> action(() -> {
                        SummaryStore.get(app).retry(job.id);
                        SummaryScheduler.schedule(app);
                    }, "Retry queued for this recording."));
                }
                if (resultDialog != null) resultDialog.dismiss();
                resultDialog = dialog.create();
                resultDialog.show();
            });
        });
    }

    private void selectResult(SummaryStore.Job job, String choice) {
        if (resultDialog != null) resultDialog.dismiss();
        action(() -> SummaryStore.get(app).chooseJob(job.id, choice),
                "Selection saved. The call-history update is queued; completion is reported after the database commit.");
    }
    private void selectSelfChannel(SummaryStore.Job job, String channel) {
        if (resultDialog != null) resultDialog.dismiss();
        action(() -> SummaryStore.get(app).selfChannel(job.id, channel),
                "Speech channel saved for this recording. The selected result's call-history update is queued.");
    }
    private void selectSelfTalker(SummaryStore.Job job, int speaker) {
        if (resultDialog != null) resultDialog.dismiss();
        action(() -> SummaryStore.get(app).selfTalker(job.id, speaker),
                "API speaker identity saved for this recording. The call-history update is queued.");
    }
    private void candidate(LinearLayout body, String heading, JSONObject document) {
        if (document == null) return;
        text(body, heading, 19, true);
        if (!document.optString("title").isEmpty()) text(body, document.optString("title"), 17, true);
        if (!document.optString("summary").isEmpty()) text(body, document.optString("summary"), 16, false);
        JSONArray segments = document.optJSONArray("segments");
        if (segments == null) return;
        for (int i = 0; i < segments.length(); i++) {
            JSONObject segment = segments.optJSONObject(i);
            if (segment == null) continue;
            String speaker = segment.optString("speaker");
            text(body, (speaker.isEmpty() ? "" : speaker + ": ") + segment.optString("text"), 16, false);
        }
    }

    private void setEnabled(boolean enabled) {
        off.setEnabled(enabled);
        always.setEnabled(enabled && Process.is64Bit()); quota.setEnabled(enabled && Process.is64Bit());
        for (ModelControls controls : models) if (controls != null) controls.setEnabled(enabled);
        clear.setEnabled(enabled);
        for (int i = 0; i < results.getChildCount(); i++) results.getChildAt(i).setEnabled(enabled);
    }
    private void showError(Exception error) { notice.setText(SummaryDownloadService.message(error)); }
    private LinearLayout column() { LinearLayout view = new LinearLayout(this); view.setOrientation(LinearLayout.VERTICAL); return view; }
    private TextView text(LinearLayout parent, String value, int size, boolean heading) {
        TextView view = new TextView(this); view.setText(value); view.setTextSize(size);
        view.setPadding(0, dp(heading ? 20 : 8), 0, dp(8)); view.setAccessibilityHeading(heading);
        view.setTextIsSelectable(!heading);
        parent.addView(view, new LinearLayout.LayoutParams(-1, -2)); return view;
    }
    private Button button(LinearLayout parent, String label, Runnable action) {
        Button button = new Button(this); button.setText(label); button.setAllCaps(false);
        button.setOnClickListener(view -> action.run());
        LinearLayout.LayoutParams layout = new LinearLayout.LayoutParams(-1, -2); layout.topMargin = dp(8);
        parent.addView(button, layout); return button;
    }
    private int dp(int value) { return Math.round(value * getResources().getDisplayMetrics().density); }
    private static String size(long bytes) { return String.format(Locale.US, "%.2f GiB", bytes / (1024.0 * 1024 * 1024)); }

    private final class ModelControls {
        final SummaryModel.Role role;
        final TextView metadata, status;
        final ProgressBar progress;
        final Button download, cancel, delete, license;
        SummaryModel model;
        String downloadToken = "";
        boolean outdated;

        ModelControls(SummaryModel.Role role) {
            this.role = role;
            text(content, role.label, 20, true);
            metadata = text(content, "Loading pinned public model information…", 14, false);
            status = text(content, "Checking model…", 15, false);
            progress = new ProgressBar(SummarySettingsActivity.this, null, android.R.attr.progressBarStyleHorizontal);
            progress.setMax(100);
            content.addView(progress, new LinearLayout.LayoutParams(-1, -2));
            license = button(content, "View " + role.label + " license", () -> {
                if (model == null) return;
                try { startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(model.licenseUrl))); }
                catch (RuntimeException error) { showError(error); }
            });
            download = button(content, "Download " + role.label, () -> confirmDownload(model, outdated));
            cancel = button(content, "Cancel " + role.label + " download", () -> {
                final String token = downloadToken;
                action(() -> app.startService(new Intent(app, SummaryDownloadService.class)
                        .setAction(SummaryDownloadService.CANCEL).putExtra(SummaryDownloadService.MODEL, role.key)
                        .putExtra(SummaryDownloadService.TOKEN, token)),
                        role.label + " cancellation requested. The current network read may take up to 15 seconds to stop.");
            });
            delete = button(content, "Delete " + role.label + " model", () ->
                    new AlertDialog.Builder(SummarySettingsActivity.this).setTitle("Delete " + role.label + " model?")
                            .setMessage("Removes only this model's downloaded weights and incomplete downloads. The other model and local results remain. "
                                    + "Original ACall summaries and recordings are never deleted. Local processing will be stopped.")
                            .setNegativeButton("Keep model", null).setPositiveButton("Delete model", (dialog, which) ->
                                    action(() -> SummaryDownloadService.deleteModel(app, role), role.label + " model deleted.")).show());
        }
        void setEnabled(boolean enabled) {
            download.setEnabled(enabled && model != null); cancel.setEnabled(enabled);
            delete.setEnabled(enabled && model != null); license.setEnabled(enabled && model != null);
        }
        void render(Snapshot snapshot) {
            ModelSnapshot observed = snapshot.models[role.ordinal()];
            model = observed.model;
            outdated = observed.outdated;
            downloadToken = snapshot.activeRole == role ? snapshot.activeToken : "";
            if (model == null) {
                metadata.setText("Pinned metadata is unavailable for " + role.label + ".");
                status.setText(observed.error);
                progress.setIndeterminate(false); progress.setProgress(0);
                setEnabled(false);
                return;
            }
            metadata.setText(model.title + "\n" + size(model.size) + " (" + model.size + " bytes)\nLicense: " + model.licenseName
                    + "\nPinned URL: " + model.url + "\nExpected SHA-256: " + model.sha256);
            boolean active = snapshot.active && snapshot.activeRole == role;
            String state = observed.ready ? "Verified " + role.label + " model ready."
                    : active && "waiting".equals(observed.state) ? role.label + " download verified; waiting to install."
                    : active && "verifying".equals(observed.state) ? "Verifying " + role.label + " size and SHA-256."
                    : active && "downloading".equals(observed.state) ? role.label + " download in progress."
                    : active ? "Preparing " + role.label + " download."
                    : outdated ? "Update available for " + role.label + ". The older installed model is kept until the update succeeds."
                    : role.label + " model not ready.";
            if (!active && ("downloading".equals(observed.state) || "verifying".equals(observed.state) || "waiting".equals(observed.state)))
                state += " Previous download was interrupted. Press " + (outdated ? "Update" : "Download") + " to start again; no automatic retry occurred.";
            else if (!observed.message.isEmpty()) state += "\n" + observed.message;
            if (snapshot.active && !active) state += "\nAnother model operation is active. Wait before downloading or deleting this model.";
            if (active) state += "\n" + size(observed.bytes) + " / " + size(model.size);
            if (!Process.is64Bit()) state = "Unsupported: this application process is 32-bit. Local summaries require 64-bit arm64 or x86_64.\n" + state;
            status.setText(state);
            progress.setVisibility(active || observed.ready ? android.view.View.VISIBLE : android.view.View.GONE);
            progress.setIndeterminate(active && ("absent".equals(observed.state) || "verifying".equals(observed.state)));
            progress.setProgress(observed.ready ? 100 : active ? (int) (Math.min(model.size, observed.bytes) * 100 / model.size) : 0);
            download.setText((outdated ? "Update " : "Download ") + role.label);
            license.setEnabled(true);
            download.setEnabled(Process.is64Bit() && !observed.ready && !snapshot.active);
            cancel.setEnabled(active && !downloadToken.isEmpty());
            delete.setEnabled(!snapshot.active && observed.modelFiles);
        }
    }
    private static final class ModelSnapshot {
        final SummaryModel model;
        final String state, message, error;
        final long bytes;
        final boolean ready, modelFiles, outdated;
        ModelSnapshot(Context context, SummaryStore store, SummaryModel.Role role, String activeToken) {
            SummaryModel selected = null;
            String failure = "";
            try { selected = SummaryModel.get(context, role); }
            catch (IOException unavailable) { failure = SummaryDownloadService.message(unavailable); }
            model = selected; error = failure;
            ready = model != null && model.ready(context);
            modelFiles = model != null && model.hasFiles(context);
            outdated = model != null && model.outdated(context, store);
            ModelDownloadProgress transfer = ModelDownloadProgress.read(
                    store.setting(role.setting(ModelDownloadProgress.KEY), ""),
                    model == null ? null : model.sha256, activeToken);
            state = transfer.state;
            message = transfer.message;
            bytes = transfer.bytes;
        }
    }
    private static final class Snapshot {
        final ModelSnapshot[] models = new ModelSnapshot[SummaryModel.Role.values().length];
        final String mode, activeToken;
        final SummaryModel.Role activeRole;
        final boolean active, summaryFiles;
        final List<SummaryStore.Job> jobs;
        Snapshot(Context context) throws IOException {
            SummaryStore store = SummaryStore.get(context);
            mode = store.mode();
            active = SummaryDownloadService.active(context);
            activeRole = active ? SummaryDownloadService.activeRole(context) : null;
            activeToken = active ? SummaryDownloadService.activeToken(context) : "";
            for (SummaryModel.Role role : SummaryModel.Role.values()) models[role.ordinal()] =
                    new ModelSnapshot(context, store, role, activeRole == role ? activeToken : null);
            summaryFiles = store.directory.exists();
            jobs = store.list();
        }
    }

    private void refreshNotificationStatus() {
        boolean permission = Build.VERSION.SDK_INT < 33 || checkSelfPermission(POST_NOTIFICATIONS) == PackageManager.PERMISSION_GRANTED;
        NotificationManager manager = getSystemService(NotificationManager.class);
        NotificationChannel channel = manager == null ? null : manager.getNotificationChannel(PROGRESS_CHANNEL);
        boolean enabled = permission && manager != null && manager.areNotificationsEnabled()
                && (channel == null || channel.getImportance() != NotificationManager.IMPORTANCE_NONE);
        notificationStatus.setText(enabled ? "Silent summary progress notifications are enabled."
                : "Summary progress notifications are disabled. Local processing is still available. "
                        + "Allow notifications or enable them in Android notification settings.");
        if (allowNotifications != null) allowNotifications.view.setVisibility(
                permission ? android.view.View.GONE : android.view.View.VISIBLE);
    }

    private void openNotificationSettings() {
        try {
            NotificationManager manager = getSystemService(NotificationManager.class);
            Intent intent = manager != null && manager.getNotificationChannel(PROGRESS_CHANNEL) != null
                    ? new Intent(Settings.ACTION_CHANNEL_NOTIFICATION_SETTINGS)
                            .putExtra(Settings.EXTRA_CHANNEL_ID, PROGRESS_CHANNEL)
                    : new Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS);
            startActivity(intent.putExtra(Settings.EXTRA_APP_PACKAGE, getPackageName()));
        } catch (RuntimeException unavailable) {
            notice.setText("Unable to open Android notification settings.");
        }
    }

    @Override public void onRequestPermissionsResult(int request, String[] permissions, int[] results) {
        super.onRequestPermissionsResult(request, permissions, results);
        if (request == REQUEST_NOTIFICATIONS) refreshNotificationStatus();
    }

    @Override public void onResume() {
        super.onResume();
        resumed = true;
        refreshNotificationStatus();
        refresh();
    }
    @Override public void onPause() {
        resumed = false; generation++; resultRequest++; main.removeCallbacks(poll);
        if (resultDialog != null) { resultDialog.dismiss(); resultDialog = null; }
        super.onPause();
    }
    @Override public void onDestroy() {
        resumed = false; generation++; resultRequest++; main.removeCallbacksAndMessages(null);
        worker.shutdown();
        super.onDestroy();
    }
}
