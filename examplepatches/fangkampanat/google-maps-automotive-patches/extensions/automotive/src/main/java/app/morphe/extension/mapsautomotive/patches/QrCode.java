package app.morphe.extension.mapsautomotive.patches;

import java.nio.charset.StandardCharsets;
import java.util.Arrays;

/**
 * A QR code (ISO/IEC 18004) for the GitHub link on the report screen: byte mode, error correction level M,
 * versions 1 to 10, so up to {@link #MAX_BYTES} bytes, and the mask with the lowest penalty score. Plain
 * Java, so its modules can be compared on a computer with another encoder's.
 */
final class QrCode {
    static final int MAX_BYTES = 213;
    // Level M, versions 1 to 10.
    private static final int[] DATA_CODEWORDS = {16, 28, 44, 64, 86, 108, 124, 154, 182, 216};
    private static final int[] EC_PER_BLOCK = {10, 16, 26, 18, 24, 16, 18, 22, 22, 26};
    private static final int[] BLOCKS = {1, 1, 1, 2, 2, 4, 4, 4, 5, 5};
    private static final int[][] ALIGNMENT = {{}, {6, 18}, {6, 22}, {6, 26}, {6, 30}, {6, 34},
            {6, 22, 38}, {6, 24, 42}, {6, 26, 46}, {6, 28, 50}};

    final int version, size, mask;
    private final boolean[][] dark, function;

    private QrCode(int version, byte[] codewords, int fixedMask) {
        this.version = version;
        size = version * 4 + 17;
        dark = new boolean[size][size];
        function = new boolean[size][size];
        drawFunctionPatterns();
        drawCodewords(codewords);
        int chosen = fixedMask;
        if (chosen < 0) {
            int best = Integer.MAX_VALUE;
            for (int candidate = 0; candidate < 8; candidate++) {
                applyMask(candidate);
                drawFormat(candidate);
                int penalty = penalty();
                if (penalty < best) {
                    best = penalty;
                    chosen = candidate;
                }
                applyMask(candidate); // the same XOR again undoes it
            }
        }
        mask = chosen;
        applyMask(chosen);
        drawFormat(chosen);
    }

    /** The code for this text, or null when its UTF-8 bytes do not fit. */
    static QrCode encode(String text) {
        return encode(text, -1);
    }

    /** With a fixed mask from 0 to 7, or -1 for the lowest penalty. */
    static QrCode encode(String text, int mask) {
        byte[] bytes = text.getBytes(StandardCharsets.UTF_8);
        for (int version = 1; version <= DATA_CODEWORDS.length; version++) {
            int countBits = version < 10 ? 8 : 16, capacity = DATA_CODEWORDS[version - 1] * 8;
            if (4 + countBits + bytes.length * 8 <= capacity) {
                return new QrCode(version, codewords(version, bytes, countBits, capacity), mask);
            }
        }
        return null;
    }

    /** x is the column, y the row, both from the top left. */
    boolean isDark(int x, int y) {
        return dark[y][x];
    }

    // The data codewords with their error correction, interleaved by block.
    private static byte[] codewords(int version, byte[] bytes, int countBits, int capacity) {
        byte[] data = new byte[capacity / 8];
        int position = put(data, 0, 0b0100, 4); // byte mode
        position = put(data, position, bytes.length, countBits);
        for (byte value : bytes) position = put(data, position, value & 0xFF, 8);
        position += Math.min(4, capacity - position); // terminator
        for (int i = (position + 7) / 8, pad = 0xEC; i < data.length; i++, pad ^= 0xEC ^ 0x11) data[i] = (byte) pad;

        int blocks = BLOCKS[version - 1], ecLength = EC_PER_BLOCK[version - 1];
        int total = data.length + blocks * ecLength, shortBlocks = blocks - total % blocks, shortData = total / blocks - ecLength;
        byte[] divisor = divisor(ecLength);
        byte[][] blockData = new byte[blocks][], blockEc = new byte[blocks][];
        for (int block = 0, offset = 0; block < blocks; block++) {
            int length = shortData + (block < shortBlocks ? 0 : 1);
            blockData[block] = Arrays.copyOfRange(data, offset, offset + length);
            blockEc[block] = remainder(blockData[block], divisor);
            offset += length;
        }
        byte[] result = new byte[total];
        int next = 0;
        for (int i = 0; i <= shortData; i++) {
            for (byte[] block : blockData) if (i < block.length) result[next++] = block[i];
        }
        for (int i = 0; i < ecLength; i++) {
            for (byte[] block : blockEc) result[next++] = block[i];
        }
        return result;
    }

    private static int put(byte[] data, int position, int value, int length) {
        for (int i = length - 1; i >= 0; i--, position++) {
            if (((value >>> i) & 1) != 0) data[position >>> 3] |= (byte) (0x80 >>> (position & 7));
        }
        return position;
    }

    // Reed-Solomon over GF(256) with the polynomial 0x11D: the generator of this degree, highest term dropped.
    private static byte[] divisor(int degree) {
        byte[] result = new byte[degree];
        result[degree - 1] = 1;
        int root = 1;
        for (int i = 0; i < degree; i++) {
            for (int j = 0; j < degree; j++) {
                result[j] = (byte) multiply(result[j] & 0xFF, root);
                if (j + 1 < degree) result[j] ^= result[j + 1];
            }
            root = multiply(root, 0x02);
        }
        return result;
    }

    private static byte[] remainder(byte[] data, byte[] divisor) {
        byte[] result = new byte[divisor.length];
        for (byte value : data) {
            int factor = (value ^ result[0]) & 0xFF;
            System.arraycopy(result, 1, result, 0, result.length - 1);
            result[result.length - 1] = 0;
            for (int j = 0; j < result.length; j++) result[j] ^= (byte) multiply(divisor[j] & 0xFF, factor);
        }
        return result;
    }

    private static int multiply(int x, int y) {
        int product = 0;
        for (int i = 7; i >= 0; i--) {
            product = (product << 1) ^ ((product >>> 7) * 0x11D);
            product ^= ((y >>> i) & 1) * x;
        }
        return product;
    }

    private void drawFunctionPatterns() {
        for (int i = 0; i < size; i++) {
            set(6, i, i % 2 == 0);
            set(i, 6, i % 2 == 0);
        }
        finder(3, 3);
        finder(size - 4, 3);
        finder(3, size - 4);
        int[] centers = ALIGNMENT[version - 1];
        int last = centers.length - 1;
        for (int a = 0; a <= last; a++) {
            for (int b = 0; b <= last; b++) {
                if (a == 0 && b == 0 || a == 0 && b == last || a == last && b == 0) continue; // the finder corners
                for (int dy = -2; dy <= 2; dy++) {
                    for (int dx = -2; dx <= 2; dx++) set(centers[a] + dx, centers[b] + dy, Math.max(Math.abs(dx), Math.abs(dy)) != 1);
                }
            }
        }
        drawFormat(0); // reserves the format modules; drawn again with the chosen mask
        if (version >= 7) {
            int remainder = version;
            for (int i = 0; i < 12; i++) remainder = (remainder << 1) ^ ((remainder >>> 11) * 0x1F25);
            int bits = version << 12 | remainder;
            for (int i = 0; i < 18; i++) {
                boolean bit = bit(bits, i);
                int a = size - 11 + i % 3, b = i / 3;
                set(a, b, bit);
                set(b, a, bit);
            }
        }
    }

    // The 7x7 finder and its light separator, cut at the edges.
    private void finder(int centerX, int centerY) {
        for (int dy = -4; dy <= 4; dy++) {
            for (int dx = -4; dx <= 4; dx++) {
                int x = centerX + dx, y = centerY + dy, distance = Math.max(Math.abs(dx), Math.abs(dy));
                if (x >= 0 && y >= 0 && x < size && y < size) set(x, y, distance != 2 && distance != 4);
            }
        }
    }

    // Level M (format bits 00) and the mask, BCH-coded, both copies, and the dark module.
    private void drawFormat(int mask) {
        int remainder = mask;
        for (int i = 0; i < 10; i++) remainder = (remainder << 1) ^ ((remainder >>> 9) * 0x537);
        int bits = (mask << 10 | remainder) ^ 0x5412;
        for (int i = 0; i <= 5; i++) set(8, i, bit(bits, i));
        set(8, 7, bit(bits, 6));
        set(8, 8, bit(bits, 7));
        set(7, 8, bit(bits, 8));
        for (int i = 9; i < 15; i++) set(14 - i, 8, bit(bits, i));
        for (int i = 0; i < 8; i++) set(size - 1 - i, 8, bit(bits, i));
        for (int i = 8; i < 15; i++) set(8, size - 15 + i, bit(bits, i));
        set(8, size - 8, true);
    }

    // Two-module columns from the right, zigzagging up and down, skipping the vertical timing column.
    private void drawCodewords(byte[] codewords) {
        int bitIndex = 0, bits = codewords.length * 8;
        for (int right = size - 1; right >= 1; right -= 2) {
            if (right == 6) right = 5;
            boolean upward = ((right + 1) & 2) == 0;
            for (int step = 0; step < size; step++) {
                int y = upward ? size - 1 - step : step;
                for (int j = 0; j < 2; j++) {
                    int x = right - j;
                    if (function[y][x] || bitIndex >= bits) continue;
                    dark[y][x] = bit(codewords[bitIndex >>> 3], 7 - (bitIndex & 7));
                    bitIndex++;
                }
            }
        }
    }

    private void applyMask(int mask) {
        for (int y = 0; y < size; y++) {
            for (int x = 0; x < size; x++) {
                if (function[y][x]) continue;
                boolean flip;
                switch (mask) {
                    case 0: flip = (x + y) % 2 == 0; break;
                    case 1: flip = y % 2 == 0; break;
                    case 2: flip = x % 3 == 0; break;
                    case 3: flip = (x + y) % 3 == 0; break;
                    case 4: flip = (x / 3 + y / 2) % 2 == 0; break;
                    case 5: flip = x * y % 2 + x * y % 3 == 0; break;
                    case 6: flip = (x * y % 2 + x * y % 3) % 2 == 0; break;
                    default: flip = ((x + y) % 2 + x * y % 3) % 2 == 0; break;
                }
                if (flip) dark[y][x] = !dark[y][x];
            }
        }
    }

    // The standard's penalty rules: runs of five or more, 2x2 blocks, finder-like patterns, dark balance.
    private int penalty() {
        int result = 0, darkCount = 0;
        for (int line = 0; line < size; line++) result += linePenalty(line, true) + linePenalty(line, false);
        for (int y = 0; y < size; y++) {
            for (int x = 0; x < size; x++) {
                boolean module = dark[y][x];
                if (module) darkCount++;
                if (x + 1 < size && y + 1 < size && module == dark[y][x + 1] && module == dark[y + 1][x] && module == dark[y + 1][x + 1]) {
                    result += 3;
                }
            }
        }
        int total = size * size, k = (Math.abs(darkCount * 20 - total * 10) + total - 1) / total - 1;
        return result + k * 10;
    }

    private int linePenalty(int line, boolean row) {
        int result = 0, run = 0;
        boolean color = false;
        for (int i = 0; i < size; i++) {
            boolean module = at(line, i, row);
            if (run > 0 && module == color) {
                run++;
            } else {
                if (run >= 5) result += run - 2;
                color = module;
                run = 1;
            }
        }
        if (run >= 5) result += run - 2;
        for (int i = 0; i + 7 <= size; i++) {
            if (at(line, i, row) && !at(line, i + 1, row) && at(line, i + 2, row) && at(line, i + 3, row)
                    && at(line, i + 4, row) && !at(line, i + 5, row) && at(line, i + 6, row)
                    && (light(line, i - 4, i, row) || light(line, i + 7, i + 11, row))) {
                result += 40;
            }
        }
        return result;
    }

    // Outside the symbol counts as light, as the quiet zone is.
    private boolean light(int line, int from, int to, boolean row) {
        for (int i = from; i < to; i++) if (i >= 0 && i < size && at(line, i, row)) return false;
        return true;
    }

    private boolean at(int line, int i, boolean row) {
        return row ? dark[line][i] : dark[i][line];
    }

    private void set(int x, int y, boolean value) {
        dark[y][x] = value;
        function[y][x] = true;
    }

    private static boolean bit(int value, int index) {
        return ((value >>> index) & 1) != 0;
    }
}
