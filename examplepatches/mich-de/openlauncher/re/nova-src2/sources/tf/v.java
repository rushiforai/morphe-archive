package tf;

import fe.b2;
import fe.r1;

/* loaded from: classes3.dex */
public final class v {

    /* renamed from: a, reason: collision with root package name */
    public final int f89177a;

    /* renamed from: b, reason: collision with root package name */
    public final r1[] f89178b;

    /* renamed from: c, reason: collision with root package name */
    public final q[] f89179c;

    /* renamed from: d, reason: collision with root package name */
    public final b2 f89180d;

    /* renamed from: e, reason: collision with root package name */
    public final Object f89181e;

    public v(r1[] r1VarArr, q[] qVarArr, b2 b2Var, r rVar) {
        this.f89178b = r1VarArr;
        this.f89179c = (q[]) qVarArr.clone();
        this.f89180d = b2Var;
        this.f89181e = rVar;
        this.f89177a = r1VarArr.length;
    }

    public final boolean a(v vVar, int i5) {
        return vVar != null && wf.v.a(this.f89178b[i5], vVar.f89178b[i5]) && wf.v.a(this.f89179c[i5], vVar.f89179c[i5]);
    }

    public final boolean b(int i5) {
        return this.f89178b[i5] != null;
    }
}
