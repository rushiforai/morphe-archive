package g0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final q0.d f56512a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.m f56513b;

    public f(q0.d dVar, t70.m mVar) {
        this.f56512a = dVar;
        this.f56513b = mVar;
    }

    public final String toString() {
        String strL;
        t70.m mVar = this.f56513b;
        t70.i0 i0Var = (t70.i0) mVar.f88824e.get(t70.i0.f88803c);
        String str = i0Var != null ? i0Var.f88804b : null;
        StringBuilder sb2 = new StringBuilder("Request@");
        int iHashCode = hashCode();
        kotlin.text.a.a(16);
        String string = Integer.toString(iHashCode, 16);
        Intrinsics.f(string, "toString(...)");
        sb2.append(string);
        if (str == null || (strL = b.c0.l("[", str, "](")) == null) {
            strL = "(";
        }
        sb2.append(strL);
        sb2.append("currentBounds()=");
        sb2.append(this.f56512a.invoke());
        sb2.append(", continuation=");
        sb2.append(mVar);
        sb2.append(')');
        return sb2.toString();
    }
}
