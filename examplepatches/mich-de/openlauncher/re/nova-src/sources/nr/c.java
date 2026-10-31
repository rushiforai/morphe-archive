package nr;

import fw.e;
import jr.m;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements e {

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f78527a;

    public c(Function1 viewActionHandler) {
        Intrinsics.g(viewActionHandler, "viewActionHandler");
        this.f78527a = viewActionHandler;
    }

    @Override // fw.e
    public final void a() {
        this.f78527a.invoke(m.f69689a);
    }
}
