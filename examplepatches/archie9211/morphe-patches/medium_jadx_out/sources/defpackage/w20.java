package defpackage;

import android.view.View;
import android.view.ViewTreeObserver;
import java.util.ArrayList;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w20 implements ViewTreeObserver.OnGlobalLayoutListener {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ w20(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public final void onGlobalLayout() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                f30 f30Var = (f30) obj;
                if (!f30Var.getInternalPopup().a()) {
                    f30Var.f.m(f30Var.getTextDirection(), f30Var.getTextAlignment());
                }
                ViewTreeObserver viewTreeObserver = f30Var.getViewTreeObserver();
                if (viewTreeObserver != null) {
                    viewTreeObserver.removeOnGlobalLayoutListener(this);
                }
                break;
            case 1:
                c30 c30Var = (c30) obj;
                f30 f30Var2 = c30Var.H;
                if (f30Var2.isAttachedToWindow() && f30Var2.getGlobalVisibleRect(c30Var.F)) {
                    c30Var.r();
                    c30Var.e();
                } else {
                    c30Var.dismiss();
                }
                break;
            case 2:
                p71 p71Var = (p71) obj;
                ArrayList arrayList = p71Var.h;
                if (p71Var.a() && arrayList.size() > 0 && !((o71) arrayList.get(0)).a.y) {
                    View view = p71Var.o;
                    if (view != null && view.isShown()) {
                        Iterator it2 = arrayList.iterator();
                        while (it2.hasNext()) {
                            ((o71) it2.next()).a.e();
                        }
                    } else {
                        p71Var.dismiss();
                    }
                    break;
                }
                break;
            default:
                knc kncVar = (knc) obj;
                gy7 gy7Var = kncVar.h;
                if (kncVar.a() && !gy7Var.y) {
                    View view2 = kncVar.m;
                    if (view2 != null && view2.isShown()) {
                        gy7Var.e();
                    } else {
                        kncVar.dismiss();
                    }
                    break;
                }
                break;
        }
    }
}
