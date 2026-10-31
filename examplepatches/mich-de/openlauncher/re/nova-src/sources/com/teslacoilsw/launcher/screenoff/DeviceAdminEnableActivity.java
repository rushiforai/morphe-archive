package com.teslacoilsw.launcher.screenoff;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.MotionEvent;
import com.teslacoilsw.launcher.NovaDeviceAdminReceiver;

/* loaded from: classes4.dex */
public class DeviceAdminEnableActivity extends Activity {
    @Override // android.app.Activity, android.view.Window.Callback
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        finish();
        return super.dispatchKeyEvent(keyEvent);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public final boolean dispatchTouchEvent(MotionEvent motionEvent) {
        finish();
        return super.dispatchTouchEvent(motionEvent);
    }

    @Override // android.app.Activity
    public final void onActivityResult(int i5, int i11, Intent intent) {
        super.onActivityResult(i5, i11, intent);
        finish();
    }

    @Override // android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Intent intent = new Intent("android.app.action.ADD_DEVICE_ADMIN");
        intent.putExtra("android.app.extra.DEVICE_ADMIN", NovaDeviceAdminReceiver.f45645a);
        startActivityForResult(intent, 1015);
    }
}
