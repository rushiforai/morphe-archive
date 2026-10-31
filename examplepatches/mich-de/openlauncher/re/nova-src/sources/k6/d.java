package k6;

import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class d extends c {
    public d(c initialExtras) {
        Intrinsics.g(initialExtras, "initialExtras");
        LinkedHashMap initialExtras2 = initialExtras.f71150a;
        Intrinsics.g(initialExtras2, "initialExtras");
        this.f71150a.putAll(initialExtras2);
    }

    @Override // k6.c
    public final Object a(b bVar) {
        return this.f71150a.get(bVar);
    }

    public /* synthetic */ d(int i5) {
        this(a.f71149b);
    }
}
