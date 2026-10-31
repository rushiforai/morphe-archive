package e90;

import java.io.IOException;
import kotlin.Unit;

/* loaded from: classes5.dex */
public final class n extends a90.a {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f52336e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ q f52337f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ int f52338g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ int f52339h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ n(String str, q qVar, int i5, int i11, int i12) {
        super(str, true);
        this.f52336e = i12;
        this.f52337f = qVar;
        this.f52338g = i5;
        this.f52339h = i11;
    }

    @Override // a90.a
    public final long a() throws IOException {
        switch (this.f52336e) {
            case 0:
                b0 b0Var = this.f52337f.f52356k;
                int i5 = this.f52339h;
                b0Var.getClass();
                fq.c.o(i5, "errorCode");
                synchronized (this.f52337f) {
                    this.f52337f.f52368y.remove(Integer.valueOf(this.f52338g));
                    Unit unit = Unit.f71706a;
                }
                return -1L;
            default:
                q qVar = this.f52337f;
                try {
                    int i11 = this.f52338g;
                    int i12 = this.f52339h;
                    fq.c.o(i12, "statusCode");
                    qVar.f52366w.h(i11, i12);
                } catch (IOException e3) {
                    qVar.a(2, 2, e3);
                }
                return -1L;
        }
    }
}
