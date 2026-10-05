package gxr.haptic;

import android.os.Binder;
import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;

/**
 * Runs in a Shizuku user service process (shell identity) and relays vibrations to the controller HAL,
 * which is not reachable from an application process.
 */
public class HapticService extends Binder {
    static final String DESCRIPTOR = "gxr.haptic.IHapticService";
    static final int TRANSACTION_VIBRATE = 1;
    static final int TRANSACTION_STOP = 2;
    static final int TRANSACTION_PLAY = 3;
    // Reserved by Shizuku: asks the user service to exit.
    private static final int TRANSACTION_DESTROY = 16777115;

    private static final String TAG = "GxrHapticMain";
    private static final String HAL_SERVICE = "vendor.samsung.hardware.secxrcontroller.ISecXRController/default";
    private static final String HAL_DESCRIPTOR = "vendor.samsung.hardware.secxrcontroller.ISecXRController";
    private static final int HAL_PERFORM_HAPTIC = 21;
    private static final int HAL_STOP_HAPTIC = 22;
    private static final int HAL_GET_DEVICE_STATUS = 15;
    private static final int HAL_STATUS_CONNECTED = 2;
    private static final long STATUS_MAX_AGE_MS = 300;
    private static final int HAL_HAPTIC_INFO_SIZE = 28;
    // The controller plays signed 8-bit samples at this rate.
    private static final float HAL_SAMPLE_RATE = 8000.0f;

    private IBinder hal;
    private final long[] statusReadAt = new long[2];
    private final boolean[] connected = new boolean[2];

    public HapticService() {
        attachInterface(null, DESCRIPTOR);
        Log.i(TAG, "user service started, hal=" + (hal() != null));
    }

    @Override
    protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
        switch (code) {
            case TRANSACTION_VIBRATE: {
                data.enforceInterface(DESCRIPTOR);
                final int device = data.readInt();
                final int vibrator = data.readInt();
                final int durationMs = data.readInt();
                final float frequency = data.readFloat();
                final float amplitude = data.readFloat();
                vibrate(device, vibrator, durationMs, frequency, amplitude);
                return true;
            }
            case TRANSACTION_PLAY: {
                data.enforceInterface(DESCRIPTOR);
                final int device = data.readInt();
                final int vibrator = data.readInt();
                play(device, vibrator, data.createByteArray());
                return true;
            }
            case TRANSACTION_STOP: {
                data.enforceInterface(DESCRIPTOR);
                stop(data.readInt());
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

    private void vibrate(int device, int vibrator, int durationMs, float frequency, float amplitude) {
        final Parcel data = Parcel.obtain();
        data.writeInterfaceToken(HAL_DESCRIPTOR);
        data.writeInt(device);
        data.writeInt(1);
        data.writeInt(HAL_HAPTIC_INFO_SIZE);
        data.writeInt(vibrator);
        data.writeInt(durationMs);
        data.writeFloat(frequency);
        data.writeFloat(amplitude);
        data.writeInt(0);
        data.writeInt(0);
        call(HAL_PERFORM_HAPTIC, data);
    }

    /**
     * The headset suspends a controller nobody tracks. A waveform sent then never starts uploading
     * and blocks the HAL, so waveforms go only to a connected controller.
     */
    private boolean isConnected(int device) {
        if (device < 0 || device >= connected.length) return false;
        final long now = android.os.SystemClock.uptimeMillis();
        if (statusReadAt[device] != 0 && now - statusReadAt[device] < STATUS_MAX_AGE_MS) return connected[device];
        boolean result = false;
        final Parcel data = Parcel.obtain();
        final Parcel reply = Parcel.obtain();
        try {
            final IBinder target = hal();
            if (target != null) {
                data.writeInterfaceToken(HAL_DESCRIPTOR);
                data.writeInt(device);
                target.transact(HAL_GET_DEVICE_STATUS, data, reply, 0);
                reply.readException();
                result = reply.readInt() == HAL_STATUS_CONNECTED;
            }
        } catch (Throwable error) {
            Log.w(TAG, "controller status read failed", error);
        } finally {
            reply.recycle();
            data.recycle();
        }
        if (result != connected[device] || statusReadAt[device] == 0) {
            Log.i(TAG, "controller " + device + (result ? " connected" : " not connected, waveforms held back"));
        }
        connected[device] = result;
        statusReadAt[device] = now;
        return result;
    }

    private void play(int device, int vibrator, byte[] samples) {
        if (samples == null || samples.length == 0) return;
        if (!isConnected(device)) return;
        final Parcel data = Parcel.obtain();
        data.writeInterfaceToken(HAL_DESCRIPTOR);
        data.writeInt(device);
        data.writeInt(1);
        final int start = data.dataPosition();
        data.writeInt(0);
        data.writeInt(vibrator);
        data.writeInt(0);
        data.writeFloat(HAL_SAMPLE_RATE);
        data.writeFloat(0.0f);
        data.writeByteArray(samples);
        data.writeInt(0);
        final int end = data.dataPosition();
        data.setDataPosition(start);
        data.writeInt(end - start);
        data.setDataPosition(end);
        call(HAL_PERFORM_HAPTIC, data);
    }

    private void stop(int device) {
        final Parcel data = Parcel.obtain();
        data.writeInterfaceToken(HAL_DESCRIPTOR);
        data.writeInt(device);
        call(HAL_STOP_HAPTIC, data);
    }

    private void call(int code, Parcel data) {
        final Parcel reply = Parcel.obtain();
        try {
            final IBinder target = hal();
            if (target != null) target.transact(code, data, reply, 0);
        } catch (Throwable error) {
            Log.w(TAG, "controller HAL call failed", error);
        } finally {
            reply.recycle();
            data.recycle();
        }
    }
}
