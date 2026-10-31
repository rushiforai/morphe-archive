package b;

import ads_mobile_sdk.j11;

/* loaded from: classes2.dex */
public final /* synthetic */ class n4 implements d4.i {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ j11 f15950a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f15951b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f15952c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String f15953d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ byte[] f15954e;

    public /* synthetic */ n4(j11 j11Var, String str, boolean z11, String str2, byte[] bArr) {
        this.f15950a = j11Var;
        this.f15951b = str;
        this.f15952c = z11;
        this.f15953d = str2;
        this.f15954e = bArr;
    }

    @Override // d4.i
    public final Object g(d4.h hVar) {
        j11 j11Var = this.f15950a;
        j11Var.f5081a.execute(new o4(j11Var, this.f15951b, hVar, this.f15952c, this.f15953d, this.f15954e));
        return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }
}
