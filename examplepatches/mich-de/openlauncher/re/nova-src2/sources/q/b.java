package q;

import android.view.View;
import androidx.appcompat.view.menu.ActionMenuItemView;
import r.i1;

/* loaded from: classes2.dex */
public final class b extends i1 {

    /* renamed from: j, reason: collision with root package name */
    public final /* synthetic */ int f83169j = 0;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ View f83170k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(ActionMenuItemView actionMenuItemView) {
        super(actionMenuItemView);
        this.f83170k = actionMenuItemView;
    }

    @Override // r.i1
    public final a0 b() {
        r.e eVar;
        switch (this.f83169j) {
            case 0:
                r.f fVar = ((ActionMenuItemView) this.f83170k).f13669f;
                if (fVar == null || (eVar = fVar.f84703a.f84740r) == null) {
                    return null;
                }
                return eVar.a();
            default:
                r.e eVar2 = ((r.h) this.f83170k).f84722d.f84739q;
                if (eVar2 == null) {
                    return null;
                }
                return eVar2.a();
        }
    }

    @Override // r.i1
    public final boolean c() {
        a0 a0VarB;
        switch (this.f83169j) {
            case 0:
                ActionMenuItemView actionMenuItemView = (ActionMenuItemView) this.f83170k;
                j jVar = actionMenuItemView.f13667d;
                return jVar != null && jVar.a(actionMenuItemView.f13664a) && (a0VarB = b()) != null && a0VarB.isShowing();
            default:
                ((r.h) this.f83170k).f84722d.l();
                return true;
        }
    }

    @Override // r.i1
    public boolean d() {
        switch (this.f83169j) {
            case 1:
                r.i iVar = ((r.h) this.f83170k).f84722d;
                if (iVar.f84741s != null) {
                    return false;
                }
                iVar.j();
                return true;
            default:
                return super.d();
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(r.h hVar, r.h hVar2) {
        super(hVar2);
        this.f83170k = hVar;
    }
}
