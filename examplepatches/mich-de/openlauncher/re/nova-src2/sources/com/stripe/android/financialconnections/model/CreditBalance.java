package com.stripe.android.financialconnections.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.core.model.StripeModel;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.LinkedHashMapSerializer;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u0000 \u00032\u00020\u00012\u00020\u0002:\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/financialconnections/model/CreditBalance;", "Lcom/stripe/android/core/model/StripeModel;", "Landroid/os/Parcelable;", com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k.O, "xr/g", "xr/h", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Serializable
/* loaded from: classes4.dex */
public final /* data */ class CreditBalance implements StripeModel, Parcelable {

    /* renamed from: a, reason: collision with root package name */
    public final Map f42713a;

    @NotNull
    public static final xr.h Companion = new xr.h();

    @NotNull
    public static final Parcelable.Creator<CreditBalance> CREATOR = new ww.c(9);

    /* renamed from: b, reason: collision with root package name */
    public static final KSerializer[] f42712b = {new LinkedHashMapSerializer(StringSerializer.INSTANCE, IntSerializer.INSTANCE)};

    public /* synthetic */ CreditBalance(int i5, Map map) {
        if ((i5 & 1) == 0) {
            this.f42713a = null;
        } else {
            this.f42713a = map;
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
        return (obj instanceof CreditBalance) && Intrinsics.b(this.f42713a, ((CreditBalance) obj).f42713a);
    }

    public final int hashCode() {
        Map map = this.f42713a;
        if (map == null) {
            return 0;
        }
        return map.hashCode();
    }

    public final String toString() {
        return "CreditBalance(used=" + this.f42713a + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        Map map = this.f42713a;
        if (map == null) {
            dest.writeInt(0);
            return;
        }
        dest.writeInt(1);
        dest.writeInt(map.size());
        for (Map.Entry entry : map.entrySet()) {
            dest.writeString((String) entry.getKey());
            dest.writeInt(((Number) entry.getValue()).intValue());
        }
    }

    public CreditBalance(LinkedHashMap linkedHashMap) {
        this.f42713a = linkedHashMap;
    }
}
