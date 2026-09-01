package com.drew.tools;

import com.drew.imaging.FileTypeDetector;
import com.drew.imaging.ImageMetadataReader;
import com.drew.imaging.eps.ld.PdtluglzAX;
import com.drew.lang.StringUtil;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.Tag;
import com.drew.metadata.exif.ExifDirectoryBase;
import com.drew.metadata.exif.ExifIFD0Directory;
import com.drew.metadata.exif.ExifSubIFDDirectory;
import com.drew.metadata.exif.ExifThumbnailDirectory;
import com.squareup.wire.sjIw.ezwlgQm;
import defpackage.ay0;
import defpackage.ev6;
import defpackage.km4;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ProcessAllImagesInFolderUtility {

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class BasicFileHandler extends FileHandlerBase {
        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandlerBase, com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public final void onExtractionSuccess(File file, Metadata metadata, String str, PrintStream printStream) {
            super.onExtractionSuccess(file, metadata, str, printStream);
            for (Directory directory : metadata.getDirectories()) {
                directory.getName();
                for (Tag tag : directory.getTags()) {
                    tag.getTagName();
                    tag.getDescription();
                }
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public interface FileHandler {
        void onBeforeExtraction(File file, PrintStream printStream, String str);

        void onExtractionError(File file, Throwable th, PrintStream printStream);

        void onExtractionSuccess(File file, Metadata metadata, String str, PrintStream printStream);

        void onScanCompleted(PrintStream printStream);

        void onStartingDirectory(File file);

        boolean shouldProcess(File file);
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    /* JADX INFO: loaded from: classes2.dex */
    public static abstract class FileHandlerBase implements FileHandler {
        private final Set<String> _supportedExtensions = new HashSet(Arrays.asList("3fr", "3g2", "3gp", "ai", "arw", "avi", "avif", PdtluglzAX.lnAops, "cam", "cr2", "cr3", "crw", "dcr", "dng", "eps", "fuzzed", "gif", "gpr", "heic", ezwlgQm.bcay, "ico", "j2c", "jp2", "jpeg", "jpf", "jpg", "jpm", "jxr", "kdc", "m2ts", "m2v", "m4a", "m4v", "mj2", "mov", "mp3", "mp4", "mpg", "mts", "nef", "orf", "pbm", "pcx", "pef", "pgm", "png", "pnm", "ppm", "psd", "raf", "rw2", "rwl", "srw", "tif", "tiff", "wav", "webp", "x3f"));
        private int _processedFileCount = 0;
        private int _exceptionCount = 0;
        private int _errorCount = 0;
        private long _processedByteCount = 0;

        public final String getExtension(File file) {
            String name = file.getName();
            int iLastIndexOf = name.lastIndexOf(46);
            if (iLastIndexOf == -1 || iLastIndexOf == name.length() - 1) {
                return null;
            }
            return name.substring(iLastIndexOf + 1);
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public void onBeforeExtraction(File file, PrintStream printStream, String str) {
            this._processedFileCount++;
            this._processedByteCount = file.length() + this._processedByteCount;
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public void onExtractionError(File file, Throwable th, PrintStream printStream) {
            this._exceptionCount++;
            printStream.printf("\t[%s] %s\n", th.getClass().getName(), th.getMessage());
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public void onExtractionSuccess(File file, Metadata metadata, String str, PrintStream printStream) {
            if (metadata.hasErrors()) {
                printStream.print(file);
                printStream.print('\n');
                for (Directory directory : metadata.getDirectories()) {
                    if (directory.hasErrors()) {
                        Iterator<String> it2 = directory.getErrors().iterator();
                        while (it2.hasNext()) {
                            printStream.printf("\t[%s] %s\n", directory.getName(), it2.next());
                            this._errorCount++;
                        }
                    }
                }
            }
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public void onScanCompleted(PrintStream printStream) {
            int i = this._processedFileCount;
            if (i > 0) {
                printStream.print(String.format("Processed %,d files (%,d bytes) with %,d exceptions and %,d file errors\n", Integer.valueOf(i), Long.valueOf(this._processedByteCount), Integer.valueOf(this._exceptionCount), Integer.valueOf(this._errorCount)));
            }
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public void onStartingDirectory(File file) {
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public final boolean shouldProcess(File file) {
            String extension = getExtension(file);
            return extension != null && this._supportedExtensions.contains(extension.toLowerCase());
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class MarkdownTableOutputHandler extends FileHandlerBase {
        private final Map<String, String> _extensionEquivalence;
        private final Map<String, List<Row>> _rowListByExtension;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public static class Row {
            private String exifVersion;
            final File file;
            private String makernote;
            private String manufacturer;
            final Metadata metadata;
            private String model;
            final String relativePath;
            private String thumbnail;

            public Row(File file, Metadata metadata, String str) {
                boolean zContainsTag;
                String str2;
                this.file = file;
                this.metadata = metadata;
                this.relativePath = str;
                ExifIFD0Directory exifIFD0Directory = (ExifIFD0Directory) metadata.getFirstDirectoryOfType(ExifIFD0Directory.class);
                ExifSubIFDDirectory exifSubIFDDirectory = (ExifSubIFDDirectory) metadata.getFirstDirectoryOfType(ExifSubIFDDirectory.class);
                ExifThumbnailDirectory exifThumbnailDirectory = (ExifThumbnailDirectory) metadata.getFirstDirectoryOfType(ExifThumbnailDirectory.class);
                if (exifIFD0Directory != null) {
                    this.manufacturer = exifIFD0Directory.getDescription(271);
                    this.model = exifIFD0Directory.getDescription(272);
                }
                if (exifSubIFDDirectory != null) {
                    this.exifVersion = exifSubIFDDirectory.getDescription(ExifDirectoryBase.TAG_EXIF_VERSION);
                    zContainsTag = exifSubIFDDirectory.containsTag(ExifDirectoryBase.TAG_MAKERNOTE);
                } else {
                    zContainsTag = false;
                }
                if (exifThumbnailDirectory != null) {
                    Integer integer = exifThumbnailDirectory.getInteger(256);
                    Integer integer2 = exifThumbnailDirectory.getInteger(257);
                    if (integer == null || integer2 == null) {
                        str2 = "Yes";
                    } else {
                        str2 = "Yes (" + integer + " x " + integer2 + ")";
                    }
                    this.thumbnail = str2;
                }
                Iterator<Directory> it2 = metadata.getDirectories().iterator();
                while (true) {
                    if (!it2.hasNext()) {
                        break;
                    }
                    Directory next = it2.next();
                    if (next.getClass().getName().contains("Makernote")) {
                        this.makernote = next.getName().replace("Makernote", "").trim();
                        break;
                    }
                }
                if (this.makernote == null) {
                    this.makernote = zContainsTag ? "(Unknown)" : "N/A";
                }
            }
        }

        public MarkdownTableOutputHandler() {
            HashMap map = new HashMap();
            this._extensionEquivalence = map;
            this._rowListByExtension = new HashMap();
            map.put("jpeg", "jpg");
        }

        private void writeOutput(PrintStream printStream) throws IOException {
            OutputStreamWriter outputStreamWriter = new OutputStreamWriter(printStream);
            outputStreamWriter.write("# Image Database Summary\n\n");
            for (Map.Entry<String, List<Row>> entry : this._rowListByExtension.entrySet()) {
                outputStreamWriter.write("## " + entry.getKey().toUpperCase() + " Files\n\n");
                outputStreamWriter.write("File|Manufacturer|Model|Dir Count|Exif?|Makernote|Thumbnail|All Data\n");
                outputStreamWriter.write("----|------------|-----|---------|-----|---------|---------|--------\n");
                List<Row> value = entry.getValue();
                Collections.sort(value, new Comparator<Row>() { // from class: com.drew.tools.ProcessAllImagesInFolderUtility.MarkdownTableOutputHandler.1
                    @Override // java.util.Comparator
                    public final int compare(Row row, Row row2) {
                        int iCompare = StringUtil.compare(row.manufacturer, row2.manufacturer);
                        return iCompare != 0 ? iCompare : StringUtil.compare(row.model, row2.model);
                    }
                });
                for (Row row : value) {
                    String name = row.file.getName();
                    String str = row.relativePath;
                    String strUrlEncode = StringUtil.urlEncode(row.file.getName());
                    String str2 = "";
                    String str3 = row.manufacturer == null ? "" : row.manufacturer;
                    String str4 = row.model == null ? "" : row.model;
                    Integer numValueOf = Integer.valueOf(row.metadata.getDirectoryCount());
                    String str5 = row.exifVersion == null ? "" : row.exifVersion;
                    String str6 = row.makernote == null ? "" : row.makernote;
                    if (row.thumbnail != null) {
                        str2 = row.thumbnail;
                    }
                    outputStreamWriter.write(String.format("[%s](https://raw.githubusercontent.com/drewnoakes/metadata-extractor-images/master/%s/%s)|%s|%s|%d|%s|%s|%s|[metadata](https://raw.githubusercontent.com/drewnoakes/metadata-extractor-images/master/%s/metadata/%s.txt)\n", name, str, strUrlEncode, str3, str4, numValueOf, str5, str6, str2, row.relativePath, StringUtil.urlEncode(row.file.getName()).toLowerCase()));
                }
                outputStreamWriter.write(10);
            }
            outputStreamWriter.flush();
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandlerBase, com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public final void onExtractionSuccess(File file, Metadata metadata, String str, PrintStream printStream) {
            super.onExtractionSuccess(file, metadata, str, printStream);
            String extension = getExtension(file);
            if (extension == null) {
                return;
            }
            String lowerCase = extension.toLowerCase();
            if (this._extensionEquivalence.containsKey(lowerCase)) {
                lowerCase = this._extensionEquivalence.get(lowerCase);
            }
            List<Row> arrayList = this._rowListByExtension.get(lowerCase);
            if (arrayList == null) {
                arrayList = new ArrayList<>();
                this._rowListByExtension.put(lowerCase, arrayList);
            }
            arrayList.add(new Row(file, metadata, str));
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandlerBase, com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public final void onScanCompleted(PrintStream printStream) throws Throwable {
            FileOutputStream fileOutputStream;
            PrintStream printStream2;
            super.onScanCompleted(printStream);
            PrintStream printStream3 = null;
            try {
                try {
                    try {
                        fileOutputStream = new FileOutputStream("../wiki/ImageDatabaseSummary.md", false);
                        try {
                            printStream2 = new PrintStream((OutputStream) fileOutputStream, false);
                        } catch (IOException e) {
                            e = e;
                        }
                    } catch (Throwable th) {
                        th = th;
                    }
                    try {
                        writeOutput(printStream2);
                        printStream2.flush();
                        printStream2.close();
                        fileOutputStream.close();
                    } catch (IOException e2) {
                        e = e2;
                        printStream3 = printStream2;
                        e.printStackTrace();
                        if (printStream3 != null) {
                            printStream3.close();
                        }
                        if (fileOutputStream != null) {
                            fileOutputStream.close();
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        printStream3 = printStream2;
                        if (printStream3 != null) {
                            printStream3.close();
                        }
                        if (fileOutputStream != null) {
                            try {
                                fileOutputStream.close();
                            } catch (IOException e3) {
                                e3.printStackTrace();
                            }
                        }
                        throw th;
                    }
                } catch (IOException e4) {
                    e = e4;
                    fileOutputStream = null;
                } catch (Throwable th3) {
                    th = th3;
                    fileOutputStream = null;
                }
            } catch (IOException e5) {
                e5.printStackTrace();
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class TextFileOutputHandler extends FileHandlerBase {
        private static final String NEW_LINE = "\n";

        private static void closeWriter(Writer writer) throws IOException {
            if (writer != null) {
                writer.write("Generated using metadata-extractor\n");
                writer.write("https://drewnoakes.com/code/exif/\n");
                writer.flush();
                writer.close();
            }
        }

        private static void deleteRecursively(File file) {
            String[] list;
            if (!file.isDirectory()) {
                ay0.e("Must be a directory.");
                return;
            }
            if (file.exists() && (list = file.list()) != null) {
                for (String str : list) {
                    File file2 = new File(str);
                    if (file2.isDirectory()) {
                        deleteRecursively(file2);
                    } else {
                        file2.delete();
                    }
                }
            }
            file.delete();
        }

        private static PrintWriter openWriter(File file) throws Throwable {
            File file2 = new File(km4.y(file.getParent(), "/metadata"));
            if (!file2.exists()) {
                file2.mkdir();
            }
            File file3 = new File(km4.y(file.getParent(), "/metadata/java"));
            if (!file3.exists()) {
                file3.mkdir();
            }
            OutputStreamWriter outputStreamWriter = new OutputStreamWriter(new FileOutputStream(file.getParent() + "/metadata/java/" + file.getName() + ".txt"), "UTF-8");
            StringBuilder sb = new StringBuilder("FILE: ");
            sb.append(file.getName());
            sb.append(NEW_LINE);
            outputStreamWriter.write(sb.toString());
            BufferedInputStream bufferedInputStream = null;
            try {
                BufferedInputStream bufferedInputStream2 = new BufferedInputStream(new FileInputStream(file));
                try {
                    outputStreamWriter.write("TYPE: " + FileTypeDetector.detectFileType(bufferedInputStream2, file.getName()).toString().toUpperCase() + NEW_LINE);
                    outputStreamWriter.write(NEW_LINE);
                    bufferedInputStream2.close();
                    return new PrintWriter(outputStreamWriter);
                } catch (Throwable th) {
                    th = th;
                    bufferedInputStream = bufferedInputStream2;
                    if (bufferedInputStream != null) {
                        bufferedInputStream.close();
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
            }
        }

        /* JADX WARN: Removed duplicated region for block: B:16:0x002d A[LOOP:1: B:14:0x0029->B:16:0x002d, LOOP_END] */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        private static void writeHierarchyLevel(com.drew.metadata.Metadata r4, java.io.PrintWriter r5, com.drew.metadata.Directory r6, int r7) {
            /*
                java.lang.Iterable r0 = r4.getDirectories()
                java.util.Iterator r0 = r0.iterator()
            L8:
                boolean r1 = r0.hasNext()
                if (r1 == 0) goto L4c
                java.lang.Object r1 = r0.next()
                com.drew.metadata.Directory r1 = (com.drew.metadata.Directory) r1
                if (r6 != 0) goto L1d
                com.drew.metadata.Directory r2 = r1.getParent()
                if (r2 == 0) goto L28
                goto L8
            L1d:
                com.drew.metadata.Directory r2 = r1.getParent()
                boolean r2 = r6.equals(r2)
                if (r2 != 0) goto L28
                goto L8
            L28:
                r2 = 0
            L29:
                int r3 = r7 * 4
                if (r2 >= r3) goto L35
                r3 = 32
                r5.write(r3)
                int r2 = r2 + 1
                goto L29
            L35:
                java.lang.String r2 = "- "
                r5.write(r2)
                java.lang.String r2 = r1.getName()
                r5.write(r2)
                java.lang.String r2 = "\n"
                r5.write(r2)
                int r2 = r7 + 1
                writeHierarchyLevel(r4, r5, r1, r2)
                goto L8
            L4c:
                return
            */
            throw new UnsupportedOperationException("Method not decompiled: com.drew.tools.ProcessAllImagesInFolderUtility.TextFileOutputHandler.writeHierarchyLevel(com.drew.metadata.Metadata, java.io.PrintWriter, com.drew.metadata.Directory, int):void");
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandlerBase, com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public final void onBeforeExtraction(File file, PrintStream printStream, String str) {
            super.onBeforeExtraction(file, printStream, str);
            printStream.print(file.getAbsoluteFile());
            printStream.print(NEW_LINE);
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandlerBase, com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public final void onExtractionError(File file, Throwable th, PrintStream printStream) throws Throwable {
            PrintWriter printWriterOpenWriter;
            super.onExtractionError(file, th, printStream);
            try {
                try {
                    printWriterOpenWriter = openWriter(file);
                    try {
                        printWriterOpenWriter.write("EXCEPTION: " + th.getMessage() + NEW_LINE);
                        printWriterOpenWriter.write(NEW_LINE);
                        closeWriter(printWriterOpenWriter);
                    } catch (Throwable th2) {
                        th = th2;
                        closeWriter(printWriterOpenWriter);
                        throw th;
                    }
                } catch (IOException e) {
                    printStream.printf("IO exception writing metadata file: %s%s", e.getMessage(), NEW_LINE);
                }
            } catch (Throwable th3) {
                th = th3;
                printWriterOpenWriter = null;
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Removed duplicated region for block: B:118:0x01a0 A[SYNTHETIC] */
        /* JADX WARN: Removed duplicated region for block: B:83:0x0196 A[Catch: all -> 0x0055, TryCatch #4 {all -> 0x0055, blocks: (B:4:0x0008, B:7:0x0014, B:8:0x001c, B:10:0x0022, B:13:0x002f, B:14:0x0037, B:16:0x003d, B:19:0x0059, B:20:0x005c, B:21:0x0064, B:23:0x006a, B:24:0x007d, B:27:0x0085, B:28:0x0090, B:36:0x00b7, B:38:0x00bb, B:41:0x00c3, B:32:0x009c, B:42:0x00dc, B:44:0x00e6, B:45:0x00e9, B:47:0x00ed, B:48:0x00f3, B:50:0x0106, B:52:0x010c, B:69:0x015a, B:71:0x0165, B:81:0x0191, B:83:0x0196, B:59:0x0128, B:61:0x012e, B:63:0x0142, B:86:0x01a7), top: B:100:0x0008, inners: #5 }] */
        /* JADX WARN: Type inference failed for: r0v15, types: [w9f] */
        /* JADX WARN: Type inference failed for: r20v1 */
        /* JADX WARN: Type inference failed for: r20v10 */
        /* JADX WARN: Type inference failed for: r20v11 */
        /* JADX WARN: Type inference failed for: r20v12 */
        /* JADX WARN: Type inference failed for: r20v13 */
        /* JADX WARN: Type inference failed for: r20v14 */
        /* JADX WARN: Type inference failed for: r20v18 */
        /* JADX WARN: Type inference failed for: r20v19 */
        /* JADX WARN: Type inference failed for: r20v2 */
        /* JADX WARN: Type inference failed for: r20v3 */
        /* JADX WARN: Type inference failed for: r20v4 */
        /* JADX WARN: Type inference failed for: r20v5 */
        /* JADX WARN: Type inference failed for: r20v6 */
        /* JADX WARN: Type inference failed for: r20v7 */
        /* JADX WARN: Type inference failed for: r20v8 */
        /* JADX WARN: Type inference failed for: r20v9 */
        /* JADX WARN: Type inference failed for: r3v8, types: [cw8, td] */
        /* JADX WARN: Type inference failed for: r5v0 */
        /* JADX WARN: Type inference failed for: r5v1, types: [boolean, int] */
        /* JADX WARN: Type inference failed for: r5v2 */
        /* JADX WARN: Type inference failed for: r5v3 */
        /* JADX WARN: Type inference failed for: r5v4 */
        /* JADX WARN: Type inference failed for: r5v7 */
        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandlerBase, com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public final void onExtractionSuccess(java.io.File r17, com.drew.metadata.Metadata r18, java.lang.String r19, java.io.PrintStream r20) throws java.lang.Throwable {
            /*
                Method dump skipped, instruction units count: 445
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.drew.tools.ProcessAllImagesInFolderUtility.TextFileOutputHandler.onExtractionSuccess(java.io.File, com.drew.metadata.Metadata, java.lang.String, java.io.PrintStream):void");
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandlerBase, com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public final void onStartingDirectory(File file) {
            File file2 = new File(file + "/metadata/java");
            if (file2.exists()) {
                deleteRecursively(file2);
            }
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class UnknownTagHandler extends FileHandlerBase {
        private HashMap<String, HashMap<Integer, Integer>> _occurrenceCountByTagByDirectory = new HashMap<>();

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandlerBase, com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public final void onExtractionSuccess(File file, Metadata metadata, String str, PrintStream printStream) {
            super.onExtractionSuccess(file, metadata, str, printStream);
            for (Directory directory : metadata.getDirectories()) {
                for (Tag tag : directory.getTags()) {
                    if (!tag.hasTagName()) {
                        HashMap<Integer, Integer> map = this._occurrenceCountByTagByDirectory.get(directory.getName());
                        if (map == null) {
                            map = new HashMap<>();
                            this._occurrenceCountByTagByDirectory.put(directory.getName(), map);
                        }
                        Integer num = map.get(Integer.valueOf(tag.getTagType()));
                        if (num == null) {
                            map.put(Integer.valueOf(tag.getTagType()), 0);
                            num = 0;
                        }
                        map.put(Integer.valueOf(tag.getTagType()), Integer.valueOf(num.intValue() + 1));
                    }
                }
            }
        }

        @Override // com.drew.tools.ProcessAllImagesInFolderUtility.FileHandlerBase, com.drew.tools.ProcessAllImagesInFolderUtility.FileHandler
        public final void onScanCompleted(PrintStream printStream) {
            super.onScanCompleted(printStream);
            for (Map.Entry<String, HashMap<Integer, Integer>> entry : this._occurrenceCountByTagByDirectory.entrySet()) {
                String key = entry.getKey();
                ArrayList<Map.Entry> arrayList = new ArrayList(entry.getValue().entrySet());
                Collections.sort(arrayList, new Comparator<Map.Entry<Integer, Integer>>() { // from class: com.drew.tools.ProcessAllImagesInFolderUtility.UnknownTagHandler.1
                    @Override // java.util.Comparator
                    public final int compare(Map.Entry<Integer, Integer> entry2, Map.Entry<Integer, Integer> entry3) {
                        return entry3.getValue().compareTo(entry2.getValue());
                    }
                });
                for (Map.Entry entry2 : arrayList) {
                    printStream.format("%s, 0x%04X, %d\n", key, (Integer) entry2.getKey(), (Integer) entry2.getValue());
                }
            }
        }
    }

    public static void main(String[] strArr) {
        Locale.setDefault(new Locale("en", "US"));
        System.setProperty("user.timezone", "Australia/Sydney");
        ArrayList arrayList = new ArrayList();
        PrintStream printStream = System.out;
        FileHandler basicFileHandler = null;
        int i = 0;
        while (i < strArr.length) {
            String str = strArr[i];
            if (str.equalsIgnoreCase("--text")) {
                basicFileHandler = new TextFileOutputHandler();
            } else if (str.equalsIgnoreCase("--markdown")) {
                basicFileHandler = new MarkdownTableOutputHandler();
            } else if (str.equalsIgnoreCase("--unknown")) {
                basicFileHandler = new UnknownTagHandler();
            } else if (str.equalsIgnoreCase("--log-file")) {
                if (i == strArr.length - 1) {
                    printUsage();
                    System.exit(1);
                }
                i++;
                printStream = new PrintStream((OutputStream) new FileOutputStream(strArr[i], false), true);
            } else {
                arrayList.add(str);
            }
            i++;
        }
        if (arrayList.isEmpty()) {
            System.err.println("Expects one or more directories as arguments.");
            printUsage();
            System.exit(1);
        }
        if (basicFileHandler == null) {
            basicFileHandler = new BasicFileHandler();
        }
        long jNanoTime = System.nanoTime();
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            processDirectory(new File((String) it2.next()), basicFileHandler, "", printStream);
        }
        basicFileHandler.onScanCompleted(printStream);
        System.out.println(String.format("Completed in %d ms", Long.valueOf((System.nanoTime() - jNanoTime) / 1000000)));
        if (printStream != System.out) {
            printStream.close();
        }
    }

    private static void printUsage() {
        System.out.println("Usage:");
        System.out.println();
        System.out.println("  java com.drew.tools.ProcessAllImagesInFolderUtility [--text|--markdown|--unknown] [--log-file <file-name>]");
    }

    private static void processDirectory(File file, FileHandler fileHandler, String str, PrintStream printStream) {
        fileHandler.onStartingDirectory(file);
        String[] list = file.list();
        if (list == null) {
            return;
        }
        Arrays.sort(list);
        for (String strX : list) {
            File file2 = new File(file, strX);
            if (file2.isDirectory()) {
                if (str.length() != 0) {
                    strX = ev6.x(str, "/", strX);
                }
                processDirectory(file2, fileHandler, strX, printStream);
            } else if (fileHandler.shouldProcess(file2)) {
                fileHandler.onBeforeExtraction(file2, printStream, str);
                try {
                    fileHandler.onExtractionSuccess(file2, ImageMetadataReader.readMetadata(file2), str, printStream);
                } catch (Throwable th) {
                    fileHandler.onExtractionError(file2, th, printStream);
                }
            }
        }
    }
}
