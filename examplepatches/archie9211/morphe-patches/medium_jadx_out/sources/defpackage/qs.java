package defpackage;

import android.R;
import android.os.Build;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qs {
    public final rs a;
    public final os b;
    public final os c;
    public final View d;

    public qs(rs rsVar, os osVar, os osVar2, View view) {
        this.a = rsVar;
        this.b = osVar;
        this.c = osVar2;
        this.d = view;
    }

    public final boolean a(Menu menu) {
        int i;
        xgd xgdVar = (xgd) this.b.invoke();
        int i2 = 0;
        if (g76.L(xgdVar, null)) {
            return false;
        }
        menu.clear();
        List list = xgdVar.a;
        int size = list.size();
        int i3 = 1;
        int i4 = 1;
        for (int i5 = 0; i5 < size; i5++) {
            vgd vgdVar = (vgd) list.get(i5);
            if (vgdVar instanceof fhd) {
                i = i3 + 1;
                Object obj = vgdVar.a;
                fhd fhdVar = (fhd) vgdVar;
                MenuItem menuItemAdd = menu.add(i4, g76.L(obj, pxf.G) ? R.id.cut : g76.L(obj, pxf.H) ? R.id.copy : g76.L(obj, pxf.I) ? R.id.paste : g76.L(obj, pxf.J) ? R.id.selectAll : g76.L(obj, pxf.K) ? R.id.autofill : i3, i3, fhdVar.b);
                menuItemAdd.setShowAsAction(2);
                menuItemAdd.setOnMenuItemClickListener(new ps(fhdVar, i2, this));
            } else {
                if (vgdVar instanceof lhd) {
                    if (Build.VERSION.SDK_INT >= 28) {
                        i = i3 + 1;
                        lhd lhdVar = (lhd) vgdVar;
                        uy.a(menu, i3, this.d.getContext(), lhdVar.b, lhdVar.c);
                    }
                } else if (vgdVar instanceof jhd) {
                    i4++;
                }
            }
            i3 = i;
        }
        return true;
    }
}
