package app.morphe.extension.maps.patches;

/**
 * Rows that opt-in patches add to the main Maps Settings screens. The shared Settings hook calls {@link #attach}
 * once per screen; each owning patch makes its row switch below return true.
 */
@SuppressWarnings("unused")
public final class MapsSettingsRows {
    private MapsSettingsRows() {
    }

    public static void attach(Object fragment, String schema) {
        // Each row catches its own failures, so one row cannot hide the other.
        if (vehicleRow()) BydVehicleSettings.attach(fragment, schema);
        if (pictureInPictureRow()) PictureInPicturePatch.attach(fragment, schema);
    }

    // Row switches: the owning patch rewrites the constant to true (enableSettingsRow).
    private static boolean vehicleRow() {
        return false;
    }

    private static boolean pictureInPictureRow() {
        return false;
    }
}
