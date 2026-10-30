package app.pielm.extension.twitter.gif;

import android.graphics.Bitmap;

import java.io.IOException;
import java.io.OutputStream;

/**
 * Self-contained GIF89a animated encoder with Netscape 2.0 infinite looping,
 * adaptive palette quantization (NeuQuant), and LZW compression.
 */
public final class AnimatedGifEncoder {
    private int width;
    private int height;
    private int repeat = 0; // 0 = infinite loop
    private int delay = 4;  // in hundredths of a second (centiseconds)
    private OutputStream out;
    private byte[] pixels;
    private byte[] indexedPixels;
    private int colorDepth;
    private byte[] colorTab;
    private boolean firstFrame = true;
    private int sample = 15; // NeuQuant sampling factor (1..30, higher = faster)

    public void setDelayMs(int ms) {
        // GIF delay is in 1/100th of a second; minimum 2 cs (20ms) for viewer compatibility
        this.delay = Math.max(2, Math.round(ms / 10.0f));
    }

    public void setRepeat(int iter) {
        if (iter >= 0) {
            this.repeat = iter;
        }
    }

    public void setQuality(int quality) {
        this.sample = Math.max(1, Math.min(30, quality));
    }

    public boolean start(OutputStream os) {
        if (os == null) return false;
        out = os;
        firstFrame = true;
        try {
            writeString("GIF89a");
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    public boolean addFrame(Bitmap im, int delayMs) {
        if (im == null || out == null) return false;
        int w = firstFrame ? im.getWidth() : width;
        int h = firstFrame ? im.getHeight() : height;
        if (im.getWidth() != w || im.getHeight() != h) {
            im = Bitmap.createScaledBitmap(im, w, h, false);
        }
        int[] argb = new int[w * h];
        im.getPixels(argb, 0, w, 0, 0, w, h);
        return addFrame(argb, w, h, delayMs);
    }

    /**
     * Adds a frame from a packed ARGB pixel array (row-major, {@code w * h} entries).
     * All frames must share the dimensions of the first frame.
     */
    public boolean addFrame(int[] argb, int w, int h, int delayMs) {
        if (argb == null || out == null) return false;
        setDelayMs(delayMs);
        try {
            if (firstFrame) {
                width = w;
                height = h;
                writeLSD();
            } else if (w != width || h != height) {
                return false;
            }
            extractPixels(argb);
            analyzePixels();
            if (firstFrame) {
                writePalette();
                if (repeat >= 0) {
                    writeNetscapeExt();
                }
            }
            writeGraphicCtrlExt();
            writeImageDesc();
            if (!firstFrame) {
                writePalette();
            }
            writePixels();
            firstFrame = false;
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    public boolean finish() {
        if (out == null) return false;
        try {
            out.write(0x3b); // GIF trailer
            out.flush();
            return true;
        } catch (IOException e) {
            return false;
        }
    }

    private void extractPixels(int[] argb) {
        int totalPixels = width * height;
        if (pixels == null || pixels.length != totalPixels * 3) {
            pixels = new byte[totalPixels * 3];
        }
        int k = 0;
        for (int i = 0; i < totalPixels; i++) {
            int c = argb[i];
            pixels[k++] = (byte) (c & 0xff);         // Blue
            pixels[k++] = (byte) ((c >> 8) & 0xff);  // Green
            pixels[k++] = (byte) ((c >> 16) & 0xff); // Red
        }
    }

    private void analyzePixels() {
        int len = pixels.length;
        int nPix = len / 3;
        if (indexedPixels == null || indexedPixels.length != nPix) {
            indexedPixels = new byte[nPix];
        }
        NeuQuant nq = new NeuQuant(pixels, len, sample);
        colorTab = nq.process();
        // Convert BGR map to RGB for GIF palette
        for (int i = 0; i < colorTab.length; i += 3) {
            byte temp = colorTab[i];
            colorTab[i] = colorTab[i + 2];
            colorTab[i + 2] = temp;
        }
        int k = 0;
        for (int i = 0; i < nPix; i++) {
            indexedPixels[i] = (byte) nq.map(
                    pixels[k++] & 0xff,
                    pixels[k++] & 0xff,
                    pixels[k++] & 0xff
            );
        }
        colorDepth = 8;
    }

    private void writeGraphicCtrlExt() throws IOException {
        out.write(0x21); // extension introducer
        out.write(0xf9); // GCE label
        out.write(4);    // data block size
        out.write(0);    // packed fields: no transparency, dispose = none
        writeShort(delay);
        out.write(0);    // transparent color index
        out.write(0);    // block terminator
    }

    private void writeImageDesc() throws IOException {
        out.write(0x2c); // image separator
        writeShort(0);   // x
        writeShort(0);   // y
        writeShort(width);
        writeShort(height);
        if (firstFrame) {
            out.write(0); // use global color table
        } else {
            out.write(0x87); // local color table (256 entries)
        }
    }

    private void writeLSD() throws IOException {
        writeShort(width);
        writeShort(height);
        out.write(0xf7); // global color table flag + 8-bit color resolution + 256 entries
        out.write(0);    // background color index
        out.write(0);    // pixel aspect ratio
    }

    private void writeNetscapeExt() throws IOException {
        out.write(0x21); // extension introducer
        out.write(0xff); // app extension label
        out.write(11);   // block size
        writeString("NETSCAPE2.0");
        out.write(3);    // sub-block size
        out.write(1);    // loop sub-block id
        writeShort(repeat);
        out.write(0);    // block terminator
    }

    private void writePalette() throws IOException {
        out.write(colorTab, 0, colorTab.length);
        int n = (3 * 256) - colorTab.length;
        for (int i = 0; i < n; i++) {
            out.write(0);
        }
    }

    private void writePixels() throws IOException {
        LzwCompression lzw = new LzwCompression(width, height, indexedPixels, colorDepth);
        lzw.encode(out);
    }

    private void writeShort(int value) throws IOException {
        out.write(value & 0xff);
        out.write((value >> 8) & 0xff);
    }

    private void writeString(String s) throws IOException {
        int len = s.length();
        for (int i = 0; i < len; i++) {
            out.write((byte) s.charAt(i));
        }
    }

    /**
     * Standard GIF LZW compressor.
     */
    private static final class LzwCompression {
        private static final int EOF = -1;
        private static final int BITS = 12;
        private static final int HSIZE = 5003;

        private final int imgW;
        private final int imgH;
        private final byte[] pixAry;
        private final int initCodeSize;
        private int remaining;
        private int curPixel;

        private int nBits;
        private int maxCode;
        private final int maxMaxCode = 1 << BITS;
        private final int[] htab = new int[HSIZE];
        private final int[] codetab = new int[HSIZE];
        private int freeEnt = 0;
        private boolean clearFlg = false;
        private int gInitBits;
        private int clearCode;
        private int eofCode;
        private int curAccum = 0;
        private int curBits = 0;
        private final int[] masks = {
                0x0000, 0x0001, 0x0003, 0x0007, 0x000F, 0x001F, 0x003F, 0x007F,
                0x00FF, 0x01FF, 0x03FF, 0x07FF, 0x0FFF, 0x1FFF, 0x3FFF, 0x7FFF, 0xFFFF
        };
        private int aCount;
        private final byte[] accum = new byte[256];

        LzwCompression(int width, int height, byte[] pixels, int colorDepth) {
            this.imgW = width;
            this.imgH = height;
            this.pixAry = pixels;
            this.initCodeSize = Math.max(2, colorDepth);
        }

        void encode(OutputStream os) throws IOException {
            os.write(initCodeSize);
            remaining = imgW * imgH;
            curPixel = 0;
            compress(initCodeSize + 1, os);
            os.write(0);
        }

        private void compress(int initBits, OutputStream outs) throws IOException {
            int fcode;
            int i;
            int c;
            int ent;
            int disp;
            int hsizeReg;
            int hshift;

            gInitBits = initBits;
            clearFlg = false;
            nBits = gInitBits;
            maxCode = (1 << nBits) - 1;

            clearCode = 1 << (initBits - 1);
            eofCode = clearCode + 1;
            freeEnt = clearCode + 2;

            aCount = 0;
            ent = nextPixel();

            hshift = 0;
            for (fcode = HSIZE; fcode < 65536; fcode *= 2) {
                ++hshift;
            }
            hshift = 8 - hshift;

            hsizeReg = HSIZE;
            clHash(hsizeReg);

            output(clearCode, outs);

            outerLoop:
            while ((c = nextPixel()) != EOF) {
                fcode = (c << BITS) + ent;
                i = (c << hshift) ^ ent;

                if (htab[i] == fcode) {
                    ent = codetab[i];
                    continue;
                } else if (htab[i] >= 0) {
                    disp = hsizeReg - i;
                    if (i == 0) {
                        disp = 1;
                    }
                    do {
                        if ((i -= disp) < 0) {
                            i += hsizeReg;
                        }
                        if (htab[i] == fcode) {
                            ent = codetab[i];
                            continue outerLoop;
                        }
                    } while (htab[i] >= 0);
                }
                output(ent, outs);
                ent = c;
                if (freeEnt < maxMaxCode) {
                    codetab[i] = freeEnt++;
                    htab[i] = fcode;
                } else {
                    clBlock(outs);
                }
            }
            output(ent, outs);
            output(eofCode, outs);
        }

        private void clBlock(OutputStream outs) throws IOException {
            clHash(HSIZE);
            freeEnt = clearCode + 2;
            clearFlg = true;
            output(clearCode, outs);
        }

        private void clHash(int hsize) {
            for (int i = 0; i < hsize; ++i) {
                htab[i] = -1;
            }
        }

        private int nextPixel() {
            if (remaining == 0) {
                return EOF;
            }
            --remaining;
            byte pix = pixAry[curPixel++];
            return pix & 0xff;
        }

        private void output(int code, OutputStream outs) throws IOException {
            curAccum &= masks[curBits];
            if (curBits > 0) {
                curAccum |= (code << curBits);
            } else {
                curAccum = code;
            }
            curBits += nBits;

            while (curBits >= 8) {
                charOut((byte) (curAccum & 0xff), outs);
                curAccum >>= 8;
                curBits -= 8;
            }

            if (freeEnt > maxCode || clearFlg) {
                if (clearFlg) {
                    nBits = gInitBits;
                    maxCode = (1 << nBits) - 1;
                    clearFlg = false;
                } else {
                    ++nBits;
                    if (nBits == BITS) {
                        maxCode = maxMaxCode;
                    } else {
                        maxCode = (1 << nBits) - 1;
                    }
                }
            }

            if (code == eofCode) {
                while (curBits > 0) {
                    charOut((byte) (curAccum & 0xff), outs);
                    curAccum >>= 8;
                    curBits -= 8;
                }
                flushChar(outs);
            }
        }

        private void charOut(byte c, OutputStream outs) throws IOException {
            accum[aCount++] = c;
            if (aCount >= 254) {
                flushChar(outs);
            }
        }

        private void flushChar(OutputStream outs) throws IOException {
            if (aCount > 0) {
                outs.write(aCount);
                outs.write(accum, 0, aCount);
                aCount = 0;
            }
        }
    }
}
