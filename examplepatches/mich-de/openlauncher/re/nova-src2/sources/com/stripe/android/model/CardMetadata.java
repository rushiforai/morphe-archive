package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.cards.Bin;
import com.stripe.android.core.model.StripeModel;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/model/CardMetadata;", "Lcom/stripe/android/core/model/StripeModel;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class CardMetadata implements StripeModel {

    @NotNull
    public static final Parcelable.Creator<CardMetadata> CREATOR = new eh.a(17);

    /* renamed from: a, reason: collision with root package name */
    public final Bin f43174a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f43175b;

    public CardMetadata(Bin bin, ArrayList arrayList) {
        Intrinsics.g(bin, "bin");
        this.f43174a = bin;
        this.f43175b = arrayList;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof CardMetadata)) {
            return false;
        }
        CardMetadata cardMetadata = (CardMetadata) obj;
        return Intrinsics.b(this.f43174a, cardMetadata.f43174a) && this.f43175b.equals(cardMetadata.f43175b);
    }

    public final int hashCode() {
        return this.f43175b.hashCode() + (this.f43174a.f42483a.hashCode() * 31);
    }

    public final String toString() {
        return "CardMetadata(bin=" + this.f43174a + ", accountRanges=" + this.f43175b + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeParcelable(this.f43174a, i5);
        Iterator itJ = fq.c.j(this.f43175b, dest);
        while (itJ.hasNext()) {
            ((AccountRange) itJ.next()).writeToParcel(dest, i5);
        }
    }
}
