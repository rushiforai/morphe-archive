package defpackage;

import android.content.Context;
import android.net.Uri;
import com.medium.android.publicationadmin.ui.featurepost.FeaturePostBottomSheetFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ua4 {
    public final /* synthetic */ zm7 a;
    public final /* synthetic */ ib4 b;

    public ua4(zm7 zm7Var, ib4 ib4Var) {
        this.a = zm7Var;
        this.b = ib4Var;
    }

    public final void a(String str, SourceParameter sourceParameter) {
        str.getClass();
        sourceParameter.getClass();
        FeaturePostBottomSheetFragment featurePostBottomSheetFragment = (FeaturePostBottomSheetFragment) this.a.b;
        p13 p13Var = featurePostBottomSheetFragment.H0;
        if (p13Var != null) {
            p13Var.h(featurePostBottomSheetFragment.S(), str, gp7.u(sourceParameter));
        } else {
            g76.g0("router");
            throw null;
        }
    }

    public final void b() {
        k40.X((FeaturePostBottomSheetFragment) this.a.b).f();
    }

    public final void c(SourceParameter sourceParameter) {
        sourceParameter.getClass();
        FeaturePostBottomSheetFragment featurePostBottomSheetFragment = (FeaturePostBottomSheetFragment) this.a.b;
        p13 p13Var = featurePostBottomSheetFragment.H0;
        if (p13Var == null) {
            g76.g0("router");
            throw null;
        }
        Context contextS = featurePostBottomSheetFragment.S();
        if (featurePostBottomSheetFragment.J0 == null) {
            g76.g0("mediumUris");
            throw null;
        }
        Uri uri = Uri.parse(i03.B);
        uri.getClass();
        p13Var.f(contextS, uri, gp7.u(sourceParameter));
    }
}
