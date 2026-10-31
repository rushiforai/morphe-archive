package ou;

import com.stripe.android.core.strings.ResolvableString;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import w70.i2;

/* loaded from: classes4.dex */
public final class t {

    /* renamed from: a, reason: collision with root package name */
    public final w70.o1 f80975a;

    /* renamed from: b, reason: collision with root package name */
    public final String f80976b;

    /* renamed from: c, reason: collision with root package name */
    public final kv.a f80977c;

    /* renamed from: d, reason: collision with root package name */
    public final kv.a f80978d;

    /* renamed from: e, reason: collision with root package name */
    public final i2 f80979e;

    /* renamed from: f, reason: collision with root package name */
    public final i2 f80980f;

    public t(m6.a aVar, w70.o1 o1Var, String merchantDisplayName, kv.a aVar2, kv.a aVar3) {
        Intrinsics.g(merchantDisplayName, "merchantDisplayName");
        this.f80975a = o1Var;
        this.f80976b = merchantDisplayName;
        this.f80977c = aVar2;
        this.f80978d = aVar3;
        i2 i2VarC = w70.u1.c(null);
        this.f80979e = i2VarC;
        this.f80980f = i2VarC;
        t70.m0.t(aVar, null, null, new mx.e0(this, (Continuation) null, 9), 3);
    }

    public final void a(ResolvableString resolvableString, boolean z11) {
        wu.b bVar;
        if (resolvableString != null) {
            bVar = new wu.b(resolvableString, z11 || ((Boolean) this.f80977c.invoke()).booleanValue());
        } else {
            bVar = null;
        }
        this.f80979e.j(bVar);
    }
}
