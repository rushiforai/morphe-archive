package nl.johninnl.eclipse.auto.ui;

import androidx.car.app.model.CarIcon;

/**
 * What template building needs from the car: the negotiated level and images. Keeping it an
 * interface lets every page be built and inspected in a JVM test at either level.
 */
public interface Env {
    /** True when the host negotiated API 9; API 9 components are never built otherwise. */
    boolean api9();

    /** A bundled vector icon by short name (e.g. {@code facet_songs}); never null. */
    CarIcon icon(String name);

    /** The same icon tinted with the accent colour ({@code CarIcon.createTintedIcon}); never null. */
    CarIcon accentIcon(String name);

    /** Artwork from the app's own provider, or the bundled placeholder; never null. */
    CarIcon art(String url);
}
