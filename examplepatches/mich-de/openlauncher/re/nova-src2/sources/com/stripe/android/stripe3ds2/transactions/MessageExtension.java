package com.stripe.android.stripe3ds2.transactions;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.c9;
import java.util.HashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001:\u0001\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/stripe3ds2/transactions/MessageExtension;", "Landroid/os/Parcelable;", "ps/f0", "3ds2sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class MessageExtension implements Parcelable {

    @NotNull
    public static final Parcelable.Creator<MessageExtension> CREATOR = new ww.c(16);

    /* renamed from: e, reason: collision with root package name */
    public static final EmptyList f45208e = EmptyList.f71733a;

    /* renamed from: a, reason: collision with root package name */
    public final String f45209a;

    /* renamed from: b, reason: collision with root package name */
    public final String f45210b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f45211c;

    /* renamed from: d, reason: collision with root package name */
    public final HashMap f45212d;

    public MessageExtension(String name, String id2, boolean z11, HashMap map) {
        Intrinsics.g(name, "name");
        Intrinsics.g(id2, "id");
        this.f45209a = name;
        this.f45210b = id2;
        this.f45211c = z11;
        this.f45212d = map;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof MessageExtension)) {
            return false;
        }
        MessageExtension messageExtension = (MessageExtension) obj;
        return Intrinsics.b(this.f45209a, messageExtension.f45209a) && Intrinsics.b(this.f45210b, messageExtension.f45210b) && this.f45211c == messageExtension.f45211c && this.f45212d.equals(messageExtension.f45212d);
    }

    public final int hashCode() {
        return this.f45212d.hashCode() + c9.f(c0.e(this.f45209a.hashCode() * 31, 31, this.f45210b), 31, this.f45211c);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("MessageExtension(name=", this.f45209a, ", id=", this.f45210b, ", criticalityIndicator=");
        sbW.append(this.f45211c);
        sbW.append(", data=");
        sbW.append(this.f45212d);
        sbW.append(")");
        return sbW.toString();
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f45209a);
        dest.writeString(this.f45210b);
        dest.writeInt(this.f45211c ? 1 : 0);
        HashMap map = this.f45212d;
        dest.writeInt(map.size());
        for (Map.Entry entry : map.entrySet()) {
            dest.writeString((String) entry.getKey());
            dest.writeString((String) entry.getValue());
        }
    }
}
