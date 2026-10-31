package r10;

import java.util.Comparator;

/* loaded from: classes.dex */
public final class t implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f85247a;

    public /* synthetic */ t(int i5) {
        this.f85247a = i5;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        switch (this.f85247a) {
            case 0:
                return ab.e0.t(Integer.valueOf(((p0) obj).ordinal()), Integer.valueOf(((p0) obj2).ordinal()));
            default:
                return ab.e0.t(Integer.valueOf(((q0) obj).f()), Integer.valueOf(((q0) obj2).f()));
        }
    }
}
