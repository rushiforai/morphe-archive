package io.branch.search.internal.client.ads;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\u000e\n\u0002\b\b\b\u0087\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001J\u000f\u0010\u0003\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u0003\u0010\u0004R\u0017\u0010\b\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0006\u001a\u0004\b\u0007\u0010\u0004j\u0002\b\t¨\u0006\n"}, d2 = {"Lio/branch/search/internal/client/ads/UiContext;", b.f42142b, b.f42142b, "toString", "()Ljava/lang/String;", "a", "Ljava/lang/String;", "getLabel", "label", "SuggestedApps", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class UiContext {
    public static final UiContext SuggestedApps;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ UiContext[] f64230b;

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @NotNull
    public final String label = "ads_suggested_apps";

    static {
        UiContext uiContext = new UiContext();
        SuggestedApps = uiContext;
        f64230b = new UiContext[]{uiContext};
    }

    public static UiContext valueOf(String str) {
        return (UiContext) Enum.valueOf(UiContext.class, str);
    }

    public static UiContext[] values() {
        return (UiContext[]) f64230b.clone();
    }

    @NotNull
    public final String getLabel() {
        return this.label;
    }

    @Override // java.lang.Enum
    @NotNull
    public String toString() {
        return this.label;
    }
}
