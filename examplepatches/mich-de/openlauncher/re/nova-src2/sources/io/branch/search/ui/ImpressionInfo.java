package io.branch.search.ui;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lio/branch/search/ui/ImpressionInfo;", "Landroid/os/Parcelable;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class ImpressionInfo implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<ImpressionInfo> CREATOR = new ab.w(24);

    /* renamed from: a, reason: collision with root package name */
    public final Impressable f66488a;

    /* renamed from: b, reason: collision with root package name */
    public final UiContext f66489b;

    /* renamed from: c, reason: collision with root package name */
    public final float f66490c;

    /* renamed from: d, reason: collision with root package name */
    public final long f66491d;

    /* renamed from: e, reason: collision with root package name */
    public final long f66492e;

    public ImpressionInfo(Impressable item, UiContext context, float f11, long j11, long j12) {
        Intrinsics.g(item, "item");
        Intrinsics.g(context, "context");
        this.f66488a = item;
        this.f66489b = context;
        this.f66490c = f11;
        this.f66491d = j11;
        this.f66492e = j12;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel out, int i5) {
        Intrinsics.g(out, "out");
        out.writeParcelable(this.f66488a, i5);
        this.f66489b.writeToParcel(out, i5);
        out.writeFloat(this.f66490c);
        out.writeLong(this.f66491d);
        out.writeLong(this.f66492e);
    }
}
