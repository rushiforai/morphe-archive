package samsungcompat;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.content.res.ColorStateList;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.provider.DocumentsContract;
import android.text.TextUtils;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.atomic.AtomicBoolean;

public final class NotesBackup {
    private static final String PREFS = "oneport_notes_backup";
    private static final String TREE_URI = "tree_uri";
    private static final String PICKING_SYNC_FOLDER = "picking_sync_folder";
    private static final String INDEX = "notes-backup-index.txt";
    private static final String INDEX_TMP = INDEX + ".tmp";
    private static final String LEGACY_INDEX_PREFIX = "notes-backup-index.tsv";
    private static final String PART = ".part";
    private static final AtomicBoolean RUNNING = new AtomicBoolean();
    private static final String TAG = "OnePortNotesBackup";
    private static final String AUTHOR_URL = "https://github.com/jibon-k";
    /** Height reserved under the Backup row for the credit line. */
    private static final int CREDIT_DP = 24;

    private NotesBackup() {}

    public static void migrateTouchFriendlyMode(Context context) {
        SharedPreferences migration = context.getSharedPreferences(
            "oneport_notes_compat", Context.MODE_PRIVATE);
        if (migration.getBoolean("touch_mode_migrated", false)) return;
        context.getSharedPreferences("Settings", Context.MODE_PRIVATE).edit()
            .putBoolean("settings_spen_only_mode", false).apply();
        migration.edit().putBoolean("touch_mode_migrated", true).apply();
    }

    /**
     * Adds the Backup row at the bottom of the drawer, sized like the native rows so the icon lines up
     * in the expanded drawer and the collapsed rail. Text style comes from a native row once laid out.
     */
    public static View addSidebarButton(View root, View.OnClickListener listener) {
        if (!(root instanceof ViewGroup)) return null;
        Context context = root.getContext();
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setClickable(true);
        row.setFocusable(true);
        row.setContentDescription(title());
        row.setTooltipText(title());
        row.setOnClickListener(listener);
        GradientDrawable mask = new GradientDrawable();
        mask.setColor(0xffffffff);
        mask.setCornerRadius(dp(context, 12));
        row.setBackground(new RippleDrawable(ColorStateList.valueOf(0x33808080), null, mask));
        // The phone drawer's card is a sibling above the root's own children; raise the row over
        // it without casting a shadow.
        row.setOutlineProvider(null);
        row.setTranslationZ(dp(context, 16));

        ImageView icon = new ImageView(context);
        icon.setImageResource(backupSyncIcon(context));
        icon.setScaleType(ImageView.ScaleType.FIT_CENTER);
        icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        int iconPad = dp(context, 10);
        icon.setPadding(iconPad, 0, iconPad, 0);
        row.addView(icon, new LinearLayout.LayoutParams(dp(context, 44), dp(context, 24)));

        TextView label = new TextView(context);
        label.setText(title());
        label.setSingleLine(true);
        label.setEllipsize(TextUtils.TruncateAt.END);
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
        label.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(
            0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        labelParams.setMarginStart(dp(context, 8));
        labelParams.setMarginEnd(dp(context, 12));
        row.addView(label, labelParams);
        applyTextColor(icon, label, label.getTextColors());
        TextView credit = createCredit(context);

        if (root instanceof FrameLayout) {
            FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 40), Gravity.BOTTOM);
            ((FrameLayout) root).addView(row, lp);
            ((FrameLayout) root).addView(credit, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM | Gravity.START));
            View list = root.findViewById(0x7f090545);
            if (list != null) {
                list.setPadding(list.getPaddingLeft(), list.getPaddingTop(),
                    list.getPaddingRight(), list.getPaddingBottom() + dp(context, 72 + CREDIT_DP));
            }
        } else if (root instanceof LinearLayout) {
            View list = root.findViewById(0x7f090545);
            if (list != null) {
                ViewGroup.LayoutParams old = list.getLayoutParams();
                LinearLayout.LayoutParams listParams = old instanceof LinearLayout.LayoutParams
                    ? (LinearLayout.LayoutParams) old
                    : new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0);
                listParams.height = 0;
                listParams.weight = 1f;
                list.setLayoutParams(listParams);
            }
            ((LinearLayout) root).addView(row, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(context, 40)));
            ((LinearLayout) root).addView(credit, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        }
        // collapsed (-1 unknown), native style copied, start/end inset of the native rows
        final int[] state = {-1, 0, dp(context, 14), dp(context, 14)};
        Rect visible = new Rect();
        // The rail is the expanded drawer clipped to ~72dp, not relaid out, so check what is
        // visible before every frame; this returns early unless the state changes.
        root.getViewTreeObserver().addOnPreDrawListener(() -> {
            updateSidebarRow(context, root, row, icon, label, credit, state, visible);
            return true;
        });
        return row;
    }

    private static void updateSidebarRow(Context context, View root, LinearLayout row,
                                         ImageView icon, TextView label, TextView credit,
                                         int[] state, Rect visible) {
        if (state[1] == 0 && copyNativeRowStyle(root, icon, label, state)) {
            state[1] = 1;
            state[0] = -1;  // re-apply the layout with the native insets
        }
        if (!root.getGlobalVisibleRect(visible)) return;
        // The drawer shows ~72dp as a rail and ~300dp when expanded.
        int collapsed = visible.width() < dp(context, 160) ? 1 : 0;
        if (collapsed == state[0]) return;
        state[0] = collapsed;
        label.setVisibility(collapsed == 1 ? View.GONE : View.VISIBLE);
        credit.setVisibility(collapsed == 1 ? View.GONE : View.VISIBLE);
        ViewGroup.LayoutParams current = row.getLayoutParams();
        int width = collapsed == 1 ? dp(context, 44) : ViewGroup.LayoutParams.MATCH_PARENT;
        // The credit sits under the row, lined up with its label.
        int creditStart = state[2] + dp(context, 52);
        int rowBottom = dp(context, collapsed == 1 ? 20 : 20 + CREDIT_DP);
        ViewGroup.MarginLayoutParams creditParams = (ViewGroup.MarginLayoutParams) credit.getLayoutParams();
        if (current instanceof FrameLayout.LayoutParams) {
            FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) current;
            params.width = width;
            params.gravity = Gravity.BOTTOM | Gravity.START;
            params.setMargins(state[2], 0, state[3], rowBottom);
            creditParams.setMargins(creditStart, 0, state[3], dp(context, 16));
        } else if (current instanceof LinearLayout.LayoutParams) {
            LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) current;
            params.width = width;
            params.gravity = Gravity.START;
            params.setMargins(state[2], dp(context, 8), state[3], dp(context, 4));
            creditParams.setMargins(creditStart, 0, state[3], dp(context, 16));
        }
        row.setLayoutParams(current);
        credit.setLayoutParams(creditParams);
    }

    private static TextView createCredit(Context context) {
        TextView credit = new TextView(context);
        credit.setText("Patches by jibon-k");
        credit.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        boolean night = (context.getResources().getConfiguration().uiMode
            & android.content.res.Configuration.UI_MODE_NIGHT_MASK)
            == android.content.res.Configuration.UI_MODE_NIGHT_YES;
        credit.setTextColor(night ? 0xff8ab4f8 : 0xff1a73e8);
        credit.setContentDescription("Patches by jibon-k, opens GitHub");
        int pad = dp(context, 4);
        credit.setPadding(0, pad, 0, pad);
        credit.setOutlineProvider(null);
        credit.setTranslationZ(dp(context, 16));
        credit.setOnClickListener(v -> {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(AUTHOR_URL));
            if (!(v.getContext() instanceof android.app.Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            try {
                v.getContext().startActivity(intent);
            } catch (android.content.ActivityNotFoundException e) {
                show(v.getContext(), AUTHOR_URL);
            }
        });
        return credit;
    }

    /**
     * Copies size, typeface, colour and horizontal insets from the first unselected native drawer
     * row, if one is laid out.
     */
    private static boolean copyNativeRowStyle(View root, ImageView icon, TextView label,
                                              int[] state) {
        Context context = root.getContext();
        View list = root.findViewById(0x7f090545);
        if (!(list instanceof ViewGroup)) return false;
        for (String pkg : new String[]{context.getPackageName(), "com.samsung.android.app.notes"}) {
            int id = context.getResources().getIdentifier("title", "id", pkg);
            if (id == 0) continue;
            ViewGroup group = (ViewGroup) list;
            for (int i = 0; i < group.getChildCount(); i++) {
                View title = group.getChildAt(i).findViewById(id);
                if (title instanceof TextView && ((TextView) title).getText().length() > 0
                        && !((TextView) title).getPaint().isFakeBoldText()
                        && !title.isSelected() && !group.getChildAt(i).isSelected()) {
                    TextView native_ = (TextView) title;
                    label.setTextSize(TypedValue.COMPLEX_UNIT_PX, native_.getTextSize());
                    label.setTypeface(native_.getTypeface());
                    applyTextColor(icon, label, native_.getTextColors());
                    View nativeRow = group.getChildAt(i);
                    int[] rootPos = new int[2];
                    int[] rowPos = new int[2];
                    root.getLocationInWindow(rootPos);
                    nativeRow.getLocationInWindow(rowPos);
                    int start = rowPos[0] - rootPos[0] + nativeRow.getPaddingLeft();
                    int end = rootPos[0] + root.getWidth() - rowPos[0] - nativeRow.getWidth()
                        + nativeRow.getPaddingRight();
                    if (start >= 0 && end >= 0) {
                        state[2] = start;
                        state[3] = end;
                    }
                    return true;
                }
            }
        }
        return false;
    }

    private static void applyTextColor(ImageView icon, TextView label, ColorStateList colors) {
        label.setTextColor(colors);
        icon.setImageTintList(ColorStateList.valueOf(colors.getDefaultColor()));
    }

    /** Resources stay compiled under the original package, so look there if the own one misses. */
    private static int backupSyncIcon(Context context) {
        for (String pkg : new String[]{context.getPackageName(), "com.samsung.android.app.notes"}) {
            int id = context.getResources().getIdentifier("oneport_ic_backup_sync", "drawable", pkg);
            if (id != 0) return id;
        }
        return android.R.drawable.ic_popup_sync;
    }

    private static int dp(Context c, int n) {
        return Math.round(n * c.getResources().getDisplayMetrics().density);
    }

    public static Intent createFolderPickerIntent() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE);
        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION
            | Intent.FLAG_GRANT_WRITE_URI_PERMISSION
            | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION
            | Intent.FLAG_GRANT_PREFIX_URI_PERMISSION);
        return intent;
    }

    public static boolean hasSavedBackupFolder(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
            .getString(TREE_URI, null) != null;
    }

    public static void onFolderSelected(Context context, Uri treeUri) {
        if (context == null || treeUri == null) return;
        // FolderPickerActivity serves both pickers; remember which one was opened.
        SharedPreferences prefs = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
        if (prefs.getBoolean(PICKING_SYNC_FOLDER, false)) {
            prefs.edit().remove(PICKING_SYNC_FOLDER).apply();
            NotesSync.onFolderSelected(context, treeUri);
            return;
        }
        try {
            context.getContentResolver().takePersistableUriPermission(treeUri,
                Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
            context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                .putString(TREE_URI, treeUri.toString()).apply();
            runBackup(context, treeUri);
        } catch (Exception e) {
            show(context, "Could not access that backup folder");
            Log.e(TAG, "Unable to access selected backup folder", e);
        }
    }

    public static void startBackup(Context context) {
        if (context == null) return;
        String value = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
            .getString(TREE_URI, null);
        if (value == null) {
            show(context, "Choose a backup folder from the folder picker");
            return;
        }
        runBackup(context, Uri.parse(value));
    }

    /** Adds the notes in the backup folder that this app doesn't have; notes it has stay as they are. */
    public static void startImport(Context context) {
        if (context == null) return;
        String value = context.getSharedPreferences(PREFS, Context.MODE_PRIVATE)
            .getString(TREE_URI, null);
        if (value == null) {
            show(context, "Choose a backup folder from the folder picker");
            return;
        }
        final Context app = context.getApplicationContext();
        final Uri tree = Uri.parse(value);
        if (!RUNNING.compareAndSet(false, true)) {
            show(app, "Backup is already running");
            return;
        }
        new Thread(() -> {
            String message;
            try {
                int[] result = importMissingNotes(app, tree);
                if (result[0] == 0 && result[2] == 0) {
                    message = result[1] == 0 ? "No notes in the backup folder"
                        : "All " + result[1] + " notes in the backup are already here";
                } else {
                    message = "Imported " + result[0] + " notes";
                    if (result[2] > 0) message += "; " + result[2] + " could not be imported";
                }
            } catch (FolderGoneException e) {
                message = "The backup folder was deleted or moved. Choose it again";
            } catch (SecurityException e) {
                app.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                    .remove(TREE_URI).apply();
                message = "Choose the backup folder again";
                Log.e(TAG, "Backup folder permission expired", e);
            } catch (Exception e) {
                message = "Import could not finish";
                Log.e(TAG, "Notes import failed", e);
            } finally {
                RUNNING.set(false);
            }
            show(app, message);
        }, "NotesImport").start();
    }

    /** @return {imported, already here, failed} */
    private static int[] importMissingNotes(Context context, Uri tree) throws Exception {
        requireFolder(context, tree);
        ContentResolver resolver = context.getContentResolver();
        Map<String, Uri> children = listChildren(resolver, tree);
        Map<String, String[]> index = readIndex(resolver, children);
        // uuid -> backup file name: the index first, then files it doesn't list (named "<title>-<uuid>.sdocx").
        Map<String, String> files = new TreeMap<>();
        for (Map.Entry<String, String[]> entry : index.entrySet()) {
            if (children.containsKey(entry.getValue()[2])) files.put(entry.getKey(), entry.getValue()[2]);
        }
        java.util.regex.Pattern named = java.util.regex.Pattern.compile(
            ".*-([0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12})\\.sdocx");
        for (String name : children.keySet()) {
            java.util.regex.Matcher m = named.matcher(name);
            if (m.matches() && !files.containsKey(m.group(1))) files.put(m.group(1), name);
        }

        Object contract = Class.forName(
            "com.samsung.android.support.senl.nt.app.sync.contractimpl.SDocResolverContractImpl")
            .getConstructor().newInstance();
        Method exists = contract.getClass().getMethod("isExistNote", Context.class, String.class);
        int imported = 0;
        int present = 0;
        int failed = 0;
        File incoming = new File(context.getCacheDir(), "backup-import.sdocx");
        for (Map.Entry<String, String> file : files.entrySet()) {
            String uuid = file.getKey();
            String name = file.getValue();
            // Trashed notes count as here too, so an import never brings back a copy of them.
            if (Boolean.TRUE.equals(exists.invoke(contract, context, uuid))) {
                present++;
                continue;
            }
            String title = name.substring(0, name.length() - (uuid.length() + ".sdocx".length() + 1));
            String[] entry = index.get(uuid);
            long modified = entry != null && parseLong(entry[0]) > 0 ? parseLong(entry[0])
                : System.currentTimeMillis();
            try {
                try (java.io.InputStream in = resolver.openInputStream(children.get(name));
                     OutputStream out = new java.io.FileOutputStream(incoming)) {
                    if (in == null) throw new IllegalStateException("Could not read " + name);
                    copy(in, out);
                }
                NoteFiles.importSdocx(context, incoming, uuid, title, uuid + ".sdocx", true,
                    "uncategorized:///", false, modified, modified, TAG);
                if (entry != null && !entry[1].isEmpty()) NotesSync.rememberRestored(context, uuid, entry[1]);
                imported++;
            } catch (java.io.IOException | IllegalStateException e) {
                Log.e(TAG, "Could not import " + name, e);
                failed++;
            } finally {
                incoming.delete();
            }
        }
        return new int[]{imported, present, failed};
    }

    /** "Backup to folder" patch hook: called with the drawer's root view right after it is inflated. */
    public static void onDrawerCreated(View root) {
        if (root == null) return;
        addSidebarButton(root, v -> showBackupOptions(v.getContext()));
    }

    private static String title() {
        return Features.syncEnabled() ? "Backup and sync" : "Backup";
    }

    public static void showBackupOptions(Context context) {
        if (context == null) return;
        java.util.List<CharSequence> labels = new java.util.ArrayList<>();
        java.util.List<Runnable> actions = new java.util.ArrayList<>();
        if (hasSavedBackupFolder(context)) {
            labels.add("Back up now");
            actions.add(() -> startBackup(context));
            labels.add("Import from backup");
            actions.add(() -> startImport(context));
            labels.add("Change backup folder");
        } else {
            labels.add("Choose backup folder");
        }
        actions.add(() -> chooseFolder(context, false));
        if (Features.syncEnabled()) {
            labels.add("Sync now");
            actions.add(() -> NotesSync.syncNow(context));
            labels.add(NotesSync.hasSyncFolder(context) ? "Change sync folder" : "Choose sync folder");
            actions.add(() -> chooseFolder(context, true));
        }
        new android.app.AlertDialog.Builder(context)
            .setTitle(title())
            .setItems(labels.toArray(new CharSequence[0]), (dialog, which) -> actions.get(which).run())
            .setNegativeButton("Cancel", null)
            .show();
    }

    private static void chooseFolder(Context context, boolean forSync) {
        try {
            context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                .putBoolean(PICKING_SYNC_FOLDER, forSync).apply();
            Intent intent = new Intent(context, FolderPickerActivity.class);
            if (!(context instanceof android.app.Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(intent);
        } catch (Exception e) {
            Log.e(TAG, "Unable to open backup folder picker", e);
        }
    }

    private static void runBackup(Context context, Uri tree) {
        final Context app = context.getApplicationContext();
        if (!RUNNING.compareAndSet(false, true)) {
            show(app, "Backup is already running");
            return;
        }
        new Thread(() -> {
            String message;
            try {
                int[] result = exportChangedNotes(app, tree);
                message = result[0] == 0
                    ? "Backup is up to date"
                    : "Backed up " + result[0] + " changed notes";
                if (result[2] > 0) {
                    message += "; " + result[2] + " notes were being saved, run backup again";
                }
            } catch (FolderGoneException e) {
                message = "The backup folder was deleted or moved. Choose it again";
            } catch (SecurityException e) {
                app.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
                    .remove(TREE_URI).apply();
                message = "Choose the backup folder again";
                Log.e(TAG, "Backup folder permission expired", e);
            } catch (Exception e) {
                message = "Backup could not finish";
                Log.e(TAG, "Notes backup failed", e);
            } finally {
                RUNNING.set(false);
            }
            String result = message;
            new Handler(Looper.getMainLooper()).post(() ->
                Toast.makeText(app, result, Toast.LENGTH_LONG).show());
        }, "NotesBackup").start();
    }

    /** @return {exported, unchanged, busy} where busy notes were mid-save and left for next run */
    private static int[] exportChangedNotes(Context context, Uri tree) throws Exception {
        requireFolder(context, tree);
        Object repositoryManager = Class.forName(
            "com.samsung.android.support.senl.nt.app.common.data.RepositoryManager")
            .getMethod("getInstance").invoke(null);
        Object repository = repositoryManager.getClass().getMethod("getNoteRepository")
            .invoke(repositoryManager);
        List<?> notes = (List<?>) repository.getClass().getMethod("getNotesForBackup")
            .invoke(repository);
        if (notes == null) return new int[]{0, 0, 0};

        ContentResolver resolver = context.getContentResolver();
        // One listing per run; kept up to date as files are created, deleted and renamed.
        Map<String, Uri> children = listChildren(resolver, tree);
        Map<String, String[]> oldIndex = readIndex(resolver, children);
        Map<String, String[]> nextIndex = new TreeMap<>(oldIndex);
        int exported = 0;
        int skipped = 0;
        int busy = 0;
        for (Object note : notes) {
            String uuid = (String) invoke(note, "getUuid");
            String title = (String) invoke(note, "getTitle");
            String path = (String) invoke(note, "getFilePath");
            long modified = ((Number) invoke(note, "getLastModifiedAt")).longValue();
            if (uuid == null || path == null) continue;
            File source = new File(path);
            if (!source.exists()) continue;
            if (savingPid(note) != 0) {
                busy++;
                continue;
            }
            String[] previous = oldIndex.get(uuid);
            String filename = previous != null ? previous[2]
                : safeName(title) + "-" + uuid + ".sdocx";
            Uri output = children.get(filename);
            if (output == null) {
                filename = findExistingNoteBackup(children, uuid);
                output = filename == null ? null : children.get(filename);
                if (output == null) filename = safeName(title) + "-" + uuid + ".sdocx";
            }
            String fileStamp = NoteFiles.stamp(source);
            if (previous != null && output != null && fileStamp.equals(previous[3])) {
                nextIndex.put(uuid, entry(modified, previous[1], filename, fileStamp));
                skipped++;
                continue;
            }
            String digest = NoteFiles.digest(source);
            if (previous != null && output != null && digest.equals(previous[1])) {
                nextIndex.put(uuid, entry(modified, digest, filename, fileStamp));
                skipped++;
                continue;
            }

            // Write the new copy beside the old one; the old copy is only removed once the new
            // one is complete and matches the note as it was before the copy started.
            Uri part = createReplacing(resolver, tree, children, filename + PART);
            writeExport(context, resolver, part, source);
            if (!digest.equals(NoteFiles.digest(source))) {
                DocumentsContract.deleteDocument(resolver, part);
                children.remove(filename + PART);
                busy++;
                continue;
            }
            if (output != null) {
                DocumentsContract.deleteDocument(resolver, output);
                children.remove(filename);
            }
            Uri renamed = DocumentsContract.renameDocument(resolver, part, filename);
            if (renamed == null) throw new IllegalStateException("Could not rename " + filename);
            children.remove(filename + PART);
            filename = getDisplayName(resolver, renamed);
            children.put(filename, renamed);
            nextIndex.put(uuid, entry(modified, digest, filename, fileStamp));
            exported++;
        }
        writeIndex(resolver, tree, children, nextIndex);
        return new int[]{exported, skipped, busy};
    }

    private static void requireFolder(Context context, Uri tree) {
        if (NoteFiles.treeExists(context, tree)) return;
        context.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit().remove(TREE_URI).apply();
        throw new FolderGoneException();
    }

    private static String[] entry(long modified, String digest, String filename, String stamp) {
        return new String[]{Long.toString(modified), digest, filename, stamp};
    }

    /** PID of the process currently saving the note, 0 when no save is in progress. */
    private static int savingPid(Object note) {
        try {
            return ((Number) invoke(note, "getIsSavingByWhichPid")).intValue();
        } catch (Exception e) {
            return 0;
        }
    }

    private static Uri createReplacing(ContentResolver resolver, Uri tree, Map<String, Uri> children,
                                       String name) throws Exception {
        Uri stale = children.remove(name);
        if (stale != null) DocumentsContract.deleteDocument(resolver, stale);
        Uri created = DocumentsContract.createDocument(resolver, rootDocumentUri(tree),
            "application/octet-stream", name);
        if (created == null) throw new IllegalStateException("Could not create " + name);
        children.put(getDisplayName(resolver, created), created);
        return created;
    }

    private static Object invoke(Object object, String method) throws Exception {
        Method m = object.getClass().getMethod(method);
        return m.invoke(object);
    }

    private static String safeName(String title) {
        if (title == null || title.trim().isEmpty()) return "Note";
        String value = title.replaceAll("[\\\\/:*?\"<>|\\p{Cntrl}]", "_").trim();
        if (value.length() > 72) value = value.substring(0, 72);
        return value.isEmpty() ? "Note" : value;
    }

    /** The note as a single .sdocx file, made by the app's own export (NoteFiles). */
    private static void writeExport(Context context, ContentResolver resolver, Uri output,
                                    File source) throws Exception {
        File exported = new File(context.getCacheDir(), "backup-export.sdocx");
        try {
            NoteFiles.exportSdocx(context, source, exported);
            try (OutputStream raw = resolver.openOutputStream(output, "wt");
                 FileInputStream in = new FileInputStream(exported)) {
                if (raw == null) throw new IllegalStateException("Could not write backup output");
                copy(in, raw);
            }
        } finally {
            exported.delete();
        }
    }

    private static void copy(java.io.InputStream in, OutputStream out) throws Exception {
        byte[] buffer = new byte[32768];
        int count;
        while ((count = in.read(buffer)) != -1) out.write(buffer, 0, count);
    }

    private static Uri childrenUri(Uri tree) {
        return DocumentsContract.buildChildDocumentsUriUsingTree(tree,
            DocumentsContract.getTreeDocumentId(tree));
    }

    private static Uri rootDocumentUri(Uri tree) {
        return DocumentsContract.buildDocumentUriUsingTree(tree,
            DocumentsContract.getTreeDocumentId(tree));
    }

    /** Index lines: uuid, lastModifiedAt, sha256, filename[, file mtime:size]. */
    private static Map<String, String[]> readIndex(ContentResolver resolver,
                                                   Map<String, Uri> children) throws Exception {
        Map<String, String[]> map = new TreeMap<>();
        for (Uri index : findIndexFiles(children)) {
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(
                    resolver.openInputStream(index), StandardCharsets.UTF_8))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    String[] parts = line.split("\\t", 5);
                    if (parts.length < 4) continue;
                    String[] old = map.get(parts[0]);
                    long modified = parseLong(parts[1]);
                    if (old == null || modified >= parseLong(old[0])) {
                        map.put(parts[0], new String[]{parts[1], parts[2], parts[3],
                            parts.length == 5 ? parts[4] : ""});
                    }
                }
            }
        }
        return map;
    }

    /** Writes a temporary index first so a failure never leaves the folder without one. */
    private static void writeIndex(ContentResolver resolver, Uri tree, Map<String, Uri> children,
                                   Map<String, String[]> map) throws Exception {
        Uri tmp = createReplacing(resolver, tree, children, INDEX_TMP);
        try (BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(
                resolver.openOutputStream(tmp, "wt"), StandardCharsets.UTF_8))) {
            for (Map.Entry<String, String[]> entry : map.entrySet()) {
                String[] value = entry.getValue();
                writer.write(entry.getKey() + "\t" + value[0] + "\t" + value[1]
                    + "\t" + value[2] + "\t" + value[3]);
                writer.newLine();
            }
        }
        for (Uri old : findIndexFiles(children)) {
            if (!old.equals(tmp)) DocumentsContract.deleteDocument(resolver, old);
        }
        if (DocumentsContract.renameDocument(resolver, tmp, INDEX) == null) {
            throw new IllegalStateException("Could not write backup index");
        }
    }

    private static long parseLong(String value) {
        try { return Long.parseLong(value); } catch (Exception ignored) { return Long.MIN_VALUE; }
    }

    /** Current index, a leftover temporary index from an interrupted run, and legacy indexes. */
    private static List<Uri> findIndexFiles(Map<String, Uri> children) {
        List<Uri> result = new ArrayList<>();
        for (Map.Entry<String, Uri> child : children.entrySet()) {
            String name = child.getKey();
            if (INDEX.equals(name) || INDEX_TMP.equals(name)
                || name.startsWith(LEGACY_INDEX_PREFIX)) {
                result.add(child.getValue());
            }
        }
        return result;
    }

    /** Name of an existing backup of this note under an older naming scheme, or null. */
    private static String findExistingNoteBackup(Map<String, Uri> children, String uuid) {
        String oldVersionNeedle = "-" + uuid + "-";
        String currentNeedle = "-" + uuid + ".sdocx";
        for (String name : children.keySet()) {
            if (name.endsWith(currentNeedle)
                || name.matches(".+-" + java.util.regex.Pattern.quote(uuid)
                    + " \\(\\d+\\)\\.sdocx")
                || (name.contains(oldVersionNeedle) && name.endsWith(".sdocx"))) {
                return name;
            }
        }
        return null;
    }

    private static Map<String, Uri> listChildren(ContentResolver resolver, Uri tree)
        throws Exception {
        Map<String, Uri> result = new LinkedHashMap<>();
        String[] columns = {DocumentsContract.Document.COLUMN_DOCUMENT_ID,
            DocumentsContract.Document.COLUMN_DISPLAY_NAME};
        try (Cursor cursor = resolver.query(childrenUri(tree), columns, null, null, null)) {
            if (cursor == null) return result;
            int idColumn = cursor.getColumnIndexOrThrow(
                DocumentsContract.Document.COLUMN_DOCUMENT_ID);
            int nameColumn = cursor.getColumnIndexOrThrow(
                DocumentsContract.Document.COLUMN_DISPLAY_NAME);
            while (cursor.moveToNext()) {
                result.put(cursor.getString(nameColumn),
                    DocumentsContract.buildDocumentUriUsingTree(tree, cursor.getString(idColumn)));
            }
        }
        return result;
    }

    private static String getDisplayName(ContentResolver resolver, Uri document)
        throws Exception {
        try (Cursor cursor = resolver.query(document,
                new String[]{DocumentsContract.Document.COLUMN_DISPLAY_NAME}, null, null, null)) {
            if (cursor != null && cursor.moveToFirst()) {
                return cursor.getString(0);
            }
        }
        return DocumentsContract.getDocumentId(document);
    }

    private static void show(Context context, String text) {
        new Handler(Looper.getMainLooper()).post(() ->
            Toast.makeText(context.getApplicationContext(), text, Toast.LENGTH_LONG).show());
    }
}
