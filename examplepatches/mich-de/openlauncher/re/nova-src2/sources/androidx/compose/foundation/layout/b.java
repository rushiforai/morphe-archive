package androidx.compose.foundation.layout;

import b2.f;
import k0.t;

/* loaded from: classes.dex */
public final class b implements t {

    /* renamed from: a, reason: collision with root package name */
    public static final b f13968a = new b();

    @Override // k0.t
    public final b2.t a(b2.t tVar, f fVar) {
        return tVar.then(new BoxChildDataElement(fVar, false));
    }

    public final b2.t b(b2.t tVar) {
        return tVar.then(new BoxChildDataElement(b2.d.f17001e, true));
    }
}
