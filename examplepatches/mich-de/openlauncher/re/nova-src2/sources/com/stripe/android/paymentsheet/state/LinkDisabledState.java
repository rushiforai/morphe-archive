package com.stripe.android.paymentsheet.state;

import android.os.Parcel;
import android.os.Parcelable;
import ft.c0;
import java.util.AbstractList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/state/LinkDisabledState;", "Lcom/stripe/android/paymentsheet/state/LinkStateResult;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class LinkDisabledState implements LinkStateResult {

    @NotNull
    public static final Parcelable.Creator<LinkDisabledState> CREATOR = new gi.g(15);

    /* renamed from: a, reason: collision with root package name */
    public final List f44958a;

    public LinkDisabledState(AbstractList linkDisabledReasons) {
        Intrinsics.g(linkDisabledReasons, "linkDisabledReasons");
        this.f44958a = linkDisabledReasons;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof LinkDisabledState) && Intrinsics.b(this.f44958a, ((LinkDisabledState) obj).f44958a);
    }

    public final int hashCode() {
        return this.f44958a.hashCode();
    }

    public final String toString() {
        return "LinkDisabledState(linkDisabledReasons=" + this.f44958a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        Iterator itK = fq.c.k(this.f44958a, dest);
        while (itK.hasNext()) {
            dest.writeString(((c0) itK.next()).name());
        }
    }
}
