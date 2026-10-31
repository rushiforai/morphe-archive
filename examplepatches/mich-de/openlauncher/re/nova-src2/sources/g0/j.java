package g0;

import kotlin.coroutines.Continuation;

/* loaded from: classes.dex */
public final class j implements m0 {

    /* renamed from: a, reason: collision with root package name */
    public c0.y f56586a;

    /* renamed from: b, reason: collision with root package name */
    public final p1 f56587b;

    public j(c0.y yVar) {
        p1 p1Var = androidx.compose.foundation.gestures.a.f13931c;
        this.f56586a = yVar;
        this.f56587b = p1Var;
    }

    @Override // g0.m0
    public final Object a(d2 d2Var, float f11, Continuation continuation) {
        return t70.m0.y(this.f56587b, new i(f11, this, d2Var, null), continuation);
    }
}
