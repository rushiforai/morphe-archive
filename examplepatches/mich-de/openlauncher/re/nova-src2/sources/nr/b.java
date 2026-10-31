package nr;

import jr.o;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements fw.c {

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f78526a;

    public b(Function1 viewActionHandler) {
        Intrinsics.g(viewActionHandler, "viewActionHandler");
        this.f78526a = viewActionHandler;
    }

    @Override // fw.c
    public final void a(ft.b brand) {
        Intrinsics.g(brand, "brand");
        this.f78526a.invoke(new o(brand));
    }
}
