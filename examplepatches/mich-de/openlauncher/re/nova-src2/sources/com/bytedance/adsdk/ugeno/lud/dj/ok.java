package com.bytedance.adsdk.ugeno.lud.dj;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public class ok extends sya implements ea {

    /* renamed from: ea, reason: collision with root package name */
    private String f22453ea;

    /* renamed from: ok, reason: collision with root package name */
    private String f22454ok;

    public ok(Context context) {
        super(context);
    }

    private void zb(com.bytedance.adsdk.ugeno.zb.sya syaVar) {
        List<com.bytedance.adsdk.ugeno.zb.sya<View>> listJw;
        List<sya> listZb;
        if (syaVar == null) {
            return;
        }
        com.bytedance.adsdk.ugeno.lud.jw jwVarDuz = syaVar.duz();
        if (jwVarDuz != null && (listZb = jwVarDuz.zb("timer")) != null && !listZb.isEmpty()) {
            for (sya syaVar2 : listZb) {
                if (syaVar2 instanceof jc) {
                    jc jcVar = (jc) syaVar2;
                    if (TextUtils.isEmpty(this.f22453ea) || TextUtils.equals(this.f22453ea, jcVar.zb())) {
                        jcVar.ycx(this);
                    }
                }
            }
        }
        if (!(syaVar instanceof com.bytedance.adsdk.ugeno.zb.ycx) || (listJw = ((com.bytedance.adsdk.ugeno.zb.ycx) syaVar).jw()) == null || listJw.isEmpty()) {
            return;
        }
        Iterator<com.bytedance.adsdk.ugeno.zb.sya<View>> it = listJw.iterator();
        while (it.hasNext()) {
            zb(it.next());
        }
    }

    @Override // com.bytedance.adsdk.ugeno.lud.dj.sya
    public boolean ycx(Object... objArr) {
        Map<String, Object> map = this.lud;
        if (map != null && !map.isEmpty()) {
            Object obj = this.lud.get(PendingUpgradeStore.KEY_NAME);
            if (obj != null) {
                this.f22453ea = String.valueOf(obj);
            }
            Object obj2 = this.lud.get("state");
            if (obj2 != null) {
                this.f22454ok = String.valueOf(obj2);
            }
        }
        com.bytedance.adsdk.ugeno.zb.sya syaVar = this.f22463zb;
        com.bytedance.adsdk.ugeno.zb.sya syaVarZb = syaVar.zb(syaVar);
        if (syaVarZb == null) {
            return false;
        }
        zb(syaVarZb);
        return false;
    }

    @Override // com.bytedance.adsdk.ugeno.lud.dj.ea
    public void ycx(String str) {
        com.bytedance.adsdk.ugeno.lud.ea eaVar;
        if (TextUtils.equals(this.f22454ok, "start") || TextUtils.isEmpty(this.f22454ok)) {
            if ((TextUtils.isEmpty(this.f22453ea) || TextUtils.equals(this.f22453ea, str)) && (eaVar = this.ycx) != null) {
                eaVar.ycx(this.f22463zb, this.f22461lt, this.sya.zb(), this.sya);
            }
        }
    }

    @Override // com.bytedance.adsdk.ugeno.lud.dj.ea
    public void zb(String str) {
        com.bytedance.adsdk.ugeno.lud.ea eaVar;
        if (TextUtils.equals(this.f22454ok, "complete") || TextUtils.isEmpty(this.f22454ok)) {
            if ((TextUtils.isEmpty(this.f22453ea) || TextUtils.equals(this.f22453ea, str)) && (eaVar = this.ycx) != null) {
                eaVar.ycx(this.f22463zb, this.f22461lt, this.sya.zb(), this.sya);
            }
        }
    }
}
