package santodan.patches;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Best-effort structural premium transformation for Car Scanner builds whose
 * assembly store, managed assembly and AOT image are not one of the reviewed
 * exact layouts. Used only by the unrestricted experimental patch.
 *
 * <p>The managed targets are located by their stable metadata identities
 * (method name plus signature) rather than by image hash, the AOT bodies by the
 * {@code mono_aot_file_info} method-address table, and the store is rebuilt with
 * the same generic plain-PE placement the exact implementations use. The
 * repackaging guard and the settings/profile decoder are verified at their known
 * instruction words. Anything that cannot be located with confidence throws, so a
 * corrupt store is never written. This is not an automatic port: genuinely changed
 * future binaries may still fail here and need review.</p>
 */
public final class CarScannerGeneric {
    public static final String ENTRY = "lib/arm64-v8a/libassembly-store.so";
    public static final String AOT_ENTRY = "lib/arm64-v8a/libaot-CarScannerMaui.dll.so";
    public static final String GUARD_ENTRY = "lib/arm64-v8a/libusbtransport.so";
    public static final String DECODER_ENTRY = "lib/arm64-v8a/libvndctx.so";
    private static final int PAYLOAD = 16384;
    private static final byte[] MARKER = "CarScannerMaui.dll".getBytes(java.nio.charset.StandardCharsets.US_ASCII);
    private static final int AOT_FORMAT = 187;
    private CarScannerGeneric() {}

    public static Result patch(byte[] store, byte[] aot, byte[] guard) {
        check(integer(store, PAYLOAD) == 0x41424158, "Unexpected assembly store (no XABA header)");
        int count = integer(store, PAYLOAD + 8);
        int indexBytes = integer(store, PAYLOAD + 16);
        int descriptors = PAYLOAD + 20 + indexBytes;
        check(count > 0 && count < 4096 && descriptors < store.length, "Unexpected XABA index");

        // Locate the main application assembly by content. The app assembly is by
        // far the largest; decode largest-first and confirm the marker.
        int target = -1, start = 0, size = 0;
        byte[] image = null;
        Integer[] order = new Integer[count];
        for (int i = 0; i < count; i++) order[i] = i;
        final byte[] fStore = store;
        final int fDesc = descriptors;
        Arrays.sort(order, (a, b) -> Integer.compareUnsigned(
            integer(fStore, fDesc + b * 28 + 8), integer(fStore, fDesc + a * 28 + 8)));
        for (int i : order) {
            int d = descriptors + i * 28;
            int s = PAYLOAD + integer(store, d + 4);
            int sz = integer(store, d + 8);
            if (sz < 12 || s < 0 || s + sz > store.length) continue;
            if (integer(store, s) != 0x5a4c4158) continue; // XALZ
            int decoded = integer(store, s + 8);
            byte[] candidate = CarScannerAssemblyStore.decodeLz4(store, s + 12, s + sz, decoded);
            if (indexOf(candidate, MARKER) >= 0) {
                target = i; start = s; size = sz; image = candidate; break;
            }
        }
        check(target >= 0, "Could not locate the CarScannerMaui.dll assembly in the store");

        // Rewrite the managed premium getter and ECU certificate predicate by
        // their stable metadata identities (name + signature).
        Meta meta = new Meta(image);
        int[] getter = meta.find("get_AdsProductPurchased", new byte[] {0x20, 0x00, 0x02});
        int[] predicate = meta.find("<Initialize>b__181_0", new byte[] {0x20, 0x01, 0x02, 0x0e});
        rewriteBoolean(image, meta.rva2off(getter[1]));
        rewriteBoolean(image, meta.rva2off(predicate[1]));

        // Rebuild the store with the managed image as a plain PE, four-byte aligned.
        byte[] result = rebuildStore(store, descriptors, count, target, start, size, image);

        // Patch the compiled AOT bodies for the same two methods.
        byte[] nativeImage = patchAot(aot, new int[] {getter[0] & 0xffffff, predicate[0] & 0xffffff});

        // Disable the repackaging failure-exit scheduler.
        byte[] nativeGuard = patchGuard(guard);

        return new Result(result, nativeImage, nativeGuard);
    }

    /** Settings/profile decoder: verified at its known seed-selection words. */
    public static byte[] patchDecoder(byte[] original) {
        check(integer(original, 0x25d68) == 0x1a881128, "Unexpected profile seed selection");
        check(integer(original, 0x23fcc) == 0x1a881128, "Unexpected settings seed selection");
        byte[] result = original.clone();
        putInt(result, 0x25d68, 0x2a0903e8); // mov w8,w9: normal seed; transform stays intact
        putInt(result, 0x23fcc, 0x2a0903e8);
        return result;
    }

    private static byte[] patchGuard(byte[] guard) {
        // The failure-only scheduler creates a sleeping thread ending in _exit(0).
        // It has been byte-identical across reviewed versions; verify its prologue
        // word before disabling it, and fail safe otherwise.
        check(integer(guard, 0x2abf0) == 0xa9bd7bfd, "Unexpected exit scheduler; cannot disable repackaging guard");
        byte[] result = guard.clone();
        putInt(result, 0x2abf0, 0xd65f03c0); // return before scheduling _exit
        return result;
    }

    private static byte[] patchAot(byte[] aot, int[] methodRows) {
        Elf elf = new Elf(aot);
        long base = elf.symbolValue("mono_aot_file_info");
        check(base != 0, "mono_aot_file_info not found");
        check(integer(aot, elf.off(base)) == AOT_FORMAT, "Unexpected AOT format");
        long table = elf.relativeAddend(base + 64);
        check(table != 0, "method-address table relocation not found");
        byte[] result = aot.clone();
        for (int row : methodRows) {
            long slot = table + (long) (row - 1) * 4;
            int word = integer(aot, elf.off(slot));
            int disp = word & 0x03ffffff;
            if ((disp & (1 << 25)) != 0) disp -= (1 << 26);
            long tgt = slot + (long) disp * 4;
            if (tgt == table) continue; // sentinel: no compiled body, IL rewrite suffices
            int bodyOff = elf.off(tgt);
            int prologue = integer(aot, bodyOff);
            check((prologue & 0xfff0ffff) == 0xa9b07bfd,
                "Unexpected AOT body prologue; cannot confirm compiled method entry");
            putInt(result, bodyOff, 0x52800020); // mov w0, #1
            putInt(result, bodyOff + 4, 0xd65f03c0); // ret, before any stack changes
        }
        return result;
    }

    private static byte[] rebuildStore(byte[] store, int descriptors, int count,
                                       int target, int start, int size, byte[] image) {
        int leadingPadding = (-start) & 3;
        int imageStart = start + leadingPadding;
        int padding = (size - leadingPadding - image.length) & 7;
        int delta = leadingPadding + image.length + padding - size;
        byte[] result = new byte[Math.addExact(store.length, delta)];
        System.arraycopy(store, 0, result, 0, start);
        System.arraycopy(image, 0, result, imageStart, image.length);
        System.arraycopy(store, start + size, result, imageStart + image.length + padding, store.length - start - size);
        int end = start + size;
        for (int i = 0; i < count; i++) {
            int d = descriptors + i * 28;
            for (int offsetField : new int[] {4, 12, 20}) {
                int offset = integer(store, d + offsetField);
                if (offset != 0 && PAYLOAD + offset >= end)
                    putInt(result, d + offsetField, Math.addExact(offset, delta));
            }
        }
        int descriptor = descriptors + target * 28;
        putInt(result, descriptor + 4, imageStart - PAYLOAD);
        putInt(result, descriptor + 8, image.length);
        long oldHeaders = longInteger(store, 40);
        int newHeaders = Math.toIntExact(oldHeaders + delta);
        putLong(result, 40, newHeaders);
        int payloadSections = 0;
        int secCount = Short.toUnsignedInt(buffer(store).getShort(60));
        for (int i = 0; i < secCount; i++) {
            int original = Math.toIntExact(oldHeaders) + i * 64;
            int updated = newHeaders + i * 64;
            long offset = longInteger(store, original + 24);
            long length = longInteger(store, original + 32);
            if (offset == PAYLOAD) {
                check(offset + length >= end && integer(store, original + 4) == 1
                    && longInteger(store, original + 8) == 0, "Payload must be non-allocated PROGBITS");
                putLong(result, updated + 32, length + delta);
                payloadSections++;
            } else if (offset >= end) {
                putLong(result, updated + 24, offset + delta);
            }
        }
        check(payloadSections == 1, "Expected one ELF payload section");
        check((imageStart & 3) == 0 && result[imageStart] == 'M'
            && result[imageStart + 1] == 'Z', "Rebuilt image missing or unaligned");
        return result;
    }

    private static void rewriteBoolean(byte[] image, int body) {
        int first = image[body] & 0xff;
        int codeStart, length;
        if ((first & 3) == 2) { // tiny header
            codeStart = body + 1;
            length = first >>> 2;
        } else { // fat header
            int hdr = Short.toUnsignedInt(buffer(image).getShort(body));
            length = integer(image, body + 4);
            codeStart = body + ((hdr >>> 12) & 0xf) * 4;
        }
        check(length >= 2 && codeStart + length <= image.length, "Unexpected managed method body");
        Arrays.fill(image, codeStart, codeStart + length, (byte) 0);
        image[codeStart] = 0x17;     // ldc.i4.1
        image[codeStart + 1] = 0x2a; // ret
    }

    public static final class Result {
        private final byte[] store, aot, guard;
        private Result(byte[] store, byte[] aot, byte[] guard) {
            this.store = store; this.aot = aot; this.guard = guard;
        }
        public byte[] store() { return store; }
        public byte[] aot() { return aot; }
        public byte[] guard() { return guard; }
    }

    /** Minimal read-only ELF64 helper for the AOT image. */
    private static final class Elf {
        private final byte[] b;
        private final long shoff;
        private final int shnum;
        Elf(byte[] bytes) {
            this.b = bytes;
            check(b.length > 64 && b[0] == 0x7f && b[1] == 'E' && b[2] == 'L' && b[3] == 'F', "Not an ELF image");
            this.shoff = longInteger(b, 40);
            this.shnum = Short.toUnsignedInt(buffer(b).getShort(60));
        }
        private long sh(int i, int field) { return longInteger(b, Math.toIntExact(shoff) + i * 64 + field); }
        private int shi(int i, int field) { return integer(b, Math.toIntExact(shoff) + i * 64 + field); }
        int off(long va) {
            for (int i = 0; i < shnum; i++) {
                if (shi(i, 4) == 8) continue; // SHT_NOBITS
                long addr = sh(i, 16), sz = sh(i, 32);
                if (addr <= va && va < addr + sz) return Math.toIntExact(sh(i, 24) + (va - addr));
            }
            throw new IllegalStateException(prefix("virtual address not mapped: 0x" + Long.toHexString(va)));
        }
        long symbolValue(String name) {
            byte[] want = name.getBytes(java.nio.charset.StandardCharsets.US_ASCII);
            for (int i = 0; i < shnum; i++) {
                if (shi(i, 4) != 11) continue; // SHT_DYNSYM
                int strOff = Math.toIntExact(sh(shi(i, 40), 24));
                int base = Math.toIntExact(sh(i, 24)), size = Math.toIntExact(sh(i, 32));
                for (int o = base; o + 24 <= base + size; o += 24) {
                    int nameIdx = integer(b, o);
                    if (matchStr(strOff + nameIdx, want)) return longInteger(b, o + 8);
                }
            }
            return 0;
        }
        long relativeAddend(long atVa) {
            int wantOff = off(atVa);
            for (int i = 0; i < shnum; i++) {
                if (shi(i, 4) != 4) continue; // SHT_RELA
                int base = Math.toIntExact(sh(i, 24)), size = Math.toIntExact(sh(i, 32));
                for (int o = base; o + 24 <= base + size; o += 24) {
                    long roff = longInteger(b, o);
                    long info = longInteger(b, o + 8);
                    if (info == 1027 && off(roff) == wantOff) return longInteger(b, o + 16); // R_AARCH64_RELATIVE
                }
            }
            return 0;
        }
        private boolean matchStr(int off, byte[] want) {
            if (off + want.length + 1 > b.length) return false;
            for (int k = 0; k < want.length; k++) if (b[off + k] != want[k]) return false;
            return b[off + want.length] == 0;
        }
    }

    /** Minimal read-only .NET metadata reader for the decoded managed assembly. */
    private static final class Meta {
        private final byte[] d;
        private final List<long[]> sections = new ArrayList<>(); // {vaddr, vsize, rawptr, rawsize}
        private int stringsOff, blobOff, tableBase, mdStart, mdRowSize, mdCount;
        private boolean strWide, blobWide;
        Meta(byte[] data) {
            this.d = data;
            int pe = integer(d, 0x3c);
            check(d[pe] == 'P' && d[pe + 1] == 'E', "Not a PE image");
            int nsec = Short.toUnsignedInt(buffer(d).getShort(pe + 6));
            int optsz = Short.toUnsignedInt(buffer(d).getShort(pe + 20));
            int opt = pe + 24;
            boolean plus = Short.toUnsignedInt(buffer(d).getShort(opt)) == 0x20b;
            int ddBase = opt + (plus ? 112 : 96);
            int comRva = integer(d, ddBase + 14 * 8);
            int sh = opt + optsz;
            for (int i = 0; i < nsec; i++) {
                int base = sh + i * 40;
                sections.add(new long[] {integer(d, base + 12), integer(d, base + 8),
                    integer(d, base + 20), integer(d, base + 16)});
            }
            int com = rva2off(comRva);
            int metaRva = integer(d, com + 8);
            parseMetadata(rva2off(metaRva));
        }
        int rva2off(int rva) {
            for (long[] s : sections) {
                long va = s[0], span = Math.max(s[1], s[3]);
                if (va <= rva && rva < va + span) return Math.toIntExact(s[2] + (rva - va));
            }
            throw new IllegalStateException(prefix("RVA not in a section: 0x" + Integer.toHexString(rva)));
        }
        private void parseMetadata(int base) {
            check(integer(d, base) == 0x424A5342, "Bad metadata signature");
            int verlen = integer(d, base + 12);
            int p = base + 16 + verlen + 2;
            int nstreams = Short.toUnsignedInt(buffer(d).getShort(p)); p += 2;
            int tildeOff = 0;
            for (int i = 0; i < nstreams; i++) {
                int soff = integer(d, p), ssize = integer(d, p + 4); p += 8;
                StringBuilder name = new StringBuilder();
                while (d[p] != 0) name.append((char) d[p++]);
                p++;
                while ((p - base) % 4 != 0) p++;
                switch (name.toString()) {
                    case "#Strings": stringsOff = base + soff; break;
                    case "#Blob": blobOff = base + soff; break;
                    case "#~": case "#-": tildeOff = base + soff; break;
                    default: break;
                }
            }
            check(tildeOff != 0 && stringsOff != 0 && blobOff != 0, "Missing metadata streams");
            parseTables(tildeOff);
        }
        private void parseTables(int base) {
            int heap = d[base + 6] & 0xff;
            strWide = (heap & 1) != 0;
            blobWide = (heap & 4) != 0;
            boolean guidWide = (heap & 2) != 0;
            long valid = longInteger(base + 8);
            int[] rc = new int[64];
            int p = base + 24;
            for (int t = 0; t < 64; t++) if ((valid >>> t & 1) != 0) { rc[t] = integer(d, p); p += 4; }
            int S = strWide ? 4 : 2, B = blobWide ? 4 : 2, G = guidWide ? 4 : 2;
            int rs = coded(rc, new int[] {0, 26, 35, 1});       // ResolutionScope
            int tdr = coded(rc, new int[] {2, 1, 27});          // TypeDefOrRef
            int[] sizes = new int[7];
            sizes[0] = 2 + S + 3 * G;
            sizes[1] = rs + 2 * S;
            sizes[2] = 4 + 2 * S + tdr + simple(rc, 4) + simple(rc, 6);
            sizes[3] = simple(rc, 4);
            sizes[4] = 2 + S + B;
            sizes[5] = simple(rc, 6);
            sizes[6] = 4 + 2 + 2 + S + B + simple(rc, 8);
            for (int t = 0; t < 64; t++) {
                if ((valid >>> t & 1) == 0) continue;
                if (t == 6) { mdStart = p; break; }
                check(t < 7, "Unexpected metadata table before MethodDef");
                p += sizes[t] * rc[t];
            }
            mdRowSize = sizes[6];
            mdCount = rc[6];
        }
        /** @return {token, rva} for the unique method with this name and signature. */
        int[] find(String name, byte[] sig) {
            byte[] want = name.getBytes(java.nio.charset.StandardCharsets.US_ASCII);
            int found = -1, rva = 0;
            for (int i = 0; i < mdCount; i++) {
                int off = mdStart + i * mdRowSize;
                int q = off + 8;
                int nameIdx = strWide ? integer(d, q) : Short.toUnsignedInt(buffer(d).getShort(q));
                q += strWide ? 4 : 2;
                if (!matchStr(stringsOff + nameIdx, want)) continue;
                int sigIdx = blobWide ? integer(d, q) : Short.toUnsignedInt(buffer(d).getShort(q));
                if (!Arrays.equals(blob(sigIdx), sig)) continue;
                check(found < 0, "Ambiguous metadata target: " + name);
                found = i; rva = integer(d, off);
            }
            check(found >= 0 && rva != 0, "Managed target not found: " + name);
            return new int[] {0x06000000 | (found + 1), rva};
        }
        private byte[] blob(int idx) {
            int o = blobOff + idx;
            int b0 = d[o] & 0xff, len;
            if ((b0 & 0x80) == 0) { len = b0; o += 1; }
            else if ((b0 & 0xc0) == 0x80) { len = ((b0 & 0x3f) << 8) | (d[o + 1] & 0xff); o += 2; }
            else { len = ((b0 & 0x1f) << 24) | ((d[o + 1] & 0xff) << 16) | ((d[o + 2] & 0xff) << 8) | (d[o + 3] & 0xff); o += 4; }
            return Arrays.copyOfRange(d, o, o + len);
        }
        private boolean matchStr(int off, byte[] want) {
            if (off + want.length + 1 > d.length) return false;
            for (int k = 0; k < want.length; k++) if (d[off + k] != want[k]) return false;
            return d[off + want.length] == 0;
        }
        private long longInteger(int o) { return CarScannerGeneric.longInteger(d, o); }
        private static int simple(int[] rc, int t) { return rc[t] > 65535 ? 4 : 2; }
        private static int coded(int[] rc, int[] tables) {
            int tag = 32 - Integer.numberOfLeadingZeros(tables.length - 1);
            if ((1 << tag) < tables.length) tag++;
            int max = 0;
            for (int t : tables) max = Math.max(max, rc[t]);
            return max >= (1 << (16 - tag)) ? 4 : 2;
        }
    }

    private static int indexOf(byte[] haystack, byte[] needle) {
        outer:
        for (int i = 0; i <= haystack.length - needle.length; i++) {
            for (int j = 0; j < needle.length; j++) if (haystack[i + j] != needle[j]) continue outer;
            return i;
        }
        return -1;
    }

    static int integer(byte[] bytes, int offset) { return buffer(bytes).getInt(offset); }
    private static long longInteger(byte[] bytes, int offset) { return buffer(bytes).getLong(offset); }
    private static void putInt(byte[] bytes, int offset, int value) { buffer(bytes).putInt(offset, value); }
    private static void putLong(byte[] bytes, int offset, long value) { buffer(bytes).putLong(offset, value); }
    private static ByteBuffer buffer(byte[] bytes) { return ByteBuffer.wrap(bytes).order(ByteOrder.LITTLE_ENDIAN); }
    private static String prefix(String message) { return "Car Scanner (experimental generic): " + message; }
    private static void check(boolean condition, String message) {
        if (!condition) throw new IllegalStateException(prefix(message));
    }
}
