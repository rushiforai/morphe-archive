package io.branch.search.ui;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lio/branch/search/ui/ClickInfo;", "Landroid/os/Parcelable;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class ClickInfo implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<ClickInfo> CREATOR = new ab.w(22);

    /* renamed from: a, reason: collision with root package name */
    public final LauncherActivity f66468a;

    /* renamed from: b, reason: collision with root package name */
    public final UiContext f66469b;

    /* renamed from: c, reason: collision with root package name */
    public final long f66470c;

    public ClickInfo(LauncherActivity item, UiContext context, long j11) {
        Intrinsics.g(item, "item");
        Intrinsics.g(context, "context");
        this.f66468a = item;
        this.f66469b = context;
        this.f66470c = j11;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel out, int i5) {
        Intrinsics.g(out, "out");
        this.f66468a.writeToParcel(out, i5);
        this.f66469b.writeToParcel(out, i5);
        out.writeLong(this.f66470c);
    }
}
