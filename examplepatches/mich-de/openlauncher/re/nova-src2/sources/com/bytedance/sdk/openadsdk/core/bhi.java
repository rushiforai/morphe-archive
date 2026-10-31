package com.bytedance.sdk.openadsdk.core;

import android.text.TextUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.concurrent.ConcurrentHashMap;

/* loaded from: classes2.dex */
public class bhi {
    public static ConcurrentHashMap<Integer, bhi> ycx = new ConcurrentHashMap<>();

    /* renamed from: dj, reason: collision with root package name */
    private int f25263dj;

    /* renamed from: lt, reason: collision with root package name */
    private String f25264lt;
    private int lud;

    /* renamed from: zb, reason: collision with root package name */
    private String f25265zb = b.f42142b;
    private String sya = b.f42142b;

    private void lt() {
        this.f25265zb = b.f42142b;
        this.sya = b.f42142b;
        this.f25263dj = 0;
        this.lud = 0;
    }

    public int dj() {
        return this.f25263dj;
    }

    public int lud() {
        return this.lud;
    }

    public String sya() {
        return this.sya;
    }

    public String ycx() {
        return this.f25264lt;
    }

    public String zb() {
        return this.f25265zb;
    }

    public static void sya(int i5) {
        bhi bhiVar;
        if (i5 == 0) {
            return;
        }
        if (ycx == null) {
            ycx = new ConcurrentHashMap<>();
        }
        if (!ycx.containsKey(Integer.valueOf(i5)) || (bhiVar = ycx.get(Integer.valueOf(i5))) == null) {
            return;
        }
        bhiVar.zb(1);
    }

    public void ycx(int i5) {
        this.f25263dj = i5;
    }

    public void zb(int i5) {
        this.lud = i5;
    }

    public static void zb(com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        if (tnVar == null || TextUtils.isEmpty(tnVar.pks())) {
            return;
        }
        int iKsy = tnVar.ksy();
        Integer numValueOf = Integer.valueOf(iKsy);
        if (iKsy == 0) {
            return;
        }
        if (ycx == null) {
            ycx = new ConcurrentHashMap<>();
        }
        bhi bhiVar = ycx.containsKey(numValueOf) ? ycx.get(numValueOf) : null;
        if (bhiVar == null) {
            bhiVar = new bhi();
        }
        String strAc = tnVar.ac();
        if (TextUtils.isEmpty(strAc) || !strAc.equals(bhiVar.ycx())) {
            bhiVar.lt();
            bhiVar.ycx(tnVar);
            ycx.put(numValueOf, bhiVar);
        }
    }

    public void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        if (tnVar != null) {
            String strAc = tnVar.ac();
            if (!TextUtils.isEmpty(strAc)) {
                this.f25264lt = strAc;
            }
            String strKh = tnVar.kh();
            if (TextUtils.isEmpty(strKh) && tnVar.wnd()) {
                strKh = tnVar.rg().jw();
            }
            if (!TextUtils.isEmpty(strKh)) {
                String[] strArrSplit = strKh.split("/");
                if (strArrSplit.length >= 3) {
                    this.f25265zb = strArrSplit[2];
                }
            }
            if (tnVar.znc() == null || TextUtils.isEmpty(tnVar.znc().sya())) {
                return;
            }
            this.sya = tnVar.znc().sya();
        }
    }

    public static void sya(com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        bhi bhiVar;
        if (tnVar == null) {
            return;
        }
        int iKsy = tnVar.ksy();
        Integer numValueOf = Integer.valueOf(iKsy);
        if (iKsy == 0) {
            return;
        }
        if (ycx == null) {
            ycx = new ConcurrentHashMap<>();
        }
        if (!ycx.containsKey(numValueOf) || (bhiVar = ycx.get(numValueOf)) == null) {
            return;
        }
        bhiVar.ycx(1);
    }
}
