package z1;

/* loaded from: classes.dex */
public abstract class a0 implements z {

    /* renamed from: a, reason: collision with root package name */
    public final x1.a f97891a = new x1.a(0);

    public final boolean a(int i5) {
        return (i5 & this.f97891a.get()) != 0;
    }

    public final void i(int i5) {
        x1.a aVar;
        int i11;
        do {
            aVar = this.f97891a;
            i11 = aVar.get();
            if ((i11 & i5) != 0) {
                return;
            }
        } while (!aVar.compareAndSet(i11, i11 | i5));
    }
}
