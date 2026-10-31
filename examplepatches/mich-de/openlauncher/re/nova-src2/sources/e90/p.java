package e90;

import java.io.IOException;

/* loaded from: classes5.dex */
public final class p extends a90.a {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ q f52342e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f52343f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ long f52344g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p(String str, q qVar, int i5, long j11) {
        super(str, true);
        this.f52342e = qVar;
        this.f52343f = i5;
        this.f52344g = j11;
    }

    @Override // a90.a
    public final long a() throws IOException {
        q qVar = this.f52342e;
        try {
            qVar.f52366w.l(this.f52343f, this.f52344g);
            return -1L;
        } catch (IOException e3) {
            qVar.a(2, 2, e3);
            return -1L;
        }
    }
}
