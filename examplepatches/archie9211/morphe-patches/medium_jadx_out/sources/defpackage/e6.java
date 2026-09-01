package defpackage;

import android.content.Context;
import android.view.View;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class e6 extends cy7 {
    public final /* synthetic */ int l = 0;
    public final /* synthetic */ h6 m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e6(h6 h6Var, Context context, dvc dvcVar, View view) {
        super(context, dvcVar, view, false, R.attr.actionOverflowMenuStyle, 0);
        this.m = h6Var;
        if ((dvcVar.A.x & 32) != 32) {
            View view2 = h6Var.i;
            this.e = view2 == null ? (View) h6Var.h : view2;
        }
        md5 md5Var = h6Var.w;
        this.h = md5Var;
        ay7 ay7Var = this.i;
        if (ay7Var != null) {
            ay7Var.g(md5Var);
        }
    }

    @Override // defpackage.cy7
    public final void c() {
        int i = this.l;
        h6 h6Var = this.m;
        switch (i) {
            case 0:
                h6Var.t = null;
                super.c();
                break;
            default:
                lx7 lx7Var = h6Var.c;
                if (lx7Var != null) {
                    lx7Var.c(true);
                }
                h6Var.s = null;
                super.c();
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e6(h6 h6Var, Context context, lx7 lx7Var, View view) {
        super(context, lx7Var, view, true, R.attr.actionOverflowMenuStyle, 0);
        this.m = h6Var;
        this.f = 8388613;
        md5 md5Var = h6Var.w;
        this.h = md5Var;
        ay7 ay7Var = this.i;
        if (ay7Var != null) {
            ay7Var.g(md5Var);
        }
    }
}
