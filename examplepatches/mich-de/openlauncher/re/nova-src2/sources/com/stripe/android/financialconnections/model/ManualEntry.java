package com.stripe.android.financialconnections.model;

import android.os.Parcel;
import android.os.Parcelable;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00022\u00020\u0001:\u0002\u0003\u0004¨\u0006\u0005"}, d2 = {"Lcom/stripe/android/financialconnections/model/ManualEntry;", "Landroid/os/Parcelable;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "xr/m", "xr/n", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class ManualEntry implements Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final ManualEntryMode f42748a;

    @NotNull
    public static final xr.n Companion = new xr.n();

    @NotNull
    public static final Parcelable.Creator<ManualEntry> CREATOR = new ww.c(11);

    public /* synthetic */ ManualEntry(int i5, ManualEntryMode manualEntryMode) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, xr.m.f96229a.getDescriptor());
        }
        this.f42748a = manualEntryMode;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ManualEntry) && this.f42748a == ((ManualEntry) obj).f42748a;
    }

    public final int hashCode() {
        return this.f42748a.hashCode();
    }

    public final String toString() {
        return "ManualEntry(mode=" + this.f42748a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f42748a.name());
    }

    public ManualEntry(ManualEntryMode mode) {
        Intrinsics.g(mode, "mode");
        this.f42748a = mode;
    }
}
