package yi;

import android.app.Activity;
import android.graphics.Point;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.view.Window;
import android.view.WindowManager;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.android.systemui.plugins.shared.LauncherOverlayManager;
import ih.g;

/* loaded from: classes3.dex */
public final class c extends g implements Handler.Callback, aj.b {

    /* renamed from: b, reason: collision with root package name */
    public final Handler f97324b;

    /* renamed from: c, reason: collision with root package name */
    public d f97325c;

    /* renamed from: d, reason: collision with root package name */
    public WindowManager f97326d;

    /* renamed from: e, reason: collision with root package name */
    public int f97327e;

    /* renamed from: f, reason: collision with root package name */
    public Window f97328f;

    public c() {
        super(5);
        attachInterface(this, "com.google.android.libraries.launcherclient.ILauncherOverlayCallback");
        this.f97324b = new Handler(Looper.getMainLooper(), this);
    }

    public final void Y(d dVar) {
        this.f97325c = dVar;
        Activity activity = dVar.f97330a;
        this.f97326d = activity.getWindowManager();
        Point point = new Point();
        this.f97326d.getDefaultDisplay().getRealSize(point);
        this.f97327e = -Math.max(point.x, point.y);
        this.f97328f = activity.getWindow();
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        d dVar = this.f97325c;
        if (dVar != null) {
            int i5 = message.what;
            if (i5 != 2) {
                if (i5 != 3) {
                    if (i5 != 4) {
                        return false;
                    }
                    dVar.d(message.arg1);
                    this.f97325c.f97333d.b(message.arg1, "stateChanged");
                    dz.g gVar = this.f97325c.f97331b;
                    return true;
                }
                WindowManager.LayoutParams attributes = this.f97328f.getAttributes();
                if (((Boolean) message.obj).booleanValue()) {
                    attributes.x = this.f97327e;
                    attributes.flags |= EventBridgeChannel.QUEUE_CAPACITY;
                } else {
                    attributes.x = 0;
                    attributes.flags &= -513;
                }
                this.f97326d.updateViewLayout(this.f97328f.getDecorView(), attributes);
                return true;
            }
            if ((dVar.f97340k & 1) != 0) {
                float fFloatValue = ((Float) message.obj).floatValue();
                dz.g gVar2 = this.f97325c.f97331b;
                LauncherOverlayManager.LauncherOverlayCallbacks launcherOverlayCallbacks = gVar2.f49885c;
                if (launcherOverlayCallbacks != null) {
                    launcherOverlayCallbacks.onScrollChanged(fFloatValue);
                }
                gVar2.f49887e = fFloatValue > 0.0f;
                if (fFloatValue <= 0.0f) {
                    this.f97325c.f97333d.e("onScroll 0, overlay closed");
                    return true;
                }
                if (fFloatValue >= 1.0f) {
                    this.f97325c.f97333d.e("onScroll 1, overlay opened");
                    return true;
                }
                this.f97325c.f97333d.d(1, "onScroll", fFloatValue);
            }
        }
        return true;
    }
}
