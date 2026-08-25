package dev.alastorkaneki.morphe.extension.mcpecenter;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.database.Cursor;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.Build;
import android.provider.DocumentsContract;
import android.widget.Toast;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.Locale;

/** Native storage integration for the target app's existing addons/detail MethodChannel. */
public final class DownloadLocationManager {
    static final String PREFS = "morphe_mcpe_download_location";
    static final String KEY_TREE_URI = "tree_uri";
    private static final String KEY_INTRO_SHOWN = "intro_shown";
    private static final String SHORTCUT_ID = "morphe_download_folder";

    private DownloadLocationManager() {
    }

    public static void initialize(Activity activity) {
        if (activity == null) {
            return;
        }

        installShortcut(activity);

        SharedPreferences preferences = prefs(activity);
        if (preferences.contains(KEY_TREE_URI) || preferences.getBoolean(KEY_INTRO_SHOWN, false)) {
            return;
        }
        preferences.edit().putBoolean(KEY_INTRO_SHOWN, true).apply();

        // Post until the FlutterActivity window is attached so this looks/behaves like a normal
        // Android dialog rather than racing the activity's startup lifecycle.
        activity.getWindow().getDecorView().post(() -> {
            if (activity.isFinishing() || activity.isDestroyed()) {
                return;
            }
            new AlertDialog.Builder(activity)
                    .setTitle("Download location")
                    .setMessage(
                            "Choose where downloaded add-ons are saved. You can change this later " +
                                    "by long-pressing the app icon and tapping Download folder."
                    )
                    .setPositiveButton("Choose folder", (dialog, which) -> openSettings(activity, true))
                    .setNegativeButton("Later", null)
                    .show();
        });
    }

    /**
     * Called at the start of MainActivity's existing MethodChannel callback. The Flutter MethodCall
     * type is intentionally reflected so the extension has no compile-time Flutter dependency.
     */
    public static void onMethodCall(Activity activity, Object methodCall) {
        if (activity == null || methodCall == null) {
            return;
        }

        try {
            Field methodField = methodCall.getClass().getField("method");
            Field argumentsField = methodCall.getClass().getField("arguments");
            Object methodValue = methodField.get(methodCall);
            Object argumentsValue = argumentsField.get(methodCall);

            if (!(methodValue instanceof String) || argumentsValue == null) {
                return;
            }

            String method = (String) methodValue;
            if (!"install".equals(method) && !"open_with".equals(method)) {
                return;
            }

            copyDownloadedFile(activity, String.valueOf(argumentsValue));
        } catch (ReflectiveOperationException ignored) {
            // The original MethodChannel flow must never be broken by the optional storage hook.
        }
    }

    static SharedPreferences prefs(Context context) {
        return context.getApplicationContext().getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    static Uri getTreeUri(Context context) {
        String value = prefs(context).getString(KEY_TREE_URI, null);
        if (value == null || value.isEmpty()) {
            return null;
        }
        try {
            return Uri.parse(value);
        } catch (RuntimeException ignored) {
            return null;
        }
    }

    static void setTreeUri(Context context, Uri uri) {
        if (uri == null) {
            prefs(context).edit().remove(KEY_TREE_URI).apply();
        } else {
            prefs(context).edit().putString(KEY_TREE_URI, uri.toString()).apply();
        }
    }

    static String folderLabel(Context context) {
        Uri treeUri = getTreeUri(context);
        if (treeUri == null) {
            return "App default";
        }

        try {
            String id = DocumentsContract.getTreeDocumentId(treeUri);
            int colon = id.indexOf(':');
            String path = colon >= 0 ? id.substring(colon + 1) : id;
            return path.isEmpty() ? "Storage root" : path;
        } catch (RuntimeException ignored) {
            return "Selected folder";
        }
    }

    static void openSettings(Activity activity, boolean pickImmediately) {
        Intent intent = new Intent(activity, DownloadLocationActivity.class)
                .setAction(Intent.ACTION_VIEW)
                .putExtra(DownloadLocationActivity.EXTRA_PICK_IMMEDIATELY, pickImmediately);
        activity.startActivity(intent);
    }

    private static void installShortcut(Context context) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.N_MR1) {
            return;
        }

        ShortcutManager shortcutManager = context.getSystemService(ShortcutManager.class);
        if (shortcutManager == null) {
            return;
        }

        Intent intent = new Intent(context, DownloadLocationActivity.class)
                .setAction(Intent.ACTION_VIEW);
        ShortcutInfo shortcut = new ShortcutInfo.Builder(context, SHORTCUT_ID)
                .setShortLabel("Download folder")
                .setLongLabel("Choose download folder")
                .setIcon(Icon.createWithResource(context, android.R.drawable.ic_menu_save))
                .setIntent(intent)
                .build();

        try {
            shortcutManager.addDynamicShortcuts(Collections.singletonList(shortcut));
        } catch (RuntimeException ignored) {
            // Shortcut support is optional; the storage hook continues to work without it.
        }
    }

    private static void copyDownloadedFile(Activity activity, String path) {
        Uri treeUri = getTreeUri(activity);
        if (treeUri == null || path == null || path.isEmpty()) {
            return;
        }

        File source = new File(path);
        if (!source.isFile()) {
            return;
        }

        // Open the source before leaving the MethodChannel callback. If the original app later
        // cleans up its working file, this descriptor remains readable until our copy completes.
        final FileInputStream sourceStream;
        try {
            sourceStream = new FileInputStream(source);
        } catch (Exception ignored) {
            return;
        }

        final String sourceName = source.getName();
        final Context applicationContext = activity.getApplicationContext();

        new Thread(() -> {
            try (FileInputStream input = sourceStream) {
                ContentResolver resolver = applicationContext.getContentResolver();
                Uri root = rootDocumentUri(treeUri);
                Uri target = findChild(resolver, treeUri, root, sourceName);
                if (target == null) {
                    target = DocumentsContract.createDocument(
                            resolver,
                            root,
                            mimeTypeFor(sourceName),
                            sourceName
                    );
                }
                if (target == null) {
                    throw new IllegalStateException("Could not create destination document");
                }

                OutputStream opened = resolver.openOutputStream(target, "rwt");
                if (opened == null) {
                    opened = resolver.openOutputStream(target, "w");
                }
                if (opened == null) {
                    throw new IllegalStateException("Could not open destination document");
                }

                try (OutputStream output = opened) {
                    byte[] buffer = new byte[64 * 1024];
                    int read;
                    while ((read = input.read(buffer)) != -1) {
                        output.write(buffer, 0, read);
                    }
                    output.flush();
                }

                showToast(activity, "Saved to " + folderLabel(applicationContext));
            } catch (Exception error) {
                showToast(activity, "Couldn't save to the selected folder");
            }
        }, "Morphe-MCPE-Save").start();
    }

    private static Uri rootDocumentUri(Uri treeUri) {
        String rootId = DocumentsContract.getTreeDocumentId(treeUri);
        return DocumentsContract.buildDocumentUriUsingTree(treeUri, rootId);
    }

    private static Uri findChild(
            ContentResolver resolver,
            Uri treeUri,
            Uri root,
            String displayName
    ) {
        Uri children = DocumentsContract.buildChildDocumentsUriUsingTree(
                treeUri,
                DocumentsContract.getDocumentId(root)
        );

        String[] projection = {
                DocumentsContract.Document.COLUMN_DOCUMENT_ID,
                DocumentsContract.Document.COLUMN_DISPLAY_NAME
        };
        try (Cursor cursor = resolver.query(children, projection, null, null, null)) {
            if (cursor == null) {
                return null;
            }
            while (cursor.moveToNext()) {
                String childName = cursor.getString(1);
                if (displayName.equals(childName)) {
                    String childId = cursor.getString(0);
                    return DocumentsContract.buildDocumentUriUsingTree(treeUri, childId);
                }
            }
        } catch (Exception ignored) {
            return null;
        }
        return null;
    }

    private static String mimeTypeFor(String fileName) {
        String lower = fileName.toLowerCase(Locale.ROOT);
        if (lower.endsWith(".mcpack") || lower.endsWith(".mcaddon") || lower.endsWith(".mcworld") ||
                lower.endsWith(".zip")) {
            return "application/zip";
        }
        if (lower.endsWith(".json")) {
            return "application/json";
        }
        if (lower.endsWith(".png")) {
            return "image/png";
        }
        if (lower.endsWith(".jpg") || lower.endsWith(".jpeg")) {
            return "image/jpeg";
        }
        return "application/octet-stream";
    }

    private static void showToast(Activity activity, String text) {
        activity.runOnUiThread(
                () -> Toast.makeText(activity.getApplicationContext(), text, Toast.LENGTH_SHORT).show()
        );
    }
}
