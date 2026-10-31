package com.stripe.android.core.strings;

import a80.m;
import android.content.Context;
import android.os.Parcel;
import android.os.Parcelable;
import b.u4;
import com.stripe.android.core.strings.transformations.Replace;
import com.stripe.android.core.strings.transformations.TransformOperation;
import fq.c;
import gi.g;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import r70.j;
import zg.a;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/core/strings/IdentifierResolvableString;", "Lcom/stripe/android/core/strings/ResolvableString;", "stripe-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final /* data */ class IdentifierResolvableString implements ResolvableString {

    @NotNull
    public static final Parcelable.Creator<IdentifierResolvableString> CREATOR = new g(12);

    /* renamed from: a, reason: collision with root package name */
    public final int f42583a;

    /* renamed from: b, reason: collision with root package name */
    public final List f42584b;

    /* renamed from: c, reason: collision with root package name */
    public final List f42585c;

    public IdentifierResolvableString(List transformations, List args, int i5) {
        Intrinsics.g(transformations, "transformations");
        Intrinsics.g(args, "args");
        this.f42583a = i5;
        this.f42584b = transformations;
        this.f42585c = args;
    }

    @Override // com.stripe.android.core.strings.ResolvableString
    public final String T(Context context) {
        Intrinsics.g(context, "context");
        List list = this.f42584b;
        Object[] objArrV = a.V(context, this.f42585c);
        String value = context.getString(this.f42583a, Arrays.copyOf(objArrV, objArrV.length));
        Iterator it = list.iterator();
        while (it.hasNext()) {
            Replace replace = (Replace) ((TransformOperation) it.next());
            replace.getClass();
            Intrinsics.g(value, "value");
            value = j.F0(value, replace.f42588a, replace.f42589b, false);
        }
        return value;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof IdentifierResolvableString)) {
            return false;
        }
        IdentifierResolvableString identifierResolvableString = (IdentifierResolvableString) obj;
        return this.f42583a == identifierResolvableString.f42583a && Intrinsics.b(this.f42584b, identifierResolvableString.f42584b) && Intrinsics.b(this.f42585c, identifierResolvableString.f42585c);
    }

    public final int hashCode() {
        return this.f42585c.hashCode() + u4.c(Integer.hashCode(this.f42583a) * 31, 31, this.f42584b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("IdentifierResolvableString(id=");
        sb2.append(this.f42583a);
        sb2.append(", transformations=");
        sb2.append(this.f42584b);
        sb2.append(", args=");
        return m.j(sb2, this.f42585c, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeInt(this.f42583a);
        Iterator itK = c.k(this.f42584b, dest);
        while (itK.hasNext()) {
            dest.writeParcelable((Parcelable) itK.next(), i5);
        }
        Iterator itK2 = c.k(this.f42585c, dest);
        while (itK2.hasNext()) {
            dest.writeValue(itK2.next());
        }
    }
}
