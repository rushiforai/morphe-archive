package e.e.a;

/** Pure scheduling policy: avoid sampling frames when light cannot be drawn. */
public final class AmbientSampling148 {
    private AmbientSampling148() {}

    /**
     * Only the four visual direction bits are significant.  Do not schedule
     * TextureView.getBitmap or PixelCopy for a non-emitting configuration.
     */
    public static boolean shouldSample(boolean enabled, boolean currentMode,
                                       int intensity, int directionMask) {
        return enabled && currentMode && intensity > 0 && (directionMask & 15) != 0;
    }
}
