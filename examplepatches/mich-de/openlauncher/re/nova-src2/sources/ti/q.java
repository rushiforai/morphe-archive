package ti;

import kotlin.Metadata;
import kotlin.jvm.JvmField;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0087\b\u0018\u00002\u00020\u0001R\u0016\u0010\u0005\u001a\u00020\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0003\u0010\u0004R\u0016\u0010\u0007\u001a\u00020\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0006\u0010\u0004R\u0016\u0010\t\u001a\u00020\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\b\u0010\u0004¨\u0006\n"}, d2 = {"Lti/q;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "Z", "startMuted", "b", "clickToExpandRequested", "c", "customControlsRequested", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final /* data */ class q {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @gn.c("startMuted")
    @JvmField
    public boolean startMuted;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @gn.c("clickToExpandRequested")
    @JvmField
    public boolean clickToExpandRequested;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @gn.c("customControlsRequested")
    @JvmField
    public boolean customControlsRequested;

    public q(boolean z11, boolean z12, boolean z13) {
        this.startMuted = z11;
        this.clickToExpandRequested = z12;
        this.customControlsRequested = z13;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q)) {
            return false;
        }
        q qVar = (q) obj;
        return this.startMuted == qVar.startMuted && this.clickToExpandRequested == qVar.clickToExpandRequested && this.customControlsRequested == qVar.customControlsRequested;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [int] */
    /* JADX WARN: Type inference failed for: r0v6 */
    /* JADX WARN: Type inference failed for: r0v7 */
    /* JADX WARN: Type inference failed for: r2v0, types: [boolean] */
    public final int hashCode() {
        boolean z11 = this.startMuted;
        ?? r02 = z11;
        if (z11) {
            r02 = 1;
        }
        int i5 = r02 * 31;
        ?? r22 = this.clickToExpandRequested;
        int i11 = r22;
        if (r22 != 0) {
            i11 = 1;
        }
        int i12 = (i5 + i11) * 31;
        boolean z12 = this.customControlsRequested;
        return i12 + (z12 ? 1 : z12 ? 1 : 0);
    }

    public final String toString() {
        boolean z11 = this.startMuted;
        boolean z12 = this.clickToExpandRequested;
        boolean z13 = this.customControlsRequested;
        StringBuilder sb2 = new StringBuilder("VideoOptionsSignal(startMuted=");
        sb2.append(z11);
        sb2.append(", clickToExpandRequested=");
        sb2.append(z12);
        sb2.append(", customControlsRequested=");
        return a80.m.k(sb2, z13, ")");
    }

    public q() {
        this(true, false, false);
    }
}
