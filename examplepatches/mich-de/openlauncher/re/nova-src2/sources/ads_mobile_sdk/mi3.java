package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class mi3 {

    /* renamed from: a, reason: collision with root package name */
    public final ur2 f7224a;

    /* renamed from: b, reason: collision with root package name */
    public fh1 f7225b;

    /* renamed from: c, reason: collision with root package name */
    public tu2 f7226c;

    /* renamed from: d, reason: collision with root package name */
    public s8 f7227d;

    public mi3(ur2 publisherRequestTraceMeta, fh1 internalRequestTraceMeta, tu2 renderTraceMeta, s8 adTraceMeta) {
        Intrinsics.g(publisherRequestTraceMeta, "publisherRequestTraceMeta");
        Intrinsics.g(internalRequestTraceMeta, "internalRequestTraceMeta");
        Intrinsics.g(renderTraceMeta, "renderTraceMeta");
        Intrinsics.g(adTraceMeta, "adTraceMeta");
        this.f7224a = publisherRequestTraceMeta;
        this.f7225b = internalRequestTraceMeta;
        this.f7226c = renderTraceMeta;
        this.f7227d = adTraceMeta;
    }

    public final void a(mi3 traceMetaSet) {
        Intrinsics.g(traceMetaSet, "traceMetaSet");
        fh1 fh1Var = traceMetaSet.f7225b;
        fh1 fh1Var2 = this.f7225b;
        fh1Var2.f3352b = fh1Var.f3352b;
        fh1Var2.f3351a = fh1Var.f3351a;
        fh1Var2.f3355e = fh1Var.f3355e;
        fh1Var2.f3354d = fh1Var.f3354d;
        fh1Var2.f3353c = fh1Var.f3353c;
        fh1Var2.f3356f = fh1Var.f3356f;
        tu2 tu2Var = traceMetaSet.f7226c;
        tu2 tu2Var2 = this.f7226c;
        tu2Var2.f10105b = tu2Var.f10105b;
        tu2Var2.f10107d = tu2Var.f10107d;
        tu2Var2.f10108e = tu2Var.f10108e;
        tu2Var2.f10104a = tu2Var.f10104a;
        tu2Var2.f10106c = tu2Var.f10106c;
        tu2Var2.f10109f = tu2Var.f10109f;
        tu2Var2.f10111h = tu2Var.f10111h;
        s8 s8Var = traceMetaSet.f7227d;
        s8 s8Var2 = this.f7227d;
        s8Var2.f9458b = s8Var.f9458b;
        s8Var2.f9459c = s8Var.f9459c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mi3)) {
            return false;
        }
        mi3 mi3Var = (mi3) obj;
        return Intrinsics.b(this.f7224a, mi3Var.f7224a) && Intrinsics.b(this.f7225b, mi3Var.f7225b) && Intrinsics.b(this.f7226c, mi3Var.f7226c) && Intrinsics.b(this.f7227d, mi3Var.f7227d);
    }

    public final int hashCode() {
        return this.f7227d.hashCode() + ((this.f7226c.hashCode() + ((this.f7225b.hashCode() + (this.f7224a.hashCode() * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "TraceMetaSet(publisherRequestTraceMeta=" + this.f7224a + ", internalRequestTraceMeta=" + this.f7225b + ", renderTraceMeta=" + this.f7226c + ", adTraceMeta=" + this.f7227d + ")";
    }
}
