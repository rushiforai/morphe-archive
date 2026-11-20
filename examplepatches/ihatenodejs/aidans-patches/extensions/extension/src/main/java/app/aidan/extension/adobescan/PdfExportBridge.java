package app.aidan.extension.adobescan;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.text.InputType;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.io.File;

public final class PdfExportBridge {

    private static final String TAG = "PdfExportBridge";

    private PdfExportBridge() {}

    public static void show(final Activity activity, final Object scanFile) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            return;
        }

        if (Looper.myLooper() != Looper.getMainLooper()) {
            new Handler(Looper.getMainLooper()).post(new Runnable() {
                @Override
                public void run() {
                    show(activity, scanFile);
                }
            });
            return;
        }

        if (scanFile == null) {
            PdfOperationUi.showSnackbar(activity, "No document selected for export.");
            return;
        }

        final File file = ScanFileAdapter.getInstance().getFile(scanFile);
        if (file == null || !file.exists() || !file.isFile() || file.length() <= 0) {
            PdfOperationUi.showSnackbar(activity, "Target document file not found on disk.");
            return;
        }


        final String[] options = new String[]{
                "Word (.docx)",
                "Excel (.xlsx)",
                "PowerPoint (.pptx)"
        };
        final int[] formats = new int[]{
                NativePdfEngine.EXPORT_DOCX,
                NativePdfEngine.EXPORT_XLSX,
                NativePdfEngine.EXPORT_PPTX
        };
        final int[] selected = new int[]{0};

        new AlertDialog.Builder(activity)
                .setTitle("Export to Office")
                .setSingleChoiceItems(options, 0, new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        selected[0] = which;
                    }
                })
                .setPositiveButton("Export", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        final int format = formats[selected[0]];
                        final ScanFileAdapter adapter = ScanFileAdapter.getInstance();
                        if (adapter.isProtected(scanFile) || adapter.getProtectionStatus(scanFile) == 2) {
                            promptPasswordAndExport(activity, scanFile, format, false);
                            return;
                        }
                        final PdfOperationCoordinator coordinator = PdfOperationCoordinator.getInstance();
                        if (coordinator == null) {
                            Log.e(TAG, "PdfOperationCoordinator is unavailable");
                            PdfOperationUi.showSnackbar(activity, "PDF service unavailable");
                            return;
                        }
                        coordinator.startExport(activity, scanFile, format);
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    public static void exportDocxDirect(final Activity activity, final Object scanFile) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            return;
        }

        if (Looper.myLooper() != Looper.getMainLooper()) {
            new Handler(Looper.getMainLooper()).post(new Runnable() {
                @Override
                public void run() {
                    exportDocxDirect(activity, scanFile);
                }
            });
            return;
        }

        if (scanFile == null) {
            PdfOperationUi.showSnackbar(activity, "No document selected for export.");
            return;
        }

        final File file = ScanFileAdapter.getInstance().getFile(scanFile);
        if (file == null || !file.exists() || !file.isFile() || file.length() <= 0) {
            PdfOperationUi.showSnackbar(activity, "Target document file not found on disk.");
            return;
        }

        final ScanFileAdapter adapter = ScanFileAdapter.getInstance();
        if (adapter.isProtected(scanFile) || adapter.getProtectionStatus(scanFile) == 2) {
            promptPasswordAndExport(activity, scanFile, NativePdfEngine.EXPORT_DOCX, false);
            return;
        }
        final PdfOperationCoordinator coordinator = PdfOperationCoordinator.getInstance();
        if (coordinator == null) {
            Log.e(TAG, "PdfOperationCoordinator is unavailable");
            PdfOperationUi.showSnackbar(activity, "PDF service unavailable");
            return;
        }
        coordinator.startExport(activity, scanFile, NativePdfEngine.EXPORT_DOCX);
    }

    public static void promptPasswordAndExport(
            final Activity activity,
            final Object scanFile,
            final int format,
            final boolean isRetry) {

        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            return;
        }

        if (Looper.myLooper() != Looper.getMainLooper()) {
            new Handler(Looper.getMainLooper()).post(new Runnable() {
                @Override
                public void run() {
                    promptPasswordAndExport(activity, scanFile, format, isRetry);
                }
            });
            return;
        }

        if (scanFile == null) {
            PdfOperationUi.showSnackbar(activity, "No document selected for export.");
            return;
        }

        final ScanFileAdapter adapter = ScanFileAdapter.getInstance();
        final String displayName = adapter.getDisplayName(scanFile);

        final LinearLayout root = new LinearLayout(activity);
        root.setOrientation(LinearLayout.VERTICAL);
        final int pad = dpToPx(activity, 20);
        root.setPadding(pad, dpToPx(activity, 12), pad, dpToPx(activity, 8));

        final TextView msgView = new TextView(activity);
        msgView.setTextSize(14f);
        if (isRetry) {
            msgView.setText("Incorrect password. Enter the password for \"" + displayName + "\" to export:");
            msgView.setTextColor(0xFFD32F2F);
        } else {
            msgView.setText("Enter the password for \"" + displayName + "\" to export:");
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
                .setPositiveButton("Export", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        final String rawPassword = passwordInput.getText().toString();
                        if (rawPassword.trim().isEmpty()) {
                            PdfOperationUi.showSnackbar(activity, "Password cannot be empty.");
                            return;
                        }
                        final PdfOperationCoordinator coordinator = PdfOperationCoordinator.getInstance();
                        if (coordinator == null) {
                            Log.e(TAG, "PdfOperationCoordinator is unavailable");
                            PdfOperationUi.showSnackbar(activity, "PDF service unavailable");
                            return;
                        }
                        coordinator.startExport(activity, scanFile, format, rawPassword);
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private static int dpToPx(final Activity activity, final int dp) {
        return Math.round(dp * activity.getResources().getDisplayMetrics().density);
    }
}
