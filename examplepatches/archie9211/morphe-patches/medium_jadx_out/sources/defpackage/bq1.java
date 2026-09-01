package defpackage;

import android.view.View;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bq1 implements View.OnClickListener {
    public d34 a;
    public WeakReference b;
    public WeakReference c;
    public View.OnClickListener d;
    public boolean e;

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            view.getClass();
            View.OnClickListener onClickListener = this.d;
            if (onClickListener != null) {
                onClickListener.onClick(view);
            }
            View view2 = (View) this.c.get();
            View view3 = (View) this.b.get();
            if (view2 == null || view3 == null) {
                return;
            }
            d34 d34Var = this.a;
            d34Var.getClass();
            dq1.B(d34Var, view2, view3);
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }
}
