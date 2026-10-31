package ju;

import android.content.Context;
import java.util.Map;

/* loaded from: classes4.dex */
public final class b implements s40.d {

    /* renamed from: a, reason: collision with root package name */
    public final s40.h f69932a;

    /* renamed from: b, reason: collision with root package name */
    public final s40.g f69933b;

    /* renamed from: c, reason: collision with root package name */
    public final s40.e f69934c;

    /* renamed from: d, reason: collision with root package name */
    public final s40.e f69935d;

    public b(s40.h hVar, s40.g gVar, s40.e eVar, s40.e eVar2) {
        this.f69932a = hVar;
        this.f69933b = gVar;
        this.f69934c = eVar;
        this.f69935d = eVar2;
    }

    @Override // w60.a
    public final Object get() {
        return new a((c) this.f69932a.get(), (Map) this.f69933b.get(), ((Boolean) this.f69934c.f86659a).booleanValue(), (Context) this.f69935d.f86659a);
    }
}
