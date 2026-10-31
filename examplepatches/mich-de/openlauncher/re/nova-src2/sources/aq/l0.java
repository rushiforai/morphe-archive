package aq;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public final class l0 extends r {

    /* renamed from: a, reason: collision with root package name */
    public final h0 f15493a;

    /* renamed from: b, reason: collision with root package name */
    public final r f15494b;

    /* renamed from: c, reason: collision with root package name */
    public final r f15495c;

    /* renamed from: d, reason: collision with root package name */
    public final r f15496d;

    /* renamed from: e, reason: collision with root package name */
    public final r f15497e;

    /* renamed from: f, reason: collision with root package name */
    public final r f15498f;

    public l0(h0 h0Var) {
        this.f15493a = h0Var;
        Set set = bq.e.f18422a;
        this.f15494b = h0Var.b(List.class, set, null);
        this.f15495c = h0Var.b(Map.class, set, null);
        this.f15496d = h0Var.b(String.class, set, null);
        this.f15497e = h0Var.b(Double.class, set, null);
        this.f15498f = h0Var.b(Boolean.class, set, null);
    }

    @Override // aq.r
    public final Object a(u uVar) {
        int iF = b.c0.F(uVar.w());
        if (iF == 0) {
            return this.f15494b.a(uVar);
        }
        if (iF == 2) {
            return this.f15495c.a(uVar);
        }
        if (iF == 5) {
            return this.f15496d.a(uVar);
        }
        if (iF == 6) {
            return this.f15497e.a(uVar);
        }
        if (iF == 7) {
            return this.f15498f.a(uVar);
        }
        if (iF == 8) {
            uVar.p();
            return null;
        }
        throw new IllegalStateException("Expected a value but was " + a80.m.y(uVar.w()) + " at path " + uVar.e());
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0020 A[PHI: r1
      0x0020: PHI (r1v4 java.lang.Class<?>) = (r1v1 java.lang.Class<?>), (r1v2 java.lang.Class<?>) binds: [B:7:0x001e, B:10:0x0028] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // aq.r
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void e(x xVar, Object obj) {
        Class<?> cls = obj.getClass();
        if (cls == Object.class) {
            xVar.b();
            w wVar = (w) xVar;
            wVar.f15534f = false;
            wVar.s(3, 5, AbstractJsonLexerKt.END_OBJ);
            return;
        }
        Class<?> cls2 = Map.class;
        if (cls2.isAssignableFrom(cls)) {
            cls = cls2;
        } else {
            cls2 = Collection.class;
            if (cls2.isAssignableFrom(cls)) {
            }
        }
        this.f15493a.b(cls, bq.e.f18422a, null).e(xVar, obj);
    }

    public final String toString() {
        return "JsonAdapter(Object)";
    }
}
