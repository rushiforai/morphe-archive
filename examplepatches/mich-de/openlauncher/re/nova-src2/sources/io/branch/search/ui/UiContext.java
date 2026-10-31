package io.branch.search.ui;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0018\u0002\n\u0000\b\u0087\u0001\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lio/branch/search/ui/UiContext;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Landroid/os/Parcelable;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class UiContext implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<UiContext> CREATOR;

    /* renamed from: a, reason: collision with root package name */
    public static final UiContext f66496a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ UiContext[] f66497b;

    /* JADX INFO: Fake field, exist only in values array */
    UiContext EF0;

    static {
        UiContext uiContext = new UiContext("ZeroState", 0);
        UiContext uiContext2 = new UiContext("Search", 1);
        f66496a = uiContext2;
        f66497b = new UiContext[]{uiContext, uiContext2};
        CREATOR = new ab.w(26);
    }

    public static UiContext valueOf(String str) {
        return (UiContext) Enum.valueOf(UiContext.class, str);
    }

    public static UiContext[] values() {
        return (UiContext[]) f66497b.clone();
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel out, int i5) {
        Intrinsics.g(out, "out");
        out.writeString(name());
    }
}
