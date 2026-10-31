package fa;

import java.util.Collections;
import o9.z1;

/* loaded from: classes2.dex */
public final /* synthetic */ class i0 implements z1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54420a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ga.e f54421b;

    public /* synthetic */ i0(ga.e eVar, int i5) {
        this.f54420a = i5;
        this.f54421b = eVar;
    }

    @Override // o9.z1
    public final void c(p pVar) {
        switch (this.f54420a) {
            case 0:
                pVar.K(Collections.singletonList(this.f54421b), false);
                break;
            default:
                Collections.singletonList(this.f54421b);
                pVar.getClass();
                break;
        }
    }
}
