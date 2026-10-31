package ey;

import kotlin.jvm.functions.Function0;

/* loaded from: classes4.dex */
public final class m extends n {

    /* renamed from: a, reason: collision with root package name */
    public final Function0 f53165a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f53166b;

    /* renamed from: c, reason: collision with root package name */
    public final x1.e f53167c;

    public m(Function0 function0, boolean z11, x1.e eVar) {
        this.f53165a = function0;
        this.f53166b = z11;
        this.f53167c = eVar;
    }

    @Override // ey.n
    public final boolean a() {
        return ((Boolean) this.f53165a.invoke()).booleanValue();
    }
}
