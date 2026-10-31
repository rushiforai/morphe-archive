package com.google.android.gms.internal.measurement;

import android.content.Context;
import android.os.Parcel;
import com.google.android.gms.tasks.Task;
import com.google.common.util.concurrent.ListenableFuture;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes3.dex */
public final class d2 implements i2, rg.j, rg.l, cl.c0, fi.e {

    /* renamed from: c, reason: collision with root package name */
    public static final k1 f32448c = new k1(7);

    /* renamed from: d, reason: collision with root package name */
    public static final kh f32449d = new kh();

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f32450a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f32451b;

    public /* synthetic */ d2(Object obj, int i5) {
        this.f32450a = i5;
        this.f32451b = obj;
    }

    public static void b(String str, jh jhVar) {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").format(new Date(TimeUnit.NANOSECONDS.toMillis(jhVar.f32698b))));
        sb2.append(": logging error [");
        qh qhVar = jhVar.f32700d;
        if (qhVar == null) {
            throw new IllegalStateException("cannot request log site information prior to postProcess()");
        }
        gh.e(1, qhVar, sb2);
        sb2.append("]: ");
        sb2.append(str);
        System.err.println(sb2);
        System.err.flush();
    }

    public dd a(String str, boolean z11) {
        return new dd(str, (td) this.f32451b, z11);
    }

    @Override // rg.l
    public void accept(Object obj, Object obj2) {
        int i5 = this.f32450a;
        Object obj3 = this.f32451b;
        fi.j jVar = (fi.j) obj2;
        cb cbVar = (cb) obj;
        switch (i5) {
            case 6:
                int i11 = ab.f32377l;
                ya yaVar = new ya(jVar);
                bb bbVar = (bb) cbVar.getService();
                byte[] bArrA = ((bc) obj3).a();
                Parcel parcelX = bbVar.X();
                r6.c(parcelX, yaVar);
                parcelX.writeByteArray(bArrA);
                bbVar.Z(parcelX, 31);
                break;
            default:
                bb bbVar2 = (bb) cbVar.getService();
                ya yaVar2 = new ya((ab) obj3, jVar);
                Parcel parcelX2 = bbVar2.X();
                r6.c(parcelX2, yaVar2);
                bbVar2.Z(parcelX2, 27);
                break;
        }
    }

    public void c(int i5, Object obj, t2 t2Var) {
        c1 c1Var = (c1) this.f32451b;
        n0 n0Var = (n0) obj;
        c1Var.r(i5, 2);
        c1Var.F(n0Var.c(t2Var));
        t2Var.b(n0Var, this);
    }

    @Override // cl.c0
    public /* synthetic */ ListenableFuture call() {
        switch (this.f32450a) {
            case 8:
                return cl.w0.d((Callable) this.f32451b, cl.m0.f20038a);
            default:
                return (cl.s) this.f32451b;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x009d A[Catch: all -> 0x009b, TryCatch #1 {all -> 0x009b, blocks: (B:30:0x007d, B:32:0x0081, B:34:0x0085, B:39:0x0092, B:44:0x009d, B:45:0x00a9), top: B:58:0x007d }] */
    @Override // rg.j
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void e(Object obj) {
        boolean z11;
        boolean z12;
        de deVar = (de) obj;
        try {
            byte[] bArr = (byte[]) this.f32451b;
            e1 e1Var = e1.f32488a;
            int i5 = p0.f32944a;
            ud udVarY = ud.y(bArr, e1.f32489b);
            Iterator it = deVar.f32472b.f32507f.iterator();
            boolean z13 = false;
            while (it.hasNext()) {
                pd pdVar = (pd) it.next();
                List listX = udVarY.x();
                pdVar.getClass();
                d2 d2Var = sd.f33058i;
                d2Var.getClass();
                if (listX == null || listX.isEmpty()) {
                    z11 = false;
                } else {
                    Iterator it2 = listX.iterator();
                    z11 = false;
                    while (it2.hasNext()) {
                        ld ldVar = (ld) ((ConcurrentHashMap) d2Var.f32451b).get((String) it2.next());
                        if (ldVar != null) {
                            sd sdVar = ldVar.f32791a;
                            if (sdVar.f33064e) {
                                le leVar = sdVar.f33060a;
                                if (leVar != null && (leVar.f32792a || ((ke) leVar.f32796e).f32738b == 3 || sdVar.f33067h.E())) {
                                    synchronized (sdVar) {
                                        try {
                                            le leVar2 = sdVar.f33060a;
                                            if (leVar2 != null) {
                                                if (leVar2.f32792a) {
                                                    sdVar.f33060a = null;
                                                    ((AtomicInteger) sdVar.f33066g.f32451b).incrementAndGet();
                                                } else {
                                                    if ((((ke) leVar2.f32796e).f32738b == 3) || sdVar.f33067h.E()) {
                                                    }
                                                }
                                            }
                                        } finally {
                                        }
                                    }
                                }
                                z12 = false;
                            } else {
                                z12 = true;
                            }
                            z11 |= z12;
                        }
                    }
                }
                if (z11 && !z13) {
                    deVar.f32471a.zza();
                    z13 = true;
                }
            }
        } catch (zzaeh unused) {
        }
    }

    @Override // fi.e
    public /* synthetic */ void onComplete(Task task) {
        gb gbVar = (gb) this.f32451b;
        if (task.o()) {
            gbVar.cancel(false);
            return;
        }
        if (task.q()) {
            gbVar.n(task.m());
            return;
        }
        Exception excL = task.l();
        if (excL == null) {
            throw new IllegalStateException();
        }
        gbVar.o(excL);
    }

    @Override // com.google.android.gms.internal.measurement.i2
    public boolean zzb(Class cls) {
        for (int i5 = 0; i5 < 2; i5++) {
            if (((i2[]) this.f32451b)[i5].zzb(cls)) {
                return true;
            }
        }
        return false;
    }

    @Override // com.google.android.gms.internal.measurement.i2
    public s2 zzc(Class cls) {
        for (int i5 = 0; i5 < 2; i5++) {
            i2 i2Var = ((i2[]) this.f32451b)[i5];
            if (i2Var.zzb(cls)) {
                return i2Var.zzc(cls);
            }
        }
        throw new UnsupportedOperationException("No factory is available for message type: ".concat(cls.getName()));
    }

    public d2(int i5) {
        this.f32450a = i5;
        switch (i5) {
            case 4:
                this.f32451b = new HashMap();
                break;
            case 12:
                this.f32451b = new ConcurrentHashMap();
                break;
            case 13:
                this.f32451b = new AtomicInteger();
                break;
            default:
                int i11 = p0.f32944a;
                this.f32451b = new d2(new i2[]{k1.f32721b, f32448c}, 3);
                break;
        }
    }

    public d2(Context context) {
        this.f32450a = 14;
        new ConcurrentHashMap();
        h.e("Context cannot be null", new Object[0], context != null);
        this.f32451b = context.getApplicationContext();
    }

    public d2(c1 c1Var) {
        this.f32450a = 2;
        this.f32451b = c1Var;
        c1Var.f32418c = this;
    }

    public d2(ya yaVar, byte[] bArr) {
        this.f32450a = 5;
        this.f32451b = bArr;
    }
}
