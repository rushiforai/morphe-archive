package r;

import android.content.Context;
import android.view.View;

/* loaded from: classes2.dex */
public final class e extends q.u {

    /* renamed from: l, reason: collision with root package name */
    public final /* synthetic */ int f84697l = 0;

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ i f84698m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(i iVar, Context context, q.k kVar, View view) {
        super(context, kVar, view, true, 2130968612, 0);
        this.f84698m = iVar;
        this.f83299f = 8388613;
        f fVar = iVar.f84743u;
        this.f83301h = fVar;
        q.s sVar = this.f83302i;
        if (sVar != null) {
            sVar.h(fVar);
        }
    }

    @Override // q.u
    public final void c() {
        switch (this.f84697l) {
            case 0:
                i iVar = this.f84698m;
                iVar.f84740r = null;
                iVar.getClass();
                super.c();
                break;
            default:
                i iVar2 = this.f84698m;
                q.k kVar = iVar2.f84727c;
                if (kVar != null) {
                    kVar.c(true);
                }
                iVar2.f84739q = null;
                super.c();
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(i iVar, Context context, q.c0 c0Var, View view) {
        super(context, c0Var, view, false, 2130968612, 0);
        this.f84698m = iVar;
        if ((c0Var.A.f83278x & 32) != 32) {
            View view2 = iVar.f84733i;
            this.f83298e = view2 == null ? (View) iVar.f84732h : view2;
        }
        f fVar = iVar.f84743u;
        this.f83301h = fVar;
        q.s sVar = this.f83302i;
        if (sVar != null) {
            sVar.h(fVar);
        }
    }
}
