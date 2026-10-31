package op;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import pp.w;

/* loaded from: classes.dex */
public final /* synthetic */ class h implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f80556a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f80557b;

    public /* synthetic */ h(int i5, int i11) {
        this.f80556a = i5;
        this.f80557b = i11;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        w it = (w) obj;
        Intrinsics.g(it, "it");
        return new k(this.f80556a, this.f80557b);
    }
}
