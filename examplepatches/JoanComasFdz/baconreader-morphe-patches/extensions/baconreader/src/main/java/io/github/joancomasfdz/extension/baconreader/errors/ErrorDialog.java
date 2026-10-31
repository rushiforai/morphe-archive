// SPDX-FileCopyrightText: 2026 ReVanced contributors
// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.errors;

import static app.morphe.extension.shared.StringRef.str;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import androidx.annotation.Nullable;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.ref.WeakReference;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;

/**
 * Errors of the BaconReader patches and of the shared Morphe code (Logger.printException, redirected here in
 * BaconReader), shown in a dialog with all the details instead of a short toast: what failed,
 * the error and its causes, the stack trace, the app, patches and Android versions. The details can be copied or
 * saved to a file (Downloads), to report them.
 */
@SuppressWarnings("unused")
public final class ErrorDialog {
    /** At most this many errors in the open dialog, so a repeating error cannot grow it forever. */
    private static final int MAX_ERRORS = 20;
    private static final String SEPARATOR = "\n\n────────────\n\n";

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** The screen on top, to show the dialog on. */
    private static WeakReference<Activity> resumed = new WeakReference<>(null);
    /** Errors waiting for a screen (they happened in the background). */
    private static final StringBuilder pending = new StringBuilder();
    private static int pendingCount;

    private static AlertDialog dialog;
    private static TextView detailsView;
    private static int dialogCount;

    private ErrorDialog() {
    }

    /** Injected in the app's Application.onCreate: follows the screen on top. */
    public static void init(Application application) {
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            @Override
            public void onActivityResumed(Activity activity) {
                resumed = new WeakReference<>(activity);
                if (pendingCount > 0) {
                    String details = pending.toString();
                    int count = pendingCount;
                    pending.setLength(0);
                    pendingCount = 0;
                    show(activity, details, count);
                }
            }

            @Override
            public void onActivityPaused(Activity activity) {
                if (resumed.get() == activity) resumed = new WeakReference<>(null);
            }

            @Override
            public void onActivityDestroyed(Activity activity) {
                if (dialog != null && dialog.getOwnerActivity() == activity) {
                    dialog = null;
                    detailsView = null;
                }
            }

            @Override
            public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
            }

            @Override
            public void onActivityStarted(Activity activity) {
            }

            @Override
            public void onActivityStopped(Activity activity) {
            }

            @Override
            public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
            }
        });
    }

    /**
     * Logs the error, as {@link Logger#printException}, and shows it in the error dialog instead of a toast.
     * Safe to call from any thread.
     */
    public static void printException(Logger.LogMessage message, @Nullable Throwable ex) {
        String text = message.buildMessageString();
        Logger.printInfo(message, ex instanceof Exception ? (Exception) ex : null);
        String details = details(source(message), text, ex);
        MAIN.post(() -> {
            Activity activity = resumed.get();
            if (activity == null || activity.isFinishing()) {
                if (pendingCount < MAX_ERRORS) {
                    if (pending.length() > 0) pending.append(SEPARATOR);
                    pending.append(details);
                    pendingCount++;
                }
                return;
            }
            show(activity, details, 1);
        });
    }

    public static void printException(Logger.LogMessage message) {
        printException(message, null);
    }

    // region Details

    /** The patch the error comes from: the class of the message lambda. */
    private static String source(Logger.LogMessage message) {
        String name = message.getClass().getName();
        int lambda = name.indexOf('$');
        if (lambda > 0) name = name.substring(0, lambda);
        return name.substring(name.lastIndexOf('.') + 1);
    }

    private static String details(String source, String message, @Nullable Throwable ex) {
        StringBuilder details = new StringBuilder();
        details.append(source).append(": ").append(message).append('\n');
        for (Throwable cause = ex; cause != null; cause = cause.getCause() == cause ? null : cause.getCause()) {
            details.append(cause == ex ? "\nError: " : "Caused by: ")
                    .append(cause.getClass().getName());
            if (cause.getMessage() != null) details.append(": ").append(cause.getMessage());
            details.append('\n');
        }

        details.append("\nTime: ")
                .append(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss Z", Locale.US).format(new Date())).append('\n');
        try {
            Context context = Utils.getContext();
            details.append("App: ").append(context.getPackageName()).append(' ')
                    .append(Utils.getAppVersionName()).append('\n');
        } catch (Exception ignored) {
        }
        try {
            details.append("Patches: ").append(Utils.getPatchesReleaseVersion()).append('\n');
        } catch (Exception ignored) {
        }
        details.append("Android: ").append(Build.VERSION.RELEASE).append(" (API ").append(Build.VERSION.SDK_INT)
                .append("), ").append(Build.MANUFACTURER).append(' ').append(Build.MODEL).append('\n');

        details.append("\nStack trace:\n");
        StringWriter stackTrace = new StringWriter();
        // Without an error, where it was reported from.
        (ex != null ? ex : new Throwable("Reported at")).printStackTrace(new PrintWriter(stackTrace));
        details.append(stackTrace.toString().trim());
        return details.toString();
    }

    // endregion

    // region Dialog

    private static void show(Activity activity, String details, int count) {
        try {
            // Another error while the dialog is open: added to it.
            if (dialog != null && dialog.isShowing() && dialog.getOwnerActivity() == activity && detailsView != null) {
                if (dialogCount >= MAX_ERRORS) return;
                detailsView.append(SEPARATOR + details);
                dialogCount += count;
                return;
            }
            dialogCount = count;

            int padding = dp(activity, 20);
            int textColor = textColor(activity);

            LinearLayout root = new LinearLayout(activity);
            root.setOrientation(LinearLayout.VERTICAL);
            root.setPadding(padding, dp(activity, 12), dp(activity, 8), dp(activity, 8));

            LinearLayout header = new LinearLayout(activity);
            header.setOrientation(LinearLayout.HORIZONTAL);
            header.setGravity(Gravity.CENTER_VERTICAL);
            TextView title = new TextView(activity);
            title.setText(str("revanced_baconreader_error_title"));
            title.setTextColor(textColor);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
            title.setTypeface(Typeface.DEFAULT_BOLD);
            header.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            ImageView close = new ImageView(activity);
            close.setContentDescription(str("revanced_baconreader_error_close"));
            Drawable closeIcon = drawable(activity, "abc_ic_clear_material");
            if (closeIcon != null) closeIcon.setTint(textColor);
            close.setImageDrawable(closeIcon);
            close.setScaleType(ImageView.ScaleType.CENTER_INSIDE);
            close.setBackground(themeDrawable(activity, android.R.attr.selectableItemBackgroundBorderless));
            header.addView(close, new LinearLayout.LayoutParams(dp(activity, 48), dp(activity, 48)));
            root.addView(header);

            final TextView text = new TextView(activity);
            text.setText(details);
            text.setTextColor(textColor);
            text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            text.setTypeface(Typeface.MONOSPACE);
            text.setTextIsSelectable(true);
            text.setPadding(0, dp(activity, 8), dp(activity, 12), dp(activity, 8));
            // At most 60% of the screen: the buttons stay visible.
            final int maxHeight = activity.getResources().getDisplayMetrics().heightPixels * 6 / 10;
            ScrollView scroll = new ScrollView(activity) {
                @Override
                protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
                    super.onMeasure(widthMeasureSpec, MeasureSpec.makeMeasureSpec(maxHeight, MeasureSpec.AT_MOST));
                }
            };
            scroll.addView(text);
            root.addView(scroll, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

            LinearLayout buttons = new LinearLayout(activity);
            buttons.setOrientation(LinearLayout.HORIZONTAL);
            buttons.setGravity(Gravity.END);
            Button copy = new Button(activity, null, android.R.attr.borderlessButtonStyle);
            copy.setText(str("revanced_baconreader_error_copy"));
            copy.setOnClickListener(v -> copy(activity, text.getText().toString()));
            Button save = new Button(activity, null, android.R.attr.borderlessButtonStyle);
            save.setText(str("revanced_baconreader_error_save"));
            save.setOnClickListener(v -> save(activity, text.getText().toString()));
            buttons.addView(copy);
            buttons.addView(save);
            root.addView(buttons);

            AlertDialog created = new AlertDialog.Builder(activity).setView(root).create();
            created.setOwnerActivity(activity);
            created.setCanceledOnTouchOutside(false);
            close.setOnClickListener(v -> created.dismiss());
            created.setOnDismissListener(d -> {
                if (dialog == created) {
                    dialog = null;
                    detailsView = null;
                }
            });
            dialog = created;
            detailsView = text;
            created.show();
        } catch (Exception ex) {
            // The dialog itself failed: the error is still in the log, show it short.
            Logger.printInfo(() -> "Could not show the error dialog", ex);
            Utils.showToastLong(details.substring(0, Math.min(details.length(), 300)));
        }
    }

    private static void copy(Activity activity, String details) {
        ClipboardManager clipboard = (ClipboardManager) activity.getSystemService(Context.CLIPBOARD_SERVICE);
        clipboard.setPrimaryClip(ClipData.newPlainText("BaconReader error", details));
        Utils.showToastShort(str("revanced_baconreader_error_copied"));
    }

    /** Saves the details to Downloads (no permission needed on Android 10+), else to the app's own folder. */
    private static void save(Activity activity, String details) {
        String name = "baconreader-error-"
                + new SimpleDateFormat("yyyyMMdd-HHmmss", Locale.US).format(new Date()) + ".txt";
        byte[] bytes = details.getBytes(StandardCharsets.UTF_8);
        try {
            String location;
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                ContentResolver resolver = activity.getContentResolver();
                ContentValues values = new ContentValues();
                values.put(MediaStore.MediaColumns.DISPLAY_NAME, name);
                values.put(MediaStore.MediaColumns.MIME_TYPE, "text/plain");
                values.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS);
                Uri uri = resolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
                if (uri == null) throw new java.io.IOException("No Downloads folder");
                try (OutputStream out = resolver.openOutputStream(uri)) {
                    if (out == null) throw new java.io.IOException("Cannot write " + uri);
                    out.write(bytes);
                }
                location = Environment.DIRECTORY_DOWNLOADS + "/" + name;
            } else {
                File file = new File(activity.getExternalFilesDir(null), name);
                try (OutputStream out = new FileOutputStream(file)) {
                    out.write(bytes);
                }
                location = file.getAbsolutePath();
            }
            Utils.showToastLong(str("revanced_baconreader_error_saved", location));
        } catch (Exception ex) {
            Logger.printInfo(() -> "Could not save the error details", ex);
            Utils.showToastLong(str("revanced_baconreader_error_save_failed", String.valueOf(ex.getMessage())));
        }
    }

    // endregion

    // region Utilities

    private static int textColor(Activity activity) {
        android.content.res.TypedArray array = activity.getTheme()
                .obtainStyledAttributes(new int[]{android.R.attr.textColorPrimary});
        try {
            return array.getColor(0, 0xFF888888);
        } finally {
            array.recycle();
        }
    }

    private static Drawable drawable(Activity activity, String name) {
        int id = ResourceUtils.getIdentifier(ResourceType.DRAWABLE, name);
        return id == 0 ? null : activity.getDrawable(id).mutate();
    }

    private static Drawable themeDrawable(Activity activity, int attribute) {
        TypedValue value = new TypedValue();
        if (!activity.getTheme().resolveAttribute(attribute, value, true) || value.resourceId == 0) return null;
        return activity.getDrawable(value.resourceId);
    }

    private static int dp(Context context, int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                context.getResources().getDisplayMetrics()));
    }

    // endregion
}
