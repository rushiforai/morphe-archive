package sx;

import b.c0;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\b\u0087\b\u0018\u00002\u00020\u0001R\u001a\u0010\u0007\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006R\u001a\u0010\b\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0005\u0010\u0004\u001a\u0004\b\u0003\u0010\u0006¨\u0006\t"}, d2 = {"Lsx/r;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "Ljava/lang/String;", "b", "()Ljava/lang/String;", "id", "adUnitId", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class r {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @gn.c("id")
    @NotNull
    private final String id;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @gn.c("adUnitId")
    @NotNull
    private final String adUnitId;

    public r(String str, String str2) {
        this.id = str;
        this.adUnitId = str2;
    }

    /* renamed from: a, reason: from getter */
    public final String getAdUnitId() {
        return this.adUnitId;
    }

    /* renamed from: b, reason: from getter */
    public final String getId() {
        return this.id;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        return Intrinsics.b(this.id, rVar.id) && Intrinsics.b(this.adUnitId, rVar.adUnitId);
    }

    public final int hashCode() {
        return this.adUnitId.hashCode() + (this.id.hashCode() * 31);
    }

    public final String toString() {
        return c0.n("TierEntry(id=", this.id, ", adUnitId=", this.adUnitId, ")");
    }
}
