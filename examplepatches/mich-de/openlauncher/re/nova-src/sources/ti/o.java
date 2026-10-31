package ti;

import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0087\b\u0018\u00002\u00020\u0001R\u0018\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0003\u0010\u0004R\u0016\u0010\b\u001a\u00020\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0006\u0010\u0007¨\u0006\t"}, d2 = {"Lti/o;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "Ljava/lang/Boolean;", "isInstantApp", "b", "Z", "isPrivilegedProcess", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final /* data */ class o {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @gn.c("instant_app")
    @JvmField
    @Nullable
    public Boolean isInstantApp;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @gn.c("is_privileged_process")
    @JvmField
    public boolean isPrivilegedProcess;

    public o() {
        this(0);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o)) {
            return false;
        }
        o oVar = (o) obj;
        return Intrinsics.b(this.isInstantApp, oVar.isInstantApp) && this.isPrivilegedProcess == oVar.isPrivilegedProcess;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        Boolean bool = this.isInstantApp;
        int iHashCode = (bool == null ? 0 : bool.hashCode()) * 31;
        boolean z11 = this.isPrivilegedProcess;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return iHashCode + i5;
    }

    public final String toString() {
        return "SdkEnvironment(isInstantApp=" + this.isInstantApp + ", isPrivilegedProcess=" + this.isPrivilegedProcess + ")";
    }

    public o(int i5) {
        this.isInstantApp = null;
        this.isPrivilegedProcess = false;
    }
}
