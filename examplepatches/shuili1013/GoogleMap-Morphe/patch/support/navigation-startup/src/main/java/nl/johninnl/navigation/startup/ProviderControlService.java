package nl.johninnl.navigation.startup;

import android.app.PendingIntent;
import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Process;
import android.os.RemoteException;

/** Cold-bindable API. Only verified map UIDs receive the private startup capability. */
public abstract class ProviderControlService extends Service {
    protected abstract boolean enabled();
    protected abstract boolean engineRunning();
    protected abstract String receiverPackage();
    protected abstract Class<? extends ProviderEngineService> engineService();
    /** Optional semantic warning API. Called only after the startup caller has been authorized. */
    protected void appendWarningCapabilities(Bundle response, int uid) { }
    protected void observeControlClient(int uid, boolean warningAware) { }

    private final Binder api = new Binder() {
        @Override protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            if (code == IBinder.INTERFACE_TRANSACTION) { reply.writeString(StartupProtocol.DESCRIPTOR); return true; }
            if (code != StartupProtocol.STATUS) return super.onTransact(code, data, reply, flags);
            data.enforceInterface(StartupProtocol.DESCRIPTOR);
            int uid = Binder.getCallingUid();
            if (uid != Process.myUid() && !StartupProtocol.allowed(getPackageManager().getPackagesForUid(uid), receiverPackage()))
                throw new SecurityException("Navigation startup is restricted to the configured receiving map");
            boolean warningAware=false;
            if(data.dataAvail()!=0){
                if(data.dataAvail()!=4 || data.readInt()!=1)throw new IllegalArgumentException("Unsupported startup capability declaration");
                warningAware=true;
            }
            observeControlClient(uid,warningAware);
            Bundle response = new Bundle();
            response.putInt("version", 1);
            String state;
            try {
                state = StartupProtocol.state(ProviderControlService.this, enabled(), engineRunning());
                if ("stopped".equals(state)) {
                    String previous = ProviderEngineService.lastState();
                    if ("start_blocked".equals(previous) || "error".equals(previous)) state = previous;
                    else if (ProviderEngineService.starting()) state = "starting";
                }
                if (!("disabled".equals(state) || "permission_required".equals(state))) {
                    ProviderEngineService.renewLease(ProviderControlService.this);
                    response.putParcelable("start", PendingIntent.getForegroundService(ProviderControlService.this, 1,
                        new Intent(ProviderControlService.this, engineService()), PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT));
                }
            } catch (ReflectiveOperationExceptionWrapper error) {
                state = "incompatible";
            } catch (RuntimeException error) {
                state = "error";
            }
            response.putString("state", state);
            response.putBoolean("audio_muted", ProviderAudio.muted());
            response.putString("engine_state", ProviderEngineService.lastState());
            response.putBoolean("api_started", ProviderLifecycle.apiStarted());
            response.putLong("health_interval_ms", StartupProtocol.HEARTBEAT_MS);
            response.putLong("health_timeout_ms", StartupProtocol.LEASE_MS);
            appendWarningCapabilities(response, uid);
            reply.writeNoException(); reply.writeBundle(response); return true;
        }
    };
    @Override public final IBinder onBind(Intent intent) { return api; }

    /** Target ABI failures are terminal until the provider is repatched. */
    public static final class ReflectiveOperationExceptionWrapper extends RuntimeException {
        public ReflectiveOperationExceptionWrapper(Throwable cause) { super(cause); }
    }
}
