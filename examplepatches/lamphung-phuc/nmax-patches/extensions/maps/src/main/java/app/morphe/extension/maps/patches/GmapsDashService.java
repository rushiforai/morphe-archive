package app.morphe.extension.maps.patches;

import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;
import android.view.Surface;

/**
 * NmaxConnect binds this (action com.lampp.nmaxconnect.gmaps.action.BIND) to put the map on the dash. Hand-written
 * stub of NmaxConnect's IGmapsDash.aidl: codes are FIRST_CALL_TRANSACTION + the AIDL ids, so keep them in step.
 */
public final class GmapsDashService extends Service {
    private static final String DESCRIPTOR = "com.lampp.nmaxconnect.gmaps.IGmapsDash";
    private static final String CLIENT = "com.lampp.nmaxconnect";
    private static final int API_VERSION = 4; // 2: setNavListener; 3: isMapOnDash; 4: zoom
    private static final int GET_API_VERSION = IBinder.FIRST_CALL_TRANSACTION + 1;
    private static final int ATTACH = IBinder.FIRST_CALL_TRANSACTION + 2;
    private static final int DETACH = IBinder.FIRST_CALL_TRANSACTION + 3;
    private static final int SET_NAV_LISTENER = IBinder.FIRST_CALL_TRANSACTION + 4;
    private static final int IS_MAP_ON_DASH = IBinder.FIRST_CALL_TRANSACTION + 5;
    private static final int ZOOM = IBinder.FIRST_CALL_TRANSACTION + 6;

    private final Binder binder = new Binder() {
        @Override
        protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            if (code == INTERFACE_TRANSACTION) {
                reply.writeString(DESCRIPTOR);
                return true;
            }
            if (code < GET_API_VERSION || code > ZOOM) return super.onTransact(code, data, reply, flags);
            data.enforceInterface(DESCRIPTOR);
            if (!allowed(getCallingUid())) {
                Log.w("GmapsDash", "refused uid " + getCallingUid());
                throw new SecurityException("not NmaxConnect");
            }
            if (code == ATTACH) {
                Surface s = data.readInt() != 0 ? Surface.CREATOR.createFromParcel(data) : null;
                int w = data.readInt();
                int h = data.readInt();
                data.readInt(); // densityDpi: Maps draws at the phone's density
                GmapsDashBridge.attach(s, w, h);
            } else if (code == DETACH) {
                GmapsDashBridge.detach();
            } else if (code == SET_NAV_LISTENER) {
                GmapsDashNav.setListener(data.readStrongBinder());
            }
            reply.writeNoException();
            if (code == GET_API_VERSION) reply.writeInt(API_VERSION);
            if (code == IS_MAP_ON_DASH) reply.writeInt(GmapsDashBridge.isMapOnDash() ? 1 : 0);
            if (code == ZOOM) reply.writeInt(GmapsDashBridge.zoom(data.readInt() != 0) ? 1 : 0);
            return true;
        }
    };

    // shortcut: trusts the package name, not its signing cert; add a cert pin if other apps could take that name.
    private boolean allowed(int uid) {
        String[] packages = getPackageManager().getPackagesForUid(uid);
        if (packages == null) return false;
        for (String p : packages) if (CLIENT.equals(p)) return true;
        return false;
    }

    @Override
    public IBinder onBind(Intent intent) {
        return binder;
    }
}
