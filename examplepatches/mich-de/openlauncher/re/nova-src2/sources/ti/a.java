package ti;

import b.c0;
import b.k9;
import kotlin.Metadata;
import kotlin.jvm.JvmField;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001R\u0014\u0010\u0005\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u0004R\u0014\u0010\u0007\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010\u0004R\u0014\u0010\u000b\u001a\u00020\b8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\t\u0010\n¨\u0006\f"}, d2 = {"Lti/a;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "I", "width", "b", "height", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "c", "Z", "isFluid", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final /* data */ class a {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @gn.c("width")
    @JvmField
    public final int width;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @gn.c("height")
    @JvmField
    public final int height;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @gn.c("is_fluid_height")
    @JvmField
    public final boolean isFluid;

    public a(int i5, int i11, boolean z11) {
        this.width = i5;
        this.height = i11;
        this.isFluid = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return this.width == aVar.width && this.height == aVar.height && this.isFluid == aVar.isFluid;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iB = k9.b(this.height, Integer.hashCode(this.width) * 31);
        boolean z11 = this.isFluid;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return iB + i5;
    }

    public final String toString() {
        int i5 = this.width;
        int i11 = this.height;
        return a80.m.k(c0.t(i5, "AdSizeBundle(width=", ", height=", i11, ", isFluid="), this.isFluid, ")");
    }
}
