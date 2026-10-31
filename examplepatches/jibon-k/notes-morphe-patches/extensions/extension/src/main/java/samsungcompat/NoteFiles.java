package samsungcompat;

import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.DocumentsContract;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * A note on disk. The app keeps an {@code .sdocx} note as a directory; an exported one is a single zip.
 */
final class NoteFiles {
    private static final String IMPORT = "com.samsung.android.support.senl.nt.model.importer.task.";

    private NoteFiles() {}

    /**
     * Cheap change marker: newest mtime, total size and file count of everything under the note.
     * A directory's own mtime is not enough: rewriting a page in place does not change it.
     */
    static String stamp(File note) {
        long newest = 0;
        long size = 0;
        List<File> files = files(note);
        for (File file : files) {
            newest = Math.max(newest, file.lastModified());
            size += file.length();
        }
        return newest + ":" + size + ":" + files.size();
    }

    /** SHA-256 over every file's relative path and bytes, in path order. */
    static String digest(File note) throws IOException {
        MessageDigest md;
        try {
            md = MessageDigest.getInstance("SHA-256");
        } catch (Exception e) {
            throw new IOException(e);
        }
        byte[] buffer = new byte[32768];
        for (File file : files(note)) {
            String relative = note.isDirectory()
                ? note.toURI().relativize(file.toURI()).getPath() : file.getName();
            md.update(relative.getBytes(StandardCharsets.UTF_8));
            md.update((byte) 0);
            try (InputStream in = new FileInputStream(file)) {
                int count;
                while ((count = in.read(buffer)) != -1) md.update(buffer, 0, count);
            }
        }
        return hex(md.digest());
    }

    /** Exports {@code note} as one {@code .sdocx} file with the app's Share export, which holds the note's file lock. */
    static void exportSdocx(Context context, File note, File target) throws IOException {
        if (target.exists() && !target.delete()) throw new IOException("cannot replace " + target);
        try {
            Object ok = Class.forName("com.samsung.android.support.senl.nt.model.utils.DocumentCopyUtils")
                .getMethod("copy", Context.class, String.class, String.class, boolean.class)
                .invoke(null, context, note.getPath(), target.getPath(), false);
            if (!Boolean.TRUE.equals(ok)) throw new IOException("export refused for " + note);
        } catch (ReflectiveOperationException e) {
            throw new IOException("export failed for " + note, e.getCause() != null ? e.getCause() : e);
        }
        if (!target.isFile() || target.length() == 0) throw new IOException("export produced nothing for " + note);
    }

    /**
     * Imports {@code sdocx} as note {@code uuid} with the app's ImportSdocXTask, keeping the UUID. Not on the main thread.
     * With {@code saveNew} false, {@code fileName} must be the existing note's, which updates it in place.
     */
    static void importSdocx(Context context, File sdocx, String uuid, String title, String fileName,
                            boolean saveNew, String folder, boolean favorite, long createdAt,
                            long modifiedAt, String caller) throws IOException {
        try {
            Class<?> paramClass = Class.forName(IMPORT + "param.ImportSdocXParam");
            Object param = paramClass.getConstructor().newInstance();
            call(param, "setContext", Context.class, context);
            call(param, "setUuid", String.class, uuid);
            call(param, "setExternalPath", String.class, sdocx.getPath());
            call(param, "setFolderUuid", String.class, folder);
            call(param, "setCaller", String.class, caller);

            Class<?> taskClass = Class.forName(IMPORT + "ImportSdocXTask");
            Object task = taskClass.getConstructor(paramClass, int.class, String.class)
                .newInstance(param, 0, title);
            call(task, "setDeleteExternalFile", boolean.class, false);
            call(task, "setImported", boolean.class, false);
            Class<?> listenerType = Class.forName(IMPORT + "ImportTaskListener");
            Object listener = Class.forName(IMPORT + "ImportTask$ListerImpl")
                .getConstructor().newInstance();
            call(task, "setImportTaskListener", listenerType, listener);

            Class<?> infoClass = Class.forName(IMPORT + "ImportDocInfo");
            Object info = infoClass.getConstructor().newInstance();
            call(info, "setServerKey", String.class, uuid);
            call(info, "setTitle", String.class, fileName);
            call(info, "setChangeUuidFlag", boolean.class, false);
            call(info, "setSaveNew", boolean.class, saveNew);
            call(info, "setCategoryUuid", String.class, folder);
            call(info, "setFavorite", boolean.class, favorite);
            call(info, "setCreatedTime", long.class, createdAt);
            call(info, "setSaveTime", long.class, modifiedAt);
            call(info, "setDeleteType", int.class, 0);
            call(info, "setOwnerId", String.class, "");
            call(info, "setRestorePath", String.class, "");
            call(info, "setMsSyncAccountId", String.class, "");
            call(info, "setMsSyncDocumentid", String.class, "");
            call(task, "setDocumentInfo", infoClass, info);

            Object ok = taskClass.getMethod("call").invoke(task);
            if (!Boolean.TRUE.equals(ok)) throw new IOException("import failed for " + uuid);
        } catch (ReflectiveOperationException e) {
            throw new IOException("import failed for " + uuid, e);
        }
    }

    /** False when the folder picked earlier was deleted or moved. */
    static boolean treeExists(Context context, Uri tree) {
        Uri root = DocumentsContract.buildDocumentUriUsingTree(tree, DocumentsContract.getTreeDocumentId(tree));
        try (Cursor cursor = context.getContentResolver().query(root,
                new String[]{DocumentsContract.Document.COLUMN_DOCUMENT_ID}, null, null, null)) {
            return cursor != null && cursor.moveToFirst();
        } catch (SecurityException e) {
            throw e;
        } catch (Exception e) {
            return false;
        }
    }

    private static void call(Object target, String method, Class<?> type, Object arg)
        throws ReflectiveOperationException {
        target.getClass().getMethod(method, type).invoke(target, arg);
    }

    private static List<File> files(File note) {
        List<File> out = new ArrayList<>();
        collect(note, out);
        Collections.sort(out, (a, b) -> a.getPath().compareTo(b.getPath()));
        return out;
    }

    private static void collect(File file, List<File> out) {
        if (file.isFile()) {
            out.add(file);
        } else if (file.isDirectory()) {
            File[] children = file.listFiles();
            if (children != null) for (File child : children) collect(child, out);
        }
    }

    static String hex(byte[] hash) {
        StringBuilder out = new StringBuilder(hash.length * 2);
        for (byte b : hash) out.append(String.format("%02x", b & 0xff));
        return out.toString();
    }
}
