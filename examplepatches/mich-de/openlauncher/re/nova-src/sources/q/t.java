package q;

import android.widget.PopupWindow;
import bn.s0;

/* loaded from: classes2.dex */
public final class t implements PopupWindow.OnDismissListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f83292a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f83293b;

    public /* synthetic */ t(Object obj, int i5) {
        this.f83292a = i5;
        this.f83293b = obj;
    }

    @Override // android.widget.PopupWindow.OnDismissListener
    public final void onDismiss() {
        switch (this.f83292a) {
            case 0:
                ((u) this.f83293b).c();
                break;
            default:
                ((s0) this.f83293b).getClass();
                break;
        }
    }
}
