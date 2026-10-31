package z1;

import b00.z0;
import e10.j2;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.KotlinNothingValueException;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import p1.o1;
import p1.v1;
import z.h0;

/* loaded from: classes.dex */
public final class v {

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f97975a;

    /* renamed from: c, reason: collision with root package name */
    public boolean f97977c;

    /* renamed from: h, reason: collision with root package name */
    public z0 f97982h;

    /* renamed from: i, reason: collision with root package name */
    public u f97983i;

    /* renamed from: b, reason: collision with root package name */
    public final AtomicReference f97976b = new AtomicReference(null);

    /* renamed from: d, reason: collision with root package name */
    public final j2 f97978d = new j2(this, 15);

    /* renamed from: e, reason: collision with root package name */
    public final v1 f97979e = new v1(this, 9);

    /* renamed from: f, reason: collision with root package name */
    public final r1.e f97980f = new r1.e(new u[16]);

    /* renamed from: g, reason: collision with root package name */
    public final Object f97981g = new Object();

    /* renamed from: j, reason: collision with root package name */
    public long f97984j = -1;

    public v(Function1 function1) {
        this.f97975a = function1;
    }

    public final void a() {
        synchronized (this.f97981g) {
            try {
                r1.e eVar = this.f97980f;
                Object[] objArr = eVar.f85077a;
                int i5 = eVar.f85079c;
                for (int i11 = 0; i11 < i5; i11++) {
                    u uVar = (u) objArr[i11];
                    uVar.f97967e.g();
                    uVar.f97968f.g();
                    uVar.f97973k.g();
                    uVar.f97974l.clear();
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0071  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x001f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void b(Object obj) {
        int i5;
        synchronized (this.f97981g) {
            try {
                r1.e eVar = this.f97980f;
                int i11 = eVar.f85079c;
                int i12 = 0;
                int i13 = 0;
                while (i12 < i11) {
                    u uVar = (u) eVar.f85077a[i12];
                    h0 h0Var = (h0) uVar.f97968f.k(obj);
                    if (h0Var == null) {
                        i5 = i12;
                    } else {
                        Object[] objArr = h0Var.f97830b;
                        int[] iArr = h0Var.f97831c;
                        long[] jArr = h0Var.f97829a;
                        int length = jArr.length - 2;
                        if (length >= 0) {
                            int i14 = 0;
                            while (true) {
                                long j11 = jArr[i14];
                                i5 = i12;
                                if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                                    int i15 = 8 - ((~(i14 - length)) >>> 31);
                                    for (int i16 = 0; i16 < i15; i16++) {
                                        if ((j11 & 255) < 128) {
                                            int i17 = (i14 << 3) + i16;
                                            Object obj2 = objArr[i17];
                                            int i18 = iArr[i17];
                                            uVar.d(obj, obj2);
                                        }
                                        j11 >>= 8;
                                    }
                                    if (i15 != 8) {
                                        break;
                                    }
                                    if (i14 == length) {
                                        break;
                                    }
                                    i14++;
                                    i12 = i5;
                                }
                            }
                        }
                    }
                    if (!uVar.f97968f.f()) {
                        i13++;
                    } else if (i13 > 0) {
                        Object[] objArr2 = eVar.f85077a;
                        objArr2[i5 - i13] = objArr2[i5];
                    }
                    i12 = i5 + 1;
                }
                int i19 = i11 - i13;
                Arrays.fill(eVar.f85077a, i19, i11, (Object) null);
                eVar.f85079c = i19;
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final boolean c() {
        boolean z11;
        Set set;
        Set set2;
        synchronized (this.f97981g) {
            z11 = this.f97977c;
        }
        if (z11) {
            return false;
        }
        boolean z12 = false;
        while (true) {
            AtomicReference atomicReference = this.f97976b;
            while (true) {
                Object obj = atomicReference.get();
                set = null;
                List list = null;
                List listSubList = null;
                if (obj == null) {
                    break;
                }
                if (obj instanceof Set) {
                    set2 = (Set) obj;
                } else {
                    if (!(obj instanceof List)) {
                        p1.u.d("Unexpected notification");
                        throw new KotlinNothingValueException();
                    }
                    List list2 = (List) obj;
                    Set set3 = (Set) list2.get(0);
                    if (list2.size() == 2) {
                        listSubList = list2.get(1);
                    } else if (list2.size() > 2) {
                        listSubList = list2.subList(1, list2.size());
                    }
                    set2 = set3;
                    list = listSubList;
                }
                while (!atomicReference.compareAndSet(obj, list)) {
                    if (atomicReference.get() != obj) {
                        break;
                    }
                }
                set = set2;
                break;
            }
            if (set == null) {
                return z12;
            }
            synchronized (this.f97981g) {
                try {
                    r1.e eVar = this.f97980f;
                    Object[] objArr = eVar.f85077a;
                    int i5 = eVar.f85079c;
                    for (int i11 = 0; i11 < i5; i11++) {
                        z12 = ((u) objArr[i11]).b(set) || z12;
                    }
                    Unit unit = Unit.f71706a;
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
    }

    public final void d(Object obj, Function1 function1, Function0 function0) {
        Object obj2;
        u uVar;
        synchronized (this.f97981g) {
            r1.e eVar = this.f97980f;
            Object[] objArr = eVar.f85077a;
            int i5 = eVar.f85079c;
            int i11 = 0;
            while (true) {
                if (i11 >= i5) {
                    obj2 = null;
                    break;
                }
                obj2 = objArr[i11];
                if (((u) obj2).f97963a == function1) {
                    break;
                } else {
                    i11++;
                }
            }
            uVar = (u) obj2;
            if (uVar == null) {
                Intrinsics.e(function1, "null cannot be cast to non-null type kotlin.Function1<kotlin.Any, kotlin.Unit>");
                TypeIntrinsics.e(1, function1);
                uVar = new u(function1);
                eVar.b(uVar);
            }
        }
        u uVar2 = this.f97983i;
        long j11 = this.f97984j;
        if (j11 != -1 && j11 != x1.f.c()) {
            StringBuilder sbU = b.c0.u(j11, "Detected multithreaded access to SnapshotStateObserver: previousThreadId=", "), currentThread={id=");
            sbU.append(x1.f.c());
            sbU.append(", name=");
            sbU.append(Thread.currentThread().getName());
            sbU.append("}. Note that observation on multiple threads in layout/draw is not supported. Make sure your measure/layout/draw for each Owner (AndroidComposeView) is executed on the same thread.");
            o1.a(sbU.toString());
        }
        try {
            this.f97983i = uVar;
            this.f97984j = x1.f.c();
            uVar.a(obj, this.f97979e, function0);
        } finally {
            this.f97983i = uVar2;
            this.f97984j = j11;
        }
    }

    public final void e() {
        j2 j2Var = this.f97978d;
        k.f(k.f97941a);
        synchronized (k.f97943c) {
            k.f97948h = b70.g.u1(k.f97948h, j2Var);
            Unit unit = Unit.f71706a;
        }
        this.f97982h = new z0(j2Var, 23);
    }
}
