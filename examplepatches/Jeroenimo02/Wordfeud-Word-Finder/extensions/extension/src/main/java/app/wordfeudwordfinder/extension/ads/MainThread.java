package app.wordfeudwordfinder.extension.ads;

import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.Executor;

/** Runs tasks later on the main (platform) thread, like Flutter's PlatformTaskQueue. Android only. */
final class MainThread implements Executor {
    private final Handler handler = new Handler(Looper.getMainLooper());

    @Override
    public void execute(Runnable task) {
        handler.post(task);
    }
}
