package ads_mobile_sdk;

import android.content.Context;
import b.a0;
import b.n4;
import b.p9;
import b.v5;
import b.v7;
import cl.p1;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes.dex */
public final class qm1 implements v7, b.v1, a0 {

    /* renamed from: u, reason: collision with root package name */
    public static final m7 f8727u;

    /* renamed from: a, reason: collision with root package name */
    public final Context f8728a;

    /* renamed from: b, reason: collision with root package name */
    public final b.g7 f8729b;

    /* renamed from: c, reason: collision with root package name */
    public final ExecutorService f8730c;

    /* renamed from: d, reason: collision with root package name */
    public final j11 f8731d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f8732e;

    /* renamed from: f, reason: collision with root package name */
    public final String f8733f;

    /* renamed from: g, reason: collision with root package name */
    public final long f8734g;

    /* renamed from: h, reason: collision with root package name */
    public final long f8735h;

    /* renamed from: i, reason: collision with root package name */
    public final double f8736i;

    /* renamed from: j, reason: collision with root package name */
    public final String f8737j;

    /* renamed from: k, reason: collision with root package name */
    public final i7 f8738k;

    /* renamed from: l, reason: collision with root package name */
    public final long f8739l;

    /* renamed from: m, reason: collision with root package name */
    public final AtomicBoolean f8740m = new AtomicBoolean(false);
    public final Object n = new Object();
    public final Object o = new Object();

    /* renamed from: p, reason: collision with root package name */
    public final Object f8741p = new Object();

    /* renamed from: q, reason: collision with root package name */
    public final p9 f8742q = s7.o();

    /* renamed from: r, reason: collision with root package name */
    public final ArrayList f8743r = new ArrayList();

    /* renamed from: s, reason: collision with root package name */
    public boolean f8744s = false;

    /* renamed from: t, reason: collision with root package name */
    public final HashMap f8745t = new HashMap();

    static {
        v5 v5VarO = m7.o();
        v5VarO.b();
        m7 m7Var = (m7) v5VarO.f1095b;
        m7Var.getClass();
        m7Var.binaryName_ = k7.ADSHIELD.getNumber();
        m7Var.bitField0_ |= 1;
        f8727u = (m7) v5VarO.a();
    }

    public qm1(Context context, b.g7 g7Var, ExecutorService executorService, j11 j11Var, Random random, String str, long j11, long j12, double d5, String str2, i7 i7Var, long j13) {
        this.f8728a = context;
        this.f8729b = g7Var;
        this.f8730c = executorService;
        this.f8731d = j11Var;
        this.f8733f = str;
        this.f8734g = j11;
        this.f8735h = j12;
        this.f8736i = d5;
        this.f8737j = str2;
        this.f8738k = i7Var;
        this.f8739l = j13;
        this.f8732e = random.nextDouble() < d5;
    }

    public final long a(int i5) {
        long jLongValue;
        synchronized (this.f8741p) {
            try {
                Long l9 = (Long) this.f8745t.get(Integer.valueOf(i5));
                if (l9 == null) {
                    l9 = 0L;
                }
                jLongValue = l9.longValue() + 1;
                this.f8745t.put(Integer.valueOf(i5), Long.valueOf(jLongValue));
            } catch (Throwable th2) {
                throw th2;
            }
        }
        return jLongValue;
    }

    @Override // b.v1
    public final ListenableFuture a() {
        p1 p1Var = new p1(Executors.callable(new b.j9(this, 1), null));
        this.f8730c.execute(p1Var);
        return p1Var;
    }

    public final void a(int i5, long j11, String str, Throwable th2) {
        if (this.f8732e) {
            synchronized (this.o) {
                try {
                    this.f8743r.add(new pm1(i5, j11, th2, str, a(i5)));
                    if (!this.f8744s) {
                        this.f8744s = true;
                        this.f8729b.a(new b.j9(this, 0), this.f8735h);
                    }
                } catch (Throwable th3) {
                    throw th3;
                }
            }
        }
    }

    public final void a(s7 s7Var) {
        try {
            b.kd kdVarO = a8.o();
            m7 m7Var = f8727u;
            kdVarO.b();
            ((a8) kdVarO.f1095b).a(m7Var);
            b.lc lcVarO = y7.o();
            lcVarO.b();
            ((y7) lcVarO.f1095b).a(s7Var);
            y7 y7Var = (y7) lcVarO.a();
            kdVarO.b();
            ((a8) kdVarO.f1095b).a(y7Var);
            a8 a8Var = (a8) kdVarO.a();
            j11 j11Var = this.f8731d;
            String str = this.f8733f;
            byte[] bArrA = a8Var.a();
            j11Var.getClass();
            bh.g.V(new n4(j11Var, str, true, "application/x-protobuf", bArrA));
        } catch (RuntimeException unused) {
        }
    }
}
