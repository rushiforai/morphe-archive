package app.hushmessenger.extension;

import android.content.ClipData;
import android.content.ClipDescription;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.PersistableBundle;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.util.Map;

/**
 * The App tab's choices backup: Export and Import through the clipboard, and Save and Read through a file the phone's
 * picker chooses, which a job copies off the main thread with a deadline and a Cancel. One per settings page.
 */
final class ChoicesBackup {
    private static final int SAVE_CHOICES = SettingsActivity.SAVE_CHOICES, READ_CHOICES = SettingsActivity.READ_CHOICES;
    private final SettingsActivity page;
    private long documentGeneration;
    private String documentExport;
    private boolean documentImport;
    private boolean documentBusy;
    private Button saveChoicesFile, readChoicesFile;
    private Button cancelChoicesFile;
    private TextView documentStatus;
    /** The whole restore result. The toast holds only its first part, since Android 12+ cuts a toast after two lines. */
    private TextView restoreStatus;
    private DocumentJob documentJob;
    static int documentTimeoutMillis = 30_000;
    private static final java.util.concurrent.Semaphore documentSlots = new java.util.concurrent.Semaphore(2);

    ChoicesBackup(SettingsActivity page) {
        this.page = page;
    }

    /** A choice changed, so a file read that started before it no longer matches what's on. */
    void choicesChanged() {
        documentGeneration++;
    }

    void destroy() {
        documentGeneration++;
        if (documentJob != null && documentJob.request == SAVE_CHOICES) {
            // The provider may already have truncated the file. Finish this authorized save,
            // keeping its original deadline and only an application context after the screen closes.
            documentJob.owner.clear();
            documentJob = null;
            documentBusy = false;
        } else cancelDocumentJob(null);
    }

    /** Export, Import, Save to a file and Read a file, with the file job's status, its Cancel and the help after them. */
    void addTo(LinearLayout choices) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        ui.rule(choices, 12);
        Button exportBtn = ui.button(text.get("export"));
        exportBtn.setTag("export_choices");
        exportBtn.setOnClickListener(view -> exportChoices());
        ui.add(choices, exportBtn, 8);
        ui.add(choices, ui.text(text.get("export_help"), 13, ui.muted, false), 8);
        ui.rule(choices, 12);
        Button importBtn = ui.button(text.get("import_choices"));
        importBtn.setTag("import_choices");
        importBtn.setOnClickListener(view -> importChoices());
        ui.add(choices, importBtn, 8);
        ui.add(choices, ui.text(text.get("import_help"), 13, ui.muted, false), 8);
        ui.rule(choices, 12);
        Button saveFile = saveChoicesFile = ui.button(text.get("save_choices_file"));
        saveFile.setTag("save_choices_file");
        saveFile.setOnClickListener(view -> {
            if (documentBusy || documentImport || documentExport != null) return;
            documentGeneration++;
            documentImport = false;
            documentExport = ChoiceCodec.encode(Settings.preferences, Settings.installed);
            Intent picker = new Intent(Intent.ACTION_CREATE_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE)
                .setType("text/plain").putExtra(Intent.EXTRA_TITLE, "HushMessenger-choices.txt");
            try { page.startActivityForResult(picker, SAVE_CHOICES); }
            catch (android.content.ActivityNotFoundException | SecurityException error) {
                documentExport = null;
                page.feedback(text.get("export_failed"), Toast.LENGTH_LONG);
            }
        });
        ui.add(choices, saveFile, 8);
        Button readFile = readChoicesFile = ui.button(text.get("read_choices_file"));
        readFile.setTag("read_choices_file");
        readFile.setOnClickListener(view -> {
            if (documentBusy || documentImport || documentExport != null) return;
            documentGeneration++;
            documentExport = null;
            documentImport = true;
            Intent picker = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("text/*");
            try { page.startActivityForResult(picker, READ_CHOICES); }
            catch (android.content.ActivityNotFoundException | SecurityException error) {
                documentImport = false;
                page.feedback(text.get("choices_file_no_picker"), Toast.LENGTH_LONG);
            }
        });
        ui.add(choices, readFile, 8);
        documentStatus = ui.text("", 13, ui.muted, false);
        documentStatus.setTag("choices_file_status");
        documentStatus.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        documentStatus.setVisibility(View.GONE);
        ui.add(choices, documentStatus, 8);
        restoreStatus = ui.text("", 13, ui.muted, false);
        restoreStatus.setTag("choices_restore_status");
        restoreStatus.setAccessibilityLiveRegion(View.ACCESSIBILITY_LIVE_REGION_POLITE);
        restoreStatus.setVisibility(View.GONE);
        ui.add(choices, restoreStatus, 8);
        cancelChoicesFile = ui.button(text.get("cancel_choices_file"));
        cancelChoicesFile.setTag("cancel_choices_file");
        cancelChoicesFile.setVisibility(View.GONE);
        cancelChoicesFile.setOnClickListener(view -> cancelDocumentJob(
            documentJob != null && documentJob.request == READ_CHOICES ? "choices_file_canceled_read" : "choices_file_canceled"));
        ui.add(choices, cancelChoicesFile, 8);
        ui.add(choices, ui.text(text.get("choices_file_help"), 13, ui.muted, false), 8);
    }

    /** The document picker's answer for Save to a file or Read a file. */
    void documentResult(int request, int result, Intent data) {
        SettingsText text = page.text;
        String export = documentExport;
        boolean importing = documentImport;
        documentExport = null;
        documentImport = false;
        // Pending document operations deliberately don't survive recreation. A returned URI alone isn't authorization.
        if (result != android.app.Activity.RESULT_OK || data == null || data.getData() == null ||
            (request == SAVE_CHOICES ? export == null : !importing)) return;
        android.net.Uri uri = data.getData();
        // A document picker must return a provider grant, never a path opened with Messenger's own UID.
        if (!"content".equals(uri.getScheme())) {
            page.feedback(text.get(request == SAVE_CHOICES ? "export_failed" : "restore_failed"), Toast.LENGTH_LONG);
            return;
        }
        if (!documentSlots.tryAcquire()) {
            documentStatus.setText(text.get("choices_file_busy"));
            documentStatus.setVisibility(View.VISIBLE);
            return;
        }
        DocumentJob job = new DocumentJob(this, uri, request, export);
        documentJob = job;
        documentBusy = true;
        restoreStatus.setVisibility(View.GONE);
        saveChoicesFile.setEnabled(false);
        readChoicesFile.setEnabled(false);
        cancelChoicesFile.setVisibility(View.VISIBLE);
        documentStatus.setText(text.get(request == SAVE_CHOICES ? "choices_file_saving" : "choices_file_reading"));
        documentStatus.setVisibility(View.VISIBLE);
        job.handler.postDelayed(job.deadline, Math.max(1, documentTimeoutMillis));
        job.worker.start();
    }

    void exportChoices() {
        SettingsText text = page.text;
        try {
            ClipData clip = ClipData.newPlainText(text.get("clipboard"), ChoiceCodec.encode(Settings.preferences, Settings.installed));
            PersistableBundle extras = new PersistableBundle();
            extras.putBoolean(Build.VERSION.SDK_INT >= 33 ? ClipDescription.EXTRA_IS_SENSITIVE : "android.content.extra.IS_SENSITIVE", true);
            clip.getDescription().setExtras(extras);
            ClipboardManager clipboard = page.getSystemService(ClipboardManager.class);
            if (clipboard == null) throw new IllegalStateException("Clipboard unavailable");
            clipboard.setPrimaryClip(clip);
            if (Build.VERSION.SDK_INT < 33) page.feedback(text.get("exported"), Toast.LENGTH_SHORT);
        } catch (Exception error) {
            android.util.Log.e("HushMessenger", "Can't export choices", error);
            page.feedback(text.get("export_failed"), Toast.LENGTH_LONG);
        }
    }

    void importChoices() {
        SettingsText text = page.text;
        documentGeneration++;
        restoreStatus.setVisibility(View.GONE);
        try {
            ClipboardManager clipboard = page.getSystemService(ClipboardManager.class);
            if (clipboard == null || !clipboard.hasPrimaryClip()) {
                page.feedback(text.get("import_empty"), Toast.LENGTH_LONG);
                return;
            }
            ClipData clip = clipboard.getPrimaryClip();
            if (clip == null || clip.getItemCount() == 0) {
                page.feedback(text.get("import_empty"), Toast.LENGTH_LONG);
                return;
            }
            CharSequence raw = clip.getItemAt(0).getText();
            restoreChoices(ChoiceCodec.parse(raw == null ? null : raw.toString()));
        } catch (Exception error) {
            android.util.Log.e("HushMessenger", "Can't import choices", error);
            page.feedback(text.get("import_invalid"), Toast.LENGTH_LONG);
        }
    }

    private void restoreChoices(Map<String, Boolean> choices) {
        SettingsText text = page.text;
        java.util.Set<String> known = new java.util.HashSet<>();
        for (String[] spec : SettingsActivity.CONTROLS) known.add(spec[0]);
        known.addAll(Settings.SUB_SWITCHES.keySet());
        Map<String, Boolean> supported = new java.util.LinkedHashMap<>();
        int unknown = 0, unavailable = 0;
        for (Map.Entry<String, Boolean> choice : choices.entrySet()) {
            String key = choice.getKey();
            String owner = Settings.SUB_SWITCHES.get(key);
            if ("paused".equals(key) || (known.contains(key) && Settings.installed.contains(owner != null ? owner : key)))
                supported.put(key, choice.getValue());
            else if (known.contains(key)) unavailable++;
            else unknown++;
        }
        String skipped = (unknown == 0 ? "" : " " + text.count("import_unknown", unknown)) +
            (unavailable == 0 ? "" : " " + text.count("import_unavailable", unavailable));
        // A backup carries Auto reply's switch but not its replies. Turning it on here would start answering with
        // whatever replies this phone already has, so it only comes on from this screen. Turning it off still applies.
        boolean autoReplyLeftOff = Boolean.TRUE.equals(supported.get(AutoReply.KEY)) &&
            !Settings.preferences.getBoolean(AutoReply.KEY, false);
        if (autoReplyLeftOff) supported.remove(AutoReply.KEY);
        String autoReply = autoReplyLeftOff ? " " + text.get("import_auto_reply_off") : "";
        if (supported.isEmpty()) {
            restoreResult(autoReplyLeftOff ? text.get("import_auto_reply_off") : text.get("import_no_choices"), skipped);
            return;
        }
        // Every choice starts off, so a value the backup shares with this phone isn't news, and the count says so. The
        // pause isn't a choice; it gets its own sentence.
        int changed = 0, total = 0;
        boolean wasPaused = Settings.preferences.getBoolean("paused", false);
        SharedPreferences.Editor editor = Settings.preferences.edit();
        for (Map.Entry<String, Boolean> choice : supported.entrySet()) {
            if (!"paused".equals(choice.getKey())) {
                total++;
                if (Settings.preferences.getBoolean(choice.getKey(), false) != choice.getValue()) changed++;
            }
            editor.putBoolean(choice.getKey(), choice.getValue());
        }
        editor.apply();
        page.refreshChoices();
        // A backup can carry the pause, and a restored pause is easy to miss, so it stays in the toast, and so does a
        // pause the backup lifted.
        Boolean pause = supported.get("paused");
        String paused = Boolean.TRUE.equals(pause) ? " " + text.get("changes_paused") + "."
            : Boolean.FALSE.equals(pause) && wasPaused ? " " + text.get("changes_resumed") + "." : "";
        // The choices only match the backup when nothing in it was skipped, held back or left the pause different.
        boolean whole = total > 0 && skipped.isEmpty() && autoReply.isEmpty() && (pause == null || pause == wasPaused);
        String headline = changed == 0 ? text.get(whole ? "import_same" : "import_none_changed")
            : changed == total ? text.count("imported", changed) : text.get("imported_partial", changed, total);
        restoreResult(headline + paused, autoReply + skipped);
    }

    /**
     * The headline goes in the toast. With notes after it, the whole result also stays on the card under the buttons.
     * Both parts are whole SettingsText sentences, already translated, so joining them adds no untranslated text.
     */
    @android.annotation.SuppressLint("SetTextI18n")
    private void restoreResult(String headline, String notes) {
        page.feedback(headline, Toast.LENGTH_LONG);
        restoreStatus.setText(headline + notes);
        restoreStatus.setVisibility(notes.isEmpty() ? View.GONE : View.VISIBLE);
    }

    private void cancelDocumentJob(String status) {
        SettingsText text = page.text;
        DocumentJob job = documentJob;
        if (job == null) return;
        documentJob = null;
        documentBusy = false;
        documentGeneration++;
        job.owner.clear();
        job.handler.removeCallbacks(job.deadline);
        job.cancel();
        if (status != null) {
            saveChoicesFile.setEnabled(true);
            readChoicesFile.setEnabled(true);
            cancelChoicesFile.setVisibility(View.GONE);
            documentStatus.setText(text.get(status));
            documentStatus.setVisibility(View.VISIBLE);
        }
    }

    private void finishDocumentJob(DocumentJob job, boolean success, Map<String, Boolean> choices) {
        SettingsText text = page.text;
        if (documentJob != job || page.isDestroyed()) return;
        documentJob = null;
        documentBusy = false;
        saveChoicesFile.setEnabled(true);
        readChoicesFile.setEnabled(true);
        cancelChoicesFile.setVisibility(View.GONE);
        documentStatus.setVisibility(View.GONE);
        // A file that can't be read isn't a bad backup, so the two get different advice.
        if (!success) page.feedback(text.get(job.request == SAVE_CHOICES ? "export_failed" : job.invalid ? "import_invalid" : "restore_failed"), Toast.LENGTH_LONG);
        else if (job.request == SAVE_CHOICES) page.feedback(text.get("choices_file_saved"), Toast.LENGTH_SHORT);
        else if (job.generation == documentGeneration && job.before.equals(ChoiceCodec.encode(Settings.preferences, Settings.installed)))
            restoreChoices(choices);
        else page.feedback(text.get("choices_file_changed"), Toast.LENGTH_LONG);
    }

    /** Provider calls may ignore cancellation. Keep their resources bounded without retaining a screen. */
    private static final class DocumentJob implements Runnable {
        final java.lang.ref.WeakReference<ChoicesBackup> owner;
        final Context context;
        final android.net.Uri uri;
        final int request;
        final String export, before;
        final String savedMessage, failedMessage, timeoutMessage;
        final long generation;
        final android.os.CancellationSignal cancellation = new android.os.CancellationSignal();
        final android.os.Handler handler = new android.os.Handler(android.os.Looper.getMainLooper());
        final Runnable deadline;
        final Thread worker;
        volatile boolean canceled;
        /** The document was read but isn't a backup, as opposed to a document that couldn't be read. */
        volatile boolean invalid;
        volatile android.content.res.AssetFileDescriptor asset;
        volatile java.io.Closeable stream;
        private int users = 1;
        private boolean finished;

        DocumentJob(ChoicesBackup screen, android.net.Uri uri, int request, String export) {
            owner = new java.lang.ref.WeakReference<>(screen);
            context = screen.page.getApplicationContext();
            this.uri = uri;
            this.request = request;
            this.export = export;
            savedMessage = screen.page.text.get("choices_file_saved");
            failedMessage = screen.page.text.get("export_failed");
            // A read that runs out of time changes nothing. Only a save can leave a cut-off file behind.
            String timeout = request == READ_CHOICES ? "choices_file_timeout_read" : "choices_file_timeout";
            timeoutMessage = screen.page.text.get(timeout);
            generation = screen.documentGeneration;
            before = ChoiceCodec.encode(Settings.preferences, Settings.installed);
            deadline = () -> {
                ChoicesBackup current = owner.get();
                if (current != null && current.documentJob == this) current.cancelDocumentJob(timeout);
                else if (!canceled) {
                    cancel();
                    Toast.makeText(context, timeoutMessage, Toast.LENGTH_LONG).show();
                }
            };
            worker = new Thread(this, "HushChoicesDocument");
            worker.setDaemon(true);
        }

        void cancel() {
            synchronized (this) {
                if (canceled) return;
                canceled = true;
                if (finished) return;
                users++;
            }
            worker.interrupt();
            // Both remote cancellation listeners and close can block, so neither runs on the UI thread.
            Thread closer = new Thread(() -> {
                try {
                    try { cancellation.cancel(); }
                    finally {
                        java.io.Closeable currentStream = stream;
                        android.content.res.AssetFileDescriptor currentAsset = asset;
                        try { if (currentStream != null) currentStream.close(); }
                        finally { if (currentAsset != null) currentAsset.close(); }
                    }
                } catch (java.io.IOException | RuntimeException error) {
                    android.util.Log.w("HushMessenger", "Can't close choices document: " + error.getClass().getName());
                } finally { release(); }
            }, "HushChoicesCancel");
            closer.setDaemon(true);
            closer.start();
        }

        private synchronized void release() {
            if (--users == 0) {
                finished = true;
                documentSlots.release();
            }
        }

        @Override public void run() {
            Map<String, Boolean> choices = null;
            boolean success = false;
            try {
                if (canceled) return;
                String authority = uri.getAuthority();
                if (authority == null || authority.isEmpty()) throw new SecurityException("Choices document has no provider");
                // ContentResolver strips Android's userId@ prefix before resolving a provider.
                authority = authority.substring(authority.lastIndexOf('@') + 1);
                android.content.pm.ProviderInfo provider = context.getPackageManager().resolveContentProvider(authority, 0);
                if (provider != null && (context.getPackageName().equals(provider.packageName) ||
                        (provider.applicationInfo != null && provider.applicationInfo.uid == android.os.Process.myUid())))
                    throw new SecurityException("Choices document belongs to this app");
                if (request == SAVE_CHOICES) {
                    android.net.Uri media = "media".equals(authority) ? uri : null;
                    boolean mediaDocument = "com.android.providers.media.documents".equals(authority);
                    if (android.os.Build.VERSION.SDK_INT >= 29 && (mediaDocument ||
                            "com.android.externalstorage.documents".equals(authority))) {
                        media = android.provider.MediaStore.getMediaUri(context, uri);
                    }
                    if (mediaDocument && media == null)
                        throw new SecurityException("Choices media ownership is unavailable");
                    if (media != null) {
                        if (android.os.Build.VERSION.SDK_INT < 29)
                            throw new SecurityException("Choices media ownership is unavailable");
                        // A third-party picker can return MediaStore rows owned by Messenger.
                        // Check before opening with wt, which can truncate immediately.
                        try (android.database.Cursor row = context.getContentResolver().query(media,
                                new String[] {android.provider.MediaStore.MediaColumns.OWNER_PACKAGE_NAME},
                                null, null, null, cancellation)) {
                            if (row == null || !row.moveToFirst())
                                throw new SecurityException("Choices media ownership is unavailable");
                            String ownerPackage = row.getString(row.getColumnIndexOrThrow(
                                    android.provider.MediaStore.MediaColumns.OWNER_PACKAGE_NAME));
                            if (ownerPackage == null || ownerPackage.isEmpty() || context.getPackageName().equals(ownerPackage) || row.moveToNext())
                                throw new SecurityException("Choices media is private or has unknown ownership");
                        }
                    }
                }
                try (android.content.res.AssetFileDescriptor opened = context.getContentResolver()
                        .openAssetFileDescriptor(uri, request == SAVE_CHOICES ? "wt" : "r", cancellation)) {
                    if (opened == null) throw new java.io.IOException("No choices document");
                    asset = opened;
                    if (canceled) return;
                    if (request == SAVE_CHOICES) {
                        byte[] bytes = export.getBytes(java.nio.charset.StandardCharsets.UTF_8);
                        if (opened.getDeclaredLength() >= 0 && opened.getDeclaredLength() < bytes.length)
                            throw new java.io.IOException("Choices document slice is too small");
                        try (java.io.OutputStream output = opened.createOutputStream()) {
                            stream = output;
                            if (canceled) return;
                            output.write(bytes);
                        }
                    } else {
                        boolean pipe = false;
                        if (opened.getDeclaredLength() >= 0) {
                            // Older AssetFileDescriptor input skips relative to the provider's position.
                            // Normalize seekable descriptors so the declared slice has an absolute start.
                            try { android.system.Os.lseek(opened.getFileDescriptor(), 0, android.system.OsConstants.SEEK_SET); }
                            catch (android.system.ErrnoException error) {
                                if (error.errno != android.system.OsConstants.ESPIPE)
                                    throw new java.io.IOException("Choices document seek failed", error);
                                pipe = true;
                            }
                        }
                        boolean brokenSkip = pipe && opened.getStartOffset() > 0 &&
                            android.os.Build.VERSION.SDK_INT < android.os.Build.VERSION_CODES.R;
                        try (java.io.InputStream input = brokenSkip ? pipeSlice(opened) : opened.createInputStream()) {
                            stream = input;
                            if (canceled) return;
                            try { choices = ChoiceCodec.parse(ChoiceCodec.read(input)); }
                            catch (ChoiceCodec.TooLarge | IllegalArgumentException malformed) { invalid = true; throw malformed; }
                        }
                    }
                }
                success = !canceled;
            } catch (java.io.IOException | RuntimeException error) {
                // Providers run outside this app's trust boundary. Their messages can include private paths or contents.
                if (!canceled) android.util.Log.e("HushMessenger", "Can't use choices document: " + error.getClass().getName());
            } finally {
                asset = null;
                stream = null;
                handler.removeCallbacks(deadline);
                boolean completed = success;
                Map<String, Boolean> result = choices;
                handler.post(() -> {
                    ChoicesBackup screen = owner.get();
                    if (screen != null) screen.finishDocumentJob(this, completed, result);
                    else if (request == SAVE_CHOICES && !canceled)
                        Toast.makeText(context, completed ? savedMessage : failedMessage, Toast.LENGTH_LONG).show();
                });
                release();
            }
        }
    }

    /**
     * Android 9 and 10 skip to a slice's start before they set its length, so on a pipe that skip reads through an
     * empty slice and moves nothing. Read the start bytes off the descriptor itself, then stop at the declared length.
     */
    static java.io.InputStream pipeSlice(android.content.res.AssetFileDescriptor opened) throws java.io.IOException {
        // Close through the ParcelFileDescriptor, the way createInputStream's stream does, so the later close is a no-op.
        java.io.InputStream raw = new android.os.ParcelFileDescriptor.AutoCloseInputStream(opened.getParcelFileDescriptor());
        byte[] discard = new byte[8192];
        for (long left = opened.getStartOffset(); left > 0; ) {
            int read = raw.read(discard, 0, (int) Math.min(discard.length, left));
            if (read < 0) throw new java.io.EOFException("Choices document ends before its slice");
            left -= read;
        }
        return new java.io.FilterInputStream(raw) {
            long remaining = opened.getDeclaredLength();
            @Override public int read() throws java.io.IOException {
                if (remaining <= 0) return -1;
                int value = super.read();
                if (value >= 0) remaining--;
                return value;
            }
            @Override public int read(byte[] bytes, int offset, int length) throws java.io.IOException {
                if (length == 0) return 0;
                if (remaining <= 0) return -1;
                int read = super.read(bytes, offset, (int) Math.min(length, remaining));
                if (read > 0) remaining -= read;
                return read;
            }
            @Override public long skip(long count) throws java.io.IOException {
                if (count <= 0 || remaining <= 0) return 0;
                long skipped = super.skip(Math.min(count, remaining));
                remaining -= skipped;
                return skipped;
            }
            @Override public int available() throws java.io.IOException {
                return (int) Math.min(super.available(), remaining);
            }
        };
    }
}
