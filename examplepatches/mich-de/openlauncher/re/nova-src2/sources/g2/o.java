package g2;

import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final class o implements m {

    /* renamed from: a, reason: collision with root package name */
    public boolean f56886a = true;

    /* renamed from: b, reason: collision with root package name */
    public final s f56887b;

    /* renamed from: c, reason: collision with root package name */
    public final s f56888c;

    /* renamed from: d, reason: collision with root package name */
    public final s f56889d;

    /* renamed from: e, reason: collision with root package name */
    public final s f56890e;

    /* renamed from: f, reason: collision with root package name */
    public final s f56891f;

    /* renamed from: g, reason: collision with root package name */
    public final s f56892g;

    /* renamed from: h, reason: collision with root package name */
    public final s f56893h;

    /* renamed from: i, reason: collision with root package name */
    public final s f56894i;

    /* renamed from: j, reason: collision with root package name */
    public Function1 f56895j;

    /* renamed from: k, reason: collision with root package name */
    public Function1 f56896k;

    public o() {
        s sVar = s.f56899b;
        s sVar2 = s.f56899b;
        this.f56887b = sVar2;
        this.f56888c = sVar2;
        this.f56889d = sVar2;
        this.f56890e = sVar2;
        this.f56891f = sVar2;
        this.f56892g = sVar2;
        this.f56893h = sVar2;
        this.f56894i = sVar2;
        this.f56895j = n.f56882k;
        this.f56896k = n.f56883l;
    }

    @Override // g2.m
    public final void a(b4.t tVar) {
        this.f56896k = tVar;
    }

    @Override // g2.m
    public final void b(boolean z11) {
        this.f56886a = z11;
    }

    @Override // g2.m
    public final boolean c() {
        return this.f56886a;
    }

    @Override // g2.m
    public final void d(b4.t tVar) {
        this.f56895j = tVar;
    }

    public final Function1 e() {
        return this.f56895j;
    }

    public final Function1 f() {
        return this.f56896k;
    }
}
