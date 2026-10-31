package com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx;

import android.content.Context;
import android.text.TextUtils;
import com.bytedance.sdk.component.utils.htf;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
public abstract class sya {
    private static int sya = 20;
    private boolean fby;
    private boolean lud;
    private final Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    protected final List<com.bytedance.sdk.component.lt.ycx.dj.ycx> f23901zb = new ArrayList();

    /* renamed from: dj, reason: collision with root package name */
    private final List<com.bytedance.sdk.component.lt.ycx.dj.ycx> f23897dj = new ArrayList();

    /* renamed from: lt, reason: collision with root package name */
    private boolean f23899lt = false;

    /* renamed from: ul, reason: collision with root package name */
    private volatile boolean f23900ul = false;

    /* renamed from: jw, reason: collision with root package name */
    private final Runnable f23898jw = new Runnable() { // from class: com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.sya.1
        @Override // java.lang.Runnable
        public void run() {
            ArrayList arrayList;
            synchronized (sya.this) {
                try {
                    sya.this.f23900ul = false;
                    if (sya.this.f23901zb.isEmpty()) {
                        sya.this.f23899lt = false;
                        return;
                    }
                    if (sya.this.lud) {
                        int size = sya.this.f23901zb.size();
                        for (int i5 = 0; i5 < size; i5++) {
                            sya.this.f23897dj.add(sya.this.f23901zb.get(i5));
                        }
                        arrayList = null;
                    } else {
                        arrayList = new ArrayList(sya.this.f23901zb);
                    }
                    sya.this.f23901zb.clear();
                    sya.this.f23899lt = false;
                    if (arrayList != null) {
                        sya.this.dj(arrayList);
                        return;
                    }
                    sya syaVar = sya.this;
                    syaVar.dj(syaVar.f23897dj);
                    sya.this.f23897dj.clear();
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
    };

    public sya(Context context) {
        this.fby = true;
        this.ycx = context;
        try {
            com.bytedance.sdk.component.lt.ycx.lud ludVarSyc = com.bytedance.sdk.component.lt.ycx.ul.lt().syc();
            if (ludVarSyc != null) {
                this.fby = ludVarSyc.ry();
                this.lud = ludVarSyc.xkz();
                sya = ludVarSyc.syc();
            }
            htf.ycx("DBInsertMemRepo", "enableOpt:" + this.fby + ",BATCH_SIZE:" + sya, Boolean.valueOf(this.lud));
        } catch (Throwable unused) {
        }
    }

    public void dj(List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list) {
        com.bytedance.sdk.component.lt.ycx.ycx.ycx.sya.ycx(lud(), zb(), list);
    }

    public long lt() {
        return h.f42227c;
    }

    public Context lud() {
        return this.ycx;
    }

    public synchronized void sya(List<String> list) {
        if (list != null) {
            if (!list.isEmpty()) {
                try {
                    Iterator<com.bytedance.sdk.component.lt.ycx.dj.ycx> it = this.f23901zb.iterator();
                    while (it.hasNext()) {
                        com.bytedance.sdk.component.lt.ycx.dj.ycx next = it.next();
                        if (next != null) {
                            String strSya = next.sya();
                            if (!TextUtils.isEmpty(strSya) && list.contains(strSya)) {
                                it.remove();
                            }
                        }
                    }
                } catch (Throwable th2) {
                    zb();
                    th2.getMessage();
                }
            }
        }
    }

    public abstract String zb();

    private void ycx() {
        if (!this.f23899lt) {
            com.bytedance.sdk.component.lt.ycx.ul.ycx.ycx().postDelayed(this.f23898jw, this.lud ? lt() : com.bytedance.sdk.component.lt.ycx.ul.ycx.zb());
            this.f23899lt = true;
        }
        if (this.fby && this.f23901zb.size() >= sya && !this.f23900ul) {
            com.bytedance.sdk.component.lt.ycx.ul.ycx.ycx().removeCallbacks(this.f23898jw);
            com.bytedance.sdk.component.lt.ycx.ul.ycx.ycx().post(this.f23898jw);
            this.f23899lt = true;
            this.f23900ul = true;
        }
    }

    public synchronized void ycx(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar) {
        if (ycxVar.lt() != null && !TextUtils.isEmpty(ycxVar.sya())) {
            this.f23901zb.add(ycxVar);
            ycx();
        }
    }
}
