package app.nogoogle.gboard;

import android.content.ComponentName;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.UserHandle;

import java.util.concurrent.Executor;

/**
 * Context handed to framework classes (e.g. TextToSpeech) that bind services internally,
 * where the call sites live in the framework and cannot be rewritten.
 */
public final class BlockingContext extends ContextWrapper {
    public BlockingContext(Context base) {
        super(base);
    }

    @Override
    public Context getApplicationContext() {
        return GoogleBlocker.wrap(super.getApplicationContext());
    }

    @Override
    public boolean bindService(Intent service, ServiceConnection conn, int flags) {
        return GoogleBlocker.bindService(getBaseContext(), service, conn, flags);
    }

    @Override
    public boolean bindService(Intent service, int flags, Executor executor, ServiceConnection conn) {
        return GoogleBlocker.bindService(getBaseContext(), service, flags, executor, conn);
    }

    @Override
    public boolean bindIsolatedService(Intent service, int flags, String instanceName,
                                       Executor executor, ServiceConnection conn) {
        if (GoogleBlocker.blockService(getBaseContext(), service)) return false;
        return super.bindIsolatedService(service, flags, instanceName, executor, conn);
    }

    @Override
    public boolean bindServiceAsUser(Intent service, ServiceConnection conn, int flags, UserHandle user) {
        return GoogleBlocker.bindServiceAsUser(getBaseContext(), service, conn, flags, user);
    }

    @Override
    public ComponentName startService(Intent service) {
        return GoogleBlocker.startService(getBaseContext(), service);
    }

    @Override
    public ComponentName startForegroundService(Intent service) {
        return GoogleBlocker.startForegroundService(getBaseContext(), service);
    }

    @Override
    public void sendBroadcast(Intent intent) {
        GoogleBlocker.sendBroadcast(getBaseContext(), intent);
    }

    @Override
    public void sendBroadcast(Intent intent, String receiverPermission) {
        GoogleBlocker.sendBroadcast(getBaseContext(), intent, receiverPermission);
    }

    @Override
    public void startActivity(Intent intent) {
        GoogleBlocker.startActivity(getBaseContext(), intent);
    }

    @Override
    public Object getSystemService(String name) {
        return GoogleBlocker.getSystemService(getBaseContext(), name);
    }
}
