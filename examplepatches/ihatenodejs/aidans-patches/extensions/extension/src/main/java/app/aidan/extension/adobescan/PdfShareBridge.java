package app.aidan.extension.adobescan;

import android.app.Activity;
import android.content.ClipData;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.util.Log;
import java.io.File;
import java.lang.reflect.Method;
import java.util.UUID;

public final class PdfShareBridge {

    private static final String TAG = "PdfShareBridge";

    private PdfShareBridge() {}

    public static void retireLauncher(final UUID launcherId) {
        if (launcherId == null) return;
        try {
            final Class<?> companionClass = Class.forName("ft.i1$a");
            final Method aMethod = companionClass.getMethod("a", UUID.class);
            final Object launcher = aMethod.invoke(null, launcherId);
            if (launcher != null) {
                final Method bMethod = launcher.getClass().getMethod("b");
                bMethod.invoke(launcher);
            }
        } catch (final Throwable t) {
            Log.w(TAG, "Failed to retire cloud launcher: " + launcherId, t);
        }
    }

    public static void shareValidated(final Activity activity, final File stageFile, final String displayName) {
        shareValidated(activity, stageFile, displayName, null);
    }

    public static void shareDocument(
            final Activity activity,
            final File file,
            final String displayName,
            final String mimeType) {
        shareDocument(activity, file, displayName, mimeType, null);
    }

    public static void shareDocument(
            final Activity activity,
            final File file,
            final String displayName,
            final String mimeType,
            final UUID launcherId) {
        if (activity == null || file == null || !file.exists()) {
            Log.e(TAG, "Cannot share; invalid arguments or missing file");
            retireLauncher(launcherId);
            return;
        }

        try {
            String authority = null;
            try {
                final Class<?> naClass = Class.forName("wc.na");
                final Method bMethod = naClass.getMethod("b");
                authority = (String) bMethod.invoke(null);
            } catch (final Throwable t) {
                Log.w(TAG, "Failed to get authority from wc.na.b(); falling back to package default", t);
                authority = activity.getPackageName() + ".provider";
            }

            Uri contentUri = null;
            try {
                final Class<?> fpClass = Class.forName("androidx.core.content.FileProvider");
                Method dMethod = null;
                try {
                    dMethod = fpClass.getMethod("d", Context.class, String.class, File.class);
                } catch (final NoSuchMethodException e) {
                    dMethod = fpClass.getMethod("getUriForFile", Context.class, String.class, File.class);
                }
                contentUri = (Uri) dMethod.invoke(null, activity, authority, file);
            } catch (final Throwable t) {
                Log.e(TAG, "Failed to obtain content URI for file sharing", t);
                PdfOperationUi.showSnackbar(activity, "Sharing failed: could not resolve file provider");
                retireLauncher(launcherId);
                return;
            }

            final String subject = (displayName != null) ? displayName : "Document";

            final Intent sendIntent = new Intent(Intent.ACTION_SEND);
            sendIntent.setType(mimeType != null ? mimeType : "application/octet-stream");
            sendIntent.putExtra(Intent.EXTRA_STREAM, contentUri);
            sendIntent.putExtra(Intent.EXTRA_SUBJECT, subject);
            sendIntent.setClipData(ClipData.newUri(activity.getContentResolver(), subject, contentUri));
            sendIntent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);

            final Intent chooserIntent = Intent.createChooser(sendIntent, "Share");
            activity.startActivity(chooserIntent);

        } catch (final Throwable t) {
            Log.e(TAG, "Error initiating share intent", t);
            PdfOperationUi.showSnackbar(activity, "Sharing failed");
        } finally {
            retireLauncher(launcherId);
        }
    }

    public static void shareValidated(
            final Activity activity,
            final File stageFile,
            final String displayName,
            final UUID launcherId) {
        final String subject = (displayName != null && displayName.toLowerCase().endsWith(".pdf"))
                ? displayName
                : ((displayName != null ? displayName : "Scan") + ".pdf");
        shareDocument(activity, stageFile, subject, "application/pdf", launcherId);
    }
}
