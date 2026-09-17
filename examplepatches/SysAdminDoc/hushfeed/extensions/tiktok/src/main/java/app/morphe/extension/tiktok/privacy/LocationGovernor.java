/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.extension.tiktok.privacy;

import android.location.Location;
import android.location.LocationManager;

import app.morphe.extension.shared.Logger;

@SuppressWarnings("unused")
public final class LocationGovernor {

    public static Location interceptGetLastKnownLocation(LocationManager manager, String provider) {
        Logger.printInfo(() -> "Location governor: blocked getLastKnownLocation for " + provider);
        return null;
    }

    private LocationGovernor() {}
}
