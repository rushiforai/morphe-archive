package dev.jason.gboardpatches.extension.customstickers;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Build;
import android.util.AtomicFile;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;
import java.util.regex.Pattern;

/**
 * Sticker packs live as image files under the app's files directory, with one small JSON index.
 * Images stay out of SharedPreferences so the keyboard process never loads them as text.
 */
public final class GboardCustomStickersStore {
    public static final int MAX_IMPORT_BYTES = 8 * 1024 * 1024;
    static final String DIRECTORY = "gboard_patches_custom_stickers";
    static final String INDEX_FILE = "packs.json";
    static final int MAX_STICKER_EDGE_PX = 512;
    static final int MAX_STICKER_BYTES = 1024 * 1024;
    static final int MAX_NAME_LENGTH = 60;
    /** Outline width for a 512 px sticker. */
    static final int MAX_OUTLINE_WIDTH = 32;
    public static final int MAX_ARCHIVE_BYTES = 64 * 1024 * 1024;
    private static final int MAX_ARCHIVE_ENTRY_BYTES = 2 * 1024 * 1024;
    private static final int MAX_ARCHIVE_ENTRIES = 2000;
    private static final String ARCHIVE_INDEX = "pack.json";
    private static final long MAX_SOURCE_PIXELS = 40_000_000L;
    // Ids and file names come back from disk; only these shapes may become paths.
    private static final Pattern PACK_ID = Pattern.compile("[0-9a-f]{32}");
    private static final Pattern STICKER_FILE = Pattern.compile("[0-9a-f]{32}\\.(png|webp)");

    private GboardCustomStickersStore() { }

    public static final class Pack {
        public final String id;
        public final String name;
        public final List<String> stickers;
        /** The pack's cover sticker; the first sticker when none was chosen. Null if empty. */
        public final String cover;
        /** Edited stickers by shown file name: their original image and settings. */
        public final Map<String, Edited> edited;
        /** Edits applied automatically to newly added stickers. */
        public final Edits defaults;

        Pack(String id, String name, List<String> stickers, String cover,
                Map<String, Edited> edited, Edits defaults) {
            this.id = id;
            this.name = name;
            this.defaults = defaults == null ? Edits.NONE : defaults;
            this.stickers = Collections.unmodifiableList(new ArrayList<>(stickers));
            this.cover = cover != null && stickers.contains(cover) ? cover
                    : stickers.isEmpty() ? null : stickers.get(0);
            Map<String, Edited> kept = new LinkedHashMap<>();
            for (Map.Entry<String, Edited> entry : edited.entrySet()) {
                String source = entry.getValue().source;
                if (stickers.contains(entry.getKey()) && STICKER_FILE.matcher(source).matches()
                        && !source.equals(entry.getKey())) {
                    kept.put(entry.getKey(), entry.getValue());
                }
            }
            this.edited = Collections.unmodifiableMap(kept);
        }

        public Edits editsOf(String fileName) {
            Edited record = edited.get(fileName);
            return record == null ? Edits.NONE : record.edits;
        }

        /** The unedited image behind a shown sticker. */
        public String sourceOf(String fileName) {
            Edited record = edited.get(fileName);
            return record == null ? fileName : record.source;
        }

        Pack withStickers(List<String> stickers, String cover, Map<String, Edited> edited) {
            return new Pack(id, name, stickers, cover, edited, defaults);
        }

        Pack withName(String newName) {
            return new Pack(id, newName, stickers, cover, edited, defaults);
        }

        Pack withDefaults(Edits newDefaults) {
            return new Pack(id, name, stickers, cover, edited, newDefaults);
        }
    }

    public static final class Edited {
        public final String source;
        public final Edits edits;

        Edited(String source, Edits edits) {
            this.source = source;
            this.edits = edits;
        }
    }

    // Parsed index and the file stamp it came from; Packs are immutable, so sharing is safe.
    private static List<Pack> cachedPacks;
    private static String cachedStamp;

    public static synchronized List<Pack> load(Context context) {
        File index = indexFile(context);
        if (!index.isFile()) return Collections.emptyList();
        // shortcut: the stamp misses a same-size rewrite within the file system's mtime
        // granularity from another process; in-process writes refresh the cache directly.
        String stamp = index.lastModified() + ":" + index.length();
        if (stamp.equals(cachedStamp)) return cachedPacks;
        try {
            byte[] bytes = new AtomicFile(index).readFully();
            List<Pack> packs = Collections.unmodifiableList(
                    fromJson(new String(bytes, StandardCharsets.UTF_8)));
            cachedPacks = packs;
            cachedStamp = stamp;
            return packs;
        } catch (IOException | JSONException ignored) {
            return Collections.emptyList();
        }
    }

    public static synchronized Pack findPack(Context context, String packId) {
        for (Pack pack : load(context)) {
            if (pack.id.equals(packId)) return pack;
        }
        return null;
    }

    public static synchronized Pack createPack(Context context, String name) throws IOException {
        String cleaned = cleanName(name);
        if (cleaned.isEmpty()) throw new IOException("Pack name is empty");
        List<Pack> packs = new ArrayList<>(load(context));
        Pack pack = new Pack(newId(), cleaned, Collections.emptyList(), null,
                Collections.emptyMap(), Edits.NONE);
        packs.add(pack);
        save(context, packs);
        return pack;
    }

    public static synchronized void renamePack(Context context, String packId, String name)
            throws IOException {
        String cleaned = cleanName(name);
        if (cleaned.isEmpty()) throw new IOException("Pack name is empty");
        List<Pack> packs = new ArrayList<>(load(context));
        int index = indexOf(packs, packId);
        Pack old = packs.get(index);
        packs.set(index, old.withName(cleaned));
        save(context, packs);
    }

    public static synchronized void setDefaults(Context context, String packId, Edits defaults)
            throws IOException {
        List<Pack> packs = new ArrayList<>(load(context));
        int index = indexOf(packs, packId);
        packs.set(index, packs.get(index).withDefaults(defaults));
        save(context, packs);
    }

    /** Moves stickers, keeping their relative order, so the first lands at {@code target}. */
    public static synchronized void moveStickers(Context context, String packId,
            List<String> fileNames, int target) throws IOException {
        List<Pack> packs = new ArrayList<>(load(context));
        int index = indexOf(packs, packId);
        Pack old = packs.get(index);
        List<String> moving = new ArrayList<>();
        for (String sticker : old.stickers) {
            if (fileNames.contains(sticker)) moving.add(sticker);
        }
        List<String> stickers = new ArrayList<>(old.stickers);
        stickers.removeAll(moving);
        stickers.addAll(clamp(target, 0, stickers.size()), moving);
        packs.set(index, old.withStickers(stickers, old.cover, old.edited));
        save(context, packs);
    }

    public static synchronized void movePack(Context context, String packId, int target)
            throws IOException {
        List<Pack> packs = new ArrayList<>(load(context));
        Pack pack = packs.remove(indexOf(packs, packId));
        packs.add(clamp(target, 0, packs.size()), pack);
        save(context, packs);
    }

    public static synchronized void setCover(Context context, String packId, String fileName)
            throws IOException {
        List<Pack> packs = new ArrayList<>(load(context));
        int index = indexOf(packs, packId);
        Pack old = packs.get(index);
        if (!old.stickers.contains(fileName)) throw new IOException("Unknown sticker");
        packs.set(index, old.withStickers(old.stickers, fileName, old.edited));
        save(context, packs);
    }

    public static synchronized void deletePack(Context context, String packId) throws IOException {
        List<Pack> packs = new ArrayList<>(load(context));
        packs.remove(indexOf(packs, packId));
        save(context, packs);
        deleteRecursively(packDirectory(context, packId));
    }

    /**
     * Called off the UI thread with the picked document's bytes. The pack's default edits are
     * applied to the new sticker, keeping the import as its original.
     */
    public static synchronized void addSticker(Context context, String packId, byte[] source)
            throws IOException {
        List<Pack> packs = new ArrayList<>(load(context));
        int index = indexOf(packs, packId);
        Pack pack = packs.get(index);
        String added = insertSticker(context, packs, index, pack.stickers.size(),
                encodeSticker(source));
        if (!pack.defaults.isEmpty()) saveEdited(context, packId, added, pack.defaults);
    }

    /** Deletes several stickers; returns how many could not be deleted. */
    public static int deleteStickers(Context context, String packId, List<String> fileNames) {
        int failed = 0;
        for (String fileName : fileNames) {
            try {
                deleteSticker(context, packId, fileName);
            } catch (IOException | RuntimeException failure) {
                failed++;
            }
        }
        return failed;
    }

    /** Editor settings; outline width is given for a 512 px sticker and scaled to its size. */
    public static final class Edits {
        public final int backgroundTolerance;
        /** 0 to 100; 100 rounds the shorter side fully. */
        public final int cornerPercent;
        public final int outlineWidth;
        public final int outlineColor;

        public Edits(int backgroundTolerance, int cornerPercent, int outlineWidth,
                int outlineColor) {
            this.backgroundTolerance = backgroundTolerance;
            this.cornerPercent = cornerPercent;
            this.outlineWidth = outlineWidth;
            this.outlineColor = outlineColor;
        }

        public static final Edits NONE = new Edits(0, 0, 0, 0xFFFFFFFF);

        public boolean isEmpty() {
            return backgroundTolerance <= 0 && cornerPercent <= 0 && outlineWidth <= 0;
        }

        @Override public boolean equals(Object other) {
            if (!(other instanceof Edits)) return false;
            Edits that = (Edits) other;
            if (isEmpty() && that.isEmpty()) return true;
            return backgroundTolerance == that.backgroundTolerance
                    && cornerPercent == that.cornerPercent
                    && outlineWidth == that.outlineWidth
                    && (outlineWidth == 0 || outlineColor == that.outlineColor);
        }

        @Override public int hashCode() {
            return isEmpty() ? 0 : java.util.Objects.hash(
                    backgroundTolerance, cornerPercent, outlineWidth,
                    outlineWidth == 0 ? 0 : outlineColor);
        }
    }

    public static final class Rendered {
        public final Bitmap bitmap;
        /** Background removal was asked for but the edges had no plain colour. */
        public final boolean backgroundNotFound;

        Rendered(Bitmap bitmap, boolean backgroundNotFound) {
            this.bitmap = bitmap;
            this.backgroundNotFound = backgroundNotFound;
        }
    }

    /** Decoded pixels of a source image, optionally after background removal. */
    private static final class Stage {
        final String key;
        final int[] pixels;
        final int width;
        final int height;
        final boolean backgroundNotFound;

        Stage(String key, int[] pixels, int width, int height, boolean backgroundNotFound) {
            this.key = key;
            this.pixels = pixels;
            this.width = width;
            this.height = height;
            this.backgroundNotFound = backgroundNotFound;
        }
    }

    private static final Object STAGE_LOCK = new Object();
    // One decoded source and one background-removal result: dragging the corner or outline
    // slider re-renders without decoding the file or repeating the flood fill.
    private static Stage sourceStage;
    private static Stage backgroundStage;

    private static Stage stage(File file, int tolerance) throws IOException {
        String sourceKey = file.getPath() + "@" + file.lastModified() + ":" + file.length();
        synchronized (STAGE_LOCK) {
            if (sourceStage == null || !sourceStage.key.equals(sourceKey)) {
                BitmapFactory.Options options = new BitmapFactory.Options();
                options.inPreferredConfig = Bitmap.Config.ARGB_8888;
                Bitmap source = BitmapFactory.decodeFile(file.getPath(), options);
                if (source == null) throw new IOException("Sticker could not be decoded");
                int width = source.getWidth();
                int height = source.getHeight();
                int[] pixels = new int[width * height];
                source.getPixels(pixels, 0, width, 0, 0, width, height);
                source.recycle();
                sourceStage = new Stage(sourceKey, pixels, width, height, false);
                backgroundStage = null;
            }
            if (tolerance <= 0) return sourceStage;
            String backgroundKey = sourceKey + "#" + tolerance;
            if (backgroundStage == null || !backgroundStage.key.equals(backgroundKey)) {
                int[] pixels = sourceStage.pixels.clone();
                int removed = GboardCustomStickersBackgroundRemover.remove(
                        pixels, sourceStage.width, sourceStage.height, tolerance);
                boolean notFound = removed == 0 || removed == pixels.length;
                backgroundStage = new Stage(backgroundKey, notFound ? sourceStage.pixels : pixels,
                        sourceStage.width, sourceStage.height, notFound);
            }
            return backgroundStage;
        }
    }

    /** Applies the edits to a sticker file; used for both the live preview and saving. */
    public static Rendered render(File file, Edits edits) throws IOException {
        Stage stage = stage(file, edits.backgroundTolerance);
        int width = stage.width;
        int height = stage.height;
        // Later steps edit in place; the cached stage must stay untouched.
        int[] pixels = stage.pixels.clone();
        boolean backgroundNotFound = stage.backgroundNotFound;
        // Drop empty transparent margins so the content fills the sticker after scaling below.
        int[] bounds = GboardCustomStickersBackgroundRemover.visibleBounds(pixels, width, height);
        if (bounds != null && (bounds[2] - bounds[0] < width || bounds[3] - bounds[1] < height)) {
            int croppedWidth = bounds[2] - bounds[0];
            int croppedHeight = bounds[3] - bounds[1];
            int[] cropped = new int[croppedWidth * croppedHeight];
            for (int y = 0; y < croppedHeight; y++) {
                System.arraycopy(pixels, (bounds[1] + y) * width + bounds[0],
                        cropped, y * croppedWidth, croppedWidth);
            }
            pixels = cropped;
            width = croppedWidth;
            height = croppedHeight;
        }
        if (edits.cornerPercent > 0) {
            GboardCustomStickersCorners.round(pixels, width, height, edits.cornerPercent);
        }
        if (edits.outlineWidth > 0) {
            int radius = Math.max(1, Math.round(
                    edits.outlineWidth * Math.max(width, height) / (float) MAX_STICKER_EDGE_PX));
            pixels = GboardCustomStickersOutline.apply(
                    pixels, width, height, radius, edits.outlineColor);
            width += 2 * radius;
            height += 2 * radius;
        }
        Bitmap result = Bitmap.createBitmap(pixels, width, height, Bitmap.Config.ARGB_8888);
        // Edited stickers always fill the 512 px box, enlarging small or cropped content.
        float scale = (float) MAX_STICKER_EDGE_PX / Math.max(width, height);
        if (scale != 1f) {
            Bitmap scaled = Bitmap.createScaledBitmap(result,
                    Math.max(1, Math.round(width * scale)),
                    Math.max(1, Math.round(height * scale)), true);
            result.recycle();
            result = scaled;
        }
        return new Rendered(result, backgroundNotFound);
    }

    /**
     * Re-renders the sticker from its original image with {@code edits}, in place: it keeps its
     * position and cover role, and the original stays on disk so it can be edited again.
     * Empty edits restore the original. Returns the sticker's new file name. Off the UI thread.
     */
    public static synchronized String saveEdited(Context context, String packId, String fileName,
            Edits edits) throws IOException {
        List<Pack> packs = new ArrayList<>(load(context));
        int index = indexOf(packs, packId);
        Pack old = packs.get(index);
        int position = old.stickers.indexOf(fileName);
        if (position < 0) throw new IOException("Unknown sticker");
        if (old.editsOf(fileName).equals(edits)) return fileName;
        String source = old.sourceOf(fileName);
        Map<String, Edited> edited = new LinkedHashMap<>(old.edited);
        edited.remove(fileName);
        File written = null;
        String shown = source;
        if (!edits.isEmpty()) {
            Rendered rendered = render(stickerFile(context, packId, source), edits);
            try {
                written = writeSticker(context, packId, encodeBitmap(rendered.bitmap));
            } finally {
                rendered.bitmap.recycle();
            }
            shown = written.getName();
            edited.put(shown, new Edited(source, edits));
        }
        List<String> stickers = new ArrayList<>(old.stickers);
        stickers.set(position, shown);
        String cover = fileName.equals(old.cover) ? shown : old.cover;
        packs.set(index, old.withStickers(stickers, cover, edited));
        if (written != null) {
            saveOrDelete(context, packs, written);
        } else {
            save(context, packs);
        }
        // The previous render is no longer referenced; the original is never deleted here.
        if (!fileName.equals(source)) {
            //noinspection ResultOfMethodCallIgnored
            stickerFile(context, packId, fileName).delete();
        }
        return shown;
    }

    private static String insertSticker(Context context, List<Pack> packs, int index,
            int position, Encoded encoded) throws IOException {
        Pack old = packs.get(index);
        File target = writeSticker(context, old.id, encoded);
        List<String> stickers = new ArrayList<>(old.stickers);
        stickers.add(position, target.getName());
        packs.set(index, old.withStickers(stickers, old.cover, old.edited));
        saveOrDelete(context, packs, target);
        return target.getName();
    }

    private static File writeSticker(Context context, String packId, Encoded encoded)
            throws IOException {
        File directory = packDirectory(context, packId);
        if (!directory.isDirectory() && !directory.mkdirs()) {
            throw new IOException("Sticker folder could not be created");
        }
        File target = new File(directory, newId() + "." + encoded.extension);
        try (FileOutputStream output = new FileOutputStream(target)) {
            output.write(encoded.bytes);
        }
        return target;
    }

    private static void saveOrDelete(Context context, List<Pack> packs, File written)
            throws IOException {
        try {
            save(context, packs);
        } catch (IOException failure) {
            //noinspection ResultOfMethodCallIgnored
            written.delete();
            throw failure;
        }
    }

    public static synchronized void deleteSticker(Context context, String packId, String fileName)
            throws IOException {
        List<Pack> packs = new ArrayList<>(load(context));
        int index = indexOf(packs, packId);
        Pack old = packs.get(index);
        List<String> stickers = new ArrayList<>(old.stickers);
        if (!stickers.remove(fileName)) throw new IOException("Unknown sticker");
        Map<String, Edited> edited = new LinkedHashMap<>(old.edited);
        edited.remove(fileName);
        packs.set(index, old.withStickers(stickers, old.cover, edited));
        save(context, packs);
        //noinspection ResultOfMethodCallIgnored
        stickerFile(context, packId, fileName).delete();
        String source = old.sourceOf(fileName);
        if (!source.equals(fileName)) {
            //noinspection ResultOfMethodCallIgnored
            stickerFile(context, packId, source).delete();
        }
    }

    /** A zip with {@code pack.json} and every shown and original image of the pack. */
    public static void exportPack(Context context, String packId, java.io.OutputStream output)
            throws IOException {
        Pack pack = findPack(context, packId);
        if (pack == null) throw new IOException("Unknown sticker pack");
        // Streamed file by file so a large pack never sits in memory at once.
        ZipOutputStream zip = new ZipOutputStream(output);
        try {
            zip.putNextEntry(new ZipEntry(ARCHIVE_INDEX));
            zip.write(toJson(Collections.singletonList(pack)).getBytes(StandardCharsets.UTF_8));
            zip.closeEntry();
        } catch (JSONException failure) {
            throw new IOException("Sticker pack could not be exported", failure);
        }
        java.util.Set<String> files = new java.util.LinkedHashSet<>(pack.stickers);
        for (Edited record : pack.edited.values()) files.add(record.source);
        for (String file : files) {
            File image = stickerFile(context, packId, file);
            if (!image.isFile()) continue;
            zip.putNextEntry(new ZipEntry(file));
            java.nio.file.Files.copy(image.toPath(), zip);
            zip.closeEntry();
        }
        // The caller owns and closes the output stream.
        zip.finish();
    }

    /**
     * Adds an exported pack as a new pack. Untrusted input: only image entries with sticker file
     * names are kept, and sizes and entry counts are capped. Off the UI thread.
     */
    public static synchronized Pack importPack(Context context, byte[] archive)
            throws IOException {
        String packId = newId();
        File directory = packDirectory(context, packId);
        try {
            if (!directory.mkdirs()) throw new IOException("Sticker folder could not be created");
            // Images go straight to the new pack folder, so only one entry is held at a time.
            String json = null;
            java.util.Set<String> images = new java.util.HashSet<>();
            long total = 0;
            int entries = 0;
            try (ZipInputStream zip =
                         new ZipInputStream(new java.io.ByteArrayInputStream(archive))) {
                ZipEntry entry;
                while ((entry = zip.getNextEntry()) != null) {
                    if (++entries > MAX_ARCHIVE_ENTRIES) throw new IOException("Too many entries");
                    if (entry.isDirectory()) continue;
                    byte[] bytes = readLimited(zip, MAX_ARCHIVE_ENTRY_BYTES);
                    total += bytes.length;
                    if (total > MAX_ARCHIVE_BYTES) throw new IOException("Archive is too large");
                    String name = entry.getName();
                    if (ARCHIVE_INDEX.equals(name)) {
                        json = new String(bytes, StandardCharsets.UTF_8);
                    } else if (STICKER_FILE.matcher(name).matches() && isStickerImage(bytes)
                            && images.add(name)) {
                        try (FileOutputStream output =
                                     new FileOutputStream(new File(directory, name))) {
                            output.write(bytes);
                        }
                    }
                }
            }
            if (json == null) throw new IOException("Not a sticker pack");
            Pack exported;
            try {
                List<Pack> parsed = fromJson(json);
                if (parsed.isEmpty()) throw new IOException("Not a sticker pack");
                exported = parsed.get(0);
            } catch (JSONException failure) {
                throw new IOException("Not a sticker pack", failure);
            }
            List<String> stickers = new ArrayList<>();
            for (String sticker : exported.stickers) {
                if (images.contains(sticker)) stickers.add(sticker);
            }
            Map<String, Edited> edited = new LinkedHashMap<>();
            for (Map.Entry<String, Edited> record : exported.edited.entrySet()) {
                if (images.contains(record.getValue().source)) {
                    edited.put(record.getKey(), record.getValue());
                }
            }
            Pack pack = new Pack(packId, exported.name, stickers, exported.cover, edited,
                    exported.defaults);
            // Drop images the index does not reference.
            java.util.Set<String> needed = new java.util.HashSet<>(pack.stickers);
            for (Edited record : pack.edited.values()) needed.add(record.source);
            for (String image : images) {
                //noinspection ResultOfMethodCallIgnored
                if (!needed.contains(image)) new File(directory, image).delete();
            }
            List<Pack> packs = new ArrayList<>(load(context));
            packs.add(pack);
            save(context, packs);
            return pack;
        } catch (IOException | RuntimeException failure) {
            deleteRecursively(directory);
            throw failure;
        }
    }

    private static byte[] readLimited(java.io.InputStream input, int limit) throws IOException {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        byte[] buffer = new byte[16 * 1024];
        int read;
        while ((read = input.read(buffer)) != -1) {
            if (output.size() + read > limit) throw new IOException("Archive entry is too large");
            output.write(buffer, 0, read);
        }
        return output.toByteArray();
    }

    private static boolean isStickerImage(byte[] bytes) {
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bytes, 0, bytes.length, bounds);
        return ("image/png".equals(bounds.outMimeType) || "image/webp".equals(bounds.outMimeType))
                && bounds.outWidth > 0 && bounds.outWidth <= MAX_STICKER_EDGE_PX
                && bounds.outHeight > 0 && bounds.outHeight <= MAX_STICKER_EDGE_PX;
    }

    public static File stickerFile(Context context, String packId, String fileName) {
        return new File(packDirectory(context, packId), fileName);
    }

    static String toJson(List<Pack> packs) throws JSONException {
        JSONArray array = new JSONArray();
        for (Pack pack : packs) {
            JSONArray stickers = new JSONArray();
            for (String sticker : pack.stickers) stickers.put(sticker);
            JSONObject item = new JSONObject()
                    .put("id", pack.id)
                    .put("name", pack.name)
                    .put("stickers", stickers);
            if (pack.cover != null) item.put("cover", pack.cover);
            if (!pack.edited.isEmpty()) {
                JSONObject edited = new JSONObject();
                for (Map.Entry<String, Edited> entry : pack.edited.entrySet()) {
                    edited.put(entry.getKey(), editsToJson(entry.getValue().edits)
                            .put("source", entry.getValue().source));
                }
                item.put("edited", edited);
            }
            if (!pack.defaults.isEmpty()) item.put("defaults", editsToJson(pack.defaults));
            array.put(item);
        }
        return new JSONObject().put("version", 1).put("packs", array).toString();
    }

    private static JSONObject editsToJson(Edits edits) throws JSONException {
        return new JSONObject()
                .put("background", edits.backgroundTolerance)
                .put("corners", edits.cornerPercent)
                .put("outline", edits.outlineWidth)
                .put("color", edits.outlineColor);
    }

    /** Clamped: these values size buffers when a sticker is rendered. */
    private static Edits editsFromJson(JSONObject json) {
        return new Edits(
                clamp(json.optInt("background"), 0, 255),
                clamp(json.optInt("corners"), 0, 100),
                clamp(json.optInt("outline"), 0, MAX_OUTLINE_WIDTH),
                json.optInt("color", 0xFFFFFFFF));
    }

    /** Drops entries whose id or file name could escape the sticker folder. */
    static List<Pack> fromJson(String json) throws JSONException {
        JSONArray array = new JSONObject(json).optJSONArray("packs");
        if (array == null) return Collections.emptyList();
        List<Pack> packs = new ArrayList<>();
        for (int i = 0; i < array.length(); i++) {
            JSONObject item = array.optJSONObject(i);
            if (item == null) continue;
            String id = item.optString("id", "");
            String name = cleanName(item.optString("name", ""));
            if (!PACK_ID.matcher(id).matches() || name.isEmpty()) continue;
            List<String> stickers = new ArrayList<>();
            JSONArray files = item.optJSONArray("stickers");
            for (int j = 0; files != null && j < files.length(); j++) {
                String file = files.optString(j, "");
                if (STICKER_FILE.matcher(file).matches()) stickers.add(file);
            }
            Map<String, Edited> edited = new LinkedHashMap<>();
            JSONObject editedJson = item.optJSONObject("edited");
            if (editedJson != null) {
                java.util.Iterator<String> keys = editedJson.keys();
                while (keys.hasNext()) {
                    String key = keys.next();
                    JSONObject record = editedJson.optJSONObject(key);
                    if (record == null) continue;
                    edited.put(key, new Edited(record.optString("source", ""),
                            editsFromJson(record)));
                }
            }
            JSONObject defaults = item.optJSONObject("defaults");
            // Pack keeps only a cover and edit records that point at validated sticker files.
            packs.add(new Pack(id, name, stickers, item.optString("cover", null), edited,
                    defaults == null ? Edits.NONE : editsFromJson(defaults)));
        }
        return packs;
    }

    private static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }

    static String cleanName(String name) {
        String trimmed = name == null ? "" : name.trim();
        return trimmed.length() > MAX_NAME_LENGTH ? trimmed.substring(0, MAX_NAME_LENGTH) : trimmed;
    }

    private static void save(Context context, List<Pack> packs) throws IOException {
        File directory = rootDirectory(context);
        if (!directory.isDirectory() && !directory.mkdirs()) {
            throw new IOException("Sticker folder could not be created");
        }
        AtomicFile file = new AtomicFile(indexFile(context));
        FileOutputStream output = file.startWrite();
        try {
            output.write(toJson(packs).getBytes(StandardCharsets.UTF_8));
            file.finishWrite(output);
        } catch (IOException | JSONException | RuntimeException failure) {
            file.failWrite(output);
            cachedStamp = null;
            throw new IOException("Sticker packs could not be saved", failure);
        }
        File index = indexFile(context);
        cachedPacks = Collections.unmodifiableList(new ArrayList<>(packs));
        cachedStamp = index.lastModified() + ":" + index.length();
    }

    private static int indexOf(List<Pack> packs, String packId) throws IOException {
        for (int i = 0; i < packs.size(); i++) {
            if (packs.get(i).id.equals(packId)) return i;
        }
        throw new IOException("Unknown sticker pack");
    }

    private static File rootDirectory(Context context) {
        return new File(context.getFilesDir(), DIRECTORY);
    }

    private static File indexFile(Context context) {
        return new File(rootDirectory(context), INDEX_FILE);
    }

    private static File packDirectory(Context context, String packId) {
        return new File(rootDirectory(context), packId);
    }

    private static String newId() {
        return UUID.randomUUID().toString().replace("-", "");
    }

    private static void deleteRecursively(File file) {
        File[] children = file.listFiles();
        if (children != null) {
            for (File child : children) deleteRecursively(child);
        }
        //noinspection ResultOfMethodCallIgnored
        file.delete();
    }

    static final class Encoded {
        final byte[] bytes;
        final String extension;

        Encoded(byte[] bytes, String extension) {
            this.bytes = bytes;
            this.extension = extension;
        }
    }

    /** Fits the image inside MAX_STICKER_EDGE_PX, keeping alpha; never enlarges. */
    static Encoded encodeSticker(byte[] source) throws IOException {
        if (source == null || source.length == 0 || source.length > MAX_IMPORT_BYTES) {
            throw new IOException("Image is empty or too large");
        }
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(source, 0, source.length, bounds);
        if (!("image/png".equals(bounds.outMimeType)
                || "image/jpeg".equals(bounds.outMimeType)
                || "image/webp".equals(bounds.outMimeType)
                || "image/gif".equals(bounds.outMimeType))
                || bounds.outWidth <= 0 || bounds.outHeight <= 0
                || (long) bounds.outWidth * bounds.outHeight > MAX_SOURCE_PIXELS) {
            throw new IOException("Unsupported image or dimensions");
        }
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inPreferredConfig = Bitmap.Config.ARGB_8888;
        options.inSampleSize = 1;
        while (Math.max(bounds.outWidth, bounds.outHeight) / (options.inSampleSize * 2)
                >= MAX_STICKER_EDGE_PX * 2) {
            options.inSampleSize *= 2;
        }
        Bitmap decoded = BitmapFactory.decodeByteArray(source, 0, source.length, options);
        if (decoded == null) throw new IOException("Image could not be decoded");
        Bitmap scaled = decoded;
        try {
            float scale = Math.min(1f, (float) MAX_STICKER_EDGE_PX
                    / Math.max(decoded.getWidth(), decoded.getHeight()));
            if (scale < 1f) {
                scaled = Bitmap.createScaledBitmap(decoded,
                        Math.max(1, Math.round(decoded.getWidth() * scale)),
                        Math.max(1, Math.round(decoded.getHeight() * scale)), true);
            }
            return encodeBitmap(scaled);
        } finally {
            if (scaled != decoded) scaled.recycle();
            decoded.recycle();
        }
    }

    /** Lossless PNG when it fits MAX_STICKER_BYTES, otherwise lossy WebP keeping alpha. */
    private static Encoded encodeBitmap(Bitmap bitmap) throws IOException {
        byte[] png = compress(bitmap, Bitmap.CompressFormat.PNG, 100);
        if (png != null && png.length <= MAX_STICKER_BYTES) return new Encoded(png, "png");
        Bitmap.CompressFormat webp = Build.VERSION.SDK_INT >= Build.VERSION_CODES.R
                ? Bitmap.CompressFormat.WEBP_LOSSY : Bitmap.CompressFormat.WEBP;
        for (int quality = 90; quality >= 50; quality -= 10) {
            byte[] encoded = compress(bitmap, webp, quality);
            if (encoded != null && encoded.length <= MAX_STICKER_BYTES) {
                return new Encoded(encoded, "webp");
            }
        }
        throw new IOException("Image could not be saved");
    }

    private static byte[] compress(Bitmap bitmap, Bitmap.CompressFormat format, int quality) {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        return bitmap.compress(format, quality, output) ? output.toByteArray() : null;
    }
}
