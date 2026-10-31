package fa;

import java.util.List;
import o9.z1;

/* loaded from: classes.dex */
public final /* synthetic */ class i implements z1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54418a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ List f54419b;

    public /* synthetic */ i(int i5, List list) {
        this.f54418a = i5;
        this.f54419b = list;
    }

    @Override // o9.z1
    public final void c(p pVar) {
        switch (this.f54418a) {
            case 0:
                pVar.S(this.f54419b);
                break;
            default:
                pVar.s(this.f54419b);
                break;
        }
    }
}
