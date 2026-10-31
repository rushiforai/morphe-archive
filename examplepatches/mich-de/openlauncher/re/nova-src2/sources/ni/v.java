package ni;

import b.t2;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.google.android.libraries.ads.mobile.sdk.internal.util.AndroidBundleTypeAdapterFactory;
import com.google.gson.GsonBuilder;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0086\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001:\u0001\u0002R\u001a\u0010\u0007\u001a\u00020\u00028\u0016X\u0097\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006R\u001a\u0010\r\u001a\u00020\b8\u0016X\u0097\u0004¢\u0006\f\n\u0004\b\t\u0010\n\u001a\u0004\b\u000b\u0010\fR\u001c\u0010\u0013\u001a\u0004\u0018\u00010\u000e8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000f\u0010\u0010\u001a\u0004\b\u0011\u0010\u0012¨\u0006\u0014"}, d2 = {"Lni/v;", "Lx7/f;", "Lni/u;", "b", "Lni/u;", "b0", "()Lni/u;", TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "c", "Ljava/lang/String;", "c0", "()Ljava/lang/String;", PglCryptUtils.KEY_MESSAGE, "Lni/g0;", "d", "Lni/g0;", "getResponseInfo", "()Lni/g0;", "responseInfo", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes3.dex */
public final /* data */ class v extends x7.f {

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @gn.c("Code")
    @NotNull
    private final u code;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @gn.c("Message")
    @NotNull
    private final String message;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    @gn.c("Response Info")
    @Nullable
    private final g0 responseInfo;

    public v(u uVar, String message, g0 g0Var) {
        Intrinsics.g(message, "message");
        this.code = uVar;
        this.message = message;
        this.responseInfo = g0Var;
    }

    /* renamed from: b0, reason: from getter */
    public final u getCode() {
        return this.code;
    }

    /* renamed from: c0, reason: from getter */
    public final String getMessage() {
        return this.message;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v)) {
            return false;
        }
        v vVar = (v) obj;
        return this.code == vVar.code && Intrinsics.b(this.message, vVar.message) && Intrinsics.b(this.responseInfo, vVar.responseInfo);
    }

    public final int hashCode() {
        int iA = t2.a(this.message, this.code.hashCode() * 31);
        g0 g0Var = this.responseInfo;
        return iA + (g0Var == null ? 0 : g0Var.hashCode());
    }

    public final String toString() {
        String json = new GsonBuilder().registerTypeAdapterFactory(new AndroidBundleTypeAdapterFactory()).registerTypeAdapter(u.class, new t(0)).setPrettyPrinting().serializeNulls().create().toJson(this);
        Intrinsics.f(json, "toJson(...)");
        return json;
    }
}
