package qi;

import b.c0;
import b.t2;
import com.google.gson.r;
import gn.c;
import java.util.ArrayList;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001R\u001a\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\u00030\u00028\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0004\u0010\u0005R\u0014\u0010\n\u001a\u00020\u00078\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\b\u0010\tR\u0014\u0010\r\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010\fR\u0014\u0010\u0011\u001a\u00020\u000e8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010\u0010¨\u0006\u0012"}, d2 = {"Lqi/b;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "Ljava/util/List;", "noFillUrls", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "b", "J", "refreshIntervalInSeconds", "c", "Ljava/lang/String;", "gwsQueryId", "Lcom/google/gson/r;", "d", "Lcom/google/gson/r;", "responseInfoExtras", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final /* data */ class b {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @c("nofill_urls")
    @JvmField
    @NotNull
    public final List<String> noFillUrls;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @c("refresh_interval")
    @JvmField
    public final long refreshIntervalInSeconds;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @c("gws_query_id")
    @JvmField
    @NotNull
    public final String gwsQueryId;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    @c("response_info_extras")
    @JvmField
    @NotNull
    public final r responseInfoExtras;

    public b(ArrayList arrayList, long j11, String str, r rVar) {
        this.noFillUrls = arrayList;
        this.refreshIntervalInSeconds = j11;
        this.gwsQueryId = str;
        this.responseInfoExtras = rVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.noFillUrls, bVar.noFillUrls) && this.refreshIntervalInSeconds == bVar.refreshIntervalInSeconds && Intrinsics.b(this.gwsQueryId, bVar.gwsQueryId) && Intrinsics.b(this.responseInfoExtras, bVar.responseInfoExtras);
    }

    public final int hashCode() {
        return this.responseInfoExtras.f34795a.hashCode() + t2.a(this.gwsQueryId, c0.d(this.noFillUrls.hashCode() * 31, 31, this.refreshIntervalInSeconds));
    }

    public final String toString() {
        return "ParentCommonConfig(noFillUrls=" + this.noFillUrls + ", refreshIntervalInSeconds=" + this.refreshIntervalInSeconds + ", gwsQueryId=" + this.gwsQueryId + ", responseInfoExtras=" + this.responseInfoExtras + ")";
    }
}
