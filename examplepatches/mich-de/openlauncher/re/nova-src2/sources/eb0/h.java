package eb0;

import retrofit2.HttpException;

/* loaded from: classes5.dex */
public final class h implements g {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f52563a;

    /* renamed from: b, reason: collision with root package name */
    public final j f52564b;

    public /* synthetic */ h(j jVar, int i5) {
        this.f52563a = i5;
        this.f52564b = jVar;
    }

    @Override // eb0.g
    public final void a(d dVar, p0 p0Var) {
        switch (this.f52563a) {
            case 0:
                boolean zC = p0Var.f52631a.c();
                j jVar = this.f52564b;
                if (!zC) {
                    jVar.completeExceptionally(new HttpException(p0Var));
                    break;
                } else {
                    jVar.complete(p0Var.f52632b);
                    break;
                }
            default:
                this.f52564b.complete(p0Var);
                break;
        }
    }

    @Override // eb0.g
    public final void e(d dVar, Throwable th2) {
        switch (this.f52563a) {
            case 0:
                this.f52564b.completeExceptionally(th2);
                break;
            default:
                this.f52564b.completeExceptionally(th2);
                break;
        }
    }
}
