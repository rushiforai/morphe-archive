package defpackage;

import android.view.KeyEvent;
import com.medium.android.domain.post.models.Highlight;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p29 implements b6d {
    public final /* synthetic */ q29 a;
    public final /* synthetic */ ArrayList b;

    public p29(q29 q29Var, ArrayList arrayList) {
        this.a = q29Var;
        this.b = arrayList;
    }

    @Override // defpackage.b6d
    public final void a(int i) {
        Highlight highlight = (Highlight) bu1.A0(i, this.b);
        if (highlight != null) {
            this.a.c.d(highlight);
        }
    }

    @Override // defpackage.b6d
    public final boolean h(KeyEvent keyEvent) {
        return false;
    }

    @Override // defpackage.b6d
    public final void i(String str, long j, y5d y5dVar) {
        y5dVar.getClass();
        int i = bkd.c;
        this.a.f = new qxb((int) (j >> 32), (int) (j & 4294967295L));
    }
}
