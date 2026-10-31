package e90;

import java.io.IOException;

/* loaded from: classes5.dex */
public final class l extends a90.a {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ q f52328e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f52329f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ m90.g f52330g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ int f52331h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public l(String str, q qVar, int i5, m90.g gVar, int i11, boolean z11) {
        super(str, true);
        this.f52328e = qVar;
        this.f52329f = i5;
        this.f52330g = gVar;
        this.f52331h = i11;
    }

    @Override // a90.a
    public final long a() {
        try {
            b0 b0Var = this.f52328e.f52356k;
            m90.g gVar = this.f52330g;
            int i5 = this.f52331h;
            b0Var.getClass();
            gVar.skip(i5);
            this.f52328e.f52366w.h(this.f52329f, 9);
            synchronized (this.f52328e) {
                this.f52328e.f52368y.remove(Integer.valueOf(this.f52329f));
            }
            return -1L;
        } catch (IOException unused) {
            return -1L;
        }
    }
}
