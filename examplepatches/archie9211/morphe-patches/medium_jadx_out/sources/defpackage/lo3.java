package defpackage;

import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lo3 extends ko3 {
    @Override // defpackage.jo3, defpackage.ho3, defpackage.mo3
    public void b(m6d m6dVar, m6d m6dVar2, Window window, View view, boolean z, boolean z2) {
        m6dVar.getClass();
        m6dVar2.getClass();
        window.getClass();
        view.getClass();
        gr7.B(window, false);
        window.setStatusBarColor(0);
        window.setNavigationBarColor(0);
        ViewGroup viewGroup = view instanceof ViewGroup ? (ViewGroup) view : null;
        if (viewGroup != null) {
            int i = 0;
            while (true) {
                if (!(i < viewGroup.getChildCount())) {
                    break;
                }
                int i2 = i + 1;
                View childAt = viewGroup.getChildAt(i);
                if (childAt == null) {
                    throw new IndexOutOfBoundsException();
                }
                Object tag = childAt.getTag();
                if (tag instanceof List) {
                    List list = (List) tag;
                    if (list.size() == 4 && (list.get(0) instanceof ev1)) {
                        Iterator it2 = ((Iterable) tag).iterator();
                        while (it2.hasNext()) {
                            it2.next();
                        }
                    }
                }
                i = i2;
            }
        }
        window.setNavigationBarContrastEnforced(true);
        int i3 = Build.VERSION.SDK_INT;
        rr7 e5fVar = i3 >= 35 ? new e5f(window) : i3 >= 30 ? new c5f(window) : i3 >= 26 ? new b5f(window) : new a5f(window);
        e5fVar.C(!z);
        e5fVar.B(true ^ z2);
    }
}
