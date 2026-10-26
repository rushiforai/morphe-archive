package app.xposed.extension;

/** Badge sizes from the X-Posed extension's Display settings; the toggles live in Settings. */
final class BadgeStyle {
    enum Size {
        // Height, icon, gap, padding and details padding in CSS px, plus the
        // span scale relative to the name's line height. TweetHeaderView is only as
        // tall as the name's glyphs, so anything above X's own verified badge scale
        // (0.8) gets its top clipped on names without emoji. That makes the box
        // smaller than on the web, so icons are 4px larger than the extension's to
        // keep the flag about as tall as the name, like it is there.
        SMALL(23, 17, 4, 1, 3, 0.74f),
        MEDIUM(25, 19, 6, 2, 4, 0.8f),
        LARGE(29, 21, 8, 3, 5, 0.8f);

        final float height, icon, gap, padding, detailsPadding, spanScale;

        Size(float height, float icon, float gap, float padding, float detailsPadding, float spanScale) {
            this.height = height;
            this.icon = icon;
            this.gap = gap;
            this.padding = padding;
            this.detailsPadding = detailsPadding;
            this.spanScale = spanScale;
        }
    }

    private BadgeStyle() {
    }
}
