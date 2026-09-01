package defpackage;

import com.medium.android.yourlibrary.YourLibraryTab;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final /* synthetic */ class vef implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ vef(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        switch (this.a) {
            case 0:
                zef zefVar = (zef) this.b;
                YourLibraryTab yourLibraryTab = (YourLibraryTab) bu1.A0(((Integer) obj).intValue(), ((cff) this.c).a);
                if (yourLibraryTab == null) {
                    yourLibraryTab = YourLibraryTab.YOUR_LISTS;
                }
                zefVar.getClass();
                yourLibraryTab.getClass();
                eff effVar = zefVar.b;
                if (eff.d.contains(yourLibraryTab)) {
                    effVar.b.d("selected_tab", yourLibraryTab);
                }
                return c1e.a;
            default:
                lg3 lg3Var = (lg3) this.b;
                zf3 zf3Var = (zf3) this.c;
                ((IOException) obj).getClass();
                synchronized (lg3Var) {
                    zf3Var.e();
                }
                return c1e.a;
        }
    }
}
