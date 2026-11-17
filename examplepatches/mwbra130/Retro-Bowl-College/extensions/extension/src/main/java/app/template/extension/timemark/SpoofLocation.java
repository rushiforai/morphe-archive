package app.template.extension.timemark;

import java.lang.reflect.Field;

/**
 * Runtime end of the "Spoof watermark location" patch, modeled on hxreborn's
 * BeReal CustomLocation: the saved coordinates (picked on the OpenStreetMap
 * picker in the patch settings) are applied to the app's location fix at the
 * single funnel the patch hooks — GlobalLocationService.refreshPlace, whose
 * fix object (Lry/c;) carries the position in two public double fields,
 * a = latitude and b = longitude. When the custom location is off or no valid
 * coordinates are saved, this is a no-op and the real GPS fix flows through
 * untouched. Never throws: a failure leaves the real fix in place.
 */
public final class SpoofLocation {

    private SpoofLocation() {
    }

    public static void applyToFix(Object fix) {
        try {
            if (fix == null || !PatchSettings.customLocation()) {
                return;
            }
            final Coordinates coordinates = Coordinates.parse(PatchSettings.latitude(), PatchSettings.longitude());
            if (coordinates == null) {
                return;
            }
            final Class<?> fixClass = fix.getClass();
            final Field latitude = fixClass.getField("a");
            latitude.setAccessible(true);
            latitude.setDouble(fix, coordinates.latitude);
            final Field longitude = fixClass.getField("b");
            longitude.setAccessible(true);
            longitude.setDouble(fix, coordinates.longitude);
        } catch (Throwable ignored) {
        }
    }

    /** Short state text for the settings row value and the settings screen. */
    public static String summary() {
        if (!PatchSettings.customLocation()) {
            return "";
        }
        final Coordinates coordinates = Coordinates.parse(PatchSettings.latitude(), PatchSettings.longitude());
        if (coordinates == null) {
            return "";
        }
        final LocationSummary summary = LocationSummary.of(PatchSettings.label(), coordinates);
        return summary.label.isEmpty() ? summary.coordinates : summary.label;
    }
}
