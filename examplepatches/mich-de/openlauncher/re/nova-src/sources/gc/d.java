package gc;

import fc.h;

/* loaded from: classes2.dex */
public final class d implements Comparable, Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final int f57343a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ h f57344b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ e f57345c;

    public d(e eVar, int i5, h hVar) {
        this.f57345c = eVar;
        this.f57344b = hVar;
        this.f57343a = i5;
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return ((d) obj).f57343a - this.f57343a;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f57345c.c(this.f57344b, true);
    }
}
