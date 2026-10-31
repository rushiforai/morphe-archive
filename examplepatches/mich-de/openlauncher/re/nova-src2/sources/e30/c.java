package e30;

import a5.a0;
import a5.h2;
import android.view.View;
import android.view.ViewGroup;
import androidx.core.graphics.Insets;
import com.android.launcher3.Workspace;
import com.teslacoilsw.launcher.wallpaper.app.CropImage;
import fe.j1;
import fe.k1;
import ya.k;
import ya.w;

/* loaded from: classes4.dex */
public final /* synthetic */ class c implements a0, wf.e, w, k {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52099a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f52100b;

    public /* synthetic */ c(int i5, int i11) {
        this.f52099a = i11;
        this.f52100b = i5;
    }

    @Override // ya.k
    public int apply(int i5) {
        return i5 | this.f52100b;
    }

    @Override // wf.e
    public void invoke(Object obj) {
        switch (this.f52099a) {
            case 1:
                ((j1) obj).onRepeatModeChanged(this.f52100b);
                break;
            default:
                ge.b bVar = (ge.b) obj;
                bVar.getClass();
                ge.k kVar = (ge.k) bVar;
                int i5 = this.f52100b;
                if (i5 == 1) {
                    kVar.f57435u = true;
                }
                kVar.f57427k = i5;
                break;
        }
    }

    @Override // ya.w
    public boolean k(View view, ga.e eVar) {
        int i5 = this.f52099a;
        int i11 = this.f52100b;
        switch (i5) {
            case 3:
                int i12 = Workspace.f20990m1;
                if (eVar != null && eVar.f57289a == i11) {
                    break;
                }
                break;
            default:
                int i13 = Workspace.f20990m1;
                if ((eVar instanceof ga.g) && ((ga.g) eVar).f57310r == i11) {
                    break;
                }
                break;
        }
        return true;
    }

    @Override // a5.a0
    public h2 u(View view, h2 h2Var) {
        int i5 = CropImage.Q;
        Insets insetsG = h2Var.f296a.g(1);
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        layoutParams.height = this.f52100b + insetsG.top;
        view.setLayoutParams(layoutParams);
        view.setPadding(0, insetsG.top, 0, 0);
        return h2Var;
    }

    public /* synthetic */ c(ge.a aVar, int i5, k1 k1Var, k1 k1Var2) {
        this.f52099a = 2;
        this.f52100b = i5;
    }
}
