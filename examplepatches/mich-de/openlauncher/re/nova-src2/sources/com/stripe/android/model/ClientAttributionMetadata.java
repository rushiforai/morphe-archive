package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.UUID;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/android/model/ClientAttributionMetadata;", "Lcom/stripe/android/model/StripeParamsModel;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class ClientAttributionMetadata implements StripeParamsModel, Parcelable {

    @NotNull
    public static final Parcelable.Creator<ClientAttributionMetadata> CREATOR = new eh.a(19);

    /* renamed from: a, reason: collision with root package name */
    public final String f43181a;

    /* renamed from: b, reason: collision with root package name */
    public final ft.o0 f43182b;

    /* renamed from: c, reason: collision with root package name */
    public final ft.p0 f43183c;

    /* renamed from: d, reason: collision with root package name */
    public final String f43184d;

    public ClientAttributionMetadata(String str, ft.o0 o0Var, ft.p0 p0Var, String stripeSdkVersion) {
        Intrinsics.g(stripeSdkVersion, "stripeSdkVersion");
        this.f43181a = str;
        this.f43182b = o0Var;
        this.f43183c = p0Var;
        this.f43184d = stripeSdkVersion;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ClientAttributionMetadata)) {
            return false;
        }
        ClientAttributionMetadata clientAttributionMetadata = (ClientAttributionMetadata) obj;
        return Intrinsics.b(this.f43181a, clientAttributionMetadata.f43181a) && this.f43182b == clientAttributionMetadata.f43182b && this.f43183c == clientAttributionMetadata.f43183c && Intrinsics.b(this.f43184d, clientAttributionMetadata.f43184d);
    }

    public final int hashCode() {
        String str = this.f43181a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        ft.o0 o0Var = this.f43182b;
        int iHashCode2 = (iHashCode + (o0Var == null ? 0 : o0Var.hashCode())) * 31;
        ft.p0 p0Var = this.f43183c;
        return this.f43184d.hashCode() + ((iHashCode2 + (p0Var != null ? p0Var.hashCode() : 0)) * 31);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r3v10, types: [java.util.Map] */
    @Override // com.stripe.android.model.StripeParamsModel
    public final Map k0() {
        b70.h hVar = b70.h.f17594a;
        Pair pair = new Pair("merchant_integration_source", "elements");
        Pair pair2 = new Pair("merchant_integration_subtype", "mobile");
        Pair pair3 = new Pair("merchant_integration_version", b.c0.k("stripe-android/", this.f43184d));
        UUID uuid = fr.c.f55586g;
        Map mapJ0 = MapsKt.j0(pair, pair2, pair3, new Pair("client_session_id", fr.c.f55586g.toString()));
        ft.p0 p0Var = this.f43183c;
        Map mapN = p0Var != null ? a80.m.n("payment_method_selection_flow", p0Var.f56002a) : null;
        if (mapN == null) {
            mapN = hVar;
        }
        LinkedHashMap linkedHashMapM0 = MapsKt.m0(mapJ0, mapN);
        ft.o0 o0Var = this.f43182b;
        Map mapN2 = o0Var != null ? a80.m.n("payment_intent_creation_flow", o0Var.f55998a) : null;
        if (mapN2 == null) {
            mapN2 = hVar;
        }
        LinkedHashMap linkedHashMapM02 = MapsKt.m0(linkedHashMapM0, mapN2);
        String str = this.f43181a;
        b70.h hVarN = str != null ? a80.m.n("elements_session_config_id", str) : null;
        if (hVarN != null) {
            hVar = hVarN;
        }
        return MapsKt.m0(linkedHashMapM02, hVar);
    }

    public final String toString() {
        return "ClientAttributionMetadata(elementsSessionConfigId=" + this.f43181a + ", paymentIntentCreationFlow=" + this.f43182b + ", paymentMethodSelectionFlow=" + this.f43183c + ", stripeSdkVersion=" + this.f43184d + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43181a);
        ft.o0 o0Var = this.f43182b;
        if (o0Var == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(o0Var.name());
        }
        ft.p0 p0Var = this.f43183c;
        if (p0Var == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            dest.writeString(p0Var.name());
        }
        dest.writeString(this.f43184d);
    }
}
