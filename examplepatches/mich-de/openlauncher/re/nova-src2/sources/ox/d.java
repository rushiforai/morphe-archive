package ox;

import b.c0;
import p1.e1;
import p1.k0;
import qx.w0;

/* loaded from: classes4.dex */
public final class d implements k0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f81060a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f81061b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ w0 f81062c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ e1 f81063d;

    public d(String str, String str2, w0 w0Var, e1 e1Var) {
        this.f81060a = str;
        this.f81061b = str2;
        this.f81062c = w0Var;
        this.f81063d = e1Var;
    }

    @Override // p1.k0
    public final void dispose() {
        qx.n nVar = (qx.n) this.f81063d.getValue();
        if (nVar != null) {
            nVar.a();
        }
        this.f81062c.i(c0.E(this.f81060a, this.f81061b));
    }
}
