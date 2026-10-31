package ti;

import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001R\u0018\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0003\u0010\u0004¨\u0006\u0006"}, d2 = {"Lti/f;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "Ljava/lang/Boolean;", "isDefaultBrowserCustomTabsCapable", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final /* data */ class f {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @gn.c("is_browser_custom_tabs_capable")
    @JvmField
    @Nullable
    public Boolean isDefaultBrowserCustomTabsCapable;

    public f() {
        this(0);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof f) && Intrinsics.b(this.isDefaultBrowserCustomTabsCapable, ((f) obj).isDefaultBrowserCustomTabsCapable);
    }

    public final int hashCode() {
        Boolean bool = this.isDefaultBrowserCustomTabsCapable;
        if (bool == null) {
            return 0;
        }
        return bool.hashCode();
    }

    public final String toString() {
        return "BrowserSignals(isDefaultBrowserCustomTabsCapable=" + this.isDefaultBrowserCustomTabsCapable + ")";
    }

    public f(int i5) {
        this.isDefaultBrowserCustomTabsCapable = null;
    }
}
