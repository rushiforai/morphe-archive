package app.voidhack.extension.applemusic.font;

import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/**
 * Pure Java OpenType / TrueType / TTC header & table inspector.
 * Validates font binaries, extracts family name, static OS/2 weight, Variable Font wght/opsz axis ranges,
 * and enumerates faces inside TrueType Collections (.ttc).
 */
final class FontInspector {
    private static final int TAG_OTTO = 0x4F54544F; // 'OTTO'
    private static final int TAG_TRUE = 0x74727565; // 'true'
    private static final int TAG_TTCF = 0x74746366; // 'ttcf'
    private static final int TAG_NAME = 0x6E616D65; // 'name'
    private static final int TAG_OS2  = 0x4F532F32; // 'OS/2'
    private static final int TAG_FVAR = 0x66766172; // 'fvar'
    private static final int TAG_WGHT = 0x77676874; // 'wght'
    private static final int TAG_OPSZ = 0x6F70737A; // 'opsz'
    private static final int MAX_TTC_FACES = 32;

    private FontInspector() {}

    static final class FaceInfo {
        final int ttcIndex;
        final String familyName;
        final int weight;
        final boolean italic;
        final boolean hasWghtAxis;
        final int minWeight;
        final int maxWeight;
        final boolean hasOpszAxis;
        final float minOpsz;
        final float maxOpsz;

        FaceInfo(int ttcIndex, String familyName, int weight, boolean italic,
                 boolean hasWghtAxis, int minWeight, int maxWeight,
                 boolean hasOpszAxis, float minOpsz, float maxOpsz) {
            this.ttcIndex = ttcIndex;
            this.familyName = familyName == null ? "" : familyName;
            this.weight = clamp(weight, 100, 1000);
            this.italic = italic;
            this.hasWghtAxis = hasWghtAxis;
            this.minWeight = minWeight;
            this.maxWeight = maxWeight;
            this.hasOpszAxis = hasOpszAxis;
            this.minOpsz = minOpsz;
            this.maxOpsz = maxOpsz;
        }
    }

    static final class FontInfo {
        final boolean valid;
        final boolean isCollection;
        final String displayName;
        final long fileSizeBytes;
        final List<FaceInfo> faces;

        FontInfo(boolean valid, boolean isCollection, String displayName, long fileSizeBytes, List<FaceInfo> faces) {
            this.valid = valid;
            this.isCollection = isCollection;
            this.displayName = displayName == null ? "" : displayName;
            this.fileSizeBytes = fileSizeBytes;
            this.faces = faces == null ? Collections.emptyList() : faces;
        }

        FaceInfo primaryFace() {
            return faces.isEmpty() ? null : faces.get(0);
        }

        boolean isVariableWeight() {
            FaceInfo primary = primaryFace();
            return primary != null && primary.hasWghtAxis;
        }

        static FontInfo invalid() {
            return new FontInfo(false, false, "", 0L, Collections.emptyList());
        }
    }

    static FontInfo inspect(File file) {
        if (file == null || !file.isFile() || file.length() < 12L) {
            return FontInfo.invalid();
        }
        try (RandomAccessFile raf = new RandomAccessFile(file, "r")) {
            return inspectStream(raf, file.length(), file.getName());
        } catch (IOException e) {
            return FontInfo.invalid();
        }
    }

    static FontInfo inspectBytes(byte[] data, String fallbackName) {
        if (data == null || data.length < 12) return FontInfo.invalid();
        File tmp = null;
        try {
            tmp = File.createTempFile("font_inspect_", ".tmp");
            try (java.io.FileOutputStream out = new java.io.FileOutputStream(tmp)) {
                out.write(data);
            }
            try (RandomAccessFile raf = new RandomAccessFile(tmp, "r")) {
                return inspectStream(raf, data.length, fallbackName);
            }
        } catch (IOException e) {
            return FontInfo.invalid();
        } finally {
            if (tmp != null) tmp.delete();
        }
    }

    private static FontInfo inspectStream(RandomAccessFile raf, long fileLen, String fallbackName) throws IOException {
        raf.seek(0);
        int magic = raf.readInt();

        boolean isCollection = (magic == TAG_TTCF);
        List<Long> faceOffsets = new ArrayList<>();
        if (isCollection) {
            if (fileLen < 16L) return FontInfo.invalid();
            raf.readUnsignedShort(); // majorVersion
            raf.readUnsignedShort(); // minorVersion
            long numFonts = raf.readInt() & 0xFFFFFFFFL;
            if (numFonts <= 0L || numFonts > 256L) return FontInfo.invalid();
            int count = (int) Math.min(numFonts, MAX_TTC_FACES);
            if (12L + count * 4L > fileLen) return FontInfo.invalid();
            for (int i = 0; i < count; i++) {
                long off = raf.readInt() & 0xFFFFFFFFL;
                if (off + 12L <= fileLen) {
                    faceOffsets.add(off);
                }
            }
            if (faceOffsets.isEmpty()) return FontInfo.invalid();
        } else if (isSingleFontMagic(magic)) {
            faceOffsets.add(0L);
        } else {
            return FontInfo.invalid();
        }

        List<FaceInfo> faces = new ArrayList<>(faceOffsets.size());
        for (int i = 0; i < faceOffsets.size(); i++) {
            FaceInfo face = parseFace(raf, fileLen, faceOffsets.get(i), i);
            if (face != null) faces.add(face);
        }
        if (faces.isEmpty()) return FontInfo.invalid();

        String displayName = "";
        for (FaceInfo f : faces) {
            if (!f.familyName.isEmpty()) {
                displayName = f.familyName;
                break;
            }
        }
        if (displayName.isEmpty()) {
            displayName = fallbackName != null ? fallbackName : "Custom Font";
        }
        return new FontInfo(true, isCollection && faces.size() > 1, displayName, fileLen, faces);
    }

    private static FaceInfo parseFace(RandomAccessFile raf, long fileLen, long offset, int ttcIndex) throws IOException {
        if (offset < 0L || offset + 12L > fileLen) return null;
        raf.seek(offset);
        int sfntVersion = raf.readInt();
        if (!isSingleFontMagic(sfntVersion)) return null;
        int numTables = raf.readUnsignedShort();
        if (numTables <= 0 || numTables > 256) return null;
        raf.skipBytes(6); // searchRange, entrySelector, rangeShift

        long nameOff = -1L, nameLen = 0L;
        long os2Off = -1L, os2Len = 0L;
        long fvarOff = -1L, fvarLen = 0L;

        for (int i = 0; i < numTables; i++) {
            if (raf.getFilePointer() + 16L > fileLen) break;
            int tag = raf.readInt();
            raf.readInt(); // checksum
            long tblOff = raf.readInt() & 0xFFFFFFFFL;
            long tblLen = raf.readInt() & 0xFFFFFFFFL;
            if (tblOff + tblLen > fileLen) continue;
            if (tag == TAG_NAME) {
                nameOff = tblOff;
                nameLen = tblLen;
            } else if (tag == TAG_OS2) {
                os2Off = tblOff;
                os2Len = tblLen;
            } else if (tag == TAG_FVAR) {
                fvarOff = tblOff;
                fvarLen = tblLen;
            }
        }

        String familyName = nameOff >= 0L ? parseFamilyName(raf, nameOff, nameLen) : "";
        int weight = 400;
        boolean italic = false;
        if (os2Off >= 0L && os2Len >= 64L) {
            raf.seek(os2Off + 4L);
            int usWeight = raf.readUnsignedShort();
            if (usWeight >= 100 && usWeight <= 1000) {
                weight = usWeight;
            }
            raf.seek(os2Off + 62L);
            int fsSelection = raf.readUnsignedShort();
            italic = (fsSelection & 0x01) != 0 || (fsSelection & 0x200) != 0;
        }

        boolean hasWght = false;
        int minW = weight;
        int maxW = weight;
        boolean hasOpsz = false;
        float minOpsz = 0f;
        float maxOpsz = 0f;

        if (fvarOff >= 0L && fvarLen >= 16L) {
            raf.seek(fvarOff + 4L);
            int axesArrayOffset = raf.readUnsignedShort();
            raf.readUnsignedShort(); // reserved
            int axisCount = raf.readUnsignedShort();
            int axisSize = raf.readUnsignedShort();
            if (axisSize >= 20 && axisCount > 0 && axisCount <= 64) {
                long cursor = fvarOff + axesArrayOffset;
                for (int a = 0; a < axisCount; a++) {
                    long entryStart = cursor + (long) a * axisSize;
                    if (entryStart + 20L > fvarOff + fvarLen) break;
                    raf.seek(entryStart);
                    int axisTag = raf.readInt();
                    float minVal = raf.readInt() / 65536.0f;
                    raf.readInt(); // defaultVal
                    float maxVal = raf.readInt() / 65536.0f;
                    if (axisTag == TAG_WGHT && maxVal > minVal) {
                        hasWght = true;
                        minW = clamp(Math.round(minVal), 1, 1000);
                        maxW = clamp(Math.round(maxVal), 1, 1000);
                    } else if (axisTag == TAG_OPSZ && maxVal > minVal) {
                        hasOpsz = true;
                        minOpsz = minVal;
                        maxOpsz = maxVal;
                    }
                }
            }
        }

        return new FaceInfo(ttcIndex, familyName, weight, italic, hasWght, minW, maxW, hasOpsz, minOpsz, maxOpsz);
    }

    private static String parseFamilyName(RandomAccessFile raf, long tableOff, long tableLen) throws IOException {
        if (tableLen < 6L) return "";
        raf.seek(tableOff);
        raf.readUnsignedShort(); // format
        int count = raf.readUnsignedShort();
        int stringOffset = raf.readUnsignedShort();
        if (count <= 0 || count > 2048) return "";

        String preferredFamily = "";
        String basicFamily = "";
        String fullName = "";

        for (int i = 0; i < count; i++) {
            long recPos = tableOff + 6L + i * 12L;
            if (recPos + 12L > tableOff + tableLen) break;
            raf.seek(recPos);
            int platformId = raf.readUnsignedShort();
            raf.readUnsignedShort(); // encodingId
            int langId = raf.readUnsignedShort();
            int nameId = raf.readUnsignedShort();
            int length = raf.readUnsignedShort();
            int offset = raf.readUnsignedShort();

            if (nameId != 1 && nameId != 4 && nameId != 16) continue;
            if (length <= 0 || length > 512) continue;
            long strPos = tableOff + stringOffset + offset;
            if (strPos + length > tableOff + tableLen) continue;

            boolean isUtf16 = (platformId == 3 || platformId == 0);
            boolean isMacRoman = (platformId == 1);
            if (!isUtf16 && !isMacRoman) continue;

            byte[] buf = new byte[length];
            raf.seek(strPos);
            raf.readFully(buf);
            String decoded = new String(buf, isUtf16 ? StandardCharsets.UTF_16BE : StandardCharsets.ISO_8859_1).trim();
            if (decoded.isEmpty()) continue;

            boolean preferLang = (platformId == 3 && (langId == 0x0409 || langId == 0x0411)) || platformId == 0;
            if (nameId == 16 && (preferredFamily.isEmpty() || preferLang)) {
                preferredFamily = decoded;
            } else if (nameId == 1 && (basicFamily.isEmpty() || preferLang)) {
                basicFamily = decoded;
            } else if (nameId == 4 && (fullName.isEmpty() || preferLang)) {
                fullName = decoded;
            }
        }

        if (!preferredFamily.isEmpty()) return preferredFamily;
        if (!basicFamily.isEmpty()) return basicFamily;
        return fullName;
    }

    private static boolean isSingleFontMagic(int magic) {
        return magic == 0x00010000 || magic == TAG_OTTO || magic == TAG_TRUE;
    }

    static int effectiveWeight(int requestedWeight, int weightOffset) {
        int base = requestedWeight <= 0 ? 400 : requestedWeight;
        return clamp(base + weightOffset, 100, 900);
    }

    static int clampVariableWeight(int targetWeight, FaceInfo face) {
        if (face == null || !face.hasWghtAxis) return clamp(targetWeight, 100, 900);
        return clamp(targetWeight, face.minWeight, face.maxWeight);
    }

    static boolean shouldUseBoldSlot(int effectiveWeight, boolean hasBoldSlot) {
        return hasBoldSlot && effectiveWeight >= 600;
    }

    static String formatSize(long bytes) {
        if (bytes < 1024L) return bytes + " B";
        if (bytes < 1024L * 1024L) return String.format(Locale.ROOT, "%.0f KB", bytes / 1024.0);
        return String.format(Locale.ROOT, "%.1f MB", bytes / (1024.0 * 1024.0));
    }

    static int clamp(int value, int min, int max) {
        return Math.max(min, Math.min(max, value));
    }
}
