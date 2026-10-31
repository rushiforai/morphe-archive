package fa;

import java.util.ArrayList;
import o9.z1;

/* loaded from: classes.dex */
public final /* synthetic */ class l implements z1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54431a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ArrayList f54432b;

    public /* synthetic */ l(ArrayList arrayList, int i5) {
        this.f54431a = i5;
        this.f54432b = arrayList;
    }

    @Override // o9.z1
    public final void c(p pVar) {
        switch (this.f54431a) {
            case 0:
                pVar.b(this.f54432b);
                break;
            case 1:
                pVar.b(this.f54432b);
                break;
            default:
                pVar.g(this.f54432b);
                break;
        }
    }
}
