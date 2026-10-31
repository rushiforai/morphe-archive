package androidx.navigation;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import h6.t;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import nv.f;
import org.jetbrains.annotations.NotNull;
import p6.e0;
import p6.n;
import p6.v;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Landroidx/navigation/NavBackStackEntryState;", "Landroid/os/Parcelable;", "navigation-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
@SuppressLint({"BanParcelableUsage"})
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class NavBackStackEntryState implements Parcelable {

    @JvmField
    @NotNull
    public static final Parcelable.Creator<NavBackStackEntryState> CREATOR = new f(11);

    /* renamed from: a, reason: collision with root package name */
    public final String f14739a;

    /* renamed from: b, reason: collision with root package name */
    public final int f14740b;

    /* renamed from: c, reason: collision with root package name */
    public final Bundle f14741c;

    /* renamed from: d, reason: collision with root package name */
    public final Bundle f14742d;

    public NavBackStackEntryState(n entry) {
        Intrinsics.g(entry, "entry");
        this.f14739a = entry.f82196f;
        this.f14740b = entry.f82192b.f82157f;
        this.f14741c = entry.a();
        Bundle bundle = new Bundle();
        this.f14742d = bundle;
        entry.f82199i.f441a.f(bundle);
    }

    public final n a(Context context, e0 e0Var, t hostLifecycleState, v vVar) {
        Intrinsics.g(context, "context");
        Intrinsics.g(hostLifecycleState, "hostLifecycleState");
        Bundle bundle = this.f14741c;
        if (bundle != null) {
            bundle.setClassLoader(context.getClassLoader());
        } else {
            bundle = null;
        }
        Bundle bundle2 = bundle;
        String id2 = this.f14739a;
        Intrinsics.g(id2, "id");
        return new n(context, e0Var, bundle2, hostLifecycleState, vVar, id2, this.f14742d);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        Intrinsics.g(parcel, "parcel");
        parcel.writeString(this.f14739a);
        parcel.writeInt(this.f14740b);
        parcel.writeBundle(this.f14741c);
        parcel.writeBundle(this.f14742d);
    }

    public NavBackStackEntryState(Parcel parcel) {
        String string = parcel.readString();
        Intrinsics.d(string);
        this.f14739a = string;
        this.f14740b = parcel.readInt();
        this.f14741c = parcel.readBundle(NavBackStackEntryState.class.getClassLoader());
        Bundle bundle = parcel.readBundle(NavBackStackEntryState.class.getClassLoader());
        Intrinsics.d(bundle);
        this.f14742d = bundle;
    }
}
