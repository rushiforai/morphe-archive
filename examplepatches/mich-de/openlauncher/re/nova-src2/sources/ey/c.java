package ey;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;

/* loaded from: classes4.dex */
public final class c implements u {

    /* renamed from: b, reason: collision with root package name */
    public final ga.a f53145b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f53146c;

    /* renamed from: d, reason: collision with root package name */
    public final Function0 f53147d;

    public c(ga.a aVar, boolean z11, Function0 function0) {
        this.f53145b = aVar;
        this.f53146c = z11;
        this.f53147d = function0;
    }

    @Override // ey.u
    public final Function0 a() {
        return this.f53147d;
    }

    @Override // ey.u
    public final Function1 b() {
        return null;
    }

    @Override // ey.u
    public final x1.e getIcon() {
        return new x1.e(new b(this, 0), true, 21874802);
    }

    @Override // ey.u
    public final x1.e getText() {
        return new x1.e(new b(this, 1), true, -316740481);
    }

    @Override // ey.u
    public final String getTitle() {
        return this.f53145b.f57300l.toString();
    }
}
