package com.bytedance.adsdk.ugeno.lud.dj;

import android.content.Context;
import com.bytedance.adsdk.ugeno.lud.lt;
import com.tiktok.util.TTConst;
import h6.c1;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/* loaded from: classes2.dex */
public class fby extends sya {

    /* renamed from: ea, reason: collision with root package name */
    private int f22435ea;

    /* renamed from: ok, reason: collision with root package name */
    private int f22436ok;

    /* renamed from: ry, reason: collision with root package name */
    private int f22437ry;

    public fby(Context context) {
        super(context);
        this.f22435ea = -1;
        this.f22436ok = -1;
        this.f22437ry = -1;
    }

    @Override // com.bytedance.adsdk.ugeno.lud.dj.sya
    public boolean ycx(Object... objArr) {
        if (objArr != null && objArr.length > 0) {
            int iYcx = com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(objArr[0]), -1);
            int iYcx2 = com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(objArr[1]), -1);
            int iYcx3 = com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(objArr[2]), -1);
            Map<String, Object> map = this.lud;
            if (map == null || map.isEmpty()) {
                HashMap map2 = new HashMap();
                c1.x(iYcx, map2, "fromIndex", iYcx2, "toIndex");
                map2.put(TTConst.TRACK_TYPE, Integer.valueOf(iYcx3));
                Iterator<lt.ycx> it = this.sya.zb().iterator();
                while (it.hasNext()) {
                    it.next().zb(map2);
                }
                this.ycx.ycx(this.f22463zb, this.f22461lt, this.sya.zb(), this.sya);
            } else {
                Object obj = this.lud.get("fromIndex");
                if (obj != null) {
                    this.f22435ea = com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(obj), -1);
                }
                if (this.lud.get("toIndex") != null) {
                    this.f22436ok = com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(this.lud.get("toIndex")), -1);
                }
                if (this.lud.get(TTConst.TRACK_TYPE) != null) {
                    this.f22437ry = com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(this.lud.get(TTConst.TRACK_TYPE)), -1);
                }
                if (iYcx == this.f22435ea && iYcx2 == this.f22436ok && iYcx3 == this.f22437ry) {
                    this.ycx.ycx(this.f22463zb, this.f22461lt, this.sya.zb(), this.sya);
                }
            }
        }
        return false;
    }
}
