package m3;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class d0 implements y1.i {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Function2 f75850a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Function1 f75851b;

    public d0(Function2 function2, Function1 function1) {
        this.f75850a = function2;
        this.f75851b = function1;
    }

    @Override // y1.i
    public final Object a(y1.b bVar, Object obj) {
        return this.f75850a.invoke(bVar, obj);
    }

    @Override // y1.i
    public final Object b(Object obj) {
        return this.f75851b.invoke(obj);
    }
}
