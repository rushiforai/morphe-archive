package ox;

import h10.y0;

/* loaded from: classes4.dex */
public final /* synthetic */ class j implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81081a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ y0 f81082b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ l f81083c;

    public /* synthetic */ j(y0 y0Var, l lVar, int i5) {
        this.f81081a = i5;
        this.f81082b = y0Var;
        this.f81083c = lVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f81081a) {
            case 0:
                this.f81082b.invoke(Integer.valueOf(this.f81083c.getMeasuredHeight()));
                break;
            default:
                this.f81082b.invoke(Integer.valueOf(this.f81083c.getMeasuredHeight()));
                break;
        }
    }
}
