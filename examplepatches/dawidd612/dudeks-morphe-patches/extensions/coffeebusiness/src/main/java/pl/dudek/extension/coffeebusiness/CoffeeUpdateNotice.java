package pl.dudek.extension.coffeebusiness;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.widget.Toast;
import java.util.concurrent.atomic.AtomicBoolean;

/** UI-only companion for Coffee's local version-notice coroutine. */
public final class CoffeeUpdateNotice {
    private static final String TAG = "MorpheCoffeeUpdate";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final AtomicBoolean SHOWN = new AtomicBoolean();
    private static volatile Context context;

    private CoffeeUpdateNotice() {}

    public static void initialize(Context activity) {
        context = activity.getApplicationContext();
    }

    public static void show() {
        Context current = context;
        if (current == null || !SHOWN.compareAndSet(false, true)) return;
        MAIN.post(() -> {
            try {
                Toast toast = Toast.makeText(current,
                        "Coffee: update notice skipped. You can keep playing.", Toast.LENGTH_SHORT);
                if (Build.VERSION.SDK_INT >= 30) Api30.observe(toast);
                toast.show();
                Log.i(TAG, "short notice requested; game continues");
            } catch (RuntimeException exception) {
                Log.w(TAG, "notice unavailable: " + exception.getClass().getSimpleName());
            }
        });
    }

    @TargetApi(30)
    private static final class Api30 {
        static void observe(Toast toast) {
            toast.addCallback(new Toast.Callback() {
                @Override public void onToastShown() { Log.i(TAG, "notice shown"); }
                @Override public void onToastHidden() { Log.i(TAG, "notice hidden"); }
            });
        }
    }
}
