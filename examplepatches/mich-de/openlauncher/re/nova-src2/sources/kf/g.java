package kf;

/* loaded from: classes3.dex */
public final class g extends jf.i implements Comparable {

    /* renamed from: j, reason: collision with root package name */
    public long f71515j;

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        g gVar = (g) obj;
        if (d(4) != gVar.d(4)) {
            return d(4) ? 1 : -1;
        }
        long j11 = this.f61582f - gVar.f61582f;
        if (j11 == 0) {
            j11 = this.f71515j - gVar.f71515j;
            if (j11 == 0) {
                return 0;
            }
        }
        return j11 > 0 ? 1 : -1;
    }
}
