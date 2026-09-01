package defpackage;

import android.app.Dialog;
import android.app.PendingIntent;
import android.content.DialogInterface;
import android.view.View;
import com.medium.android.donkey.post.PostFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class qa3 implements DialogInterface.OnClickListener {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ qa3(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i) throws PendingIntent.CanceledException {
        int i2 = this.a;
        Object obj = this.b;
        switch (i2) {
            case 0:
                ta3 ta3Var = (ta3) obj;
                View viewE0 = ta3Var.e0(false);
                Dialog dialog = ta3Var.x0;
                if (dialog != null) {
                    dialog.setContentView(viewE0);
                }
                m87 m87Var = ta3Var.M0;
                if (m87Var != null) {
                    ta3Var.l0(m87Var);
                }
                break;
            case 1:
                sw9 sw9VarK1 = ((PostFragment) obj).k1();
                vx0.c0(f76.F(sw9VarK1), null, null, new kd7(sw9VarK1, null, 27), 3);
                break;
            default:
                ((nbb) obj).invoke();
                break;
        }
    }
}
