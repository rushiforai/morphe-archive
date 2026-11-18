package com.lampp.wazenmax;

import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;
import android.view.Surface;

/**
 * The bound service NmaxConnect uses ({@code com.lampp.nmaxconnect.waze.IWazeDash}, hand-written here: keep the ids in
 * step with the AIDL): Waze's navigation snapshot and updates ({@link WazeNav}) and Waze's live map rendered into the
 * dash's Surface ({@link DashSurfaceBridge}), and reports and zoom from the dash's buttons ({@link WazeReport}, {@link WazeZoom}). Added to the manifest by patch.py, exported, action
 * {@code com.lampp.nmaxconnect.waze.action.BIND}.
 */
public final class WazeDashService extends Service {
    private static final String DESCRIPTOR = "com.lampp.nmaxconnect.waze.IWazeDash";
    private static final String CLIENT = "com.lampp.nmaxconnect";
    private static final int API_VERSION = 3; // 2: REPORT, 3: ZOOM
    private static final int GET_API_VERSION = IBinder.FIRST_CALL_TRANSACTION + 1;
    private static final int GET_SNAPSHOT = IBinder.FIRST_CALL_TRANSACTION + 2;
    private static final int REGISTER = IBinder.FIRST_CALL_TRANSACTION + 3;
    private static final int UNREGISTER = IBinder.FIRST_CALL_TRANSACTION + 4;
    private static final int ATTACH = IBinder.FIRST_CALL_TRANSACTION + 5;
    private static final int DETACH = IBinder.FIRST_CALL_TRANSACTION + 6;
    private static final int IS_DASH_SHOWN = IBinder.FIRST_CALL_TRANSACTION + 7;
    private static final int REPORT = IBinder.FIRST_CALL_TRANSACTION + 8;
    private static final int ZOOM = IBinder.FIRST_CALL_TRANSACTION + 9;

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
                Log.w("WazeNmax", "refused uid " + getCallingUid());
                throw new SecurityException("not NmaxConnect");
            }
            if (code == REGISTER) {
                WazeNav.addListener(data.readStrongBinder());
            } else if (code == UNREGISTER) {
                WazeNav.removeListener(data.readStrongBinder());
            } else if (code == ATTACH) {
                Surface s = data.readInt() != 0 ? Surface.CREATOR.createFromParcel(data) : null;
                int w = data.readInt();
                int h = data.readInt();
                int d = data.readInt();
                DashSurfaceBridge.attachDash(s, w, h, d);
            } else if (code == DETACH) {
                DashSurfaceBridge.detachDash();
            }
            reply.writeNoException();
            if (code == GET_API_VERSION) reply.writeInt(API_VERSION);
            if (code == GET_SNAPSHOT) {
                reply.writeInt(1); // AIDL Bundle return: non-null marker, then the Bundle
                WazeNav.snapshot().writeToParcel(reply, 0);
            }
            if (code == IS_DASH_SHOWN) reply.writeInt(DashSurfaceBridge.isDashShown() ? 1 : 0);
            if (code == REPORT) reply.writeInt(WazeReport.send(data.readInt()) ? 1 : 0);
            if (code == ZOOM) reply.writeInt(WazeZoom.zoom(data.readInt() != 0) ? 1 : 0);
            return true;
        }
    };

    // shortcut: trusts the package name, not its signing cert (as the Google Maps patch does); add a cert pin if other
    // apps could take that name.
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
