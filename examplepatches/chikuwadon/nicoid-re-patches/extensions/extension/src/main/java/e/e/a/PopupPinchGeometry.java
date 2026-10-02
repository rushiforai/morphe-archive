package e.e.a;

/** Platform-independent bounds calculation, shared with host-side regression tests. */
public final class PopupPinchGeometry {
    private PopupPinchGeometry() { }

    public static int[] bounds(float requestedHeight, float ratio, float minHeight,
            float maxHeight, int screenWidth, int screenHeight,
            float anchorX, float anchorY, float fractionX, float fractionY) {
        if (!(ratio > 0) || Float.isInfinite(ratio)) ratio = 16f / 9f;
        screenWidth = Math.max(1, screenWidth);
        screenHeight = Math.max(1, screenHeight);
        float upper = Math.max(1, Math.min(maxHeight,
                Math.min(screenHeight, screenWidth / ratio)));
        float lower = Math.min(upper, Math.max(1, minHeight));
        if (Float.isNaN(requestedHeight)) requestedHeight = lower;
        int height = Math.max(1, Math.min(screenHeight,
                Math.round(Math.max(lower, Math.min(upper, requestedHeight)))));
        int width = Math.max(1, Math.min(screenWidth, Math.round(height * ratio)));
        int x = Math.max(0, Math.min(screenWidth - width,
                Math.round(anchorX - width * fractionX)));
        int y = Math.max(0, Math.min(screenHeight - height,
                Math.round(anchorY - height * fractionY)));
        return new int[]{width, height, x, y};
    }
}
