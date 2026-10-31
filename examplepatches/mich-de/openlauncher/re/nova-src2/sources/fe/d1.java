package fe;

import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class d1 implements a1 {

    /* renamed from: a, reason: collision with root package name */
    public final gf.q f54740a;

    /* renamed from: d, reason: collision with root package name */
    public int f54743d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f54744e;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f54742c = new ArrayList();

    /* renamed from: b, reason: collision with root package name */
    public final Object f54741b = new Object();

    public d1(gf.a aVar, boolean z11) {
        this.f54740a = new gf.q(aVar, z11);
    }

    @Override // fe.a1
    public final Object a() {
        return this.f54741b;
    }

    @Override // fe.a1
    public final z1 b() {
        return this.f54740a.o;
    }
}
