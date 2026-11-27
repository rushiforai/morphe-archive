package de.rossmann.app.android.models.coupon;

/**
 * Compile-only stub of Rossmann's Coupon model, verified against 5.11.1
 * (versionCode 421000110).
 *
 * The single-letter field names are the app's R8 output. The patch fingerprints
 * pin this exact build, so the names are stable as long as the compatibility
 * declaration in app.gogamid.morphed.patches.shared.Constants does not move.
 *
 * This class is never shipped. It is compiled into
 * extensions/extension/libs/rossmann-stub-5.11.1.jar which the extension
 * module uses as compileOnly, so the extension dex never contains it.
 * At runtime the calls bind against the app's real classes.
 */
public final class Coupon {

    /** Backend coupon identifier (EAN). */
    public final String l = null;

    /** Coupon is in the wallet. */
    public final boolean q;

    /** Preview state of the coupon. NotPreview means the coupon is available now. */
    public final PreviewState R = null;

    private Coupon() {
        throw new UnsupportedOperationException("stub");
    }

    /** Base of the coupon preview states. */
    public abstract static class PreviewState {

        /** The coupon is available now; its availableFrom date lies in the past or is absent. */
        public static final class NotPreview extends PreviewState {

            /** The app exposes the single instance through this static field. */
            public static final NotPreview a = null;
        }
    }
}
