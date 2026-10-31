package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.json.JSONObject;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/ConfirmationTokenClientContextParams;", "Lcom/stripe/android/model/StripeParamsModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final /* data */ class ConfirmationTokenClientContextParams implements StripeParamsModel {

    @NotNull
    public static final Parcelable.Creator<ConfirmationTokenClientContextParams> CREATOR = new eh.a(21);

    /* renamed from: a, reason: collision with root package name */
    public final String f43236a;

    /* renamed from: b, reason: collision with root package name */
    public final String f43237b;

    /* renamed from: c, reason: collision with root package name */
    public final ft.d f43238c;

    /* renamed from: d, reason: collision with root package name */
    public final String f43239d;

    /* renamed from: e, reason: collision with root package name */
    public final List f43240e;

    /* renamed from: f, reason: collision with root package name */
    public final String f43241f;

    /* renamed from: g, reason: collision with root package name */
    public final String f43242g;

    /* renamed from: h, reason: collision with root package name */
    public final String f43243h;

    /* renamed from: i, reason: collision with root package name */
    public final String f43244i;

    public ConfirmationTokenClientContextParams(String mode, String str, ft.d dVar, String str2, List list, String str3, String str4, String str5, String str6) {
        Intrinsics.g(mode, "mode");
        this.f43236a = mode;
        this.f43237b = str;
        this.f43238c = dVar;
        this.f43239d = str2;
        this.f43240e = list;
        this.f43241f = str3;
        this.f43242g = str4;
        this.f43243h = str5;
        this.f43244i = str6;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ConfirmationTokenClientContextParams)) {
            return false;
        }
        ConfirmationTokenClientContextParams confirmationTokenClientContextParams = (ConfirmationTokenClientContextParams) obj;
        return Intrinsics.b(this.f43236a, confirmationTokenClientContextParams.f43236a) && Intrinsics.b(this.f43237b, confirmationTokenClientContextParams.f43237b) && this.f43238c == confirmationTokenClientContextParams.f43238c && Intrinsics.b(this.f43239d, confirmationTokenClientContextParams.f43239d) && Intrinsics.b(this.f43240e, confirmationTokenClientContextParams.f43240e) && Intrinsics.b(this.f43241f, confirmationTokenClientContextParams.f43241f) && Intrinsics.b(this.f43242g, confirmationTokenClientContextParams.f43242g) && Intrinsics.b(this.f43243h, confirmationTokenClientContextParams.f43243h) && Intrinsics.b(this.f43244i, confirmationTokenClientContextParams.f43244i);
    }

    public final int hashCode() {
        int iHashCode = this.f43236a.hashCode() * 31;
        String str = this.f43237b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        ft.d dVar = this.f43238c;
        int iHashCode3 = (iHashCode2 + (dVar == null ? 0 : dVar.hashCode())) * 31;
        String str2 = this.f43239d;
        int iHashCode4 = (iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31;
        List list = this.f43240e;
        int iHashCode5 = (iHashCode4 + (list == null ? 0 : list.hashCode())) * 31;
        String str3 = this.f43241f;
        int iHashCode6 = (iHashCode5 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f43242g;
        int iHashCode7 = (iHashCode6 + (str4 == null ? 0 : str4.hashCode())) * 31;
        String str5 = this.f43243h;
        int iHashCode8 = (iHashCode7 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.f43244i;
        return iHashCode8 + (str6 != null ? str6.hashCode() : 0);
    }

    @Override // com.stripe.android.model.StripeParamsModel
    public final Map k0() {
        MapBuilder mapBuilder = new MapBuilder();
        mapBuilder.put("mode", this.f43236a);
        String str = this.f43237b;
        if (str != null) {
            mapBuilder.put(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, str);
        }
        ft.d dVar = this.f43238c;
        if (dVar == null || dVar == ft.d.f55926d) {
            dVar = null;
        }
        if (dVar != null) {
            mapBuilder.put("setup_future_usage", dVar.f55930a);
        }
        String str2 = this.f43239d;
        if (str2 != null) {
            mapBuilder.put("capture_method", str2);
        }
        List list = this.f43240e;
        if (list != null && !list.isEmpty()) {
            mapBuilder.put("payment_method_types", list);
        }
        String str3 = this.f43241f;
        if (str3 != null) {
            mapBuilder.put("on_behalf_of", str3);
        }
        String str4 = this.f43242g;
        if (str4 != null) {
            mapBuilder.put("payment_method_configuration", str4);
        }
        String str5 = this.f43243h;
        if (str5 != null) {
            mapBuilder.put("customer", str5);
        }
        String str6 = this.f43244i;
        if (str6 != null) {
            Map mapE = vh.a.E(new JSONObject(str6));
            Intrinsics.e(mapE, "null cannot be cast to non-null type kotlin.Any");
            mapBuilder.put("payment_method_options", mapE);
        }
        return mapBuilder.b();
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("ConfirmationTokenClientContextParams(mode=", this.f43236a, ", currency=", this.f43237b, ", setupFutureUsage=");
        sbW.append(this.f43238c);
        sbW.append(", captureMethod=");
        sbW.append(this.f43239d);
        sbW.append(", paymentMethodTypes=");
        sbW.append(this.f43240e);
        sbW.append(", onBehalfOf=");
        sbW.append(this.f43241f);
        sbW.append(", paymentMethodConfiguration=");
        b.c0.D(sbW, this.f43242g, ", customer=", this.f43243h, ", paymentMethodOptionsJson=");
        return b.c0.q(sbW, this.f43244i, ")");
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43236a);
        dest.writeString(this.f43237b);
        ft.d dVar = this.f43238c;
        if (dVar == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(dVar.name());
        }
        dest.writeString(this.f43239d);
        dest.writeStringList(this.f43240e);
        dest.writeString(this.f43241f);
        dest.writeString(this.f43242g);
        dest.writeString(this.f43243h);
        dest.writeString(this.f43244i);
    }
}
