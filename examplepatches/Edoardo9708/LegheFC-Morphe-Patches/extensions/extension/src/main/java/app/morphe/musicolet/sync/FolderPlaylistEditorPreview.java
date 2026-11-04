package app.morphe.musicolet.sync;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.net.Uri;
import android.os.Environment;
import android.provider.DocumentsContract;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.json.JSONObject;

public final class FolderPlaylistEditorPreview {
    private static final String TAG = "Morphe.FolderPlaylistPreview";
    private static final int EDITOR_ROOT = 0x7f090471;

    private FolderPlaylistEditorPreview() { }

    public static void install(Activity activity) {
        View root = activity.findViewById(EDITOR_ROOT);
        if (root == null || !(root.getParent() instanceof FrameLayout)) return;
        FrameLayout parent = (FrameLayout) root.getParent();
        if (parent.findViewWithTag(TAG) != null || parent.getChildCount() != 1) return;

        // Keep Musicolet's ConstraintLayout and its internal constraints intact.
        LinearLayout wrapper = new LinearLayout(activity);
        wrapper.setOrientation(LinearLayout.VERTICAL);
        wrapper.addView(createPanel(activity, activity, false));
        ViewGroup.LayoutParams originalParams = root.getLayoutParams();
        parent.removeView(root);
        wrapper.addView(root, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        parent.addView(wrapper, originalParams);
    }

    public static void installNewPlaylist(EditText name) {
        if (name == null || !(name.getParent() instanceof RelativeLayout)) return;
        RelativeLayout input = (RelativeLayout) name.getParent();
        if (!(input.getParent() instanceof LinearLayout)) return;
        LinearLayout content = (LinearLayout) input.getParent();
        if (content.getOrientation() != LinearLayout.VERTICAL || content.findViewWithTag(TAG) != null) return;

        Context context = name.getContext();
        Context host = context;
        while (host instanceof ContextWrapper && !(host instanceof Activity)) {
            host = ((ContextWrapper) host).getBaseContext();
        }
        if (!(host instanceof Activity)) return;
        content.addView(createPanel(context, (Activity) host, true), content.indexOfChild(input) + 1);
    }

    private static LinearLayout createPanel(Context context, Activity activity, boolean creating) {
        FolderPanel panel = new FolderPanel(context);
        panel.setOrientation(LinearLayout.VERTICAL);
        panel.setTag(TAG);
        panel.setPadding(dp(activity, 16), dp(activity, 4), dp(activity, 16), dp(activity, 4));
        panel.setId(View.generateViewId());

        Switch sync = panel.sync;
        sync.setText("Sincronizza con una cartella");
        sync.setChecked(false);
        panel.addView(sync, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        // Controls are hidden unless the user enables synchronization.
        LinearLayout folderControls = new LinearLayout(context);
        folderControls.setOrientation(LinearLayout.VERTICAL);
        folderControls.setVisibility(View.GONE);
        panel.addView(folderControls, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        Button chooseFolder = new Button(context);
        chooseFolder.setText("Scegli cartella");
        folderControls.addView(chooseFolder, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView selectedFolder = new TextView(context);
        selectedFolder.setText("Nessuna cartella selezionata");
        selectedFolder.setTextSize(13f);
        selectedFolder.setPadding(0, dp(activity, 3), 0, dp(activity, 3));
        folderControls.addView(selectedFolder, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        CheckBox recursive = panel.recursive;
        recursive.setText("Includi sottocartelle");
        recursive.setChecked(false);
        folderControls.addView(recursive, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView hint = new TextView(context);
        hint.setText(creating
            ? "Salva la playlist per importare i brani già indicizzati in questa cartella."
            : "Anteprima: la cartella scelta non viene ancora salvata e i brani non vengono modificati.");
        hint.setTextSize(12f);
        folderControls.addView(hint, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        // The selected folder is stored when the new playlist is saved.
        sync.setOnCheckedChangeListener((button, checked) -> {
            folderControls.setVisibility(checked ? View.VISIBLE : View.GONE);

        });

        chooseFolder.setOnClickListener(view -> {
            try {
                FolderTreePickerFragment picker = FolderTreePickerFragment.findOrAttach(activity);
                picker.setCallback(uri -> {
                    if (!panel.isAttachedToWindow()) return;
                    panel.tree = uri;
                    selectedFolder.setText("Cartella: " + describeTree(uri));
                    chooseFolder.setText("✓  Cartella selezionata · Cambia");
                    chooseFolder.setBackgroundTintList(ColorStateList.valueOf(Color.rgb(38, 117, 72)));
                    chooseFolder.setTextColor(Color.WHITE);
                    Log.i(TAG, "Folder selected (preview only)");
                });
                picker.launchPicker();
            } catch (Exception e) {
                Log.e(TAG, "Could not open system folder picker", e);
                Toast.makeText(activity, "Impossibile aprire il selettore cartelle", Toast.LENGTH_LONG).show();
            }
        });

        return panel;
    }

    private static final class FolderPanel extends LinearLayout {
        final Switch sync;
        final CheckBox recursive;
        Uri tree;

        FolderPanel(Context context) {
            super(context);
            sync = new Switch(context);
            recursive = new CheckBox(context);
        }
    }

    // Called for the new model before Musicolet schedules its normal save.
    public static boolean populateNewPlaylist(Dialog dialog, Object playlist) {
        if (dialog.getWindow() == null) return true;
        View view = dialog.getWindow().getDecorView().findViewWithTag(TAG);
        if (!(view instanceof FolderPanel)) return true;
        FolderPanel panel = (FolderPanel) view;
        if (!panel.sync.isChecked()) return true;

        Context context = dialog.getContext();
        try {
            File folder = primaryStorageFolder(panel.tree);
            if (folder == null) {
                Toast.makeText(context, "Scegli una cartella nella memoria interna.", Toast.LENGTH_LONG).show();
                return false;
            }

            Context app = context.getApplicationContext();
            ClassLoader loader = app.getClassLoader();
            // PairIP owns the Android Application instance. Use the same static
            // Musicolet library reference as the original playlist save method.
            Class<?> musicoletApp = loader.loadClass("in.krosbits.musicolet.MyApplication");
            Field libraryOwner = musicoletApp.getDeclaredField("j");
            libraryOwner.setAccessible(true);
            Object owner = libraryOwner.get(null);
            Object library = owner == null ? null : readField(owner, "c");
            if (library == null) {
                Toast.makeText(context, "Libreria Musicolet non ancora disponibile.", Toast.LENGTH_LONG).show();
                return false;
            }
            List<?> songs = new ArrayList<>((List<?>) readField(library, "b"));
            Class<?> songType = loader.loadClass("dm0");
            Field songFolder = songType.getDeclaredField("h");
            songFolder.setAccessible(true);
            Field songSource = songType.getDeclaredField("c");
            songSource.setAccessible(true);
            Method songUri = songSource.getType().getDeclaredMethod("a");
            songUri.setAccessible(true);
            Method add = playlist.getClass().getDeclaredMethod("a", songType);
            add.setAccessible(true);

            String directory = folder.getPath();
            String prefix = directory + File.separator;
            boolean includeSubfolders = panel.recursive.isChecked();
            int resolvedFolders = 0;
            List<Object> matches = new ArrayList<>();
            for (Object song : songs) {
                File parent = indexedStorageFolder((String) songFolder.get(song));
                if (parent == null) {
                    Object source = songSource.get(song);
                    if (source != null) parent = indexedFolder((Uri) songUri.invoke(source));
                }
                if (parent == null) continue;
                resolvedFolders++;
                String parentPath = parent.getPath();
                if (parentPath.equals(directory) || (includeSubfolders && parentPath.startsWith(prefix))) {
                    matches.add(song);
                }
            }
            Log.i(TAG, "Indexed tracks: " + songs.size() + ", resolved folders: " + resolvedFolders
                + ", matched: " + matches.size());

            if (matches.isEmpty()) {
                Toast.makeText(context, "Nessun brano indicizzato nella cartella scelta.", Toast.LENGTH_LONG).show();
                return false;
            }

            for (Object song : matches) add.invoke(playlist, song);
            String name = (String) readField(playlist, "b");
            JSONObject binding = new JSONObject();
            binding.put("id", UUID.randomUUID().toString());
            binding.put("treeUri", panel.tree.toString());
            binding.put("includeSubfolders", includeSubfolders);
            context.getContentResolver().takePersistableUriPermission(
                panel.tree, Intent.FLAG_GRANT_READ_URI_PERMISSION);
            boolean saved = app.getSharedPreferences("morphe_folder_playlists", Context.MODE_PRIVATE)
                .edit().putString(name, binding.toString()).commit();
            if (!saved) {
                Toast.makeText(context, "Impossibile salvare il collegamento alla cartella.", Toast.LENGTH_LONG).show();
                return false;
            }
            Log.i(TAG, "Matched indexed tracks: " + matches.size());
            return true;
        } catch (ReflectiveOperationException | org.json.JSONException | RuntimeException e) {
            Log.e(TAG, "Could not populate new playlist", e);
            Toast.makeText(context, "Impossibile importare i brani dalla libreria.", Toast.LENGTH_LONG).show();
            return false;
        }
    }

    public static void refreshBindings() {
        try {
            ClassLoader loader = FolderPlaylistEditorPreview.class.getClassLoader();
            Class<?> application = loader.loadClass("in.krosbits.musicolet.MyApplication");
            Field instance = application.getDeclaredField("i");
            instance.setAccessible(true);
            Context context = (Context) instance.get(null);
            if (context == null) return;
            Context app = context.getApplicationContext();
            Field ownerField = loader.loadClass("in.krosbits.musicolet.MyApplication").getDeclaredField("j");
            ownerField.setAccessible(true);
            Object owner = ownerField.get(null);
            if (owner == null) return;
            Object library = readField(owner, "c");
            if (library == null) return;

            List<?> songs = new ArrayList<>((List<?>) readField(library, "b"));
            Class<?> songType = loader.loadClass("dm0");
            Field folder = songType.getDeclaredField("h");
            folder.setAccessible(true);
            Class<?> model = loader.loadClass("r71");
            Class<?> storage = loader.loadClass("s71");
            Method load = storage.getDeclaredMethod("f", Context.class, String.class);
            Method save = storage.getDeclaredMethod("k", Context.class, model);
            Method add = model.getDeclaredMethod("a", songType);
            load.setAccessible(true);
            save.setAccessible(true);
            add.setAccessible(true);

            for (String name : app.getSharedPreferences("morphe_folder_playlists", Context.MODE_PRIVATE)
                    .getAll().keySet()) {
                String entry = app.getSharedPreferences("morphe_folder_playlists", Context.MODE_PRIVATE)
                    .getString(name, null);
                if (entry == null) continue;
                JSONObject binding = new JSONObject(entry);
                Uri tree = Uri.parse(binding.getString("treeUri"));
                boolean readable = app.getContentResolver().getPersistedUriPermissions().stream()
                    .anyMatch(permission -> permission.isReadPermission() && tree.equals(permission.getUri()));
                if (!readable) continue;
                File directory = primaryStorageFolder(tree);
                if (directory == null) continue;
                Object playlist = load.invoke(null, app, name);
                if (playlist == null) continue;
                boolean changed = false;
                boolean recursive = binding.getBoolean("includeSubfolders");
                for (Object song : songs) {
                    File parent = indexedStorageFolder((String) folder.get(song));
                    if (parent != null && (parent.equals(directory) ||
                            (recursive && parent.toPath().startsWith(directory.toPath())))) {
                        changed |= Boolean.TRUE.equals(add.invoke(playlist, song));
                    }
                }
                if (changed) save.invoke(null, app, playlist);
            }
        } catch (ReflectiveOperationException | org.json.JSONException | RuntimeException e) {
            Log.e(TAG, "Could not refresh folder playlists", e);
        }
    }

    public static boolean blockRemoval(String name) {
        try {
            Class<?> appClass = Class.forName("in.krosbits.musicolet.MyApplication");
            Context context = (Context) appClass.getDeclaredField("i").get(null);
            if (context != null && context.getSharedPreferences("morphe_folder_playlists", Context.MODE_PRIVATE).contains(name)) {
                Toast.makeText(context, "Questa playlist segue la cartella: rimuovi il file dalla cartella.", Toast.LENGTH_LONG).show();
                return true;
            }
        } catch (ReflectiveOperationException | RuntimeException e) {
            Log.e(TAG, "Could not check folder binding", e);
        }
        return false;
    }

    private static boolean isLinkedPlaylist(Object playlist) throws ReflectiveOperationException {
        String name = (String) readField(playlist, "b");
        Class<?> appClass = Class.forName("in.krosbits.musicolet.MyApplication");
        Field instance = appClass.getDeclaredField("i");
        instance.setAccessible(true);
        Context context = (Context) instance.get(null);
        return context != null && context.getSharedPreferences(
            "morphe_folder_playlists", Context.MODE_PRIVATE).contains(name);
    }

    public static void removeTrackFromUi(Object playlist, Object song) {
        try {
            if (isLinkedPlaylist(playlist)) return;
            Method original = playlist.getClass().getDeclaredMethod("f", song.getClass());
            original.setAccessible(true);
            original.invoke(playlist, song);
        } catch (ReflectiveOperationException | RuntimeException e) {
            Log.e(TAG, "Could not remove track", e);
        }
    }

    public static boolean removeTracksFromUi(Object playlist, java.util.HashSet<?> songs) {
        try {
            if (isLinkedPlaylist(playlist)) return false;
            Method original = playlist.getClass().getDeclaredMethod("g", java.util.HashSet.class);
            original.setAccessible(true);
            return Boolean.TRUE.equals(original.invoke(playlist, songs));
        } catch (ReflectiveOperationException | RuntimeException e) {
            Log.e(TAG, "Could not remove tracks", e);
            return false;
        }
    }

    public static void removeBinding(Context context, Object playlist) {
        try {
            String name = (String) readField(playlist, "b");
            File playlistFile = new File(context.getFilesDir(), name + ".mpl");
            if (!playlistFile.exists()) {
                context.getSharedPreferences("morphe_folder_playlists", Context.MODE_PRIVATE)
                    .edit().remove(name).commit();
            }
        } catch (ReflectiveOperationException | RuntimeException e) {
            Log.e(TAG, "Could not remove folder binding", e);
        }
    }

    public static void renameBinding(Context context, String oldName, String newName) {
        if (oldName.equals(newName)) return;
        android.content.SharedPreferences registry =
            context.getSharedPreferences("morphe_folder_playlists", Context.MODE_PRIVATE);
        String binding = registry.getString(oldName, null);
        if (binding != null && !registry.edit().remove(oldName).putString(newName, binding).commit()) {
            Log.e(TAG, "Could not update folder binding after rename");
        }
    }

    private static Object readField(Object object, String name) throws ReflectiveOperationException {
        Field field = object.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(object);
    }

    private static File indexedStorageFolder(String path) {
        // MediaStore tracks use Musicolet's virtual Storage/primary namespace.
        String prefix = "Storage/primary/";
        return path != null && path.startsWith(prefix)
            ? resolvePrimaryRelativePath(path.substring(prefix.length())) : null;
    }

    private static File indexedFolder(Uri uri) {
        if (uri == null) return null;
        String path = uri.getPath();
        if ("file".equals(uri.getScheme()) && path != null && path.startsWith("/")) {
            return new File(path).toPath().normalize().toFile().getParentFile();
        }
        if ("musicolet".equals(uri.getScheme()) && "media-store".equals(uri.getAuthority())) {
            String volume = uri.getQueryParameter("p_v");
            if (!"primary".equals(volume) && !"external_primary".equals(volume)) return null;
            return resolvePrimaryRelativePath(uri.getQueryParameter("p_rp"));
        }
        if (DocumentsContract.isTreeUri(uri)
                && "com.android.externalstorage.documents".equals(uri.getAuthority())
                && uri.getPathSegments().size() == 4) {
            File document = resolvePrimaryDocument(DocumentsContract.getDocumentId(uri));
            return document == null ? null : document.getParentFile();
        }
        return null;
    }

    private static File primaryStorageFolder(Uri tree) {
        if (tree == null || !"com.android.externalstorage.documents".equals(tree.getAuthority())) return null;
        return resolvePrimaryDocument(DocumentsContract.getTreeDocumentId(tree));
    }

    private static File resolvePrimaryDocument(String id) {
        return id.startsWith("primary:") ? resolvePrimaryRelativePath(id.substring("primary:".length())) : null;
    }

    private static File resolvePrimaryRelativePath(String relative) {
        if (relative == null || relative.isEmpty() || relative.startsWith("/")) return null;
        File root = Environment.getExternalStorageDirectory();
        String path = new File(root, relative).toPath().normalize().toString();
        return path.startsWith(root.getPath() + File.separator) ? new File(path) : null;
    }
    /** SAF provider returns a document ID, not a guaranteed filesystem path. */
    private static String describeTree(Uri uri) {
        if (uri == null) return "Nessuna";
        try {
            String id = DocumentsContract.getTreeDocumentId(uri);
            if (!TextUtils.isEmpty(id)) return id;
        } catch (RuntimeException ignored) {
            // Nonstandard document provider: fall back to its opaque URI.
        }
        return uri.toString();
    }

    private static int dp(Activity activity, int amount) {
        return Math.round(activity.getResources().getDisplayMetrics().density * amount);
    }
}
