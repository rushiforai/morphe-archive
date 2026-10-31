package io.branch.search.ui;

import android.content.ComponentName;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.UserHandle;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lio/branch/search/ui/LauncherActivity;", "Lio/branch/search/ui/Impressable;", "Landroid/os/Parcelable;", "BranchSearchSDK_forPartnersRelease"}, k = 1, mv = {1, 7, 1})
/* loaded from: classes4.dex */
public final class LauncherActivity implements Impressable, Parcelable {

    @NotNull
    public static final Parcelable.Creator<LauncherActivity> CREATOR = new ab.w(25);

    /* renamed from: a, reason: collision with root package name */
    public final String f66493a;

    /* renamed from: b, reason: collision with root package name */
    public final ComponentName f66494b;

    /* renamed from: c, reason: collision with root package name */
    public final UserHandle f66495c;

    public LauncherActivity(String name, ComponentName componentName, UserHandle userHandle) {
        Intrinsics.g(name, "name");
        Intrinsics.g(componentName, "componentName");
        Intrinsics.g(userHandle, "userHandle");
        this.f66493a = name;
        this.f66494b = componentName;
        this.f66495c = userHandle;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel out, int i5) {
        Intrinsics.g(out, "out");
        out.writeString(this.f66493a);
        out.writeParcelable(this.f66494b, i5);
        out.writeParcelable(this.f66495c, i5);
    }
}
