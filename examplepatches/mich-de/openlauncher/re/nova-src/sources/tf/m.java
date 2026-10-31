package tf;

import fe.k0;
import gf.x0;

/* loaded from: classes3.dex */
public abstract class m {

    /* renamed from: a, reason: collision with root package name */
    public final int f89096a;

    /* renamed from: b, reason: collision with root package name */
    public final x0 f89097b;

    /* renamed from: c, reason: collision with root package name */
    public final int f89098c;

    /* renamed from: d, reason: collision with root package name */
    public final k0 f89099d;

    public m(int i5, x0 x0Var, int i11) {
        this.f89096a = i5;
        this.f89097b = x0Var;
        this.f89098c = i11;
        this.f89099d = x0Var.f57658d[i11];
    }

    public abstract int a();

    public abstract boolean b(m mVar);
}
