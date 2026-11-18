import app.sircoderin.extension.twilight.TintMath;

import java.awt.image.BufferedImage;
import java.awt.image.Raster;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.nio.file.Files;
import javax.imageio.ImageIO;

/**
 * Offline check of TintMath against a real lossless Display P3 screenshot taken with Twilight's tint
 * (sRGB 255,0,0, alpha 150/255, dim 0, window alpha 1).
 *
 * Run (from the repo root):
 *   javac -d /tmp/untint-check extensions/extension/src/main/java/app/sircoderin/extension/twilight/TintMath.java \
 *         tools/twilight-untint-check/UntintCheck.java
 *   java -cp /tmp/untint-check UntintCheck full.png full_untinted.png
 */
public final class UntintCheck {
    // sRGB linear -> Display P3 linear (D65), then the sRGB transfer function.
    private static final double[][] SRGB_TO_P3 = {
        {0.8224621, 0.1775380, 0.0000000},
        {0.0331941, 0.9668058, 0.0000000},
        {0.0170827, 0.0723974, 0.9105199},
    };

    static double decode(double v) { return v <= 0.04045 ? v / 12.92 : Math.pow((v + 0.055) / 1.055, 2.4); }
    static double encode(double v) { return v <= 0.0031308 ? v * 12.92 : 1.055 * Math.pow(v, 1 / 2.4) - 0.055; }

    /** sRGB 0..255 -> Display P3 encoded 0..255. */
    static double[] srgbToP3(int r, int g, int b) {
        double[] lin = {decode(r / 255.0), decode(g / 255.0), decode(b / 255.0)};
        double[] out = new double[3];
        for (int i = 0; i < 3; i++) {
            double s = 0;
            for (int j = 0; j < 3; j++) s += SRGB_TO_P3[i][j] * lin[j];
            out[i] = encode(Math.max(0, Math.min(1, s))) * 255.0;
        }
        return out;
    }

    static TintMath candidate(int alpha255, int r, int g, int b) {
        double a = alpha255 / 255.0;
        double[] c = srgbToP3(r, g, b);
        return new TintMath(TintMath.effectiveAlpha(1, a, 0),
                new double[] {a * c[0], a * c[1], a * c[2]});
    }

    /** Raw stored samples (no colour conversion) packed as ARGB. */
    static int[] rawPixels(BufferedImage img) {
        Raster r = img.getRaster();
        int w = img.getWidth(), h = img.getHeight(), bands = r.getNumBands();
        int[] out = new int[w * h];
        int[] px = new int[bands];
        for (int y = 0; y < h; y++) {
            for (int x = 0; x < w; x++) {
                r.getPixel(x, y, px);
                int a = bands == 4 ? px[3] : 255;
                out[y * w + x] = (a << 24) | (px[0] << 16) | (px[1] << 8) | px[2];
            }
        }
        return out;
    }

    static int[] grid(int[] px, int w, int h, int samples) {
        int step = Math.max(1, (int) Math.sqrt((double) w * h / samples));
        int[] out = new int[((w + step - 1) / step) * ((h + step - 1) / step)];
        int i = 0;
        for (int y = 0; y < h; y += step) for (int x = 0; x < w; x += step) out[i++] = px[y * w + x];
        return out;
    }

    static void report(String name, TintMath m, int[] sample, int tol) {
        System.out.printf("%-34s A=%.3f P=(%.1f,%.1f,%.1f) miss=%.3f%%%n", name, m.alpha(),
                m.premul()[0], m.premul()[1], m.premul()[2], m.fitFraction(sample, tol) * 100);
    }

    public static void main(String[] args) throws Exception {
        File in = new File(args[0]);
        File out = new File(args[1]);
        BufferedImage img = ImageIO.read(in);
        int w = img.getWidth(), h = img.getHeight();
        int[] px = rawPixels(img);
        int[] sample = grid(px, w, h, 20_000);
        System.out.println("image " + w + "x" + h + ", " + sample.length + " samples, bands=" + img.getRaster().getNumBands());
        double[] p3 = srgbToP3(255, 0, 0);
        System.out.printf("sRGB (255,0,0) -> P3 (%.1f, %.1f, %.1f)%n", p3[0], p3[1], p3[2]);

        int tol = 6;
        TintMath good = candidate(150, 255, 0, 0);
        report("correct a=150/255 red", good, sample, tol);
        report("wrong   a=60/255 red", candidate(60, 255, 0, 0), sample, tol);
        report("wrong   a=200/255 red", candidate(200, 255, 0, 0), sample, tol);
        report("wrong   a=150/255 blue", candidate(150, 0, 0, 255), sample, tol);

        // Untinted inputs must be rejected by the correct candidate.
        int[] synth = new int[2000];
        for (int i = 0; i < synth.length; i++) synth[i] = (i % 2 == 0) ? 0xFFFFFFFF : 0xFF0000FF;
        report("synthetic white+blue (untinted)", good, synth, tol);

        // Invert the full image.
        int[] row = new int[w];
        BufferedImage res = new BufferedImage(w, h, BufferedImage.TYPE_INT_ARGB);
        for (int y = 0; y < h; y++) {
            System.arraycopy(px, y * w, row, 0, w);
            good.invert(row);
            res.setRGB(0, y, w, 1, row, 0, w);
        }
        int[] after = rawPixels(res);
        report("untinted result vs same candidate", good, grid(after, w, h, 20_000), tol);

        // Keep the original ICC profile (iCCP chunk) so viewers show P3 correctly.
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        ImageIO.write(res, "png", bos);
        byte[] png = bos.toByteArray();
        byte[] orig = Files.readAllBytes(in.toPath());
        byte[] iccp = findChunk(orig, "iCCP");
        if (iccp != null) {
            int ihdrEnd = 8 + 8 + 13 + 4;
            ByteArrayOutputStream o2 = new ByteArrayOutputStream();
            o2.write(png, 0, ihdrEnd);
            o2.write(iccp);
            o2.write(png, ihdrEnd, png.length - ihdrEnd);
            png = o2.toByteArray();
        }
        Files.write(out.toPath(), png);
        System.out.println("wrote " + out + (iccp != null ? " (with original iCCP)" : " (no iCCP found)"));
    }

    static byte[] findChunk(byte[] png, String type) {
        int pos = 8;
        while (pos + 12 <= png.length) {
            int len = ((png[pos] & 255) << 24) | ((png[pos + 1] & 255) << 16) | ((png[pos + 2] & 255) << 8) | (png[pos + 3] & 255);
            String t = new String(png, pos + 4, 4, java.nio.charset.StandardCharsets.US_ASCII);
            if (t.equals(type)) {
                byte[] c = new byte[len + 12];
                System.arraycopy(png, pos, c, 0, len + 12);
                return c;
            }
            pos += len + 12;
        }
        return null;
    }
}
