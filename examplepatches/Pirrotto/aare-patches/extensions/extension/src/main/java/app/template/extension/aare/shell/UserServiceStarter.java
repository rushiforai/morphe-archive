package app.template.extension.aare.shell;

import android.content.Context;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Looper;
import android.util.Log;

import moe.shizuku.api.BinderContainer;
import moe.shizuku.server.IShizukuService;

/**
 * Starts one of AARE's Shizuku user services in a shell process, as Shizuku's ServiceStarter does:
 * builds the service with AARE's code, then hands its binder to the integrated server, which passes
 * it to AARE.
 */
public final class UserServiceStarter {
    private static final String TAG = IntegratedServer.TAG;

    @SuppressWarnings("FieldCanBeLocal") // keeps the death link alive
    private static IBinder server;

    public static void main(String[] args) {
        Looper.prepareMainLooper();
        String token = null, pkg = null, cls = null;
        for (String arg : args) {
            if (arg.startsWith("--token=")) token = arg.substring(8);
            else if (arg.startsWith("--package=")) pkg = arg.substring(10);
            else if (arg.startsWith("--class=")) cls = arg.substring(8);
        }
        IntegratedServer.log("user service starter: " + cls + " uid " + android.os.Process.myUid(), null);
        try {
            IBinder service = create(pkg, cls);
            IntegratedServer.log("user service created: " + cls, null);

            // The integrated server's binder, from AARE, which received it.
            Bundle reply = Providers.call(Providers.authority(pkg), "getBinder", new Bundle());
            if (reply == null) throw new IllegalStateException("AARE has no Shizuku binder");
            reply.setClassLoader(BinderContainer.class.getClassLoader());
            BinderContainer container = reply.getParcelable(IntegratedServer.EXTRA_BINDER);
            if (container == null || container.binder == null) throw new IllegalStateException("no server binder");
            server = container.binder;
            server.linkToDeath(() -> {
                Log.i(TAG, "server gone, user service exits");
                System.exit(0);
            }, 0);

            Bundle options = new Bundle();
            options.putString(IntegratedServer.USER_SERVICE_ARG_TOKEN, token);
            IShizukuService.Stub.asInterface(server).attachUserService(service, options);
            IntegratedServer.log("user service " + cls + " started", null);
        } catch (Throwable t) {
            IntegratedServer.log("unable to start user service " + cls, t);
            System.exit(1);
        }
        Looper.loop();
        System.exit(0);
    }

    private static IBinder create(String pkg, String cls) throws Exception {
        Class<?> activityThread = Class.forName("android.app.ActivityThread");
        Object thread = activityThread.getMethod("systemMain").invoke(null);
        Context system = (Context) activityThread.getMethod("getSystemContext").invoke(thread);
        Context context = system.createPackageContext(pkg, Context.CONTEXT_INCLUDE_CODE | Context.CONTEXT_IGNORE_SECURITY);
        Class<?> type = context.getClassLoader().loadClass(cls);
        try {
            return (IBinder) type.getConstructor(Context.class).newInstance(context);
        } catch (NoSuchMethodException e) {
            return (IBinder) type.getConstructor().newInstance();
        }
    }
}
