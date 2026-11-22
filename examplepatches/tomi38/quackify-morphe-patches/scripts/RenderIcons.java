// Renders the raster launcher icons bundled with the Spotify branding patch.
//
// Quackify ships its launcher icons as WebP bitmaps, which a resource patch cannot
// replace with vector XML, so the patch overwrites them with these pre-rendered PNGs.
//
// Usage (JDK 11+, from the repository root):
//   java scripts/RenderIcons.java patches/src/main/resources/quackify/branding

import javax.imageio.ImageIO;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.geom.AffineTransform;
import java.awt.geom.Ellipse2D;
import java.awt.geom.Path2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RenderIcons {
    // Spotify mark in a 108x108 adaptive icon viewport (same path as the patch's vector drawables).
    static final String MARK = "M70.563,50.822C61.537,45.462 46.65,44.97 38.034,47.585C36.65,48.005 35.187,47.223 34.768,45.84C34.348,44.455 35.129,42.993 36.513,42.573C46.404,39.57 62.846,40.15 73.236,46.318C74.481,47.057 74.889,48.664 74.151,49.907C73.413,51.151 71.804,51.561 70.563,50.822ZM70.267,58.761C69.634,59.789 68.29,60.111 67.264,59.48C59.74,54.855 48.266,53.515 39.363,56.217C38.209,56.566 36.99,55.915 36.639,54.763C36.291,53.609 36.942,52.391 38.095,52.041C48.264,48.954 60.907,50.449 69.549,55.76C70.575,56.392 70.898,57.736 70.267,58.761ZM66.841,66.386C66.338,67.211 65.264,67.469 64.441,66.966C57.866,62.948 49.59,62.04 39.844,64.267C38.905,64.482 37.969,63.893 37.755,62.955C37.539,62.015 38.126,61.079 39.067,60.865C49.733,58.427 58.882,59.476 66.262,63.986C67.085,64.488 67.344,65.563 66.841,66.386ZM54,26C38.536,26 26,38.536 26,53.999C26,69.465 38.536,82 54,82C69.464,82 82,69.465 82,53.999C82,38.536 69.464,26 54,26L54,26Z";

    static final Color GREEN = new Color(0x1E, 0xD7, 0x60);
    static final Color BLACK = new Color(0, 0, 0);

    public static void main(String[] args) throws Exception {
        File out = new File(args.length > 0 ? args[0] : "patches/src/main/resources/quackify/branding");
        out.mkdirs();
        Path2D mark = parse(MARK);

        // Adaptive icon foreground layers: 108dp at mdpi..xxxhdpi.
        for (int px : new int[]{108, 162, 216, 324, 432}) {
            write(foreground(mark, px), new File(out, "foreground-" + px + ".png"));
        }
        // Legacy (pre-API 26) and icon-picker icons: 48dp at mdpi..xxxhdpi, plus the 432px "normal" icon.
        for (int px : new int[]{48, 72, 96, 144, 192, 432}) {
            write(legacy(mark, px), new File(out, "legacy-" + px + ".png"));
        }
    }

    /** Green mark on a transparent 108-unit canvas; the black background layer comes from the vector drawable. */
    static BufferedImage foreground(Path2D mark, int px) {
        BufferedImage img = new BufferedImage(px, px, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g = graphics(img);
        g.scale(px / 108.0, px / 108.0);
        g.setColor(GREEN);
        g.fill(mark);
        g.dispose();
        return img;
    }

    /** Full-bleed round icon: the visible 72-unit center of the adaptive icon, clipped to a circle. */
    static BufferedImage legacy(Path2D mark, int px) {
        BufferedImage img = new BufferedImage(px, px, BufferedImage.TYPE_INT_ARGB);
        Graphics2D g = graphics(img);
        g.setColor(BLACK);
        g.fill(new Ellipse2D.Double(0, 0, px, px));
        AffineTransform t = new AffineTransform();
        t.scale(px / 72.0, px / 72.0);
        t.translate(-18, -18);
        g.transform(t);
        g.setColor(GREEN);
        g.fill(mark);
        g.dispose();
        return img;
    }

    static Graphics2D graphics(BufferedImage img) {
        Graphics2D g = img.createGraphics();
        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
        g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
        g.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_PURE);
        return g;
    }

    static void write(BufferedImage img, File file) throws Exception {
        if (!ImageIO.write(img, "png", file)) throw new IllegalStateException("No PNG writer");
        System.out.println(file.getPath() + " " + img.getWidth() + "x" + img.getHeight());
    }

    /** Minimal SVG path parser for the absolute M, L, C and Z commands used by the mark. */
    static Path2D parse(String d) {
        Path2D.Double path = new Path2D.Double(Path2D.WIND_NON_ZERO);
        Matcher m = Pattern.compile("[MLCZmlcz]|-?\\d*\\.?\\d+(?:[eE][-+]?\\d+)?").matcher(d);
        List<String> tokens = new ArrayList<>();
        while (m.find()) tokens.add(m.group());

        char cmd = 0;
        int i = 0;
        while (i < tokens.size()) {
            String tok = tokens.get(i);
            if (Character.isLetter(tok.charAt(0))) {
                cmd = tok.charAt(0);
                i++;
                if (cmd == 'Z' || cmd == 'z') {
                    path.closePath();
                    continue;
                }
            }
            switch (cmd) {
                case 'M' -> { path.moveTo(n(tokens, i), n(tokens, i + 1)); i += 2; cmd = 'L'; }
                case 'L' -> { path.lineTo(n(tokens, i), n(tokens, i + 1)); i += 2; }
                case 'C' -> {
                    path.curveTo(n(tokens, i), n(tokens, i + 1), n(tokens, i + 2),
                            n(tokens, i + 3), n(tokens, i + 4), n(tokens, i + 5));
                    i += 6;
                }
                default -> throw new IllegalArgumentException("Unsupported path command: " + cmd);
            }
        }
        return path;
    }

    static double n(List<String> tokens, int i) {
        return Double.parseDouble(tokens.get(i));
    }
}
