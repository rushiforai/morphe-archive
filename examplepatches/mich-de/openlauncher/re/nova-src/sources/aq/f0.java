package aq;

import java.lang.reflect.Type;

/* loaded from: classes4.dex */
public final class f0 extends r {

    /* renamed from: a, reason: collision with root package name */
    public final Type f15453a;

    /* renamed from: b, reason: collision with root package name */
    public final String f15454b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f15455c;

    /* renamed from: d, reason: collision with root package name */
    public r f15456d;

    public f0(Type type, String str, Object obj) {
        this.f15453a = type;
        this.f15454b = str;
        this.f15455c = obj;
    }

    @Override // aq.r
    public final Object a(u uVar) {
        r rVar = this.f15456d;
        if (rVar != null) {
            return rVar.a(uVar);
        }
        throw new IllegalStateException("JsonAdapter isn't ready");
    }

    @Override // aq.r
    public final void e(x xVar, Object obj) {
        r rVar = this.f15456d;
        if (rVar == null) {
            throw new IllegalStateException("JsonAdapter isn't ready");
        }
        rVar.e(xVar, obj);
    }

    public final String toString() {
        r rVar = this.f15456d;
        return rVar != null ? rVar.toString() : super.toString();
    }
}
