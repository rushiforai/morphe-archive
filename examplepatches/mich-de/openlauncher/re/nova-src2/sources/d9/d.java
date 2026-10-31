package d9;

import android.view.View;
import android.view.ViewTreeObserver;
import com.android.launcher3.CropView;
import java.util.ArrayList;
import java.util.Iterator;
import q.b0;
import r.f0;
import r.g0;
import r.x1;

/* loaded from: classes2.dex */
public final class d implements ViewTreeObserver.OnGlobalLayoutListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f49032a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f49033b;

    public /* synthetic */ d(Object obj, int i5) {
        this.f49032a = i5;
        this.f49033b = obj;
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public final void onGlobalLayout() {
        int i5;
        switch (this.f49032a) {
            case 0:
                j jVar = (j) this.f49033b;
                jVar.f49063d.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                int i11 = jVar.n;
                if ((i11 == 2 || i11 == 3) && i11 == 2 && (i5 = jVar.f49062c.f49057x) >= 0 && jVar.f49063d.getLastVisiblePosition() < i5) {
                    int lastVisiblePosition = i5 - ((jVar.f49063d.getLastVisiblePosition() - jVar.f49063d.getFirstVisiblePosition()) / 2);
                    if (lastVisiblePosition < 0) {
                        lastVisiblePosition = 0;
                    }
                    jVar.f49063d.post(new com.google.android.material.datepicker.g(this, lastVisiblePosition, 1));
                    break;
                }
                break;
            case 1:
                CropView cropView = (CropView) this.f49033b;
                cropView.c();
                cropView.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                break;
            case 2:
                q.e eVar = (q.e) this.f49033b;
                ArrayList arrayList = eVar.f83200h;
                if (eVar.isShowing() && arrayList.size() > 0 && !((q.d) arrayList.get(0)).f83191a.f84882y) {
                    View view = eVar.o;
                    if (view != null && view.isShown()) {
                        Iterator it = arrayList.iterator();
                        while (it.hasNext()) {
                            ((q.d) it.next()).f83191a.show();
                        }
                        break;
                    } else {
                        eVar.dismiss();
                        break;
                    }
                }
                break;
            case 3:
                b0 b0Var = (b0) this.f49033b;
                x1 x1Var = b0Var.f83177h;
                if (b0Var.isShowing() && !x1Var.f84882y) {
                    View view2 = b0Var.f83182m;
                    if (view2 != null && view2.isShown()) {
                        x1Var.show();
                        break;
                    } else {
                        b0Var.dismiss();
                        break;
                    }
                }
                break;
            case 4:
                androidx.appcompat.widget.b bVar = (androidx.appcompat.widget.b) this.f49033b;
                g0 g0Var = bVar.f13836f;
                if (!g0Var.isShowing()) {
                    g0Var.h(bVar.getTextDirection(), bVar.getTextAlignment());
                }
                ViewTreeObserver viewTreeObserver = bVar.getViewTreeObserver();
                if (viewTreeObserver != null) {
                    viewTreeObserver.removeOnGlobalLayoutListener(this);
                    break;
                }
                break;
            default:
                f0 f0Var = (f0) this.f49033b;
                androidx.appcompat.widget.b bVar2 = f0Var.G;
                f0Var.getClass();
                if (!bVar2.isAttachedToWindow() || !bVar2.getGlobalVisibleRect(f0Var.E)) {
                    f0Var.dismiss();
                    break;
                } else {
                    f0Var.q();
                    f0Var.show();
                    break;
                }
                break;
        }
    }
}
