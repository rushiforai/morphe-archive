package defpackage;

import android.content.Context;
import android.net.Uri;
import com.medium.android.core.navigation.s;
import com.medium.android.reposters.ui.RepostersFragment;
import com.medium.android.reposters.ui.a;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lab implements js0 {
    public final /* synthetic */ mab a;

    public lab(mab mabVar) {
        this.a = mabVar;
    }

    @Override // defpackage.js0
    public final void a() {
        jbb jbbVar = this.a.b;
        vx0.c0(f76.F(jbbVar), null, null, new dbb(1, null, jbbVar), 3);
    }

    @Override // defpackage.js0
    public final void b(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        mab mabVar = this.a;
        mabVar.getClass();
        sourceParameter.getClass();
        RepostersFragment repostersFragment = ((a) mabVar.a).a;
        s sVarZ = repostersFragment.Z();
        Context contextS = repostersFragment.S();
        if (repostersFragment.u0 == null) {
            g76.g0("mediumUris");
            throw null;
        }
        ((p13) sVarZ).f(contextS, Uri.parse(i03.z), gp7.u(sourceParameter));
    }

    @Override // defpackage.js0
    public final void c(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        mab mabVar = this.a;
        mabVar.getClass();
        str.getClass();
        sourceParameter.getClass();
        mabVar.b.e(str, sourceParameter);
    }
}
