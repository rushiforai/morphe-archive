package bn;

import android.content.Context;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class n implements dn.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f18249a;

    /* renamed from: b, reason: collision with root package name */
    public final b5.f f18250b;

    public /* synthetic */ n(b5.f fVar, int i5) {
        this.f18249a = i5;
        this.f18250b = fVar;
    }

    @Override // w60.a
    public final Object get() {
        int i5 = this.f18249a;
        b5.f fVar = this.f18250b;
        switch (i5) {
            case 0:
                return new m((nm.c) fVar.f17550a);
            case 1:
                ul.g firebaseApp = (ul.g) fVar.f17550a;
                Intrinsics.g(firebaseApp, "firebaseApp");
                n0 n0Var = n0.f18251a;
                return n0.a(firebaseApp);
            default:
                return new en.a((Context) fVar.f17550a);
        }
    }
}
