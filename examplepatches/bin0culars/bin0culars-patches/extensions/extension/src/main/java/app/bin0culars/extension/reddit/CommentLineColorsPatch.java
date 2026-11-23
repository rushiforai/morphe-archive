package app.bin0culars.extension.reddit;

import app.bin0culars.extension.reddit.settings.BinocularsMods;

public final class CommentLineColorsPatch {

    private static final int[] PALETTE_RAINBOW = {
        0xFFE53935, 0xFFFB8C00, 0xFFFDD835, 0xFF43A047, 0xFF1E88E5, 0xFF8E24AA
    };
    private static final int[] PALETTE_PASTEL = {
        0xFFF4A6A6, 0xFFF7C59F, 0xFFF3E29B, 0xFFA8D8B9, 0xFF9EC9F0, 0xFFC8A8E9
    };
    private static final int[] PALETTE_MUTED = {
        0xFFB5655B, 0xFFC08A4E, 0xFFA89B4E, 0xFF6E9468, 0xFF5E83A6, 0xFF8A6D9E
    };

    private CommentLineColorsPatch() {
    }

    public static long lineColor(int depth, long original) {
        if (!BinocularsMods.isEnabled("comment_line_colors")) {
            return original;
        }
        String choice = BinocularsMods.getChoice("comment_line_palette");
        int[] palette;
        if ("pastel".equals(choice)) {
            palette = PALETTE_PASTEL;
        } else if ("muted".equals(choice)) {
            palette = PALETTE_MUTED;
        } else {
            palette = PALETTE_RAINBOW;
        }
        int index = Math.max(depth - 1, 0) % palette.length;
        long argb = palette[index];
        return (argb & 0xFFFFFFFFL) << 32;
    }

    public static float lineAlpha(float alpha) {
        if (BinocularsMods.isEnabled("comment_line_colors")) {
            return 1.0f;
        }
        return alpha;
    }
}
