package app.revanced.extension.rif;

/** Pure helper for {@link InlineVideos}: where the picture sits inside a TextureView bitmap. */
final class VideoCrop {
    private VideoCrop() {}

    /** The crop within a w x h copy of the buffer, or null for none or a case not handled. */
    static int[] pictureRect(float[] m, int w, int h) {
        // Only the plain case: no rotation or mirroring.
        if (m[1] != 0 || m[4] != 0 || m[0] <= 0 || m[5] >= 0) return null;
        float left = m[12], right = m[12] + m[0], top = m[13] + m[5], bottom = m[13];
        if (left < 0 || top < 0 || right > 1.001f || bottom > 1.001f) return null;
        int x0 = Math.round(left * w), y0 = Math.round(top * h);
        int x1 = Math.min(w, Math.round(right * w)), y1 = Math.min(h, Math.round(bottom * h));
        if (x0 == 0 && y0 == 0 && x1 == w && y1 == h) return null;
        if (x1 - x0 < w / 2 || y1 - y0 < h / 2) return null; // implausible crop
        return new int[]{x0, y0, x1, y1};
    }
}
