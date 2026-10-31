package ni;

import android.os.Bundle;
import com.google.android.libraries.ads.mobile.sdk.internal.util.AndroidBundleTypeAdapterFactory;
import com.google.gson.GsonBuilder;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010 \n\u0002\b\u0005\b\u0086\b\u0018\u00002\u00020\u0001R\u001c\u0010\u0007\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006R\u001c\u0010\t\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0005\u0010\u0004\u001a\u0004\b\b\u0010\u0006R\u001a\u0010\u000e\u001a\u00020\n8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\b\u0010\u000b\u001a\u0004\b\f\u0010\rR\u001c\u0010\u0014\u001a\u0004\u0018\u00010\u000f8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0010\u0010\u0011\u001a\u0004\b\u0012\u0010\u0013R \u0010\u0019\u001a\b\u0012\u0004\u0012\u00020\u000f0\u00158\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0016\u0010\u0017\u001a\u0004\b\u0003\u0010\u0018¨\u0006\u001a"}, d2 = {"Lni/g0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "Ljava/lang/String;", "b", "()Ljava/lang/String;", "adapterClassName", "c", "responseId", "Landroid/os/Bundle;", "Landroid/os/Bundle;", "getResponseExtras", "()Landroid/os/Bundle;", "responseExtras", "Lni/l;", "d", "Lni/l;", "getLoadedAdSourceResponseInfo", "()Lni/l;", "loadedAdSourceResponseInfo", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "e", "Ljava/util/List;", "()Ljava/util/List;", "adSourceResponses", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final /* data */ class g0 {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @gn.c("Mediation Adapter Class Name")
    @Nullable
    private final String adapterClassName;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @gn.c("Response ID")
    @Nullable
    private final String responseId;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @gn.c("Response Extras")
    @NotNull
    private final Bundle responseExtras;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    @gn.c("Loaded Ad Source Response Info")
    @Nullable
    private final l loadedAdSourceResponseInfo;

    /* renamed from: e, reason: collision with root package name and from kotlin metadata */
    @gn.c("Ad Source Responses")
    @NotNull
    private final List<l> adSourceResponses;

    public g0(String str, String str2, Bundle bundle, l lVar, List adSourceResponses) {
        Intrinsics.g(adSourceResponses, "adSourceResponses");
        this.adapterClassName = str;
        this.responseId = str2;
        this.responseExtras = bundle;
        this.loadedAdSourceResponseInfo = lVar;
        this.adSourceResponses = adSourceResponses;
    }

    /* renamed from: a, reason: from getter */
    public final List getAdSourceResponses() {
        return this.adSourceResponses;
    }

    /* renamed from: b, reason: from getter */
    public final String getAdapterClassName() {
        return this.adapterClassName;
    }

    /* renamed from: c, reason: from getter */
    public final String getResponseId() {
        return this.responseId;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g0)) {
            return false;
        }
        g0 g0Var = (g0) obj;
        return Intrinsics.b(this.adapterClassName, g0Var.adapterClassName) && Intrinsics.b(this.responseId, g0Var.responseId) && Intrinsics.b(this.responseExtras, g0Var.responseExtras) && Intrinsics.b(this.loadedAdSourceResponseInfo, g0Var.loadedAdSourceResponseInfo) && Intrinsics.b(this.adSourceResponses, g0Var.adSourceResponses);
    }

    public final int hashCode() {
        String str = this.adapterClassName;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.responseId;
        int iHashCode2 = (this.responseExtras.hashCode() + ((iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31)) * 31;
        l lVar = this.loadedAdSourceResponseInfo;
        return this.adSourceResponses.hashCode() + ((iHashCode2 + (lVar != null ? lVar.hashCode() : 0)) * 31);
    }

    public final String toString() {
        String json = new GsonBuilder().registerTypeAdapterFactory(new AndroidBundleTypeAdapterFactory()).setPrettyPrinting().serializeNulls().create().toJson(this);
        Intrinsics.f(json, "toJson(...)");
        return json;
    }
}
