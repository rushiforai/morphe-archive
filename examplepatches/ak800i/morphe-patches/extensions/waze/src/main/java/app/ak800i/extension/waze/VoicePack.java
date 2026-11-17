package app.ak800i.extension.waze;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.database.Cursor;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.provider.DocumentsContract;
import android.provider.OpenableColumns;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import android.widget.Toast;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Adds "Import pack" and "Export pack" buttons to Waze's custom voice screen
 * ({@code com.waze.settings.CustomPromptsRecordingActivity}).
 *
 * <ul>
 * <li>Import replaces the prompts on screen with those from a zip. The user then taps Done
 * and Waze saves the voice as if the prompts had been recorded. The name field is filled in
 * from the pack.</li>
 * <li>Export writes the prompts on screen to a zip. It works when an existing voice is opened
 * for editing or viewing, and for a new voice that is still being recorded.</li>
 * </ul>
 */
@SuppressWarnings({"unused", "deprecation"})
public final class VoicePack {
    static final String TAG = "WazeVoicePack";

    private static final String FRAGMENT_TAG = "app.ak800i.voicepack.Picker";
    private static final String EXTRA_IMPORTED_NAME = "app.ak800i.voicepack.IMPORTED_NAME";
    // Extras that Waze passes to the custom voice screen.
    private static final String EXTRA_READ_ONLY_MODE = "EXTRA_READ_ONLY_MODE";
    private static final String EXTRA_SET_NAME = "EXTRA_SET_NAME";
    private static final String DEFAULT_NAME = "My Waze voice";
    /** Set while an import or export runs; only one may run at a time. */
    private static final AtomicBoolean BUSY = new AtomicBoolean();

    private VoicePack() {
    }

    /** Called at the start of the screen's onCreate. */
    public static void onCreate(Activity activity) {
        // The screen's views exist only after onCreate. Posting also runs after the saved state
        // is restored, so the name that is set below is not overwritten.
        new Handler(Looper.getMainLooper()).post(() -> {
            try {
                attach(activity);
            } catch (Throwable t) {
                Log.e(TAG, "Could not add the voice pack buttons", t);
            }
        });
    }

    private static void attach(Activity activity) {
        if (activity.isFinishing() || activity.isDestroyed()) return;

        View root = findView(activity, "root");
        View header = findView(activity, "headerView");
        View list = findView(activity, "promptsRecycler");
        if (!(root instanceof RelativeLayout) || header == null || list == null) {
            Log.w(TAG, "The custom voice screen has an unexpected layout");
            return;
        }
        Picker picker = Picker.of(activity);

        LinearLayout bar = new LinearLayout(activity);
        bar.setId(View.generateViewId());
        bar.setOrientation(LinearLayout.HORIZONTAL);
        int pad = dp(activity, 8);
        bar.setPadding(pad * 2, pad, pad * 2, pad);
        int background = color(activity, "background_variant");
        if (background != 0) bar.setBackgroundColor(background);

        boolean readOnly = activity.getIntent().getBooleanExtra(EXTRA_READ_ONLY_MODE, false);
        if (!readOnly) bar.addView(button(activity, "Import pack", v -> picker.pickImport()));
        bar.addView(button(activity, "Export pack", v -> picker.pickExport()));

        RelativeLayout.LayoutParams barParams = new RelativeLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        barParams.addRule(RelativeLayout.BELOW, header.getId());
        ((RelativeLayout) root).addView(bar, barParams);

        if (list.getLayoutParams() instanceof RelativeLayout.LayoutParams) {
            RelativeLayout.LayoutParams listParams = (RelativeLayout.LayoutParams) list.getLayoutParams();
            listParams.addRule(RelativeLayout.BELOW, bar.getId());
            list.setLayoutParams(listParams);
        }

        String importedName = activity.getIntent().getStringExtra(EXTRA_IMPORTED_NAME);
        View nameField = findView(activity, "nameYourVoiceEditText");
        if (importedName != null && nameField instanceof EditText) {
            ((EditText) nameField).setText(importedName);
            // Applied once; after this the field keeps whatever the user types.
            activity.getIntent().removeExtra(EXTRA_IMPORTED_NAME);
        }
    }

    private static Button button(Activity activity, String text, View.OnClickListener onClick) {
        Button button = new Button(activity);
        button.setText(text);
        button.setAllCaps(false);
        button.setOnClickListener(onClick);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        int margin = dp(activity, 4);
        params.setMargins(margin, 0, margin, 0);
        button.setLayoutParams(params);
        return button;
    }

    private static View findView(Activity activity, String name) {
        int id = activity.getResources().getIdentifier(name, "id", activity.getPackageName());
        return id == 0 ? null : activity.findViewById(id);
    }

    private static int color(Context context, String name) {
        int id = context.getResources().getIdentifier(name, "color", context.getPackageName());
        if (id == 0) return 0;
        try {
            return context.getColor(id);
        } catch (Exception e) {
            return 0;
        }
    }

    private static int dp(Context context, int value) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics());
    }

    /** The name of the voice on screen, used for the export file and its metadata. */
    private static String voiceName(Activity activity) {
        String name = VoicePackFormat.trimName(activity.getIntent().getStringExtra(EXTRA_SET_NAME));
        if (name == null) {
            View field = findView(activity, "nameYourVoiceEditText");
            if (field instanceof EditText) name = VoicePackFormat.trimName(((EditText) field).getText().toString());
        }
        return name == null ? DEFAULT_NAME : name;
    }

    private static String fileName(String voiceName) {
        String safe = voiceName.replaceAll("[\\\\/:*?\"<>|\\p{Cntrl}]", "_").trim();
        return (safe.isEmpty() ? "waze-voice" : safe) + ".zip";
    }

    private static void toast(Context context, String text) {
        new Handler(Looper.getMainLooper()).post(() -> Toast.makeText(context, text, Toast.LENGTH_LONG).show());
    }

    private static boolean isGone(Activity activity) {
        return activity.isFinishing() || activity.isDestroyed();
    }

    /**
     * Covers the screen while a pack is read or written, so Done and the prompts cannot be
     * tapped, and keeps the screen from rotating, which would rebuild it in the middle.
     */
    private static View showOverlay(Activity activity) {
        ViewGroup content = activity.findViewById(android.R.id.content);
        if (content == null) return null;
        FrameLayout overlay = new FrameLayout(activity);
        overlay.setTag(activity.getRequestedOrientation());
        activity.setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LOCKED);
        overlay.setBackgroundColor(0x80000000);
        overlay.setClickable(true);
        overlay.setFocusable(true);
        overlay.setElevation(dp(activity, 100));
        overlay.addView(new ProgressBar(activity), new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));
        content.addView(overlay, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        return overlay;
    }

    /** Ends an import or export: removes the overlay and allows the next one. Runs on the main thread. */
    private static void finish(View overlay) {
        if (overlay != null) {
            if (overlay.getContext() instanceof Activity && overlay.getTag() instanceof Integer) {
                ((Activity) overlay.getContext()).setRequestedOrientation((Integer) overlay.getTag());
            }
            if (overlay.getParent() instanceof ViewGroup) ((ViewGroup) overlay.getParent()).removeView(overlay);
        }
        BUSY.set(false);
    }

    private static void runImport(Activity activity, Uri uri, View overlay) {
        Context app = activity.getApplicationContext();
        Handler main = new Handler(Looper.getMainLooper());
        File staging = null;
        boolean handedOff = false;
        try {
            WazeVoices voices = WazeVoices.query();
            staging = voices.newStagingDir();

            VoicePackFormat.ImportResult result;
            try (InputStream in = app.getContentResolver().openInputStream(uri)) {
                if (in == null) throw new IllegalStateException("Cannot open the file");
                result = VoicePackFormat.read(in, voices.promptIds, staging);
            }
            if (result.imported.isEmpty()) {
                long empty = result.skipped.stream().filter(s -> s.endsWith("(empty)")).count();
                toast(app, empty > 0
                        ? "No Waze prompts found; " + empty + " prompt files in the pack are empty."
                        : "No Waze prompts found. Prompt files must be named like TurnLeft.mp3.");
                return;
            }
            String name = result.name != null ? result.name : VoicePackFormat.trimName(displayName(app, uri));
            StringBuilder message = new StringBuilder("Imported ")
                    .append(result.imported.size()).append(" prompts");
            if (!result.skipped.isEmpty()) message.append(", skipped ").append(result.skipped.size()).append(" files");
            long empty = result.skipped.stream().filter(s -> s.endsWith("(empty)")).count();
            if (empty > 0) message.append(" (").append(empty).append(" empty)");
            if (result.newerFormat) message.append(". The pack uses a newer format; some details may be ignored");
            message.append(". Tap Done to save the voice.");

            // The recordings are replaced on the main thread, only while this screen is still
            // open. Waze's Done button and its save run from the main thread too.
            File staged = staging;
            handedOff = true;
            main.post(() -> {
                try {
                    if (isGone(activity)) {
                        Log.w(TAG, "The screen was closed; the import was not applied");
                        Toast.makeText(app, "The voice screen was closed, so the import was not applied.",
                                Toast.LENGTH_LONG).show();
                        return;
                    }
                    voices.replaceRecordings(staged);
                    Log.i(TAG, "Imported " + result.imported + ", skipped " + result.skipped);
                    Toast.makeText(app, message.toString(), Toast.LENGTH_LONG).show();
                    if (name != null) activity.getIntent().putExtra(EXTRA_IMPORTED_NAME, name);
                    // Rebuilds the prompt list from the new recordings. Waze keeps the voice's
                    // editing state, because the activity is not finishing.
                    activity.recreate();
                } catch (Exception e) {
                    Log.e(TAG, "Import failed", e);
                    Toast.makeText(app, "Import failed: " + e.getMessage(), Toast.LENGTH_LONG).show();
                } finally {
                    WazeVoices.deleteRecursively(staged);
                    finish(overlay);
                }
            });
        } catch (Exception e) {
            Log.e(TAG, "Import failed", e);
            toast(app, "Import failed: " + e.getMessage());
        } finally {
            if (!handedOff) {
                if (staging != null) WazeVoices.deleteRecursively(staging);
                main.post(() -> finish(overlay));
            }
        }
    }

    private static void runExport(Activity activity, Uri uri, String name, View overlay) {
        Context app = activity.getApplicationContext();
        try {
            WazeVoices voices = WazeVoices.query();
            int count;
            try (OutputStream out = app.getContentResolver().openOutputStream(uri, "wt")) {
                if (out == null) throw new IllegalStateException("Cannot write the file");
                count = VoicePackFormat.write(out, voices, name, wazeVersion(app));
            }
            if (count == 0) {
                deleteDocument(app, uri);
                toast(app, "This voice has no recordings to export.");
                return;
            }
            toast(app, "Exported " + count + " prompts.");
        } catch (Exception e) {
            Log.e(TAG, "Export failed", e);
            deleteDocument(app, uri);
            toast(app, "Export failed: " + e.getMessage());
        } finally {
            new Handler(Looper.getMainLooper()).post(() -> finish(overlay));
        }
    }

    private static String wazeVersion(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (Exception e) {
            return null;
        }
    }

    private static String displayName(Context context, Uri uri) {
        try (Cursor cursor = context.getContentResolver().query(
                uri, new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (cursor != null && cursor.moveToFirst()) {
                String name = cursor.getString(0);
                if (name != null) name = name.replaceAll("(?i)\\.(zip|tar\\.gz|tgz|tar)$", "");
                return name;
            }
        } catch (Exception e) {
            Log.w(TAG, "Could not read the file name", e);
        }
        return null;
    }

    private static void deleteDocument(Context context, Uri uri) {
        try {
            DocumentsContract.deleteDocument(context.getContentResolver(), uri);
        } catch (Exception ignored) {
            // The empty or partial file stays; the toast tells the user what happened.
        }
    }

    /**
     * A view-less fragment that opens the system file picker and receives its result, so the
     * patch does not have to add an activity or change Waze's onActivityResult.
     */
    public static final class Picker extends Fragment {
        private static final int REQUEST_IMPORT = 4201;
        private static final int REQUEST_EXPORT = 4202;

        /** The voice name at the time Export was tapped. */
        private String exportName;

        public Picker() {
        }

        static Picker of(Activity activity) {
            FragmentManager manager = activity.getFragmentManager();
            Fragment existing = manager.findFragmentByTag(FRAGMENT_TAG);
            if (existing instanceof Picker) return (Picker) existing;
            Picker picker = new Picker();
            manager.beginTransaction().add(picker, FRAGMENT_TAG).commitNowAllowingStateLoss();
            return picker;
        }

        void pickImport() {
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT)
                    .addCategory(Intent.CATEGORY_OPENABLE)
                    .setType("*/*")
                    .putExtra(Intent.EXTRA_MIME_TYPES, new String[]{
                            "application/zip", "application/x-zip-compressed", "application/gzip", "application/x-gzip",
                            "application/x-tar", "application/x-compressed-tar", "application/octet-stream"});
            start(intent, REQUEST_IMPORT);
        }

        void pickExport() {
            exportName = voiceName(getActivity());
            Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT)
                    .addCategory(Intent.CATEGORY_OPENABLE)
                    .setType("application/zip")
                    .putExtra(Intent.EXTRA_TITLE, fileName(exportName));
            start(intent, REQUEST_EXPORT);
        }

        private void start(Intent intent, int request) {
            if (BUSY.get()) {
                Toast.makeText(getActivity(), "Another import or export is still running.", Toast.LENGTH_LONG).show();
                return;
            }
            try {
                startActivityForResult(intent, request);
            } catch (ActivityNotFoundException e) {
                Toast.makeText(getActivity(), "No file picker is available.", Toast.LENGTH_LONG).show();
            }
        }

        @Override
        public void onActivityResult(int requestCode, int resultCode, Intent data) {
            Activity activity = getActivity();
            if (activity == null || isGone(activity) || resultCode != Activity.RESULT_OK
                    || data == null || data.getData() == null) return;
            if (requestCode != REQUEST_IMPORT && requestCode != REQUEST_EXPORT) return;
            if (!BUSY.compareAndSet(false, true)) {
                Toast.makeText(activity, "Another import or export is still running.", Toast.LENGTH_LONG).show();
                return;
            }
            Uri uri = data.getData();
            View overlay = showOverlay(activity);
            if (requestCode == REQUEST_IMPORT) {
                new Thread(() -> runImport(activity, uri, overlay), "VoicePackImport").start();
            } else {
                String name = exportName != null ? exportName : voiceName(activity);
                new Thread(() -> runExport(activity, uri, name, overlay), "VoicePackExport").start();
            }
        }
    }
}
