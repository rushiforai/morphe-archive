package com.thegibbonn.extension;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Icon;
import android.media.MediaMetadata;
import android.os.Build;
import androidx.core.graphics.drawable.IconCompat;

/**
 * Safe wrappers for bitmap and icon operations to prevent crashes on Android 14/15+.
 */
public class BitmapCrashGuard {

    public static boolean isBitmapValid(Bitmap bitmap) {
        return bitmap != null && !bitmap.isRecycled();
    }

    public static MediaMetadata.Builder safePutBitmap(MediaMetadata.Builder builder, String key, Bitmap bitmap) {
        if (builder == null) return null;
        if (isBitmapValid(bitmap)) {
            try {
                return builder.putBitmap(key, bitmap);
            } catch (Throwable ignored) {
            }
        }
        return builder;
    }

    public static Icon safeCreateWithBitmap(Bitmap bitmap) {
        if (isBitmapValid(bitmap)) {
            try {
                return Icon.createWithBitmap(bitmap);
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    public static Icon safeCreateWithAdaptiveBitmap(Bitmap bitmap) {
        if (isBitmapValid(bitmap)) {
            try {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    return Icon.createWithAdaptiveBitmap(bitmap);
                } else {
                    return Icon.createWithBitmap(bitmap);
                }
            } catch (Throwable ignored) {
            }
        }
        return null;
    }

    public static Icon safeToIcon(IconCompat iconCompat, Context context) {
        if (iconCompat == null) return null;
        try {
            return iconCompat.toIcon(context);
        } catch (Throwable ignored) {
            return null;
        }
    }
}
