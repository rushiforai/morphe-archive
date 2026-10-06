package gxr.pose;

import android.os.Binder;
import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;

/**
 * Runs in a Shizuku user service process (shell identity) and reads controller poses from the
 * controller HAL, which is not reachable from an application process.
 */
public class PoseService extends Binder {
    static final String DESCRIPTOR = "gxr.pose.IPoseService";
    static final int TRANSACTION_POSES = 1;
    // Reserved by Shizuku: asks the user service to exit.
    private static final int TRANSACTION_DESTROY = 16777115;

    private static final String TAG = "GxrHalPose";
    private static final String HAL_SERVICE = "vendor.samsung.hardware.secxrcontroller.ISecXRController/default";
    private static final String HAL_DESCRIPTOR = "vendor.samsung.hardware.secxrcontroller.ISecXRController";
    // One controller per call. The HAL's getDualPoseAtTimestamp (transaction 19) is not usable over
    // binder: it answers with a copy of the last single reply in both poses. The system controller
    // service gets its dual poses through the HAL's message queues instead.
    private static final int HAL_GET_POSE_AT_TIMESTAMP = 18;
    private static final int HAL_POSE_REQUEST_SIZE = 20;
    // The HAL's reply after the exception code: result, then the PoseInfo parcelable.
    static final int HAL_REPLY_WORDS = 35;
    private static final int CONTROLLERS = 2;

    private IBinder hal;

    public PoseService() {
        attachInterface(null, DESCRIPTOR);
        Log.i(TAG, "user service started, hal=" + (hal() != null));
    }

    @Override
    protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
        switch (code) {
            case TRANSACTION_POSES: {
                data.enforceInterface(DESCRIPTOR);
                final long timeNs = data.readLong();
                reply.writeNoException();
                for (int device = 0; device < CONTROLLERS; ++device) pose(device, timeNs, reply);
                return true;
            }
            case TRANSACTION_DESTROY:
                System.exit(0);
                return true;
            default:
                return super.onTransact(code, data, reply, flags);
        }
    }

    private synchronized IBinder hal() {
        if (hal != null && hal.isBinderAlive()) return hal;
        try {
            hal = (IBinder) Class.forName("android.os.ServiceManager")
                .getMethod("checkService", String.class)
                .invoke(null, HAL_SERVICE);
        } catch (Throwable error) {
            Log.w(TAG, "controller HAL lookup failed", error);
            hal = null;
        }
        return hal;
    }

    /** Appends 1 and the HAL's reply words, or 0 when the HAL gave no pose. */
    private void pose(int device, long timeNs, Parcel out) {
        final Parcel data = Parcel.obtain();
        final Parcel reply = Parcel.obtain();
        try {
            final IBinder target = hal();
            if (target != null) {
                data.writeInterfaceToken(HAL_DESCRIPTOR);
                data.writeInt(device);
                data.writeInt(1);
                data.writeInt(HAL_POSE_REQUEST_SIZE);
                data.writeLong(timeNs);
                data.writeLong(timeNs);
                target.transact(HAL_GET_POSE_AT_TIMESTAMP, data, reply, 0);
                reply.readException();
                if (reply.dataAvail() >= HAL_REPLY_WORDS * 4) {
                    out.writeInt(1);
                    for (int word = 0; word < HAL_REPLY_WORDS; ++word) out.writeInt(reply.readInt());
                    return;
                }
            }
        } catch (Throwable error) {
            Log.w(TAG, "controller pose read failed", error);
        } finally {
            reply.recycle();
            data.recycle();
        }
        out.writeInt(0);
    }
}
