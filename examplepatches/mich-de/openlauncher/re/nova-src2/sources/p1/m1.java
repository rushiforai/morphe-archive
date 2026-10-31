package p1;

import java.util.ArrayList;
import kotlin.LazyKt;

/* loaded from: classes.dex */
public final class m1 {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f81507a;

    /* renamed from: b, reason: collision with root package name */
    public final int f81508b;

    /* renamed from: c, reason: collision with root package name */
    public int f81509c;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f81510d;

    /* renamed from: e, reason: collision with root package name */
    public final z.c0 f81511e;

    /* renamed from: f, reason: collision with root package name */
    public final a70.d f81512f;

    public m1(ArrayList arrayList, int i5) {
        this.f81507a = arrayList;
        this.f81508b = i5;
        if (i5 < 0) {
            o1.a("Invalid start index");
        }
        this.f81510d = new ArrayList();
        z.c0 c0Var = new z.c0();
        int size = arrayList.size();
        int i11 = 0;
        for (int i12 = 0; i12 < size; i12++) {
            w0 w0Var = (w0) this.f81507a.get(i12);
            int i13 = w0Var.f81611c;
            int i14 = w0Var.f81612d;
            c0Var.h(i13, new q0(i12, i11, i14));
            i11 += i14;
        }
        this.f81511e = c0Var;
        this.f81512f = LazyKt.a(new e20.m0(this, 1));
    }

    public final boolean a(int i5, int i11) {
        int i12;
        z.c0 c0Var = this.f81511e;
        q0 q0Var = (q0) c0Var.b(i5);
        if (q0Var == null) {
            return false;
        }
        int i13 = q0Var.f81527b;
        int i14 = i11 - q0Var.f81528c;
        q0Var.f81528c = i11;
        if (i14 == 0) {
            return true;
        }
        Object[] objArr = c0Var.f97796c;
        long[] jArr = c0Var.f97794a;
        int length = jArr.length - 2;
        if (length < 0) {
            return true;
        }
        int i15 = 0;
        while (true) {
            long j11 = jArr[i15];
            if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                int i16 = 8 - ((~(i15 - length)) >>> 31);
                for (int i17 = 0; i17 < i16; i17++) {
                    if ((255 & j11) < 128) {
                        q0 q0Var2 = (q0) objArr[(i15 << 3) + i17];
                        if (q0Var2.f81527b >= i13 && !q0Var2.equals(q0Var) && (i12 = q0Var2.f81527b + i14) >= 0) {
                            q0Var2.f81527b = i12;
                        }
                    }
                    j11 >>= 8;
                }
                if (i16 != 8) {
                    return true;
                }
            }
            if (i15 == length) {
                return true;
            }
            i15++;
        }
    }
}
