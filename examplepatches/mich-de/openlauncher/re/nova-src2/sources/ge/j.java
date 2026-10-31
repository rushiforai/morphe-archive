package ge;

import android.bluetooth.BluetoothLeAudio;
import android.bluetooth.BluetoothProfile;
import android.graphics.Point;
import android.graphics.Rect;
import android.media.metrics.PlaybackMetrics;
import android.view.ScrollCaptureCallback;
import android.view.ScrollCaptureSession;
import android.view.ScrollCaptureTarget;
import androidx.compose.ui.platform.AndroidComposeView;

/* loaded from: classes3.dex */
public abstract /* synthetic */ class j {
    public static /* bridge */ /* synthetic */ BluetoothLeAudio c(BluetoothProfile bluetoothProfile) {
        return (BluetoothLeAudio) bluetoothProfile;
    }

    public static /* bridge */ /* synthetic */ PlaybackMetrics.Builder f(Object obj) {
        return (PlaybackMetrics.Builder) obj;
    }

    public static /* bridge */ /* synthetic */ ScrollCaptureSession i(Object obj) {
        return (ScrollCaptureSession) obj;
    }

    public static /* synthetic */ ScrollCaptureTarget j(AndroidComposeView androidComposeView, Rect rect, Point point, ScrollCaptureCallback scrollCaptureCallback) {
        return new ScrollCaptureTarget(androidComposeView, rect, point, scrollCaptureCallback);
    }

    public static /* bridge */ /* synthetic */ boolean z(BluetoothProfile bluetoothProfile) {
        return bluetoothProfile instanceof BluetoothLeAudio;
    }
}
