package app.aidan.extension.adobescan;

import android.app.Application;
import android.os.Build;

public final class PdfProcess {

    public static final String WORKER_PROCESS_NAME = "com.adobe.scan.android:aidan_pdf";

    private PdfProcess() {}

    public static boolean isWorkerProcess() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            final String processName = Application.getProcessName();
            return processName != null && processName.startsWith(WORKER_PROCESS_NAME);
        }
        return false;
    }
}
