package rg;

import com.google.android.gms.common.Feature;

/* loaded from: classes3.dex */
public final class y extends m {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ cz.b f85941d;

    public y(cz.b bVar, Feature[] featureArr, boolean z11, int i5) {
        this.f85941d = bVar;
        this.f85894c = featureArr;
        boolean z12 = false;
        if (featureArr != null && z11) {
            z12 = true;
        }
        this.f85893b = z12;
        this.f85892a = i5;
    }

    public final void e(qg.c cVar, fi.j jVar) {
        ((l) this.f85941d.f48575c).accept(cVar, jVar);
    }
}
