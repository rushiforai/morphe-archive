package e90;

import java.io.IOException;
import kotlin.jvm.internal.Ref;

/* loaded from: classes5.dex */
public final class h extends a90.a {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f52318e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ q f52319f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ Object f52320g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ h(String str, q qVar, Object obj, int i5) {
        super(str, true);
        this.f52318e = i5;
        this.f52319f = qVar;
        this.f52320g = obj;
    }

    @Override // a90.a
    public final long a() {
        switch (this.f52318e) {
            case 0:
                q qVar = this.f52319f;
                qVar.f52346a.a(qVar, (c0) ((Ref.ObjectRef) this.f52320g).f71863a);
                break;
            default:
                try {
                    this.f52319f.f52346a.b((y) this.f52320g);
                    break;
                } catch (IOException e3) {
                    g90.m mVar = g90.m.f57276a;
                    g90.m mVar2 = g90.m.f57276a;
                    String str = "Http2Connection.Listener failure for " + this.f52319f.f52348c;
                    mVar2.getClass();
                    g90.m.i(4, str, e3);
                    try {
                        ((y) this.f52320g).c(2, e3);
                        break;
                    } catch (IOException unused) {
                        break;
                    }
                }
        }
        return -1L;
    }
}
