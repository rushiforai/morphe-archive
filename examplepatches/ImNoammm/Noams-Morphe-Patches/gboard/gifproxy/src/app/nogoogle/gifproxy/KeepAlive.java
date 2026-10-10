package app.nogoogle.gifproxy;

import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.IBinder;

/**
 * Does nothing but exist: while the keyboard is bound to it during transfers, this process shares
 * the keyboard's priority, so Android doesn't freeze it halfway through streaming an answer.
 */
public final class KeepAlive extends Service {
    private final IBinder binder = new Binder();

    @Override
    public IBinder onBind(Intent intent) {
        return binder;
    }
}
