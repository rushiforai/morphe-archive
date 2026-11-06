package app.morphe.extension.youtube.bilibilidanmaku;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;

/**
 * Minimal QR Code Model 2 encoder (byte mode, error correction level M) used only to
 * display the Bilibili login link. Pure Java so it can be unit tested on the JVM and
 * does not depend on any library inside the patched host application.
 */
final class BilibiliQrCode {
    // Error correction level M. Index 0 is unused.
    private static final int[] ECC_PER_BLOCK = {
            -1, 10, 16, 26, 18, 24, 16, 18, 22, 22, 26, 30, 22, 22, 24, 24, 28, 28, 26, 26, 26,
            26, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28, 28};
    private static final int[] BLOCKS = {
            -1, 1, 1, 1, 2, 2, 4, 4, 4, 5, 5, 5, 8, 9, 9, 10, 10, 11, 13, 14, 16,
            17, 17, 18, 20, 21, 23, 25, 26, 28, 29, 31, 33, 35, 37, 38, 40, 43, 45, 47, 49};
    private static final int FORMAT_BITS_M = 0;

    final int version;
    final int size;
    final int mask;
    private final boolean[][] modules;
    private final boolean[][] function;

    private BilibiliQrCode(int version, int mask, byte[] codewords, boolean chooseMask) {
        this.version = version;
        size = version * 4 + 17;
        modules = new boolean[size][size];
        function = new boolean[size][size];
        drawFunctionPatterns();
        drawCodewords(codewords);
        int chosen = mask;
        if (chooseMask) {
            long best = Long.MAX_VALUE;
            for (int candidate = 0; candidate < 8; candidate++) {
                applyMask(candidate);
                drawFormatBits(candidate);
                long penalty = penalty();
                if (penalty < best) { best = penalty; chosen = candidate; }
                applyMask(candidate); // XOR again to undo.
            }
        }
        this.mask = chosen;
        applyMask(chosen);
        drawFormatBits(chosen);
    }

    static BilibiliQrCode encode(String text) { return encode(text, -1); }

    /** @param forcedMask 0..7, or -1 to choose the mask with the lowest penalty. */
    static BilibiliQrCode encode(String text, int forcedMask) {
        byte[] data = text.getBytes(StandardCharsets.UTF_8);
        for (int version = 1; version <= 40; version++) {
            int capacityBits = dataCodewords(version) * 8;
            int countBits = version < 10 ? 8 : 16;
            int used = 4 + countBits + data.length * 8;
            if (data.length >= (1 << countBits) || used > capacityBits) continue;
            BitBuffer bits = new BitBuffer();
            bits.append(0x4, 4);
            bits.append(data.length, countBits);
            for (byte b : data) bits.append(b & 0xff, 8);
            bits.append(0, Math.min(4, capacityBits - bits.length));
            bits.append(0, (8 - bits.length % 8) % 8);
            for (int pad = 0xEC; bits.length < capacityBits; pad ^= 0xEC ^ 0x11) bits.append(pad, 8);
            byte[] codewords = addEccAndInterleave(bits.toBytes(), version);
            return new BilibiliQrCode(version, Math.max(0, forcedMask), codewords, forcedMask < 0);
        }
        throw new IllegalArgumentException("Text too long for a QR code");
    }

    boolean get(int x, int y) {
        return x >= 0 && y >= 0 && x < size && y < size && modules[y][x];
    }

    // ---- Function patterns ----

    private void drawFunctionPatterns() {
        for (int i = 0; i < size; i++) {
            setFunction(6, i, i % 2 == 0);
            setFunction(i, 6, i % 2 == 0);
        }
        drawFinder(3, 3);
        drawFinder(size - 4, 3);
        drawFinder(3, size - 4);
        int[] positions = alignmentPositions();
        int count = positions.length;
        for (int i = 0; i < count; i++) {
            for (int j = 0; j < count; j++) {
                if ((i == 0 && j == 0) || (i == 0 && j == count - 1) || (i == count - 1 && j == 0)) continue;
                drawAlignment(positions[i], positions[j]);
            }
        }
        drawFormatBits(0); // Reserve; overwritten after masking.
        drawVersion();
    }

    private void drawFormatBits(int maskValue) {
        int data = FORMAT_BITS_M << 3 | maskValue;
        int rem = data;
        for (int i = 0; i < 10; i++) rem = (rem << 1) ^ ((rem >>> 9) * 0x537);
        int bits = (data << 10 | rem) ^ 0x5412;
        for (int i = 0; i <= 5; i++) setFunction(8, i, bit(bits, i));
        setFunction(8, 7, bit(bits, 6));
        setFunction(8, 8, bit(bits, 7));
        setFunction(7, 8, bit(bits, 8));
        for (int i = 9; i < 15; i++) setFunction(14 - i, 8, bit(bits, i));
        for (int i = 0; i < 8; i++) setFunction(size - 1 - i, 8, bit(bits, i));
        for (int i = 8; i < 15; i++) setFunction(8, size - 15 + i, bit(bits, i));
        setFunction(8, size - 8, true);
    }

    private void drawVersion() {
        if (version < 7) return;
        int rem = version;
        for (int i = 0; i < 12; i++) rem = (rem << 1) ^ ((rem >>> 11) * 0x1F25);
        long bits = (long) version << 12 | rem;
        for (int i = 0; i < 18; i++) {
            boolean dark = ((bits >>> i) & 1) != 0;
            int a = size - 11 + i % 3;
            int b = i / 3;
            setFunction(a, b, dark);
            setFunction(b, a, dark);
        }
    }

    private void drawFinder(int x, int y) {
        for (int dy = -4; dy <= 4; dy++) {
            for (int dx = -4; dx <= 4; dx++) {
                int distance = Math.max(Math.abs(dx), Math.abs(dy));
                int xx = x + dx, yy = y + dy;
                if (xx >= 0 && xx < size && yy >= 0 && yy < size)
                    setFunction(xx, yy, distance != 2 && distance != 4);
            }
        }
    }

    private void drawAlignment(int x, int y) {
        for (int dy = -2; dy <= 2; dy++)
            for (int dx = -2; dx <= 2; dx++)
                setFunction(x + dx, y + dy, Math.max(Math.abs(dx), Math.abs(dy)) != 1);
    }

    private void setFunction(int x, int y, boolean dark) {
        modules[y][x] = dark;
        function[y][x] = true;
    }

    private int[] alignmentPositions() {
        if (version == 1) return new int[0];
        int count = version / 7 + 2;
        int step = version == 32 ? 26 : (version * 4 + count * 2 + 1) / (count * 2 - 2) * 2;
        int[] result = new int[count];
        result[0] = 6;
        for (int i = count - 1, position = size - 7; i >= 1; i--, position -= step) result[i] = position;
        return result;
    }

    // ---- Data ----

    private void drawCodewords(byte[] data) {
        int i = 0;
        for (int right = size - 1; right >= 1; right -= 2) {
            if (right == 6) right = 5;
            for (int vertical = 0; vertical < size; vertical++) {
                for (int j = 0; j < 2; j++) {
                    int x = right - j;
                    boolean upward = ((right + 1) & 2) == 0;
                    int y = upward ? size - 1 - vertical : vertical;
                    if (!function[y][x] && i < data.length * 8) {
                        modules[y][x] = bit(data[i >>> 3], 7 - (i & 7));
                        i++;
                    }
                }
            }
        }
    }

    private void applyMask(int maskValue) {
        for (int y = 0; y < size; y++) {
            for (int x = 0; x < size; x++) {
                boolean invert;
                switch (maskValue) {
                    case 0: invert = (x + y) % 2 == 0; break;
                    case 1: invert = y % 2 == 0; break;
                    case 2: invert = x % 3 == 0; break;
                    case 3: invert = (x + y) % 3 == 0; break;
                    case 4: invert = (x / 3 + y / 2) % 2 == 0; break;
                    case 5: invert = x * y % 2 + x * y % 3 == 0; break;
                    case 6: invert = (x * y % 2 + x * y % 3) % 2 == 0; break;
                    default: invert = ((x + y) % 2 + x * y % 3) % 2 == 0; break;
                }
                if (invert && !function[y][x]) modules[y][x] = !modules[y][x];
            }
        }
    }

    /** Standard penalty rules N1-N4; only used to pick the most readable mask. */
    private long penalty() {
        long result = 0;
        for (int pass = 0; pass < 2; pass++) {
            for (int a = 0; a < size; a++) {
                int run = 1;
                for (int b = 1; b < size; b++) {
                    boolean current = pass == 0 ? modules[a][b] : modules[b][a];
                    boolean previous = pass == 0 ? modules[a][b - 1] : modules[b - 1][a];
                    if (current == previous) {
                        run++;
                        if (run == 5) result += 3;
                        else if (run > 5) result++;
                    } else run = 1;
                }
                for (int b = 0; b + 10 < size + 4; b++) {
                    if (finderLike(pass, a, b)) result += 40;
                }
            }
        }
        for (int y = 0; y < size - 1; y++) {
            for (int x = 0; x < size - 1; x++) {
                boolean color = modules[y][x];
                if (color == modules[y][x + 1] && color == modules[y + 1][x] && color == modules[y + 1][x + 1])
                    result += 3;
            }
        }
        int dark = 0;
        for (boolean[] row : modules) for (boolean module : row) if (module) dark++;
        int total = size * size;
        int k = (Math.abs(dark * 20 - total * 10) + total - 1) / total - 1;
        result += Math.max(0, k) * 10L;
        return result;
    }

    /** 1:1:3:1:1 pattern with four light modules on either side; outside the symbol counts as light. */
    private boolean finderLike(int pass, int line, int start) {
        final boolean[] pattern = {true, false, true, true, true, false, true};
        boolean before = true, after = true;
        for (int i = 0; i < 7; i++) {
            if (module(pass, line, start + 4 + i) != pattern[i]) return false;
        }
        for (int i = 0; i < 4; i++) {
            if (module(pass, line, start + i)) before = false;
            if (module(pass, line, start + 11 + i)) after = false;
        }
        return before || after;
    }

    private boolean module(int pass, int line, int position) {
        int index = position - 4;
        if (index < 0 || index >= size) return false;
        return pass == 0 ? modules[line][index] : modules[index][line];
    }

    // ---- Error correction ----

    static int rawDataModules(int version) {
        int result = (16 * version + 128) * version + 64;
        if (version >= 2) {
            int count = version / 7 + 2;
            result -= (25 * count - 10) * count - 55;
            if (version >= 7) result -= 36;
        }
        return result;
    }

    static int dataCodewords(int version) {
        return rawDataModules(version) / 8 - ECC_PER_BLOCK[version] * BLOCKS[version];
    }

    private static byte[] addEccAndInterleave(byte[] data, int version) {
        int blockCount = BLOCKS[version];
        int eccLength = ECC_PER_BLOCK[version];
        int rawCodewords = rawDataModules(version) / 8;
        int shortBlocks = blockCount - rawCodewords % blockCount;
        int shortLength = rawCodewords / blockCount;
        byte[] divisor = reedSolomonDivisor(eccLength);
        byte[][] blocks = new byte[blockCount][];
        for (int i = 0, k = 0; i < blockCount; i++) {
            int length = shortLength - eccLength + (i < shortBlocks ? 0 : 1);
            byte[] chunk = Arrays.copyOfRange(data, k, k + length);
            k += length;
            byte[] ecc = reedSolomonRemainder(chunk, divisor);
            byte[] block = new byte[shortLength + 1];
            System.arraycopy(chunk, 0, block, 0, chunk.length);
            System.arraycopy(ecc, 0, block, block.length - eccLength, eccLength);
            blocks[i] = block;
        }
        byte[] result = new byte[rawCodewords];
        int index = 0;
        for (int i = 0; i < shortLength + 1; i++) {
            for (int j = 0; j < blockCount; j++) {
                if (i != shortLength - eccLength || j >= shortBlocks) result[index++] = blocks[j][i];
            }
        }
        return result;
    }

    private static byte[] reedSolomonDivisor(int degree) {
        byte[] result = new byte[degree];
        result[degree - 1] = 1;
        int root = 1;
        for (int i = 0; i < degree; i++) {
            for (int j = 0; j < result.length; j++) {
                result[j] = (byte) multiply(result[j] & 0xff, root);
                if (j + 1 < result.length) result[j] ^= result[j + 1];
            }
            root = multiply(root, 0x02);
        }
        return result;
    }

    private static byte[] reedSolomonRemainder(byte[] data, byte[] divisor) {
        byte[] result = new byte[divisor.length];
        for (byte b : data) {
            int factor = (b ^ result[0]) & 0xff;
            System.arraycopy(result, 1, result, 0, result.length - 1);
            result[result.length - 1] = 0;
            for (int i = 0; i < result.length; i++) result[i] ^= (byte) multiply(divisor[i] & 0xff, factor);
        }
        return result;
    }

    private static int multiply(int x, int y) {
        int z = 0;
        for (int i = 7; i >= 0; i--) {
            z = (z << 1) ^ ((z >>> 7) * 0x11D);
            z ^= ((y >>> i) & 1) * x;
        }
        return z & 0xff;
    }

    private static boolean bit(long value, int index) { return ((value >>> index) & 1) != 0; }

    private static final class BitBuffer {
        private byte[] bytes = new byte[64];
        int length;

        void append(int value, int count) {
            for (int i = count - 1; i >= 0; i--) {
                if (length / 8 >= bytes.length) bytes = Arrays.copyOf(bytes, bytes.length * 2);
                if (((value >>> i) & 1) != 0) bytes[length / 8] |= (byte) (0x80 >>> (length % 8));
                length++;
            }
        }

        byte[] toBytes() { return Arrays.copyOf(bytes, length / 8); }
    }
}
