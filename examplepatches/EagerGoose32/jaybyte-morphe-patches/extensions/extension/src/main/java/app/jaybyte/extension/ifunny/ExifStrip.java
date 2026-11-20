package app.jaybyte.extension.ifunny;

import android.media.ExifInterface;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Locale;

/**
 * Removes GPS and device-identifying EXIF tags from images before they are uploaded.
 * Works on a copy in the app cache; the user's original file is never modified.
 * Any failure falls back to the original file so uploads never break.
 */
@SuppressWarnings("unused")
public final class ExifStrip {
    private static final String[] TAGS = {
            "GPSLatitude", "GPSLatitudeRef", "GPSLongitude", "GPSLongitudeRef",
            "GPSAltitude", "GPSAltitudeRef", "GPSTimeStamp", "GPSDateStamp",
            "GPSProcessingMethod", "GPSAreaInformation", "GPSSpeed", "GPSSpeedRef",
            "GPSImgDirection", "GPSImgDirectionRef", "GPSDestLatitude", "GPSDestLatitudeRef",
            "GPSDestLongitude", "GPSDestLongitudeRef", "GPSTrack", "GPSTrackRef",
            "GPSHPositioningError", "BodySerialNumber", "LensSerialNumber",
            "CameraOwnerName", "ImageUniqueID", "Make", "Model"
    };

    private ExifStrip() {
    }

    public static File strip(File original) {
        if (original == null) return null;
        String name = original.getName().toLowerCase(Locale.ROOT);
        if (!(name.endsWith(".jpg") || name.endsWith(".jpeg")
                || name.endsWith(".png") || name.endsWith(".webp"))) {
            return original;
        }
        File copy = null;
        try {
            copy = File.createTempFile("jbexif", "_" + original.getName());
            copyFile(original, copy);
            ExifInterface exif = new ExifInterface(copy.getAbsolutePath());
            for (String tag : TAGS) exif.setAttribute(tag, null);
            exif.saveAttributes();
            return copy;
        } catch (Throwable t) {
            if (copy != null) //noinspection ResultOfMethodCallIgnored
                copy.delete();
            return original;
        }
    }

    private static void copyFile(File from, File to) throws Exception {
        try (InputStream in = new FileInputStream(from); OutputStream out = new FileOutputStream(to)) {
            byte[] buf = new byte[64 * 1024];
            int n;
            while ((n = in.read(buf)) > 0) out.write(buf, 0, n);
        }
    }
}
