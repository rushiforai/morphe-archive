package app.morphe.extension.arcore;

/**
 * Extension code compiled into the .mpe and called from the patch.
 *
 * Returns the public ARCore enum value for "supported and installed".
 * This class is only a return-value helper — it does not create a
 * device profile, does not touch native code, and does not make
 * ArSession_create() succeed on its own.
 *
 * WHY REFLECTION: the extension module has no ARCore SDK on its
 * compile classpath (com.google.ar:core is not a dependency of this
 * project), so a direct reference to com.google.ar.core.ArCoreApk
 * fails the build with "package com.google.ar.core does not exist"
 * (seen in the GitHub Actions build log, 2026-11-11). The enum is
 * looked up by name at runtime instead, inside the patched ARCore
 * APK itself — where the class really exists. The patch then
 * check-casts the returned Object to ArCoreApk$Availability.
 * Returns null only if the class is missing (i.e. the target is
 * not a real ARCore APK at all).
 */
@SuppressWarnings({"unchecked", "rawtypes", "unused"})
public class ArCoreAvailability {

    public static Object supportedInstalled() {
        try {
            Class<?> availabilityClass =
                    Class.forName("com.google.ar.core.ArCoreApk$Availability");
            return Enum.valueOf((Class) availabilityClass, "SUPPORTED_INSTALLED");
        } catch (Exception e) {
            return null;
        }
    }
}
