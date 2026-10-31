package com.bytedance.adsdk.ugeno.lud.dj;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.view.View;
import com.bytedance.adsdk.ugeno.fby.jw;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: classes2.dex */
public class jc extends sya implements jw.ycx {

    /* renamed from: dv, reason: collision with root package name */
    private boolean f22438dv;

    /* renamed from: dy, reason: collision with root package name */
    private int f22439dy;

    /* renamed from: ea, reason: collision with root package name */
    private int f22440ea;
    private boolean htf;

    /* renamed from: ok, reason: collision with root package name */
    private int f22441ok;
    private final List<ea> oty;
    private int pmi;

    /* renamed from: ry, reason: collision with root package name */
    private String f22442ry;
    private int syc;
    private boolean thx;

    /* renamed from: tn, reason: collision with root package name */
    private int f22443tn;

    /* renamed from: uh, reason: collision with root package name */
    private boolean f22444uh;
    private Handler wie;
    private long wwx;
    private int xkz;

    public jc(Context context) {
        super(context);
        this.f22441ok = 0;
        this.f22442ry = b.f42142b;
        this.xkz = 0;
        this.syc = 0;
        this.f22439dy = 0;
        this.wie = new com.bytedance.adsdk.ugeno.fby.jw(Looper.getMainLooper(), this);
        this.pmi = 0;
        this.f22444uh = false;
        this.htf = false;
        this.thx = false;
        this.wwx = 0L;
        this.f22443tn = 0;
        this.f22438dv = false;
        this.oty = new ArrayList();
    }

    private void ea() {
        if (this.thx) {
            this.thx = false;
            int i5 = this.f22443tn;
            this.f22443tn = 0;
            zb(i5);
        }
    }

    private void fby() {
        if (this.htf) {
            return;
        }
        this.htf = true;
        this.f22444uh = false;
        this.thx = false;
        this.f22443tn = 0;
        this.f22438dv = false;
        this.f22439dy = 0;
        ok();
        zb(this.f22441ok);
        jw();
    }

    private void jc() {
        if (this.thx) {
            return;
        }
        this.f22443tn = (int) Math.max(0L, this.wwx - SystemClock.uptimeMillis());
        this.wie.removeMessages(1001);
        this.thx = true;
    }

    private void jw() {
        if (this.htf) {
            com.bytedance.adsdk.ugeno.zb.sya syaVar = this.f22463zb;
            View viewEa = syaVar != null ? syaVar.ea() : null;
            if ((this.syc & 2) != 0 && viewEa != null && viewEa.getVisibility() != 0) {
                this.f22439dy |= 2;
            }
            if ((this.syc & 1) != 0 && viewEa != null && !viewEa.hasWindowFocus()) {
                this.f22439dy |= 1;
            }
            if (this.f22439dy != 0) {
                jc();
            } else {
                ea();
            }
        }
    }

    private void ok() {
        if (this.oty.isEmpty()) {
            return;
        }
        Iterator it = new ArrayList(this.oty).iterator();
        while (it.hasNext()) {
            ((ea) it.next()).ycx(this.f22442ry);
        }
    }

    private void ry() {
        if (this.oty.isEmpty()) {
            return;
        }
        Iterator it = new ArrayList(this.oty).iterator();
        while (it.hasNext()) {
            ((ea) it.next()).zb(this.f22442ry);
        }
    }

    private void zb(int i5) {
        this.wie.removeMessages(1001);
        long jMax = Math.max(0, i5);
        this.wwx = SystemClock.uptimeMillis() + jMax;
        this.wie.sendEmptyMessageDelayed(1001, jMax);
    }

    @Override // com.bytedance.adsdk.ugeno.lud.dj.sya
    public void sya() {
        super.sya();
        Map<String, Object> map = this.lud;
        if (map == null) {
            this.f22442ry = b.f42142b;
            return;
        }
        Object obj = map.get(PendingUpgradeStore.KEY_NAME);
        if (obj != null) {
            this.f22442ry = String.valueOf(obj);
        } else {
            this.f22442ry = b.f42142b;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x00a4  */
    @Override // com.bytedance.adsdk.ugeno.lud.dj.sya
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean ycx(Object... objArr) {
        Map<String, Object> map = this.lud;
        if (map != null) {
            Object obj = map.get(PendingUpgradeStore.KEY_NAME);
            if (obj != null) {
                this.f22442ry = String.valueOf(obj);
            } else {
                this.f22442ry = b.f42142b;
            }
            Object obj2 = this.lud.get("condition");
            if (obj2 != null) {
                this.xkz = com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(obj2), 0);
            } else {
                this.xkz = 0;
            }
            Object obj3 = this.lud.get("pauseMode");
            if (obj3 != null) {
                this.syc = com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(obj3), 0);
            } else {
                this.syc = 0;
            }
            Object obj4 = this.lud.get("loop");
            if (obj4 != null) {
                this.f22440ea = com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(obj4), 1);
            } else {
                this.f22440ea = 1;
            }
            int i5 = this.f22440ea;
            if (i5 <= 0) {
                this.pmi = -1;
            } else {
                this.pmi = i5;
            }
            Object obj5 = this.lud.get("duration");
            if (obj5 == null) {
                this.f22441ok = 0;
            } else {
                this.f22441ok = com.bytedance.adsdk.ugeno.fby.sya.ycx(String.valueOf(obj5), 0);
            }
        }
        int i11 = this.xkz;
        if (i11 == 0) {
            fby();
        } else if (i11 == 1) {
            com.bytedance.adsdk.ugeno.zb.sya syaVar = this.f22463zb;
            if (syaVar == null || syaVar.ea() == null || this.f22463zb.ea().getVisibility() != 0) {
                this.f22444uh = true;
            }
        } else if (i11 == 2) {
            this.f22444uh = true;
        }
        return true;
    }

    public String zb() {
        return this.f22442ry;
    }

    public void ycx(int i5) {
        if (this.xkz == 1 && this.f22444uh && i5 == 0) {
            fby();
        }
        if (!this.htf || (this.syc & 2) == 0) {
            return;
        }
        if (i5 == 0) {
            this.f22439dy &= -3;
        } else {
            this.f22439dy |= 2;
        }
        jw();
    }

    public void ycx() {
        if (this.xkz == 2 && this.f22444uh) {
            fby();
        }
    }

    public void ycx(boolean z11) {
        if (!this.htf || (this.syc & 1) == 0) {
            return;
        }
        if (z11) {
            this.f22439dy &= -2;
        } else {
            this.f22439dy |= 1;
        }
        jw();
    }

    @Override // com.bytedance.adsdk.ugeno.fby.jw.ycx
    public void ycx(Message message) {
        int i5;
        int i11;
        if (message.what != 1001) {
            return;
        }
        this.ycx.ycx(this.f22463zb, this.f22461lt, this.sya.zb(), this.sya);
        int i12 = this.pmi - 1;
        this.pmi = i12;
        if (i12 < 0 && (i11 = this.f22441ok) != 0) {
            zb(i11);
            return;
        }
        if (i12 > 0 && (i5 = this.f22441ok) != 0) {
            zb(i5);
            return;
        }
        this.wie.removeMessages(1001);
        this.wwx = 0L;
        if (this.f22438dv) {
            return;
        }
        this.f22438dv = true;
        ry();
    }

    public void ycx(ea eaVar) {
        if (eaVar == null || this.oty.contains(eaVar)) {
            return;
        }
        this.oty.add(eaVar);
    }
}
