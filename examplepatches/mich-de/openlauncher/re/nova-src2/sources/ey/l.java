package ey;

import android.content.res.Resources;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes4.dex */
public final class l extends n {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f53164a;

    public l(ArrayList arrayList) {
        this.f53164a = arrayList;
    }

    @Override // ey.n
    public final boolean a() throws Resources.NotFoundException {
        z10.e eVar = (z10.e) b70.g.Y0(this.f53164a);
        if (eVar == null) {
            return false;
        }
        eVar.f98008a.invoke();
        return true;
    }

    public final List b() {
        return this.f53164a;
    }
}
