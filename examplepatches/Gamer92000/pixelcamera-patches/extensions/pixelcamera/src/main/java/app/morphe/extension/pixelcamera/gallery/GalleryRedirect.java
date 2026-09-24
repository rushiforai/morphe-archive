/*
 * Copyright 2026
 * SPDX-License-Identifier: GPL-3.0-or-later
 */
package app.morphe.extension.pixelcamera.gallery;

import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.util.Log;
import android.view.View;
import android.webkit.MimeTypeMap;

import java.util.Locale;

/**
 * Runtime half of the "Use third-party gallery" patch.
 *
 * <p>Pixel Camera funnels every camera-roll thumbnail launch through one
 * method that (a) asks Google Photos' availability first and (b) finally calls
 * {@code Intent.resolveActivity} followed by {@code startActivityForResult}.
 * The patch injects calls to this class at exactly those points, so all of the
 * app's own animation, shared-element transition, cancellation and
 * error-handling code is reused untouched.
 *
 * <p>Nothing here references Google Photos, Immich, or any other package by
 * name. The redirect is a plain implicit {@link Intent#ACTION_VIEW}, which lets
 * Android apply the user's default handler and otherwise show the normal
 * resolver dialog.
 */
public final class GalleryRedirect {

    private static final String TAG = "MorpheGalleryRedirect";

    // Fallbacks used only when the media's concrete type cannot be determined.
    //
    // A fully wildcarded type (star slash star) is deliberately NOT used.
    // Android's IntentFilter matching does not treat it as matching a filter
    // that declares a wildcard subtype, so such an intent is invisible to most
    // galleries. Measured on a Pixel 10 Pro XL against an installed Immich,
    // with a content:// MediaStore URI:
    //
    //   type image/jpeg          -> Immich matches
    //   type image/* (subtype)   -> Immich matches
    //   type star slash star     -> Immich does NOT match
    //   no type at all           -> Immich does NOT match
    //
    // A wildcard subtype is therefore the widest usable fallback.
    private static final String FALLBACK_IMAGE_MIME_TYPE = "image/*";
    private static final String FALLBACK_VIDEO_MIME_TYPE = "video/*";

    /**
     * Secure-review actions end with this suffix
     * ({@code android.provider.action.REVIEW_SECURE} and Google Photos'
     * {@code ...mars.api.ACTION_REVIEW_SECURE}). These are only used when the
     * camera runs above the lock screen, where the caller expects the viewer to
     * show nothing except the items captured during this locked session.
     */
    private static final String SECURE_ACTION_SUFFIX = "_SECURE";

    private GalleryRedirect() {
    }

    // ---------------------------------------------------------------- launch

    /**
     * Whether secure (lock-screen) review launches should also be redirected.
     *
     * <p>This method is the switch between the two patches. The base
     * "Use third-party gallery" patch leaves it returning false. The separate
     * "Use third-party gallery on lock screen" patch rewrites the body to
     * return true.
     *
     * <p>It is deliberately a method rather than a field so the patch can flip
     * it with a single instruction insertion that does not depend on how the
     * Java compiler laid out static initialisers.
     *
     * @return false unless the lock-screen patch has been applied
     */
    public static boolean redirectSecureReview() {
        return false;
    }

    /**
     * Rewrites a Pixel Camera review intent into a generic implicit view
     * intent.
     *
     * <p>Secure (lock-screen) launches are left alone unless
     * {@link #redirectSecureReview()} has been patched to return true, because
     * third-party galleries have no notion of Android's secure-review contract
     * and a viewer opened that way may expose the whole library above the lock
     * screen.
     *
     * @param intent the intent Pixel Camera is about to launch; mutated in place
     * @param anchor the thumbnail view being launched from, used only to obtain
     *               a {@link Context} for MIME-type resolution; may be null
     */
    public static void prepareGalleryIntent(Intent intent, View anchor) {
        try {
            if (intent == null) {
                return;
            }

            String action = intent.getAction();
            if (action != null
                    && action.endsWith(SECURE_ACTION_SUFFIX)
                    && !redirectSecureReview()) {
                Log.i(TAG, "Secure review left untouched: " + action);
                return;
            }

            Uri data = intent.getData();
            if (data == null) {
                // Nothing identifies the media, so an implicit VIEW would be
                // meaningless. Leave the intent as-is and let the app's own
                // resolveActivity() null-check cancel the launch.
                Log.w(TAG, "Review intent has no data URI; not redirecting");
                return;
            }

            Context context = anchor != null ? anchor.getContext() : null;

            String mimeType = intent.getType();
            if (isBlank(mimeType)) {
                mimeType = resolveMimeType(context, data);
            }
            if (isBlank(mimeType)) {
                mimeType = guessMimeTypeFromUri(data);
            }

            intent.setAction(Intent.ACTION_VIEW);
            // Drop every explicit-target restriction so Android resolves the
            // intent normally: user default first, resolver dialog otherwise.
            intent.setPackage(null);
            intent.setComponent(null);
            intent.setSelector(null);
            // Pixel Camera calls setData() alone on the common path. An
            // implicit VIEW without a type does NOT match a gallery's
            // `scheme="content" mimeType="image/*"` filter, so the type must be
            // set explicitly here.
            intent.setDataAndType(data, mimeType);
            intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);

            Log.i(TAG, "Redirecting review to implicit VIEW, type=" + mimeType);
        } catch (Throwable t) {
            // Never let the redirect take the camera down. If anything goes
            // wrong the intent is left in whatever state it was in, and the
            // app's own resolveActivity()/try-catch handles the outcome.
            Log.e(TAG, "Failed to rewrite review intent", t);
        }
    }

    /**
     * Best-effort MIME type for a media URI.
     *
     * <ol>
     *   <li>{@link ContentResolver#getType} - authoritative for MediaStore and
     *       for Pixel Camera's own providers.</li>
     *   <li>File extension via {@link MimeTypeMap} - covers {@code file://}
     *       URIs and providers that return no type.</li>
     * </ol>
     *
     * @return the MIME type, or null when it cannot be determined
     */
    private static String resolveMimeType(Context context, Uri uri) {
        if (context != null) {
            try {
                String type = context.getContentResolver().getType(uri);
                if (!isBlank(type)) {
                    return type;
                }
            } catch (Throwable t) {
                Log.w(TAG, "ContentResolver.getType failed for " + uri.getScheme(), t);
            }
        }

        try {
            String path = uri.getPath();
            if (path != null) {
                int dot = path.lastIndexOf('.');
                if (dot >= 0 && dot < path.length() - 1) {
                    String extension = path.substring(dot + 1).toLowerCase(Locale.ROOT);
                    String type = MimeTypeMap.getSingleton().getMimeTypeFromExtension(extension);
                    if (!isBlank(type)) {
                        return type;
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "Extension-based MIME lookup failed", t);
        }

        return null;
    }

    /**
     * Last-resort type when neither the provider nor the file extension yields
     * one. MediaStore URIs carry their collection in the path
     * ({@code content://media/external/video/media/123}), and Pixel Camera's own
     * in-progress URIs keep the same shape, so the collection name is a
     * reliable image-versus-video discriminator.
     *
     * @return {@link #FALLBACK_VIDEO_MIME_TYPE} or {@link #FALLBACK_IMAGE_MIME_TYPE}
     */
    private static String guessMimeTypeFromUri(Uri uri) {
        try {
            String path = uri.getPath();
            if (path != null) {
                String lower = path.toLowerCase(Locale.ROOT);
                if (lower.contains("/video") || lower.contains("/movies")) {
                    return FALLBACK_VIDEO_MIME_TYPE;
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "URI-based MIME guess failed", t);
        }
        return FALLBACK_IMAGE_MIME_TYPE;
    }

    private static boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }

    // ------------------------------------------------ Google Photos gate

    /*
     * Pixel Camera refuses to start the review transition at all unless Google
     * Photos is installed, enabled and not suspended; otherwise it shows an
     * "enable Google Photos" dialog and cancels.
     *
     * The patch replaces the three probes below with these stand-ins. Each has
     * the same argument count and return type as the call it replaces, so the
     * surrounding register allocation is untouched. Only the Photos-specific
     * precondition is bypassed - the media URI, MIME type, thumbnail bitmap and
     * transition state are all still produced by the app's own code.
     */

    /**
     * Replaces Pixel Camera's {@code getPackageInfo("com.google.android.apps.photos")}
     * wrapper, which returns null when Photos is missing or disabled.
     *
     * <p>The returned value is only null-checked by the caller; it is never
     * dereferenced on this code path. A placeholder is returned rather than
     * real package data so that no assumption is made about any particular
     * viewer being installed.
     *
     * @param unusedHelper the app's own helper instance, ignored
     * @return a non-null placeholder {@link PackageInfo}
     */
    public static PackageInfo galleryPackageInfo(Object unusedHelper) {
        PackageInfo info = new PackageInfo();
        info.packageName = "";
        info.versionName = "0";
        return info;
    }

    /**
     * Replaces {@link PackageManager#getApplicationEnabledSetting(String)} for
     * the Google Photos package name.
     *
     * @return {@link PackageManager#COMPONENT_ENABLED_STATE_ENABLED}
     */
    public static int applicationEnabledSetting(PackageManager packageManager, String packageName) {
        return PackageManager.COMPONENT_ENABLED_STATE_ENABLED;
    }

    /**
     * Replaces {@code PackageManager.isPackageSuspended(String)} for the Google
     * Photos package name. The real call also throws
     * {@code NameNotFoundException} when Photos is absent entirely.
     *
     * @return false
     */
    public static boolean isPackageSuspended(PackageManager packageManager, String packageName) {
        return false;
    }
}
