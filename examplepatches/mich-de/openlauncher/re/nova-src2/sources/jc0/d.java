package jc0;

import aa.v;
import e1.m0;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;
import java.util.function.Supplier;

/* loaded from: classes5.dex */
public final class d extends dc0.b {

    /* renamed from: d, reason: collision with root package name */
    public final c[] f69438d;

    /* renamed from: e, reason: collision with root package name */
    public final transient m0 f69439e;

    public d() {
        super(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        this.f69439e = new m0(new v(this, 2));
        this.f69438d = new c[0];
    }

    public static int t(d dVar) {
        c[] cVarArr = dVar.f69438d;
        if (cVarArr != null && cVarArr.length > 1) {
            cVarArr = (c[]) Arrays.copyOf(cVarArr, cVarArr.length);
            Arrays.sort(cVarArr, new com.google.firebase.crashlytics.internal.persistence.c(9));
        }
        return Objects.hash(cVarArr);
    }

    public static int u(int i5, int i11) {
        return i11 == 0 ? i5 : u(i11, i5 % i11);
    }

    public static x60.e v(c[] cVarArr, c[] cVarArr2) {
        int i5;
        c[] cVarArr3 = new c[cVarArr.length + cVarArr2.length];
        int length = cVarArr.length;
        int i11 = 0;
        int i12 = 0;
        while (true) {
            int i13 = 1;
            if (i11 >= length) {
                break;
            }
            c cVar = cVarArr[i11];
            x60.e eVar = cVar.f69435a;
            int i14 = cVar.f69436b;
            int i15 = cVar.f69437c;
            int length2 = cVarArr2.length;
            int i16 = 0;
            while (true) {
                if (i16 >= length2) {
                    i5 = 0;
                    break;
                }
                c cVar2 = cVarArr2[i16];
                if (eVar.equals(cVar2.f69435a)) {
                    i5 = cVar2.f69436b;
                    i13 = cVar2.f69437c;
                    break;
                }
                i16++;
            }
            int i17 = (i5 * i15) + (i14 * i13);
            int i18 = i15 * i13;
            if (i17 != 0) {
                int iU = u(Math.abs(i17), i18);
                cVarArr3[i12] = new c(eVar, i17 / iU, i18 / iU);
                i12++;
            }
            i11++;
        }
        for (c cVar3 : cVarArr2) {
            x60.e eVar2 = cVar3.f69435a;
            int length3 = cVarArr.length;
            int i19 = 0;
            while (true) {
                if (i19 >= length3) {
                    cVarArr3[i12] = cVar3;
                    i12++;
                    break;
                }
                if (eVar2.equals(cVarArr[i19].f69435a)) {
                    break;
                }
                i19++;
            }
        }
        if (i12 == 0) {
            return dc0.b.f49216c;
        }
        if (i12 == 1) {
            c cVar4 = cVarArr3[0];
            if (cVar4.f69436b == cVar4.f69437c) {
                return cVar4.f69435a;
            }
        }
        c[] cVarArr4 = new c[i12];
        System.arraycopy(cVarArr3, 0, cVarArr4, 0, i12);
        return new d(cVarArr4);
    }

    public static x60.e y(d dVar, int i5) {
        c[] cVarArr;
        if (dVar != null) {
            c[] cVarArr2 = dVar.f69438d;
            cVarArr = new c[cVarArr2.length];
            for (int i11 = 0; i11 < cVarArr2.length; i11++) {
                int iU = u(Math.abs(cVarArr2[i11].f69436b * i5), cVarArr2[i11].f69437c);
                c cVar = cVarArr2[i11];
                cVarArr[i11] = new c(cVar.f69435a, (cVar.f69436b * i5) / iU, cVar.f69437c / iU);
            }
        } else {
            cVarArr = new c[]{new c(dVar, i5, 1)};
        }
        return v(cVarArr, new c[0]);
    }

    @Override // dc0.b, x60.e
    public final Map a() {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (int i5 = 0; i5 < this.f69438d.length; i5++) {
            linkedHashMap.put(w(i5), Integer.valueOf(x(i5)));
        }
        return linkedHashMap;
    }

    @Override // dc0.b, x60.e
    public final x60.b b() {
        x60.b bVarB = f.f69444c;
        int i5 = 0;
        while (true) {
            c[] cVarArr = this.f69438d;
            if (i5 >= cVarArr.length) {
                return bVarB;
            }
            x60.e eVarW = w(i5);
            if (eVarW.b() != null) {
                x60.b bVarB2 = eVarW.b();
                f fVar = (f) bVarB;
                bVarB = fVar.b(new f(((dc0.b) ((f) bVarB2).f69452a.c(x(i5))).o(cVarArr[i5].f69437c)));
            }
            i5++;
        }
    }

    @Override // dc0.b, x60.e
    public final x60.e c(int i5) {
        return y(this, i5);
    }

    /* JADX WARN: Code restructure failed: missing block: B:17:0x002e, code lost:
    
        if (r5.f69436b != r8.f69436b) goto L26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:19:0x0034, code lost:
    
        if (r5.f69437c == r8.f69437c) goto L21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:21:0x0037, code lost:
    
        r4 = r4 + 1;
     */
    @Override // dc0.b
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof d)) {
            return false;
        }
        c[] cVarArr = ((d) obj).f69438d;
        c[] cVarArr2 = this.f69438d;
        if (cVarArr2.length == cVarArr.length) {
            int length = cVarArr2.length;
            int i5 = 0;
            loop0: while (i5 < length) {
                c cVar = cVarArr2[i5];
                int length2 = cVarArr.length;
                int i11 = 0;
                while (true) {
                    if (i11 >= length2) {
                        break loop0;
                    }
                    c cVar2 = cVarArr[i11];
                    if (cVar.f69435a.equals(cVar2.f69435a)) {
                        break;
                    }
                    i11++;
                }
            }
            return true;
        }
        return false;
    }

    public final int hashCode() {
        Object obj;
        m0 m0Var = this.f69439e;
        synchronized (m0Var) {
            try {
                if (m0Var.f51337b) {
                    obj = m0Var.f51339d;
                } else {
                    m0Var.f51337b = true;
                    obj = ((Supplier) m0Var.f51338c).get();
                    m0Var.f51339d = obj;
                }
            } finally {
            }
        }
        return ((Integer) obj).intValue();
    }

    @Override // dc0.b
    public final x60.f k() {
        x60.f fVarD = fc0.e.f54605b;
        for (c cVar : this.f69438d) {
            x60.e eVar = cVar.f69435a;
            if (eVar instanceof dc0.b) {
                x60.f fVarK = ((dc0.b) eVar).k();
                if (!fVarK.e()) {
                    throw new UnsupportedOperationException(eVar + " is non-linear, cannot convert");
                }
                if (cVar.f69437c != 1) {
                    throw new UnsupportedOperationException(eVar + " holds a base unit with fractional exponent");
                }
                int i5 = cVar.f69436b;
                if (i5 < 0) {
                    i5 = -i5;
                    fVarK = fVarK.g();
                }
                for (int i11 = 0; i11 < i5; i11++) {
                    fVarD = fVarD.d(fVarK);
                }
            }
        }
        return fVarD;
    }

    @Override // dc0.b
    public final x60.e q() {
        c[] cVarArr = this.f69438d;
        x60.e eVarM = dc0.b.f49216c;
        for (c cVar : cVarArr) {
            eVarM = ((dc0.b) eVarM).m(((dc0.b) ((dc0.b) cVar.f69435a).q().c(cVar.f69436b)).o(cVar.f69437c));
        }
        return (dc0.b) eVarM;
    }

    public final x60.e w(int i5) {
        return this.f69438d[i5].f69435a;
    }

    public final int x(int i5) {
        return this.f69438d[i5].f69436b;
    }

    public d(x60.e eVar) {
        super(((dc0.b) eVar).f49218b);
        this.f69439e = new m0(new v(this, 2));
        this.f69438d = ((d) eVar).f69438d;
    }

    public d(c[] cVarArr) {
        super(null);
        this.f69439e = new m0(new v(this, 2));
        this.f69438d = cVarArr;
    }
}
