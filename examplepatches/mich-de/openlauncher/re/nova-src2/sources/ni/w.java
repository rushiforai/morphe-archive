package ni;

import b.t2;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.google.gson.GsonBuilder;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\t\b\u0086\b\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001R\u001a\u0010\u0007\u001a\u00020\u00028\u0016X\u0097\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006R\u001a\u0010\r\u001a\u00020\b8\u0016X\u0097\u0004¢\u0006\f\n\u0004\b\t\u0010\n\u001a\u0004\b\u000b\u0010\fR\u001a\u0010\u0010\u001a\u00020\b8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000e\u0010\n\u001a\u0004\b\u000f\u0010\f¨\u0006\u0011"}, d2 = {"Lni/w;", "Lx7/f;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "b", "I", "b0", "()Ljava/lang/Integer;", TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "c", "Ljava/lang/String;", "d0", "()Ljava/lang/String;", PglCryptUtils.KEY_MESSAGE, "d", "c0", "domain", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final /* data */ class w extends x7.f {

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @gn.c("Code")
    private final int code;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @gn.c("Message")
    @NotNull
    private final String message;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    @gn.c("Domain")
    @NotNull
    private final String domain;

    public w(int i5, String message, String str) {
        Intrinsics.g(message, "message");
        this.code = i5;
        this.message = message;
        this.domain = str;
    }

    public final Integer b0() {
        return Integer.valueOf(this.code);
    }

    /* renamed from: c0, reason: from getter */
    public final String getDomain() {
        return this.domain;
    }

    /* renamed from: d0, reason: from getter */
    public final String getMessage() {
        return this.message;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w)) {
            return false;
        }
        w wVar = (w) obj;
        return this.code == wVar.code && Intrinsics.b(this.message, wVar.message) && Intrinsics.b(this.domain, wVar.domain);
    }

    public final int hashCode() {
        return this.domain.hashCode() + t2.a(this.message, Integer.hashCode(this.code) * 31);
    }

    public final String toString() {
        String json = new GsonBuilder().setPrettyPrinting().serializeNulls().create().toJson(this);
        Intrinsics.f(json, "toJson(...)");
        return json;
    }
}
