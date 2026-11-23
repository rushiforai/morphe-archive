package io.github.xxlc.extension.grok;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

import java.util.Locale;

/** Short toast notification for the number of download requests queued in the library. */
public final class Notify {
    private Notify() {
    }

    public static void queued(Context suppliedContext, int count) {
        try {
            Context context = suppliedContext;
            if (context == null) {
                context = application("android.app.ActivityThread", "currentApplication");
            }
            if (context == null) {
                context = application("android.app.AppGlobals", "getInitialApplication");
            }
            if (context == null) {
                return;
            }
            Context toastContext = context;

            // Resource ID assigned during patching is not passed into this helper.
            Locale locale = Locale.getDefault();
            String format = "vi".equals(locale.getLanguage())
                    ? "Đã đưa %1$d tệp vào hàng đợi tải"
                    : "Queued %1$d files for download";
            String message = String.format(locale, format, count);
            new Handler(Looper.getMainLooper()).post(() -> {
                try {
                    Toast.makeText(toastContext, message, Toast.LENGTH_SHORT).show();
                } catch (Exception ignored) {
                    // Do not let notification errors interrupt download operations.
                }
            });
        } catch (Exception ignored) {
            // Skip notification if reflection or main looper is unavailable.
        }
    }

    private static Context application(String className, String methodName) {
        try {
            return (Context) Class.forName(className).getMethod(methodName).invoke(null);
        } catch (Exception ignored) {
            // If this step is unavailable, let caller try the next fallback.
            return null;
        }
    }
}
