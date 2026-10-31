package z2;

import java.util.Map;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final class i0 implements s0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ s0 f98077a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ n0 f98078b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f98079c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ s0 f98080d;

    public i0(s0 s0Var, n0 n0Var, int i5, s0 s0Var2) {
        this.f98078b = n0Var;
        this.f98079c = i5;
        this.f98080d = s0Var2;
        this.f98077a = s0Var;
    }

    @Override // z2.s0
    public final Map a() {
        return this.f98077a.a();
    }

    @Override // z2.s0
    public final void b() {
        int i5 = this.f98079c;
        n0 n0Var = this.f98078b;
        n0Var.f98111e = i5;
        this.f98080d.b();
        z.o0 o0Var = n0Var.f98118l;
        long[] jArr = o0Var.f97866a;
        int length = jArr.length - 2;
        if (length < 0) {
            return;
        }
        int i11 = 0;
        while (true) {
            long j11 = jArr[i11];
            if ((((~j11) << 7) & j11 & (-9187201950435737472L)) != -9187201950435737472L) {
                int i12 = 8 - ((~(i11 - length)) >>> 31);
                for (int i13 = 0; i13 < i12; i13++) {
                    if ((255 & j11) < 128) {
                        int i14 = (i11 << 3) + i13;
                        Object obj = o0Var.f97867b[i14];
                        t1 t1Var = (t1) o0Var.f97868c[i14];
                        int i15 = n0Var.f98119m.i(obj);
                        if (i15 < 0 || i15 >= n0Var.f98111e) {
                            t1Var.dispose();
                            o0Var.l(i14);
                        }
                    }
                    j11 >>= 8;
                }
                if (i12 != 8) {
                    return;
                }
            }
            if (i11 == length) {
                return;
            } else {
                i11++;
            }
        }
    }

    @Override // z2.s0
    public final Function1 c() {
        return this.f98077a.c();
    }

    @Override // z2.s0
    public final int getHeight() {
        return this.f98077a.getHeight();
    }

    @Override // z2.s0
    public final int getWidth() {
        return this.f98077a.getWidth();
    }
}
