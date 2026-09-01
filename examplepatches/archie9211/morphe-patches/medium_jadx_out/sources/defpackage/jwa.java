package defpackage;

import android.view.View;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jwa extends nr0 {
    public final kwa c;

    public jwa(kwa kwaVar) {
        this.c = kwaVar;
    }

    @Override // defpackage.nr0
    public final void a(pr0 pr0Var) {
        ((hve) pr0Var.t).a.setContent(k50.d);
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
        if (nr0Var instanceof jwa) {
            return this.c == ((jwa) nr0Var).c;
        }
        return false;
    }
}
