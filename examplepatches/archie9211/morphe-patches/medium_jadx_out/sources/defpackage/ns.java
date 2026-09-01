package defpackage;

import android.os.Handler;
import android.os.Looper;
import android.view.ActionMode;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ns implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ts b;

    public /* synthetic */ ns(ts tsVar, int i) {
        this.a = i;
        this.b = tsVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        ts tsVar = this.b;
        switch (i) {
            case 0:
                m45 m45Var = (m45) obj;
                View view = tsVar.a;
                Handler handler = view.getHandler();
                if ((handler != null ? handler.getLooper() : null) == Looper.myLooper()) {
                    m45Var.invoke();
                } else {
                    Handler handler2 = view.getHandler();
                    if (handler2 != null) {
                        handler2.post(new wm(2, m45Var));
                    }
                }
                return c1eVar;
            case 1:
                ActionMode actionMode = tsVar.h;
                if (actionMode != null) {
                    actionMode.invalidate();
                }
                return c1eVar;
            case 2:
                ActionMode actionMode2 = tsVar.h;
                if (actionMode2 != null) {
                    actionMode2.invalidateContentRect();
                }
                return c1eVar;
            default:
                tsVar.e.e();
                return new u7(3, tsVar);
        }
    }
}
