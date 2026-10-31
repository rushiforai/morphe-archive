package com.stripe.android.financialconnections.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.stripe.android.core.model.StripeModel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00032\u00020\u00012\u00020\u0002:\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/financialconnections/model/FinancialConnectionsAccountList;", "Lcom/stripe/android/core/model/StripeModel;", "Landroid/os/Parcelable;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "xr/j", "xr/k", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class FinancialConnectionsAccountList implements StripeModel, Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final List f42730a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f42731b;

    /* renamed from: c, reason: collision with root package name */
    public final String f42732c;

    /* renamed from: d, reason: collision with root package name */
    public final Integer f42733d;

    /* renamed from: e, reason: collision with root package name */
    public final Integer f42734e;

    @NotNull
    public static final xr.k Companion = new xr.k();

    @NotNull
    public static final Parcelable.Creator<FinancialConnectionsAccountList> CREATOR = new ww.c(10);

    /* renamed from: f, reason: collision with root package name */
    public static final KSerializer[] f42729f = {new ArrayListSerializer(g.f42756a), null, null, null, null};

    public /* synthetic */ FinancialConnectionsAccountList(int i5, List list, boolean z11, String str, Integer num, Integer num2) {
        if (7 != (i5 & 7)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 7, xr.j.f96228a.getDescriptor());
        }
        this.f42730a = list;
        this.f42731b = z11;
        this.f42732c = str;
        if ((i5 & 8) == 0) {
            this.f42733d = null;
        } else {
            this.f42733d = num;
        }
        if ((i5 & 16) == 0) {
            this.f42734e = null;
        } else {
            this.f42734e = num2;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof FinancialConnectionsAccountList)) {
            return false;
        }
        FinancialConnectionsAccountList financialConnectionsAccountList = (FinancialConnectionsAccountList) obj;
        return Intrinsics.b(this.f42730a, financialConnectionsAccountList.f42730a) && this.f42731b == financialConnectionsAccountList.f42731b && Intrinsics.b(this.f42732c, financialConnectionsAccountList.f42732c) && Intrinsics.b(this.f42733d, financialConnectionsAccountList.f42733d) && Intrinsics.b(this.f42734e, financialConnectionsAccountList.f42734e);
    }

    public final int hashCode() {
        int iE = b.c0.e(c9.f(this.f42730a.hashCode() * 31, 31, this.f42731b), 31, this.f42732c);
        Integer num = this.f42733d;
        int iHashCode = (iE + (num == null ? 0 : num.hashCode())) * 31;
        Integer num2 = this.f42734e;
        return iHashCode + (num2 != null ? num2.hashCode() : 0);
    }

    public final String toString() {
        return "FinancialConnectionsAccountList(data=" + this.f42730a + ", hasMore=" + this.f42731b + ", url=" + this.f42732c + ", count=" + this.f42733d + ", totalCount=" + this.f42734e + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        Iterator itK = fq.c.k(this.f42730a, dest);
        while (itK.hasNext()) {
            ((FinancialConnectionsAccount) itK.next()).writeToParcel(dest, i5);
        }
        dest.writeInt(this.f42731b ? 1 : 0);
        dest.writeString(this.f42732c);
        Integer num = this.f42733d;
        if (num == null) {
            dest.writeInt(0);
        } else {
            fq.c.q(dest, 1, num);
        }
        Integer num2 = this.f42734e;
        if (num2 == null) {
            dest.writeInt(0);
        } else {
            fq.c.q(dest, 1, num2);
        }
    }

    public FinancialConnectionsAccountList(ArrayList arrayList, boolean z11, String url, Integer num, Integer num2) {
        Intrinsics.g(url, "url");
        this.f42730a = arrayList;
        this.f42731b = z11;
        this.f42732c = url;
        this.f42733d = num;
        this.f42734e = num2;
    }
}
