package gf;

import android.net.Uri;
import fe.x1;
import fe.y1;
import fe.z1;
import java.util.Collections;
import java.util.List;
import xk.r2;

/* loaded from: classes3.dex */
public final class w0 extends z1 {

    /* renamed from: g, reason: collision with root package name */
    public static final Object f57648g = new Object();

    /* renamed from: b, reason: collision with root package name */
    public final long f57649b;

    /* renamed from: c, reason: collision with root package name */
    public final long f57650c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f57651d;

    /* renamed from: e, reason: collision with root package name */
    public final fe.u0 f57652e;

    /* renamed from: f, reason: collision with root package name */
    public final fe.q0 f57653f;

    static {
        fe.m0 m0Var = new fe.m0();
        xk.l0 l0Var = xk.v0.f96030b;
        r2 r2Var = r2.f96007e;
        List list = Collections.EMPTY_LIST;
        r2 r2Var2 = r2.f96007e;
        fe.s0 s0Var = fe.s0.f54981c;
        Uri uri = Uri.EMPTY;
        if (uri != null) {
            new fe.r0(uri, null, list, r2Var2);
        }
        m0Var.a();
        fe.w0 w0Var = fe.w0.G;
    }

    public w0(long j11, boolean z11, boolean z12, fe.u0 u0Var) {
        fe.q0 q0Var = z12 ? u0Var.f54995c : null;
        this.f57649b = j11;
        this.f57650c = j11;
        this.f57651d = z11;
        u0Var.getClass();
        this.f57652e = u0Var;
        this.f57653f = q0Var;
    }

    @Override // fe.z1
    public final int b(Object obj) {
        return f57648g.equals(obj) ? 0 : -1;
    }

    @Override // fe.z1
    public final x1 f(int i5, x1 x1Var, boolean z11) {
        wf.a.h(i5, 1);
        Object obj = z11 ? f57648g : null;
        x1Var.getClass();
        x1Var.h(null, obj, 0, this.f57649b, 0L, hf.b.f59845f, false);
        return x1Var;
    }

    @Override // fe.z1
    public final int h() {
        return 1;
    }

    @Override // fe.z1
    public final Object l(int i5) {
        wf.a.h(i5, 1);
        return f57648g;
    }

    @Override // fe.z1
    public final y1 m(int i5, y1 y1Var, long j11) {
        wf.a.h(i5, 1);
        y1Var.b(y1.f55095q, this.f57652e, -9223372036854775807L, -9223372036854775807L, -9223372036854775807L, this.f57651d, false, this.f57653f, 0L, this.f57650c, 0, 0, 0L);
        return y1Var;
    }

    @Override // fe.z1
    public final int o() {
        return 1;
    }
}
