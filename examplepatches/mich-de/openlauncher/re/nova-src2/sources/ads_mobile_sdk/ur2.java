package ads_mobile_sdk;

import b.c0;
import b.t2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class ur2 {

    /* renamed from: a, reason: collision with root package name */
    public String f10461a;

    /* renamed from: b, reason: collision with root package name */
    public String f10462b;

    /* renamed from: c, reason: collision with root package name */
    public qw2 f10463c;

    /* renamed from: d, reason: collision with root package name */
    public final String f10464d;

    /* renamed from: e, reason: collision with root package name */
    public String f10465e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f10466f;

    /* renamed from: g, reason: collision with root package name */
    public String f10467g;

    public ur2() {
        qw2 qw2Var = qw2.f8859d;
        this.f10461a = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f10462b = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f10463c = qw2Var;
        this.f10464d = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f10465e = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f10466f = false;
        this.f10467g = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ur2)) {
            return false;
        }
        ur2 ur2Var = (ur2) obj;
        return Intrinsics.b(this.f10461a, ur2Var.f10461a) && Intrinsics.b(this.f10462b, ur2Var.f10462b) && this.f10463c == ur2Var.f10463c && Intrinsics.b(this.f10464d, ur2Var.f10464d) && Intrinsics.b(this.f10465e, ur2Var.f10465e) && this.f10466f == ur2Var.f10466f && Intrinsics.b(this.f10467g, ur2Var.f10467g);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iA = t2.a(this.f10465e, t2.a(this.f10464d, (this.f10463c.hashCode() + t2.a(this.f10462b, this.f10461a.hashCode() * 31)) * 31));
        boolean z11 = this.f10466f;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return this.f10467g.hashCode() + ((iA + i5) * 31);
    }

    public final String toString() {
        String str = this.f10461a;
        String str2 = this.f10462b;
        qw2 qw2Var = this.f10463c;
        String str3 = this.f10465e;
        boolean z11 = this.f10466f;
        String str4 = this.f10467g;
        StringBuilder sbW = c0.w("PublisherRequestTraceMeta(publisherRequestId=", str, ", adUnitId=", str2, ", publisherRequestType=");
        sbW.append(qw2Var);
        sbW.append(", signalGenerationRequestId=");
        sbW.append(this.f10464d);
        sbW.append(", preloadId=");
        a80.m.q(str3, ", skipUninitializedAdapters=", ", requestAgent=", sbW, z11);
        return c0.q(sbW, str4, ")");
    }
}
