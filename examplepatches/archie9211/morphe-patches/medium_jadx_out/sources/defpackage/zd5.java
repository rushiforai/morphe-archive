package defpackage;

import android.content.Context;
import android.os.Build;
import android.os.Looper;
import java.util.Collections;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class zd5 {
    public final Context a;
    public final String b;
    public final md5 c;
    public final s26 d;
    public final sy e;
    public final gz f;
    public final Looper g;
    public final int h;
    public final wif i;
    public final y3b j;
    public final ee5 k;

    public zd5(Context context, s26 s26Var, sy syVar, yd5 yd5Var) {
        vp7.q("Null context is not permitted.", context);
        vp7.q("Api must not be null.", s26Var);
        vp7.q("Settings must not be null; use Settings.DEFAULT_SETTINGS instead.", yd5Var);
        Context applicationContext = context.getApplicationContext();
        vp7.q("The provided context did not have an application context.", applicationContext);
        this.a = applicationContext;
        int i = Build.VERSION.SDK_INT;
        String attributionTag = (i < 30 || i < 30) ? null : context.getAttributionTag();
        this.b = attributionTag;
        this.c = i >= 31 ? new md5(6, context.getAttributionSource()) : null;
        this.d = s26Var;
        this.e = syVar;
        this.g = yd5Var.b;
        this.f = new gz(s26Var, syVar, attributionTag);
        this.i = new wif(this);
        ee5 ee5VarD = ee5.d(applicationContext);
        this.k = ee5VarD;
        this.h = ee5VarD.h.getAndIncrement();
        this.j = yd5Var.a;
        tjf tjfVar = ee5VarD.m;
        tjfVar.sendMessage(tjfVar.obtainMessage(7, this));
    }

    public final m50 a() {
        m50 m50Var = new m50(20, false);
        Set set = Collections.EMPTY_SET;
        d80 d80Var = (d80) m50Var.b;
        if (d80Var == null) {
            d80Var = new d80(0);
            m50Var.b = d80Var;
        }
        d80Var.addAll(set);
        Context context = this.a;
        m50Var.d = context.getClass().getName();
        m50Var.c = context.getPackageName();
        return m50Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0059  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0076  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.jrg b(int r17, defpackage.wv0 r18) {
        /*
            r16 = this;
            r0 = r16
            r1 = r18
            wfd r2 = new wfd
            r2.<init>()
            jrg r3 = r2.a
            y3b r4 = r0.j
            ee5 r6 = r0.k
            tjf r13 = r6.m
            int r7 = r1.b
            if (r7 == 0) goto L82
            gz r8 = r0.f
            boolean r5 = r6.e()
            if (r5 != 0) goto L1e
            goto L5b
        L1e:
            olb r5 = defpackage.olb.k()
            java.lang.Object r5 = r5.b
            plb r5 = (defpackage.plb) r5
            r9 = 1
            if (r5 == 0) goto L5d
            boolean r10 = r5.b
            if (r10 == 0) goto L5b
            boolean r5 = r5.c
            j$.util.concurrent.ConcurrentHashMap r10 = r6.j
            java.lang.Object r10 = r10.get(r8)
            uif r10 = (defpackage.uif) r10
            if (r10 == 0) goto L59
            wd5 r11 = r10.f
            boolean r12 = r11 instanceof defpackage.mn0
            if (r12 == 0) goto L5b
            mn0 r11 = (defpackage.mn0) r11
            fag r12 = r11.v
            if (r12 == 0) goto L59
            boolean r12 = r11.m()
            if (r12 != 0) goto L59
            k42 r5 = defpackage.pre.d(r10, r11, r7)
            if (r5 == 0) goto L5b
            int r11 = r10.p
            int r11 = r11 + r9
            r10.p = r11
            boolean r9 = r5.c
            goto L5d
        L59:
            r9 = r5
            goto L5d
        L5b:
            r5 = 0
            goto L74
        L5d:
            pre r5 = new pre
            r10 = 0
            if (r9 == 0) goto L68
            long r14 = java.lang.System.currentTimeMillis()
            goto L69
        L68:
            r14 = r10
        L69:
            if (r9 == 0) goto L6f
            long r10 = android.os.SystemClock.elapsedRealtime()
        L6f:
            r11 = r10
            r9 = r14
            r5.<init>(r6, r7, r8, r9, r11)
        L74:
            if (r5 == 0) goto L82
            j$.util.Objects.requireNonNull(r13)
            gq r7 = new gq
            r8 = 2
            r7.<init>(r13, r8)
            r3.b(r7, r5)
        L82:
            kjf r5 = new kjf
            r7 = r17
            r5.<init>(r7, r1, r2, r4)
            java.util.concurrent.atomic.AtomicInteger r1 = r6.i
            ajf r2 = new ajf
            int r1 = r1.get()
            r2.<init>(r5, r1, r0)
            r0 = 4
            android.os.Message r0 = r13.obtainMessage(r0, r2)
            r13.sendMessage(r0)
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zd5.b(int, wv0):jrg");
    }
}
