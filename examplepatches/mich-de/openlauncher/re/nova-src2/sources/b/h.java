package b;

import ads_mobile_sdk.a63;

/* loaded from: classes2.dex */
public final /* synthetic */ class h implements vk.g {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15861a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ a63 f15862b;

    public /* synthetic */ h(a63 a63Var, int i5) {
        this.f15861a = i5;
        this.f15862b = a63Var;
    }

    @Override // vk.g
    public final Object apply(Object obj) {
        byte[] bArr = (byte[]) obj;
        switch (this.f15861a) {
            case 0:
                a63 a63Var = this.f15862b;
                a63Var.getClass();
                a63Var.a(new e30.j(1), bArr, false);
                break;
            default:
                a63 a63Var2 = this.f15862b;
                a63Var2.getClass();
                a63Var2.a(new e30.j(1), bArr, true);
                break;
        }
        return null;
    }
}
