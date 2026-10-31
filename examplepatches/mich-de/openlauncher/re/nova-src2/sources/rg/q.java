package rg;

import com.amplitude.android.migration.DatabaseConstants;
import com.google.android.gms.common.Feature;
import java.util.Arrays;

/* loaded from: classes.dex */
public final class q {

    /* renamed from: a, reason: collision with root package name */
    public final a f85916a;

    /* renamed from: b, reason: collision with root package name */
    public final Feature f85917b;

    public /* synthetic */ q(a aVar, Feature feature) {
        this.f85916a = aVar;
        this.f85917b = feature;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof q) {
            q qVar = (q) obj;
            if (sg.w.k(this.f85916a, qVar.f85916a) && sg.w.k(this.f85917b, qVar.f85917b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{this.f85916a, this.f85917b});
    }

    public final String toString() {
        og.i iVar = new og.i(this);
        iVar.c(this.f85916a, DatabaseConstants.KEY_FIELD);
        iVar.c(this.f85917b, "feature");
        return iVar.toString();
    }
}
