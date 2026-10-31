package fa;

import o9.z1;

/* loaded from: classes.dex */
public final /* synthetic */ class e implements z1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54383a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ga.a[] f54384b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f54385c;

    public /* synthetic */ e(ga.a[] aVarArr, int i5, int i11) {
        this.f54383a = i11;
        this.f54384b = aVarArr;
        this.f54385c = i5;
    }

    @Override // o9.z1
    public final void c(p pVar) {
        switch (this.f54383a) {
            case 0:
                pVar.c(this.f54384b, this.f54385c);
                break;
            default:
                pVar.c(this.f54384b, this.f54385c);
                break;
        }
    }
}
