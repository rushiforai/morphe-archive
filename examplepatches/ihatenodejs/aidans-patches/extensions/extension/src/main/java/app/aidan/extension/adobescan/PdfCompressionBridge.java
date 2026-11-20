package app.aidan.extension.adobescan;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.text.InputType;
import android.util.Log;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.UUID;

public final class PdfCompressionBridge {

    private static final String TAG = "PdfCompressionBridge";

    private PdfCompressionBridge() {}

    /**
     * Constructs the compression selection result from CompressActivity, sets RESULT_OK and finishes.
     * Replaces old cloud dispatch in CompressActivity$e.
     */
    public static void selectCompression(final Activity activity) {
        if (activity == null) {
            Log.e(TAG, "selectCompression called with null activity");
            return;
        }

        try {
            final Class<?> actClass = activity.getClass();

            // 1. Resolve currentScanFileId from activity.S0.i()
            long scanFileId = -1;
            try {
                final Field s0Field = actClass.getField("S0");
                final Object m0 = s0Field.get(activity);
                if (m0 != null) {
                    final Method iMethod = m0.getClass().getMethod("i");
                    scanFileId = (Long) iMethod.invoke(m0);
                }
            } catch (final Throwable t) {
                Log.e(TAG, "Failed to resolve currentScanFileId from CompressActivity.S0", t);
            }

            // 2. Resolve selectedCompressionLevel from activity.x1().getValue()
            int compressionLevel = 1; // default LOW
            try {
                final Method x1Method = actClass.getMethod("x1");
                final Object levelEnum = x1Method.invoke(activity);
                if (levelEnum != null) {
                    final Method getValueMethod = levelEnum.getClass().getMethod("getValue");
                    compressionLevel = (Integer) getValueMethod.invoke(levelEnum);
                }
            } catch (final Throwable t) {
                Log.w(TAG, "Failed to resolve selectedCompressionLevel from x1(); attempting fallback", t);
            }

            // 3. Resolve compressAndShare and launcherId from getIntent()
            boolean compressAndShare = false;
            Serializable launcherId = null;
            final Intent srcIntent = activity.getIntent();
            if (srcIntent != null) {
                compressAndShare = srcIntent.getBooleanExtra("compressAndShare", false);
                launcherId = srcIntent.getSerializableExtra("launcherId");
            }

            // 4. Resolve extraContextData from activity.T0
            Serializable extraContextData = null;
            try {
                final Field t0Field = actClass.getField("T0");
                final Object t0Val = t0Field.get(activity);
                if (t0Val instanceof Serializable) {
                    extraContextData = (Serializable) t0Val;
                }
            } catch (final Throwable ignored) {
            }

            // 5. Check activity.W0 for compressAndShare override
            try {
                final Field w0Field = actClass.getField("W0");
                compressAndShare = w0Field.getBoolean(activity);
            } catch (final Throwable ignored) {
            }

            final Intent resultIntent = new Intent();
            resultIntent.putExtra("currentScanFileId", scanFileId);
            resultIntent.putExtra("selectedCompressionLevel", compressionLevel);
            resultIntent.putExtra("compressAndShare", compressAndShare);
            if (launcherId != null) {
                resultIntent.putExtra("launcherId", launcherId);
            }
            if (extraContextData != null) {
                resultIntent.putExtra("extraContextData", extraContextData);
            }

            activity.setResult(Activity.RESULT_OK, resultIntent);
            activity.finish();

        } catch (final Throwable t) {
            Log.e(TAG, "Failed to select compression in CompressActivity", t);
            activity.finish();
        }
    }

    /**
     * Consumes the compression selection result from CompressActivity in zq/qa.
     * Starts local compression transform without dispatching to Adobe Document Cloud.
     *
     * @return true if the result was consumed and handled locally; false otherwise.
     */
    public static boolean onCompressionResult(final Activity activity, final int resultCode, final Intent data) {
        if (resultCode != Activity.RESULT_OK || data == null) {
            return false;
        }

        final long scanFileId = data.getLongExtra("currentScanFileId", -1L);
        if (scanFileId == -1L) {
            Log.w(TAG, "onCompressionResult received invalid currentScanFileId");
            return false;
        }

        final int compressionLevel = data.getIntExtra("selectedCompressionLevel", 1);
        final boolean compressAndShare = data.getBooleanExtra("compressAndShare", false);
        final Serializable launcherIdObj = data.getSerializableExtra("launcherId");
        final UUID launcherId = (launcherIdObj instanceof UUID) ? (UUID) launcherIdObj : null;

        final ScanFileAdapter adapter = ScanFileAdapter.getInstance();
        final Object scanFileObj = adapter.getScanFileById(scanFileId);
        if (scanFileObj == null) {
            Log.e(TAG, "Could not resolve ScanFile model for id: " + scanFileId);
            PdfOperationUi.showSnackbar(activity, "Compression failed: Document unavailable");
            if (launcherId != null) {
                PdfShareBridge.retireLauncher(launcherId);
            }
            return true;
        }

        if (adapter.isProtected(scanFileObj)) {
            promptPasswordAndCompress(
                    activity,
                    scanFileObj,
                    compressionLevel,
                    compressAndShare,
                    launcherId,
                    false);
            return true;
        }

        final PdfOperationCoordinator coordinator = PdfOperationCoordinator.getInstance();
        if (coordinator != null) {
            coordinator.startCompression(
                    activity,
                    scanFileObj,
                    compressionLevel,
                    compressAndShare,
                    launcherId);
            return true;
        }

        PdfOperationUi.showSnackbar(activity, "Compression failed: Document unavailable");
        if (launcherId != null) {
            PdfShareBridge.retireLauncher(launcherId);
        }
        return true; // Return TRUE to consume result and prevent Document Cloud fallback
    }

    /**
     * Legacy direct compression entry point. Kept for backwards compatibility during cutover.
     */
    public static void compressFile(final Activity activity, final Object scanFileObj, final int compressionLevel) {
        if (activity == null || scanFileObj == null) {
            return;
        }
        final ScanFileAdapter adapter = ScanFileAdapter.getInstance();
        if (adapter.isProtected(scanFileObj)) {
            promptPasswordAndCompress(activity, scanFileObj, compressionLevel, false, null, false);
            return;
        }
        final PdfOperationCoordinator coordinator = PdfOperationCoordinator.getInstance();
        if (coordinator != null) {
            coordinator.startCompression(activity, scanFileObj, compressionLevel, false, null);
        }
    }

    public static void promptPasswordAndCompress(
            final Activity activity,
            final Object scanFileObj,
            final int compressionLevel,
            final boolean compressAndShare,
            final UUID launcherId,
            final boolean isRetry) {

        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            if (launcherId != null) {
                PdfShareBridge.retireLauncher(launcherId);
            }
            return;
        }

        final ScanFileAdapter adapter = ScanFileAdapter.getInstance();
        final String displayName = adapter.getDisplayName(scanFileObj);

        final LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        final int pad = dpToPx(activity, 20);
        root.setPadding(pad, dpToPx(activity, 12), pad, dpToPx(activity, 8));

        final TextView msgView = new TextView(activity);
        msgView.setTextSize(14f);
        if (isRetry) {
            msgView.setText("Incorrect password. Enter the password for \"" + displayName + "\" to compress:");
            msgView.setTextColor(0xFFD32F2F);
        } else {
            msgView.setText("Enter the password for \"" + displayName + "\" to compress and re-protect:");
        }
        msgView.setPadding(0, 0, 0, dpToPx(activity, 12));
        root.addView(msgView);

        final EditText passwordInput = new EditText(activity);
        passwordInput.setHint("Password");
        passwordInput.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_PASSWORD);
        passwordInput.setSingleLine(true);
        root.addView(passwordInput);

        new AlertDialog.Builder(activity)
                .setTitle("Password Required")
                .setView(root)
                .setPositiveButton("Compress", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        final String password = passwordInput.getText().toString().trim();
                        if (password.isEmpty()) {
                            PdfOperationUi.showSnackbar(activity, "Password cannot be empty.");
                            if (launcherId != null) {
                                PdfShareBridge.retireLauncher(launcherId);
                            }
                            return;
                        }
                        final PdfOperationCoordinator coordinator = PdfOperationCoordinator.getInstance();
                        if (coordinator != null) {
                            coordinator.startCompression(
                                    activity,
                                    scanFileObj,
                                    compressionLevel,
                                    password,
                                    compressAndShare,
                                    launcherId);
                        }
                    }
                })
                .setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        if (launcherId != null) {
                            PdfShareBridge.retireLauncher(launcherId);
                        }
                    }
                })
                .setOnCancelListener(new DialogInterface.OnCancelListener() {
                    @Override
                    public void onCancel(DialogInterface dialog) {
                        if (launcherId != null) {
                            PdfShareBridge.retireLauncher(launcherId);
                        }
                    }
                })
                .show();
    }

    private static int dpToPx(final Activity activity, final int dp) {
        return Math.round(dp * activity.getResources().getDisplayMetrics().density);
    }
}
