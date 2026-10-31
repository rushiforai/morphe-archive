package w9;

import androidx.room.o;
import java.util.ArrayList;
import mz.h;

/* loaded from: classes.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f94116a = new ArrayList();

    /* renamed from: b, reason: collision with root package name */
    public int f94117b;

    public boolean a(h hVar) {
        ArrayList arrayList = this.f94116a;
        int iIndexOf = arrayList.indexOf(hVar);
        h hVar2 = iIndexOf == -1 ? null : (h) arrayList.get(iIndexOf);
        if (hVar2 == null) {
            boolean zAdd = arrayList.add(hVar);
            if (zAdd) {
                this.f94117b += hVar.f77344d;
            }
            return zAdd;
        }
        int i5 = hVar2.f77344d;
        int i11 = hVar.f77344d;
        if (i5 == i11) {
            return false;
        }
        this.f94117b = (this.f94117b - i5) + i11;
        hVar2.f77344d = i11;
        return true;
    }

    public int b() {
        return Math.min(this.f94117b, o.MAX_BIND_PARAMETER_CNT);
    }

    public boolean c(h hVar) {
        boolean zRemove = this.f94116a.remove(hVar);
        if (zRemove) {
            this.f94117b -= hVar.f77344d;
        }
        return zRemove;
    }

    public final String toString() {
        return Integer.toString(this.f94117b);
    }
}
