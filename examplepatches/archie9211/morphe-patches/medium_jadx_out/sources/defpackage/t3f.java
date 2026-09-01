package defpackage;

import android.view.View;
import androidx.appcompat.widget.ActionBarOverlayLayout;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t3f extends mve {
    public final /* synthetic */ int a;
    public final /* synthetic */ v3f b;

    public /* synthetic */ t3f(v3f v3fVar, int i) {
        this.a = i;
        this.b = v3fVar;
    }

    @Override // defpackage.lve
    public final void c() {
        View view;
        int i = this.a;
        v3f v3fVar = this.b;
        switch (i) {
            case 0:
                if (v3fVar.o && (view = v3fVar.g) != null) {
                    view.setTranslationY(0.0f);
                    v3fVar.d.setTranslationY(0.0f);
                }
                v3fVar.d.setVisibility(8);
                v3fVar.d.setTransitioning(false);
                v3fVar.s = null;
                lig ligVar = v3fVar.k;
                if (ligVar != null) {
                    ligVar.Z(v3fVar.j);
                    v3fVar.j = null;
                    v3fVar.k = null;
                }
                ActionBarOverlayLayout actionBarOverlayLayout = v3fVar.c;
                if (actionBarOverlayLayout != null) {
                    WeakHashMap weakHashMap = ute.a;
                    actionBarOverlayLayout.requestApplyInsets();
                }
                break;
            default:
                v3fVar.s = null;
                v3fVar.d.requestLayout();
                break;
        }
    }
}
