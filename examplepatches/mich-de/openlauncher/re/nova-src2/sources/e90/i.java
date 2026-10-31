package e90;

import java.io.IOException;

/* loaded from: classes.dex */
public final class i extends a90.a {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ q f52321e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f52322f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ int f52323g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i(String str, q qVar, int i5, int i11) {
        super(str, true);
        this.f52321e = qVar;
        this.f52322f = i5;
        this.f52323g = i11;
    }

    @Override // a90.a
    public final long a() throws IOException {
        q qVar = this.f52321e;
        try {
            qVar.f52366w.f(this.f52322f, this.f52323g, true);
            return -1L;
        } catch (IOException e3) {
            qVar.a(2, 2, e3);
            return -1L;
        }
    }
}
