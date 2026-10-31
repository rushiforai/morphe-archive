package samsungcompat;

import android.content.Context;
import android.util.Log;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import samsungcompat.sync.HashAliases;
import samsungcompat.sync.NoteRecord;
import samsungcompat.sync.SyncPlanner;
import samsungcompat.sync.SyncRunner;

/**
 * This app's notes as the sync runner sees them; one per run. Trash and favourite changes go through
 * the old cloud engine's {@code …InSync} methods so they are not marked dirty again.
 */
final class NotesSyncStore implements SyncRunner.NoteStore {
    private static final String TAG = "OnePortSync";
    private static final String PKG = "com.samsung.android.support.senl.nt.";
    private static final String CONTRACTS = PKG + "app.sync.contractimpl.";
    private static final int DELETE_TO_TRASH = 2;
    private static final String UNCATEGORIZED = "uncategorized:///";
    /** A trashed note's category; not a folder, so it is never synced as one. */
    private static final String TRASH = "trash:///";

    private final Context context;
    private final File stateDir;
    private final HashAliases aliases;
    /**
     * Notes put in Uncategorized because their folder doesn't exist here, mapped to that folder. Reported
     * as that folder so the fallback isn't published as a move.
     */
    private final Map<String, String> missingFolders;
    private final Map<String, String[]> hashCache;
    private final Map<String, String> paths = new HashMap<>();
    private final Map<String, Boolean> trashed = new HashMap<>();
    private final Set<String> excluded = new HashSet<>();
    private List<SyncPlanner.LocalNote> scanned;

    NotesSyncStore(Context context, File stateDir) throws IOException {
        this.context = context.getApplicationContext();
        this.stateDir = stateDir;
        if (!stateDir.isDirectory() && !stateDir.mkdirs()) {
            throw new IOException("cannot create " + stateDir);
        }
        this.aliases = HashAliases.parse(readText("aliases.tsv"));
        this.missingFolders = parseMap(readText("folders.tsv"));
        this.hashCache = parseHashCache(readText("hashes.tsv"));
    }

    @Override
    public List<SyncPlanner.LocalNote> listNotes() throws IOException {
        if (scanned != null) return scanned;
        List<SyncPlanner.LocalNote> result = new ArrayList<>();
        try {
            Object manager = Class.forName(PKG + "app.common.data.RepositoryManager")
                .getMethod("getInstance").invoke(null);
            Object repository = manager.getClass().getMethod("getNoteRepository").invoke(manager);
            // Includes the trash (isDeleted = 2); excludes shared/co-edit and old locked notes.
            List<?> notes = (List<?>) repository.getClass().getMethod("getNotesForBackup")
                .invoke(repository);
            if (notes != null) {
                for (Object note : notes) add(note, result);
            }
        } catch (ReflectiveOperationException e) {
            throw new IOException("cannot list notes", e);
        }
        writeText("hashes.tsv", serializeHashCache());
        writeText("aliases.tsv", aliases.serialize());
        writeText("folders.tsv", serializeMap(missingFolders));
        scanned = result;
        return result;
    }

    private void add(Object note, List<SyncPlanner.LocalNote> out) throws ReflectiveOperationException, IOException {
        String uuid = (String) invoke(note, "getUuid");
        String path = (String) invoke(note, "getFilePath");
        if (uuid == null) return;
        int lock = number(invoke(note, "getIsLock")).intValue();
        int savingPid = number(invoke(note, "getIsSavingByWhichPid")).intValue();
        File file = path == null ? null : new File(path);
        // Locked notes stay out for privacy; old .sdoc notes and notes mid-save are skipped.
        // A note is normally a directory here (NoteFiles).
        if (lock >= 1 || savingPid != 0 || file == null || !path.endsWith(".sdocx")
            || !file.exists()) {
            excluded.add(uuid);
            return;
        }
        boolean deleted = number(invoke(note, "getIsDeleted")).intValue() == DELETE_TO_TRASH;
        paths.put(uuid, path);
        trashed.put(uuid, deleted);
        String category = (String) invoke(note, "getCategoryUuid");
        if (TRASH.equals(category)) {
            category = null;
        } else if (UNCATEGORIZED.equals(category) && missingFolders.containsKey(uuid)) {
            category = missingFolders.get(uuid);
        } else {
            missingFolders.remove(uuid);
        }
        out.add(new SyncPlanner.LocalNote(uuid, aliases.resolve(uuid, fileHash(file)),
            (String) invoke(note, "getTitle"), category,
            number(invoke(note, "getCreatedAt")).longValue(),
            number(invoke(note, "getLastModifiedAt")).longValue(),
            number(invoke(note, "getIsFavorite")).intValue() == 1, deleted,
            deleted ? number(invoke(note, "getRecycleBinTimeMoved")).longValue() : 0));
    }

    @Override
    public Set<String> excludedUuids() throws IOException {
        listNotes();
        return excluded;
    }

    @Override
    public void exportContent(String uuid, String expectedHash, OutputStream out)
        throws IOException {
        String path = paths.get(uuid);
        if (path == null) throw new IOException("unknown note " + uuid);
        File note = new File(path);
        File exported = new File(stateDir, "outgoing-" + uuid + ".sdocx");
        try {
            NoteFiles.exportSdocx(context, note, exported);
            // The payload is named by the note's content hash, not the zip's bytes; check that
            // the note still has that content now that the export is complete.
            if (!expectedHash.equals(aliases.resolve(uuid, NoteFiles.digest(note)))) {
                throw new IOException("note " + uuid + " changed during sync");
            }
            try (InputStream in = new FileInputStream(exported)) {
                byte[] buffer = new byte[32768];
                int count;
                while ((count = in.read(buffer)) != -1) out.write(buffer, 0, count);
            }
        } finally {
            if (exported.exists() && !exported.delete()) Log.w(TAG, "cannot delete " + exported);
        }
    }

    @Override
    public void applyContent(NoteRecord target, InputStream payload) throws IOException {
        String existing = paths.get(target.uuid);
        File saved = importNote(target, payload, existing);
        if (target.deleted) {
            contract("SDocResolverContractImpl", "deleteSDoc",
                new Class<?>[]{Context.class, String.class, int.class, boolean.class},
                context, target.uuid, DELETE_TO_TRASH, true);
        }
        aliases.remember(target.uuid, fileHash(saved), target.hash);
        writeText("aliases.tsv", aliases.serialize());
    }

    @Override
    public void applyMetadata(NoteRecord target) throws IOException {
        boolean wasDeleted = Boolean.TRUE.equals(trashed.get(target.uuid));
        if (wasDeleted && !target.deleted) {
            contract("SDocResolverContractImpl", "restoreSDoc",
                new Class<?>[]{Context.class, String.class, boolean.class},
                context, target.uuid, true);
        }
        contract("SDocResolverContractImpl", "setNoteFavorite",
            new Class<?>[]{Context.class, String.class, boolean.class, boolean.class},
            context, target.uuid, target.favorite, true);
        // A trashed record carries no folder; leave the note where it is before trashing it.
        // (Not the contract's setNoteCategory: it maps Uncategorized to the legacy folder "1".)
        if (!target.deleted) setFolder(target.uuid, place(target), target.modifiedAt);
        if (!wasDeleted && target.deleted) {
            contract("SDocResolverContractImpl", "deleteSDoc",
                new Class<?>[]{Context.class, String.class, int.class, boolean.class},
                context, target.uuid, DELETE_TO_TRASH, true);
        }
    }

    @Override
    public void createCopy(NoteRecord copy, InputStream payload) throws IOException {
        File saved = importNote(copy, payload, null);
        aliases.remember(copy.uuid, fileHash(saved), copy.hash);
        writeText("aliases.tsv", aliases.serialize());
    }

    @Override
    public String readBase() throws IOException {
        return readText("base.json");
    }

    @Override
    public void writeBase(String json) throws IOException {
        writeText("base.json", json);
    }

    /** Imports {@code payload} as note {@code target.uuid}, in place when it exists; returns the note's file. */
    private File importNote(NoteRecord target, InputStream payload, String existingPath)
        throws IOException {
        File incoming = new File(stateDir, "incoming-" + target.uuid + ".sdocx");
        try (OutputStream out = new FileOutputStream(incoming)) {
            byte[] buffer = new byte[32768];
            int count;
            while ((count = payload.read(buffer)) != -1) out.write(buffer, 0, count);
        }
        String fileName = existingPath != null ? new File(existingPath).getName()
            : target.uuid + ".sdocx";
        String folder = target.deleted ? UNCATEGORIZED : place(target);
        try {
            NoteFiles.importSdocx(context, incoming, target.uuid, target.title, fileName,
                existingPath == null, folder, target.favorite, target.createdAt,
                target.modifiedAt, TAG);
        } finally {
            if (incoming.exists() && !incoming.delete()) Log.w(TAG, "cannot delete " + incoming);
        }
        File saved = existingPath != null ? new File(existingPath) : new File(notesDir(), fileName);
        if (!saved.exists()) throw new IOException("imported note missing: " + saved);
        return saved;
    }

    /**
     * Note {@code uuid} was restored from a backup copy with {@code originalHash}. Report that hash while the
     * note is unchanged, so a device with the same version doesn't see a conflict.
     */
    void rememberRestored(String uuid, String originalHash) throws IOException {
        aliases.remember(uuid, fileHash(new File(notesDir(), uuid + ".sdocx")), originalHash);
        writeText("aliases.tsv", aliases.serialize());
    }

    private File notesDir() throws IOException {
        try {
            return new File((String) Class.forName(PKG + "base.common.util.WDocUtils")
                .getMethod("getNoteFilePath", Context.class).invoke(null, context));
        } catch (ReflectiveOperationException e) {
            throw new IOException("cannot find notes directory", e);
        }
    }

    /**
     * A folder that does not exist here (yet) would be an invalid parent; use Uncategorized.
     * (Not the contract's isExistCategory: it only accepts the legacy "Old notebooks" folders.)
     */
    private String folderOrDefault(String folder) throws IOException {
        if (folder == null || folder.isEmpty() || TRASH.equals(folder)) return UNCATEGORIZED;
        try {
            Object manager = Class.forName(PKG + "model.folder.FolderManager")
                .getMethod("getInstance").invoke(null);
            Object entity = manager.getClass().getMethod("getCategoryEntity", String.class)
                .invoke(manager, folder);
            if (entity == null) return UNCATEGORIZED;
            return number(invoke(entity, "getIsDeleted")).intValue() == 0 ? folder : UNCATEGORIZED;
        } catch (ReflectiveOperationException e) {
            throw new IOException("cannot look up folder " + folder, e);
        }
    }

    /** The local folder for {@code target}, remembering a fallback in {@link #missingFolders}. */
    private String place(NoteRecord target) throws IOException {
        String folder = folderOrDefault(target.categoryUuid);
        String wanted = target.categoryUuid;
        if (!folder.equals(wanted) && wanted != null && !wanted.isEmpty()) {
            missingFolders.put(target.uuid, wanted);
        } else {
            missingFolders.remove(target.uuid);
        }
        writeText("folders.tsv", serializeMap(missingFolders));
        return folder;
    }

    /** Move a live note to {@code folder} without marking it dirty for the (absent) cloud. */
    private void setFolder(String uuid, String folder, long time) throws IOException {
        try {
            Object factory = Class.forName(PKG + "data.repository.NotesDataRepositoryFactory")
                .getMethod("newInstance", Context.class).invoke(null, context);
            Object repository = factory.getClass().getMethod("createSyncNoteDataRepository")
                .invoke(factory);
            // The two-argument overload only updates old .sdoc notes.
            repository.getClass().getMethod("updateNoteCategory", String.class, String.class,
                int.class, long.class).invoke(repository, uuid, folder, 0, time);
        } catch (ReflectiveOperationException e) {
            throw new IOException("cannot move " + uuid + " to " + folder, e);
        }
    }

    private Object contract(String className, String method, Class<?>[] types, Object... args)
        throws IOException {
        try {
            Class<?> type = Class.forName(CONTRACTS + className);
            Object instance = type.getConstructor().newInstance();
            return type.getMethod(method, types).invoke(instance, args);
        } catch (ReflectiveOperationException e) {
            throw new IOException(className + "." + method + " failed", e);
        }
    }

    // ---- hashing ----------------------------------------------------------------------------

    /** {@link NoteFiles#digest}, cached by path + {@link NoteFiles#stamp} across runs. */
    private String fileHash(File file) throws IOException {
        String stamp = NoteFiles.stamp(file);
        String[] cached = hashCache.get(file.getPath());
        if (cached != null && cached[0].equals(stamp)) return cached[1];
        String hash = NoteFiles.digest(file);
        hashCache.put(file.getPath(), new String[]{stamp, hash});
        return hash;
    }

    private static Map<String, String> parseMap(String text) {
        Map<String, String> map = new HashMap<>();
        if (text == null) return map;
        for (String line : text.split("\n")) {
            String[] parts = line.split("\t");
            if (parts.length == 2) map.put(parts[0], parts[1]);
        }
        return map;
    }

    private static String serializeMap(Map<String, String> map) {
        StringBuilder out = new StringBuilder();
        for (Map.Entry<String, String> e : map.entrySet()) {
            out.append(e.getKey()).append('\t').append(e.getValue()).append('\n');
        }
        return out.toString();
    }

    private static Map<String, String[]> parseHashCache(String text) {
        Map<String, String[]> map = new HashMap<>();
        if (text == null) return map;
        for (String line : text.split("\n")) {
            String[] parts = line.split("\t");
            if (parts.length == 3) map.put(parts[0], new String[]{parts[1], parts[2]});
        }
        return map;
    }

    private String serializeHashCache() {
        StringBuilder out = new StringBuilder();
        for (Map.Entry<String, String[]> e : hashCache.entrySet()) {
            if (!new File(e.getKey()).exists()) continue;
            out.append(e.getKey()).append('\t').append(e.getValue()[0]).append('\t')
                .append(e.getValue()[1]).append('\n');
        }
        return out.toString();
    }

    // ---- small helpers ----------------------------------------------------------------------

    private String readText(String name) throws IOException {
        File file = new File(stateDir, name);
        if (!file.isFile()) return null;
        return new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8);
    }

    private void writeText(String name, String text) throws IOException {
        File tmp = new File(stateDir, name + ".tmp");
        Files.write(tmp.toPath(), text.getBytes(StandardCharsets.UTF_8));
        if (!tmp.renameTo(new File(stateDir, name))) throw new IOException("cannot save " + name);
    }

    private static Object invoke(Object target, String method) throws ReflectiveOperationException {
        Method m = target.getClass().getMethod(method);
        return m.invoke(target);
    }

    private static void call(Object target, String method, Class<?> type, Object arg)
        throws ReflectiveOperationException {
        target.getClass().getMethod(method, type).invoke(target, arg);
    }

    private static Number number(Object value) {
        return value instanceof Number ? (Number) value : 0;
    }
}
