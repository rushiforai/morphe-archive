package app.morphe.extension.sabp;

import android.content.Context;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

/**
 * Snapshot of the playing book, read from SABP's own data. SABP's BookData, MetadataHolder,
 * Chapter and Bookmark classes are Serializable, so their field names (mFileName, mFileInfo,
 * mPrecedingPlaybackTime, mChapters, ...) survive obfuscation and are safe to read.
 */
public final class EppyBook {

    public static final class FileItem {
        public String name;
        public String id3Title;
        public int start;    // seconds from book start, -1 if not measured yet
        public int duration; // seconds, -1 if unknown
    }

    public static final class ChapterItem {
        public String title;
        public String fileName;
        public int positionInFile; // seconds
        public int start;          // seconds from book start, -1 if unknown
        public int length;         // seconds, -1 if unknown
        public boolean isFile;     // a whole file rather than an embedded chapter
    }

    public static final class BookmarkItem {
        public String title;
        public String description;
        public String fileName;
        public int position; // seconds in file
        public Object raw;   // SABP's Bookmark object
    }

    public String folderUri;
    public String folderName;
    public String currentFile;
    public int total;      // seconds, -1 if unknown
    public final List<FileItem> files = new ArrayList<>();
    public final List<ChapterItem> chapters = new ArrayList<>();
    public boolean embeddedChapters;
    /** Subtitle (SRT) lines of every file, in book order. */
    public final List<SrtItem> srts = new ArrayList<>();
    /** Text/PDF files SABP found next to the audio (its "Open PDF file" menu). */
    public final List<String> textFiles = new ArrayList<>();

    public static final class SrtItem {
        public String fileName;
        public String text;
        public int startInFile; // seconds
        public int endInFile;   // seconds
        public int start = -1;  // seconds from book start
    }

    /** Reads the current book from PlayerService. Returns null when nothing is loaded. */
    public static EppyBook current() {
        Object service = EppyBridge.getPlayerService();
        if (service == null) return null;
        Object bookData = fieldOfType(service, EppyBridge.SABP_PACKAGE + ".BookData");
        if (bookData == null) return null;
        EppyBook b = new EppyBook();
        b.folderUri = str(field(bookData, "mFolderUri"));
        b.currentFile = str(field(bookData, "mFileName"));
        if (b.folderUri == null) return null;
        b.folderName = lastSegment(b.folderUri);
        Object meta = metadataHolder(bookData);
        b.total = meta != null ? intVal(field(meta, "mTotalPlaybackTime"), -1) : -1;
        if (b.total <= 0) {
            int cached = intVal(field(bookData, "mTotalPlaybackTimeCache"), -1);
            b.total = cached > 0 ? cached : -1;
        }
        Object infos = meta != null ? field(meta, "mFileInfo") : null;
        if (infos instanceof Object[]) {
            Object[] arr = (Object[]) infos;
            for (Object fi : arr) {
                FileItem f = new FileItem();
                f.name = str(field(fi, "mName"));
                f.id3Title = str(field(fi, "mId3Title"));
                f.start = intVal(field(fi, "mPrecedingPlaybackTime"), -1);
                b.files.add(f);
            }
            for (int i = 0; i < b.files.size(); i++) {
                FileItem f = b.files.get(i);
                int next = i + 1 < b.files.size() ? b.files.get(i + 1).start : b.total;
                f.duration = (f.start >= 0 && next > f.start) ? next - f.start : -1;
            }
            // Embedded chapters (m4b, cue sheets, openbook.json...).
            for (int i = 0; i < arr.length; i++) {
                Object list = field(arr[i], "mChapters");
                if (!(list instanceof List) || ((List<?>) list).isEmpty()) continue;
                FileItem f = b.files.get(i);
                List<?> chs = (List<?>) list;
                for (int k = 0; k < chs.size(); k++) {
                    Object ch = chs.get(k);
                    ChapterItem c = new ChapterItem();
                    c.title = str(field(ch, "mName"));
                    c.positionInFile = intVal(field(ch, "mStartTime"), 0);
                    c.fileName = f.name;
                    c.start = f.start >= 0 ? f.start + c.positionInFile : -1;
                    int end = k + 1 < chs.size() ? intVal(field(chs.get(k + 1), "mStartTime"), -1) : f.duration;
                    c.length = end > c.positionInFile ? end - c.positionInFile : -1;
                    b.chapters.add(c);
                }
                b.embeddedChapters = true;
            }
        }
        if (infos instanceof Object[]) {
            Object[] arr = (Object[]) infos;
            for (int i = 0; i < arr.length; i++) {
                Object list = field(arr[i], "mSrts");
                if (!(list instanceof List)) continue;
                FileItem f = b.files.get(i);
                for (Object o : (List<?>) list) {
                    SrtItem it = new SrtItem();
                    it.fileName = f.name;
                    it.text = str(field(o, "mTitle"));
                    it.startInFile = intVal(field(o, "mStartTime"), 0);
                    it.endInFile = intVal(field(o, "mEndTime"), it.startInFile);
                    it.start = f.start >= 0 ? f.start + it.startInFile : -1;
                    b.srts.add(it);
                }
            }
        }
        Object tf = meta != null ? field(meta, "mTextFiles") : null;
        if (tf instanceof String[]) for (String t : (String[]) tf) if (t != null) b.textFiles.add(t);
        if (!b.embeddedChapters) {
            for (FileItem f : b.files) {
                ChapterItem c = new ChapterItem();
                c.title = f.id3Title != null && !f.id3Title.trim().isEmpty() ? f.id3Title.trim() : stripExtension(lastSegment(f.name));
                c.fileName = f.name;
                c.positionInFile = 0;
                c.start = f.start;
                c.length = f.duration;
                c.isFile = true;
                b.chapters.add(c);
            }
        }
        return b;
    }

    public FileItem file(String name) {
        if (name == null) return null;
        for (FileItem f : files) if (name.equals(f.name)) return f;
        return null;
    }

    /** Live position in the whole book (seconds), or -1. */
    public int bookPosition(int filePositionSeconds) {
        FileItem f = file(currentFile);
        if (f == null || f.start < 0 || filePositionSeconds < 0) return -1;
        return f.start + filePositionSeconds;
    }

    /** Index of the chapter containing a book position (or the current file when unknown). */
    public int chapterIndexAt(int bookPos, int filePos) {
        int best = -1;
        for (int i = 0; i < chapters.size(); i++) {
            ChapterItem c = chapters.get(i);
            if (bookPos >= 0 && c.start >= 0) {
                if (c.start <= bookPos) best = i;
            } else if (c.fileName != null && c.fileName.equals(currentFile) && c.positionInFile <= Math.max(0, filePos)) {
                best = i;
            }
        }
        return best;
    }

    /** Converts a whole-book position to (file, seconds in file). */
    public Object[] locate(int bookPos) {
        FileItem hit = null;
        for (FileItem f : files) {
            if (f.start >= 0 && f.start <= bookPos) hit = f;
        }
        if (hit == null) return null;
        int inFile = bookPos - hit.start;
        if (hit.duration > 0) inFile = Math.min(inFile, Math.max(0, hit.duration - 1));
        return new Object[]{hit.name, Math.max(0, inFile)};
    }

    // ---- bookmarks ------------------------------------------------------------------------

    public static List<BookmarkItem> bookmarks(Context c, String folderUri) {
        ArrayList<BookmarkItem> out = new ArrayList<>();
        try {
            ArrayList<?> raw = EppyBridge.loadBookmarks(c, folderUri);
            if (raw == null) return out;
            for (Object o : raw) {
                BookmarkItem b = new BookmarkItem();
                b.title = str(field(o, "mTitle"));
                b.description = str(field(o, "mDescription"));
                b.fileName = str(field(o, "mFileName"));
                b.position = intVal(field(o, "mFilePosition"), 0);
                b.raw = o;
                out.add(b);
            }
        } catch (Throwable ignored) {
        }
        return out;
    }

    /** Saves the given list (in order) back to bookmarks.sabp.xml. */
    @SuppressWarnings({"unchecked", "rawtypes"})
    public static boolean saveBookmarks(Context c, String folderUri, List<BookmarkItem> items) {
        try {
            ArrayList raw = new ArrayList();
            for (BookmarkItem b : items) raw.add(b.raw != null ? b.raw : newBookmark(b));
            EppyBridge.saveBookmarks(c, raw, folderUri);
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    public static Object newBookmark(BookmarkItem b) throws Exception {
        Class<?> cls = Class.forName(EppyBridge.SABP_PACKAGE + ".Bookmark");
        Constructor<?> ctor = cls.getDeclaredConstructor(String.class, String.class, String.class, int.class);
        ctor.setAccessible(true);
        return ctor.newInstance(b.title != null ? b.title : "", b.description != null ? b.description : "", b.fileName, b.position);
    }

    // ---- reflection helpers ---------------------------------------------------------------

    static Object metadataHolder(Object bookData) {
        Object m = fieldOfType(bookData, EppyBridge.SABP_PACKAGE + ".MetadataHolder");
        if (m != null) return m;
        // Lazily created: call BookData's own (private) getter, found by its return type.
        try {
            for (Method method : bookData.getClass().getDeclaredMethods()) {
                if (method.getParameterTypes().length == 0
                        && method.getReturnType().getName().equals(EppyBridge.SABP_PACKAGE + ".MetadataHolder")) {
                    method.setAccessible(true);
                    return method.invoke(bookData);
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    static Object fieldOfType(Object o, String typeName) {
        try {
            for (Field f : o.getClass().getDeclaredFields()) {
                if (f.getType().getName().equals(typeName)) {
                    f.setAccessible(true);
                    return f.get(o);
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    static Object field(Object o, String name) {
        if (o == null) return null;
        Class<?> c = o.getClass();
        while (c != null) {
            try {
                Field f = c.getDeclaredField(name);
                f.setAccessible(true);
                return f.get(o);
            } catch (NoSuchFieldException e) {
                c = c.getSuperclass();
            } catch (Throwable t) {
                return null;
            }
        }
        return null;
    }

    static String str(Object o) {
        return o instanceof String ? (String) o : null;
    }

    static int intVal(Object o, int fallback) {
        return o instanceof Integer ? (Integer) o : fallback;
    }

    public static String lastSegment(String s) {
        if (s == null) return "";
        String d = android.net.Uri.decode(s);
        int slash = Math.max(d.lastIndexOf('/'), d.lastIndexOf(':'));
        return slash >= 0 && slash < d.length() - 1 ? d.substring(slash + 1) : d;
    }

    static String stripExtension(String s) {
        int dot = s.lastIndexOf('.');
        return dot > 0 ? s.substring(0, dot) : s;
    }
}
