package androidx.fragment.app;

import android.widget.ListView;

/* loaded from: classes2.dex */
public final class r implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f14676a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f14677b;

    public /* synthetic */ r(Object obj, int i5) {
        this.f14676a = i5;
        this.f14677b = obj;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f14676a) {
            case 0:
                DialogFragment dialogFragment = (DialogFragment) this.f14677b;
                dialogFragment.mOnDismissListener.onDismiss(dialogFragment.mDialog);
                break;
            case 1:
                f2 f2Var = (f2) this.f14677b;
                if (!f2Var.f14554b.isEmpty()) {
                    f2Var.f();
                    break;
                }
                break;
            default:
                ListView listView = ((ListFragment) this.f14677b).f14482d;
                listView.focusableViewAvailable(listView);
                break;
        }
    }
}
