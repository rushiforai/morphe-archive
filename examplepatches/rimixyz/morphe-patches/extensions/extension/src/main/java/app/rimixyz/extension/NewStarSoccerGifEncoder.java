package app.rimixyz.extension;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Arrays;

/**
 * Codificador GIF89a animado 100% em Java puro (sem dependências externas).
 *
 * Características:
 *  - Streaming quadro a quadro diretamente para o OutputStream (uso mínimo de RAM).
 *  - Quantização Median Cut de 256 cores por quadro em histograma RGB555 (32x32x32)
 *    com dithering ordenado Bayer 2x2 para preservar gradientes de gramado sem faixas.
 *  - Extensão Netscape 2.0 para loop infinito em galerias, WhatsApp, Telegram e Discord.
 *  - Compressão LZW compatível com GIF89a (códigos variáveis de 9 a 12 bits + clear code).
 */
public final class NewStarSoccerGifEncoder {

    private static final int HASH_SIZE = 5003;
    private static final int MAX_LZW_CODE = 4096;

    private static final int[] BAYER_2X2 = {
            -4,  2,
             3, -1
    };

    private final BufferedOutputStream out;
    private final int width;
    private final int height;
    private final int delayCentiseconds;

    private boolean headerWritten = false;
    private boolean finished = false;

    // Buffers reutilizáveis entre quadros para evitar pressão no GC.
    private final int[] hist = new int[32768];
    private final byte[] lut = new byte[32768];
    private final byte[] palette = new byte[768];
    private final byte[] indexedPixels;

    // Tabelas do compressor LZW reutilizáveis.
    private final int[] hashKeys = new int[HASH_SIZE];
    private final int[] hashCodes = new int[HASH_SIZE];
    private final byte[] blockBuf = new byte[256];
    private int blockPos = 0;
    private int bitAcc = 0;
    private int bitCount = 0;

    public NewStarSoccerGifEncoder(OutputStream os, int width, int height, int fps) {
        this.out = new BufferedOutputStream(os, 32768);
        this.width = width;
        this.height = height;
        int cs = Math.round(100.0f / Math.max(1, fps));
        this.delayCentiseconds = Math.max(2, cs);
        this.indexedPixels = new byte[width * height];
    }

    public void addFrame(int[] argbPixels) throws IOException {
        if (finished) {
            throw new IllegalStateException("GIF encoder already finished");
        }
        if (argbPixels.length < width * height) {
            throw new IllegalArgumentException("Frame buffer smaller than GIF dimensions");
        }

        if (!headerWritten) {
            writeHeader();
            headerWritten = true;
        }

        // 1. Constrói paleta local de 256 cores via Median Cut e mapeia pixels com Bayer 2x2.
        quantizeFrame(argbPixels);

        // 2. Graphic Control Extension (delay + disposal none).
        out.write(0x21); // Extension Introducer
        out.write(0xF9); // Graphic Control Label
        out.write(0x04); // Block Size
        out.write(0x00); // Packed: no disposal, no transparency
        writeShortLE(delayCentiseconds);
        out.write(0x00); // Transparent Color Index (unused)
        out.write(0x00); // Block Terminator

        // 3. Image Descriptor com Local Color Table de 256 cores (2^(7+1)).
        out.write(0x2C); // Image Separator
        writeShortLE(0); // Left
        writeShortLE(0); // Top
        writeShortLE(width);
        writeShortLE(height);
        out.write(0x87); // Local Color Table Flag=1, Interlace=0, Sort=0, Size=7 (256 colors)

        // 4. Local Color Table (768 bytes RGB).
        out.write(palette, 0, 768);

        // 5. Image Data (LZW com minCodeSize = 8).
        writeLzwData(indexedPixels, width * height);
    }

    public void finish() throws IOException {
        if (finished) {
            return;
        }
        finished = true;
        if (!headerWritten) {
            writeHeader();
            headerWritten = true;
        }
        out.write(0x3B); // GIF Trailer
        out.flush();
    }

    private void writeHeader() throws IOException {
        // Assinatura GIF89a
        out.write('G');
        out.write('I');
        out.write('F');
        out.write('8');
        out.write('9');
        out.write('a');

        // Logical Screen Descriptor (sem Global Color Table; cada quadro usa LCT própria)
        writeShortLE(width);
        writeShortLE(height);
        out.write(0x70); // Global Color Table Flag=0, Color Res=7 (8 bits), Sort=0, Size=0
        out.write(0x00); // Background Color Index
        out.write(0x00); // Pixel Aspect Ratio

        // Netscape 2.0 Application Extension (loop infinito: loopCount = 0)
        out.write(0x21);
        out.write(0xFF);
        out.write(0x0B);
        out.write('N'); out.write('E'); out.write('T'); out.write('S');
        out.write('C'); out.write('A'); out.write('P'); out.write('E');
        out.write('2'); out.write('.'); out.write('0');
        out.write(0x03); // Sub-block size
        out.write(0x01); // Sub-block ID
        writeShortLE(0); // 0 = loop infinito
        out.write(0x00); // Terminator
    }

    private void quantizeFrame(int[] argbPixels) {
        Arrays.fill(hist, 0);

        // Amostra todos os pixels para o histograma RGB555 (32x32x32).
        int total = width * height;
        for (int i = 0; i < total; i++) {
            int p = argbPixels[i];
            int r5 = (p >> 19) & 0x1F;
            int g5 = (p >> 11) & 0x1F;
            int b5 = (p >> 3) & 0x1F;
            hist[(r5 << 10) | (g5 << 5) | b5]++;
        }

        // Coleta apenas os buckets não vazios.
        int[] usedColors = new int[32768];
        int usedCount = 0;
        for (int c = 0; c < 32768; c++) {
            if (hist[c] > 0) {
                usedColors[usedCount++] = c;
            }
        }

        // Caso trivial: <= 256 cores distintas no quadro.
        if (usedCount <= 256) {
            Arrays.fill(palette, (byte) 0);
            for (int i = 0; i < usedCount; i++) {
                int c = usedColors[i];
                int r = ((c >> 10) & 0x1F) * 255 / 31;
                int g = ((c >> 5) & 0x1F) * 255 / 31;
                int b = (c & 0x1F) * 255 / 31;
                palette[i * 3] = (byte) r;
                palette[i * 3 + 1] = (byte) g;
                palette[i * 3 + 2] = (byte) b;
                lut[c] = (byte) i;
            }
            mapPixelsWithDither(argbPixels, usedCount);
            return;
        }

        // Median Cut em até 256 caixas.
        int[] boxStart = new int[256];
        int[] boxEnd = new int[256];
        int[] boxPop = new int[256];
        int[] boxSpan = new int[256];
        int[] boxAxis = new int[256];

        boxStart[0] = 0;
        boxEnd[0] = usedCount;
        computeBoxMetrics(usedColors, 0, boxStart, boxEnd, boxPop, boxSpan, boxAxis);
        int boxCount = 1;

        while (boxCount < 256) {
            int bestBox = -1;
            long bestScore = -1L;
            for (int b = 0; b < boxCount; b++) {
                if (boxEnd[b] - boxStart[b] > 1 && boxSpan[b] > 0) {
                    long score = (long) boxPop[b] * (long) boxSpan[b];
                    if (score > bestScore) {
                        bestScore = score;
                        bestBox = b;
                    }
                }
            }
            if (bestBox < 0) {
                break;
            }

            int start = boxStart[bestBox];
            int end = boxEnd[bestBox];
            int axis = boxAxis[bestBox];
            sortColorsByAxis(usedColors, start, end, axis);

            // Divide no ponto mediano ponderado pela população de pixels.
            int halfPop = boxPop[bestBox] >>> 1;
            int accPop = 0;
            int split = start + 1;
            for (int i = start; i < end - 1; i++) {
                accPop += hist[usedColors[i]];
                if (accPop >= halfPop) {
                    split = i + 1;
                    break;
                }
            }
            if (split <= start) {
                split = start + 1;
            } else if (split >= end) {
                split = end - 1;
            }

            boxStart[boxCount] = split;
            boxEnd[boxCount] = end;
            boxEnd[bestBox] = split;

            computeBoxMetrics(usedColors, bestBox, boxStart, boxEnd, boxPop, boxSpan, boxAxis);
            computeBoxMetrics(usedColors, boxCount, boxStart, boxEnd, boxPop, boxSpan, boxAxis);
            boxCount++;
        }

        // Gera a paleta final (média ponderada por população em cada caixa) e preenche a LUT.
        Arrays.fill(palette, (byte) 0);
        for (int b = 0; b < boxCount; b++) {
            long sumR = 0L;
            long sumG = 0L;
            long sumB = 0L;
            long sumW = 0L;
            int start = boxStart[b];
            int end = boxEnd[b];
            for (int i = start; i < end; i++) {
                int c = usedColors[i];
                int w = hist[c];
                sumR += (long) ((c >> 10) & 0x1F) * w;
                sumG += (long) ((c >> 5) & 0x1F) * w;
                sumB += (long) (c & 0x1F) * w;
                sumW += w;
                lut[c] = (byte) b;
            }
            if (sumW > 0L) {
                int r = (int) Math.min(255L, (sumR * 255L) / (sumW * 31L));
                int g = (int) Math.min(255L, (sumG * 255L) / (sumW * 31L));
                int bl = (int) Math.min(255L, (sumB * 255L) / (sumW * 31L));
                palette[b * 3] = (byte) r;
                palette[b * 3 + 1] = (byte) g;
                palette[b * 3 + 2] = (byte) bl;
            }
        }

        mapPixelsWithDither(argbPixels, boxCount);
    }

    private void mapPixelsWithDither(int[] argbPixels, int paletteCount) {
        int idx = 0;
        for (int y = 0; y < height; y++) {
            int rowMask = (y & 1) << 1;
            for (int x = 0; x < width; x++) {
                int p = argbPixels[idx];
                int d = BAYER_2X2[rowMask | (x & 1)];
                int r = clampByte(((p >> 16) & 0xFF) + d);
                int g = clampByte(((p >> 8) & 0xFF) + d);
                int b = clampByte((p & 0xFF) + d);
                int key = ((r >> 3) << 10) | ((g >> 3) << 5) | (b >> 3);
                if (hist[key] > 0) {
                    indexedPixels[idx] = lut[key];
                } else {
                    // Fallback direto sem dithering (garantidamente presente no histograma).
                    int exactKey = (((p >> 19) & 0x1F) << 10)
                            | (((p >> 11) & 0x1F) << 5)
                            | ((p >> 3) & 0x1F);
                    if (hist[exactKey] > 0) {
                        indexedPixels[idx] = lut[exactKey];
                    } else {
                        indexedPixels[idx] = findNearestPaletteIndex(r, g, b, paletteCount);
                    }
                }
                idx++;
            }
        }
    }

    private byte findNearestPaletteIndex(int r, int g, int b, int count) {
        int bestIdx = 0;
        int bestDist = Integer.MAX_VALUE;
        for (int i = 0; i < count; i++) {
            int pr = palette[i * 3] & 0xFF;
            int pg = palette[i * 3 + 1] & 0xFF;
            int pb = palette[i * 3 + 2] & 0xFF;
            int dr = r - pr;
            int dg = g - pg;
            int db = b - pb;
            int dist = dr * dr + dg * dg + db * db;
            if (dist < bestDist) {
                bestDist = dist;
                bestIdx = i;
            }
        }
        return (byte) bestIdx;
    }

    private void computeBoxMetrics(
            int[] usedColors, int b,
            int[] boxStart, int[] boxEnd,
            int[] boxPop, int[] boxSpan, int[] boxAxis
    ) {
        int minR = 31, maxR = 0;
        int minG = 31, maxG = 0;
        int minB = 31, maxB = 0;
        int pop = 0;
        int start = boxStart[b];
        int end = boxEnd[b];
        for (int i = start; i < end; i++) {
            int c = usedColors[i];
            int r = (c >> 10) & 0x1F;
            int g = (c >> 5) & 0x1F;
            int bl = c & 0x1F;
            if (r < minR) minR = r;
            if (r > maxR) maxR = r;
            if (g < minG) minG = g;
            if (g > maxG) maxG = g;
            if (bl < minB) minB = bl;
            if (bl > maxB) maxB = bl;
            pop += hist[c];
        }
        int spanR = (maxR - minR) * 3;
        int spanG = (maxG - minG) * 4; // Verde tem maior peso perceptual (gramado!)
        int spanB = (maxB - minB) * 2;
        if (spanG >= spanR && spanG >= spanB) {
            boxAxis[b] = 1;
            boxSpan[b] = maxG - minG;
        } else if (spanR >= spanB) {
            boxAxis[b] = 0;
            boxSpan[b] = maxR - minR;
        } else {
            boxAxis[b] = 2;
            boxSpan[b] = maxB - minB;
        }
        boxPop[b] = pop;
    }

    /** Counting sort O(N) em 32 baldes (valores de 0..31) — muito mais rápido que quicksort. */
    private void sortColorsByAxis(int[] arr, int start, int end, int axis) {
        int shift = (axis == 0) ? 10 : (axis == 1 ? 5 : 0);
        int len = end - start;
        int[] counts = new int[32];
        for (int i = start; i < end; i++) {
            counts[(arr[i] >> shift) & 0x1F]++;
        }
        int[] offsets = new int[32];
        int sum = 0;
        for (int b = 0; b < 32; b++) {
            offsets[b] = sum;
            sum += counts[b];
        }
        int[] temp = new int[len];
        for (int i = start; i < end; i++) {
            int c = arr[i];
            int bucket = (c >> shift) & 0x1F;
            temp[offsets[bucket]++] = c;
        }
        System.arraycopy(temp, 0, arr, start, len);
    }

    private void writeLzwData(byte[] pixels, int length) throws IOException {
        final int minCodeSize = 8;
        final int clearCode = 1 << minCodeSize; // 256
        final int eoiCode = clearCode + 1;      // 257

        out.write(minCodeSize);
        blockPos = 0;
        bitAcc = 0;
        bitCount = 0;

        Arrays.fill(hashKeys, -1);
        int codeSize = minCodeSize + 1; // 9
        int nextCode = eoiCode + 1;     // 258
        int maxCodeForBits = 1 << codeSize; // 512

        writeBits(clearCode, codeSize);
        if (length <= 0) {
            writeBits(eoiCode, codeSize);
            flushBits();
            out.write(0x00);
            return;
        }

        int prefix = pixels[0] & 0xFF;
        for (int i = 1; i < length; i++) {
            int k = pixels[i] & 0xFF;
            int key = (prefix << 8) | k;
            int hashIdx = ((k << 4) ^ prefix) % HASH_SIZE;
            if (hashIdx < 0) hashIdx += HASH_SIZE;

            int foundCode = -1;
            int probe = hashIdx;
            int step = (hashIdx == 0) ? 1 : (HASH_SIZE - hashIdx);
            while (hashKeys[probe] != -1) {
                if (hashKeys[probe] == key) {
                    foundCode = hashCodes[probe];
                    break;
                }
                probe -= step;
                if (probe < 0) probe += HASH_SIZE;
            }

            if (foundCode >= 0) {
                prefix = foundCode;
            } else {
                writeBits(prefix, codeSize);
                if (nextCode < MAX_LZW_CODE) {
                    hashKeys[probe] = key;
                    hashCodes[probe] = nextCode;
                    nextCode++;
                    if (nextCode > maxCodeForBits && codeSize < 12) {
                        codeSize++;
                        maxCodeForBits = 1 << codeSize;
                    }
                } else {
                    writeBits(clearCode, codeSize);
                    Arrays.fill(hashKeys, -1);
                    codeSize = minCodeSize + 1;
                    nextCode = eoiCode + 1;
                    maxCodeForBits = 1 << codeSize;
                }
                prefix = k;
            }
        }

        writeBits(prefix, codeSize);
        writeBits(eoiCode, codeSize);
        flushBits();
        out.write(0x00); // Block Terminator
    }

    private void writeBits(int code, int numBits) throws IOException {
        bitAcc |= (code << bitCount);
        bitCount += numBits;
        while (bitCount >= 8) {
            emitBlockByte((byte) (bitAcc & 0xFF));
            bitAcc >>>= 8;
            bitCount -= 8;
        }
    }

    private void flushBits() throws IOException {
        if (bitCount > 0) {
            emitBlockByte((byte) (bitAcc & 0xFF));
            bitAcc = 0;
            bitCount = 0;
        }
        flushBlock();
    }

    private void emitBlockByte(byte b) throws IOException {
        blockBuf[blockPos++] = b;
        if (blockPos == 255) {
            flushBlock();
        }
    }

    private void flushBlock() throws IOException {
        if (blockPos > 0) {
            out.write(blockPos);
            out.write(blockBuf, 0, blockPos);
            blockPos = 0;
        }
    }

    private void writeShortLE(int value) throws IOException {
        out.write(value & 0xFF);
        out.write((value >>> 8) & 0xFF);
    }

    private static int clampByte(int v) {
        if (v < 0) return 0;
        if (v > 255) return 255;
        return v;
    }
}
