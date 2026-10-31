package com.bytedance.adsdk.ugeno.core.zb;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.bytedance.adsdk.ugeno.core.ry;
import com.bytedance.adsdk.ugeno.core.syc;
import com.bytedance.adsdk.ugeno.fby.jw;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt implements jw.ycx {

    /* renamed from: dj, reason: collision with root package name */
    private Context f22253dj;

    /* renamed from: lt, reason: collision with root package name */
    private com.bytedance.adsdk.ugeno.zb.sya f22254lt;
    private ry lud;
    private syc sya;

    /* renamed from: ul, reason: collision with root package name */
    private Handler f22255ul = new jw(Looper.getMainLooper(), this);
    private boolean ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f22256zb;

    public lt(Context context, ry ryVar, com.bytedance.adsdk.ugeno.zb.sya syaVar) {
        this.f22253dj = context;
        this.lud = ryVar;
        this.f22254lt = syaVar;
    }

    public void ycx(syc sycVar) {
        this.sya = sycVar;
    }

    public void ycx() {
        ry ryVar = this.lud;
        if (ryVar == null) {
            return;
        }
        JSONObject jSONObjectSya = ryVar.sya();
        try {
            this.f22256zb = Integer.parseInt(com.bytedance.adsdk.ugeno.dj.zb.ycx(jSONObjectSya.optString("interval", "8000"), this.f22254lt.ok()));
            this.ycx = jSONObjectSya.optBoolean("repeat");
            this.f22255ul.sendEmptyMessageDelayed(1001, this.f22256zb);
        } catch (NumberFormatException unused) {
        }
    }

    @Override // com.bytedance.adsdk.ugeno.fby.jw.ycx
    public void ycx(Message message) {
        if (message.what != 1001) {
            return;
        }
        syc sycVar = this.sya;
        if (sycVar != null) {
            ry ryVar = this.lud;
            com.bytedance.adsdk.ugeno.zb.sya syaVar = this.f22254lt;
            sycVar.ycx(ryVar, syaVar, syaVar);
        }
        if (this.ycx) {
            this.f22255ul.sendEmptyMessageDelayed(1001, this.f22256zb);
        } else {
            this.f22255ul.removeMessages(1001);
        }
    }
}
