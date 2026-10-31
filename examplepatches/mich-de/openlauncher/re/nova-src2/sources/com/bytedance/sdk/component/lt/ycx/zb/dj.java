package com.bytedance.sdk.component.lt.ycx.zb;

import android.os.Handler;
import android.os.Looper;
import com.bytedance.sdk.component.lt.ycx.lud;
import com.bytedance.sdk.component.lt.ycx.ul;
import java.util.Comparator;
import java.util.concurrent.Executor;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes2.dex */
public class dj {

    /* renamed from: ea, reason: collision with root package name */
    private final Comparator<com.bytedance.sdk.component.lt.ycx.dj.ycx> f23911ea;

    /* renamed from: jc, reason: collision with root package name */
    private volatile Handler f23912jc;

    /* renamed from: jw, reason: collision with root package name */
    private volatile com.bytedance.sdk.component.lt.ycx.zb.zb.sya f23913jw;

    /* renamed from: ok, reason: collision with root package name */
    private final PriorityBlockingQueue<com.bytedance.sdk.component.lt.ycx.dj.ycx> f23914ok;
    public static final dj ycx = new dj();

    /* renamed from: dj, reason: collision with root package name */
    public static final com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx f23908dj = new com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx();
    public static final AtomicLong lud = new AtomicLong(0);

    /* renamed from: lt, reason: collision with root package name */
    public static final AtomicLong f23909lt = new AtomicLong(0);

    /* renamed from: ul, reason: collision with root package name */
    public static final long f23910ul = System.currentTimeMillis();
    public static long fby = 0;

    /* renamed from: zb, reason: collision with root package name */
    public volatile boolean f23915zb = false;
    public volatile boolean sya = false;

    private dj() {
        Comparator<com.bytedance.sdk.component.lt.ycx.dj.ycx> comparator = new Comparator<com.bytedance.sdk.component.lt.ycx.dj.ycx>() { // from class: com.bytedance.sdk.component.lt.ycx.zb.dj.1
            @Override // java.util.Comparator
            /* renamed from: ycx, reason: merged with bridge method [inline-methods] */
            public int compare(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar, com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar2) {
                return dj.this.ycx(ycxVar, ycxVar2);
            }
        };
        this.f23911ea = comparator;
        this.f23914ok = new PriorityBlockingQueue<>(8, comparator);
    }

    public boolean dj() {
        try {
            if (this.f23913jw != null || com.bytedance.sdk.component.lt.ycx.zb.zb()) {
                return false;
            }
            synchronized (this) {
                if (this.f23913jw != null) {
                    return false;
                }
                this.f23913jw = new com.bytedance.sdk.component.lt.ycx.zb.zb.sya(this.f23914ok);
                this.f23913jw.start();
                return true;
            }
        } catch (Throwable th2) {
            th2.getMessage();
            return false;
        }
    }

    public void lud() {
        com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(f23908dj.kgy(), 1);
        final com.bytedance.sdk.component.lt.ycx.zb.zb.sya syaVar = this.f23913jw;
        if (Looper.myLooper() != Looper.getMainLooper()) {
            if (syaVar != null) {
                syaVar.sya(2);
                return;
            }
            return;
        }
        lud ludVarSyc = ul.lt().syc();
        if (ludVarSyc != null) {
            Executor executorDj = ludVarSyc.dj();
            if (executorDj == null) {
                executorDj = ludVarSyc.lud();
            }
            if (executorDj != null) {
                executorDj.execute(new com.bytedance.sdk.component.lt.ycx.lud.lud("flush") { // from class: com.bytedance.sdk.component.lt.ycx.zb.dj.3
                    @Override // java.lang.Runnable
                    public void run() {
                        com.bytedance.sdk.component.lt.ycx.zb.zb.sya syaVar2 = syaVar;
                        if (syaVar2 != null) {
                            syaVar2.sya(2);
                        }
                    }
                });
            }
        }
    }

    public void sya() {
        if (this.f23913jw == null || !this.f23913jw.isAlive()) {
            return;
        }
        synchronized (this) {
            try {
                if (this.f23913jw != null && this.f23913jw.isAlive()) {
                    if (this.f23912jc != null) {
                        this.f23912jc.removeCallbacksAndMessages(null);
                    }
                    this.f23913jw.ycx(false);
                    this.f23913jw.quitSafely();
                    this.f23913jw = null;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public void zb() {
        dj();
        lud();
    }

    public PriorityBlockingQueue<com.bytedance.sdk.component.lt.ycx.dj.ycx> ycx() {
        return this.f23914ok;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int ycx(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar, com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar2) {
        long jYcx;
        long jZb;
        long jZb2;
        long jYcx2;
        if (ycxVar == null) {
            return ycxVar2 == null ? 0 : -1;
        }
        if (ycxVar2 == null) {
            return 1;
        }
        if (ycxVar.lud() == ycxVar2.lud()) {
            if (ycxVar.ycx() != null) {
                jYcx = ycxVar.ycx().ycx();
                jZb = ycxVar.ycx().zb();
            } else {
                jYcx = 0;
                jZb = 0;
            }
            if (ycxVar2.ycx() != null) {
                jYcx2 = ycxVar2.ycx().ycx();
                jZb2 = ycxVar2.ycx().zb();
            } else {
                jZb2 = 0;
                jYcx2 = 0;
            }
            if (jYcx == 0 || jYcx2 == 0) {
                return 0;
            }
            long j11 = jYcx - jYcx2;
            if (Math.abs(j11) > 2147483647L) {
                return 0;
            }
            if (j11 != 0) {
                return (int) j11;
            }
            if (jZb == 0 || jZb2 == 0) {
                return 0;
            }
            return (int) (jZb - jZb2);
        }
        return ycxVar.lud() - ycxVar2.lud();
    }

    public void ycx(Handler handler) {
        this.f23912jc = handler;
    }

    public void ycx(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar, int i5) {
        dj();
        lud ludVarSyc = ul.lt().syc();
        com.bytedance.sdk.component.lt.ycx.zb.zb.sya syaVar = this.f23913jw;
        if (syaVar != null) {
            ycx(ludVarSyc, ycxVar);
            syaVar.ycx(ycxVar, ycxVar.lud() == 4);
        }
    }

    private void ycx(final lud ludVar, com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar) {
        if (ludVar != null) {
            try {
                if (ludVar.ul()) {
                    final long jZb = (ycxVar == null || ycxVar.ycx() == null) ? 0L : ycxVar.ycx().zb();
                    if (jZb == 1) {
                        fby = System.currentTimeMillis();
                    }
                    AtomicLong atomicLongHpv = f23908dj.hpv();
                    com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(atomicLongHpv, 1);
                    if (atomicLongHpv.get() == 200) {
                        try {
                            if (Looper.getMainLooper() == Looper.myLooper()) {
                                Executor executorDj = ludVar.dj();
                                if (executorDj == null) {
                                    executorDj = ludVar.lud();
                                }
                                if (executorDj != null) {
                                    executorDj.execute(new com.bytedance.sdk.component.lt.ycx.lud.lud("report") { // from class: com.bytedance.sdk.component.lt.ycx.zb.dj.2
                                        @Override // java.lang.Runnable
                                        public void run() {
                                            dj.this.ycx(ludVar, jZb);
                                        }
                                    });
                                }
                            } else {
                                ycx(ludVar, jZb);
                            }
                        } catch (Exception unused) {
                        }
                    }
                }
            } catch (Exception unused2) {
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(lud ludVar, long j11) {
        com.bytedance.sdk.component.lt.ycx.zb.zb.sya syaVar = this.f23913jw;
        if (ludVar == null || syaVar == null) {
            return;
        }
        com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx ycxVar = f23908dj;
        syaVar.ycx(ludVar.ycx(ycxVar.zb(j11)), true);
        ycxVar.yi();
    }
}
