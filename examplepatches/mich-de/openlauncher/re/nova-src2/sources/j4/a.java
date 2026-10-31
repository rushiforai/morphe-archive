package j4;

/* loaded from: classes2.dex */
public final class a extends c {

    /* renamed from: h, reason: collision with root package name */
    public int f68895h;

    /* renamed from: i, reason: collision with root package name */
    public int f68896i;

    /* renamed from: j, reason: collision with root package name */
    public g4.a f68897j;

    @Override // j4.c
    public final void g(g4.d dVar, boolean z11) {
        int i5 = this.f68895h;
        this.f68896i = i5;
        if (z11) {
            if (i5 == 5) {
                this.f68896i = 1;
            } else if (i5 == 6) {
                this.f68896i = 0;
            }
        } else if (i5 == 5) {
            this.f68896i = 0;
        } else if (i5 == 6) {
            this.f68896i = 1;
        }
        if (dVar instanceof g4.a) {
            ((g4.a) dVar).f57054r0 = this.f68896i;
        }
    }
}
