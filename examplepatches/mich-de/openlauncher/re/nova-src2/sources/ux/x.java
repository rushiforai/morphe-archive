package ux;

import kotlin.Pair;
import kotlin.collections.MapsKt;
import p1.e1;
import p1.k0;

/* loaded from: classes4.dex */
public final class x implements k0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ e1 f91672a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p0.y f91673b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f91674c;

    public x(e1 e1Var, p0.y yVar, long j11) {
        this.f91672a = e1Var;
        this.f91673b = yVar;
        this.f91674c = j11;
    }

    @Override // p1.k0
    public final void dispose() {
        if (((Boolean) this.f91672a.getValue()).booleanValue()) {
            return;
        }
        zy.c cVar = zy.c.f98823a;
        zy.c.i("ai_showcase_abandoned", MapsKt.j0(new Pair("last_page", String.valueOf(this.f91673b.k())), new Pair("total_duration_ms", String.valueOf(System.currentTimeMillis() - this.f91674c))));
    }
}
