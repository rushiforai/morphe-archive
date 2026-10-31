package com.bytedance.adsdk.ugeno.lud.dj;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.view.MotionEvent;
import com.bytedance.adsdk.ugeno.fby.jw;

/* loaded from: classes2.dex */
public class ry extends sya implements jw.ycx {

    /* renamed from: ea, reason: collision with root package name */
    private int f22455ea;

    /* renamed from: ok, reason: collision with root package name */
    private boolean f22456ok;

    /* renamed from: ry, reason: collision with root package name */
    private Handler f22457ry;

    public ry(Context context) {
        super(context);
        this.f22455ea = 500;
        this.f22457ry = new com.bytedance.adsdk.ugeno.fby.jw(Looper.getMainLooper(), this);
    }

    @Override // com.bytedance.adsdk.ugeno.lud.dj.sya
    public boolean ycx(Object... objArr) {
        if (objArr == null || objArr.length <= 0) {
            return false;
        }
        MotionEvent motionEvent = (MotionEvent) objArr[0];
        Object obj = this.lud.get("delay");
        if (obj == null) {
            this.f22455ea = 500;
        } else {
            this.f22455ea = com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(obj), 500);
        }
        return ycx(this.f22463zb, motionEvent);
    }

    private boolean ycx(com.bytedance.adsdk.ugeno.zb.sya syaVar, MotionEvent motionEvent) {
        com.bytedance.adsdk.ugeno.lud.ea eaVar;
        int action = motionEvent.getAction();
        if (action == 0) {
            this.f22457ry.sendEmptyMessageDelayed(1102, this.f22455ea);
        } else {
            if (action == 1) {
                if (this.f22456ok && (eaVar = this.ycx) != null) {
                    eaVar.ycx(this.f22463zb, this.f22461lt, this.sya.zb(), this.sya);
                    this.f22456ok = false;
                    Handler handler = this.f22457ry;
                    if (handler != null) {
                        handler.removeMessages(1102);
                    }
                    return true;
                }
                Handler handler2 = this.f22457ry;
                if (handler2 != null) {
                    handler2.removeMessages(1102);
                }
                this.f22456ok = false;
                return false;
            }
            if (action == 3) {
                Handler handler3 = this.f22457ry;
                if (handler3 != null) {
                    handler3.removeMessages(1102);
                }
                this.f22456ok = false;
            }
        }
        return true;
    }

    @Override // com.bytedance.adsdk.ugeno.fby.jw.ycx
    public void ycx(Message message) {
        if (message.what != 1102) {
            return;
        }
        this.f22456ok = true;
        Handler handler = this.f22457ry;
        if (handler != null) {
            handler.removeMessages(1102);
        }
    }
}
