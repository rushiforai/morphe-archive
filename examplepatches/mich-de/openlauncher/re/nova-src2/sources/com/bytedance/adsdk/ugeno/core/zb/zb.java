package com.bytedance.adsdk.ugeno.core.zb;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import com.bytedance.adsdk.ugeno.core.jc;
import com.bytedance.adsdk.ugeno.core.ry;
import com.bytedance.adsdk.ugeno.core.syc;
import com.bytedance.adsdk.ugeno.fby.jw;
import com.tiktok.util.TTConst;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb implements jw.ycx {

    /* renamed from: dj, reason: collision with root package name */
    private ry f22272dj;

    /* renamed from: lt, reason: collision with root package name */
    private Handler f22273lt = new jw(Looper.getMainLooper(), this);
    private com.bytedance.adsdk.ugeno.zb.sya lud;
    private Context sya;
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private syc f22274zb;

    public zb(Context context, ry ryVar, com.bytedance.adsdk.ugeno.zb.sya syaVar) {
        this.sya = context;
        this.f22272dj = ryVar;
        this.lud = syaVar;
    }

    public void ycx(syc sycVar) {
        this.f22274zb = sycVar;
    }

    public void ycx() {
        ry ryVar = this.f22272dj;
        if (ryVar == null) {
            return;
        }
        try {
            int i5 = Integer.parseInt(com.bytedance.adsdk.ugeno.dj.zb.ycx(ryVar.sya().optString("delay"), this.lud.ok()));
            this.ycx = i5;
            this.f22273lt.sendEmptyMessageDelayed(1001, i5);
        } catch (NumberFormatException unused) {
        }
    }

    @Override // com.bytedance.adsdk.ugeno.fby.jw.ycx
    public void ycx(Message message) {
        if (message.what != 1001) {
            return;
        }
        JSONObject jSONObjectSya = this.f22272dj.sya();
        if (TextUtils.equals(jSONObjectSya.optString(TTConst.TRACK_TYPE), "onAnimation")) {
            String strOptString = jSONObjectSya.optString("nodeId");
            com.bytedance.adsdk.ugeno.zb.sya syaVar = this.lud;
            com.bytedance.adsdk.ugeno.zb.sya syaVarLud = syaVar.zb(syaVar).lud(strOptString);
            new jc(syaVarLud.ea(), com.bytedance.adsdk.ugeno.core.ycx.ycx(jSONObjectSya.optJSONObject("animatorSet"), syaVarLud)).ycx();
        } else {
            syc sycVar = this.f22274zb;
            if (sycVar != null) {
                ry ryVar = this.f22272dj;
                com.bytedance.adsdk.ugeno.zb.sya syaVar2 = this.lud;
                sycVar.ycx(ryVar, syaVar2, syaVar2);
            }
        }
        this.f22273lt.removeMessages(1001);
    }
}
