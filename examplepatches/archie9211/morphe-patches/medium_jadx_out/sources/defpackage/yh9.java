package defpackage;

import android.view.View;
import com.medium.proto.event.MeterViewed;
import com.medium.proto.event.ShowMeterBanner;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yh9 extends nr0 {
    public final zh9 c;

    public yh9(zh9 zh9Var) {
        this.c = zh9Var;
    }

    @Override // defpackage.nr0
    public final void a(pr0 pr0Var) {
        ((hve) pr0Var.t).a.setContent(new mz1(new xh9(this, 0), true, -520965230));
    }

    @Override // defpackage.nr0
    public final int d() {
        return R.layout.view_post_item_compose;
    }

    @Override // defpackage.nr0
    public final ete g(View view) {
        view.getClass();
        return hve.a(view);
    }

    @Override // defpackage.nr0
    public final boolean h(nr0 nr0Var) {
        return (nr0Var instanceof yh9) && ((yh9) nr0Var).c == this.c;
    }

    @Override // defpackage.nr0
    public final void k(boolean z) {
        if (z) {
            zh9 zh9Var = this.c;
            cv9 cv9Var = zh9Var.c;
            b08 b08Var = zh9Var.b;
            sw9 sw9Var = cv9Var.a;
            String strU = gp7.u(b08Var.b);
            yx2 yx2Var = sw9Var.p;
            String str = b08Var.a;
            String str2 = sw9Var.d;
            String str3 = sw9Var.D0;
            yx2Var.getClass();
            rqd rqdVar = yx2Var.a;
            str.getClass();
            str2.getClass();
            str3.getClass();
            rqd.a(rqdVar, new ShowMeterBanner(null, 0, str, null, 9, null), str2, strU, false, null, str3, 24);
            rqd.a(rqdVar, new MeterViewed(null, 0, str, null, null, 25, null), str2, strU, false, null, str3, 24);
        }
    }
}
