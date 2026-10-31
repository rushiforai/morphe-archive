package com.stripe.android.model;

import android.os.Parcel;
import android.os.Parcelable;
import b.c9;
import com.stripe.android.core.model.StripeModel;
import java.util.Date;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002:\u0001\u0003¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/model/Token;", "Lcom/stripe/android/core/model/StripeModel;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "ft/t0", "payments-model_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class Token implements StripeModel, Parcelable {

    @NotNull
    public static final Parcelable.Creator<Token> CREATOR = new ft.q(16);

    /* renamed from: a, reason: collision with root package name */
    public final String f43996a;

    /* renamed from: b, reason: collision with root package name */
    public final ft.t0 f43997b;

    /* renamed from: c, reason: collision with root package name */
    public final Date f43998c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f43999d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f44000e;

    /* renamed from: f, reason: collision with root package name */
    public final BankAccount f44001f;

    /* renamed from: g, reason: collision with root package name */
    public final Card f44002g;

    public Token(String id2, ft.t0 type, Date created, boolean z11, boolean z12, BankAccount bankAccount, Card card) {
        Intrinsics.g(id2, "id");
        Intrinsics.g(type, "type");
        Intrinsics.g(created, "created");
        this.f43996a = id2;
        this.f43997b = type;
        this.f43998c = created;
        this.f43999d = z11;
        this.f44000e = z12;
        this.f44001f = bankAccount;
        this.f44002g = card;
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Token)) {
            return false;
        }
        Token token = (Token) obj;
        return Intrinsics.b(this.f43996a, token.f43996a) && this.f43997b == token.f43997b && Intrinsics.b(this.f43998c, token.f43998c) && this.f43999d == token.f43999d && this.f44000e == token.f44000e && Intrinsics.b(this.f44001f, token.f44001f) && Intrinsics.b(this.f44002g, token.f44002g);
    }

    public final int hashCode() {
        int iF = c9.f(c9.f((this.f43998c.hashCode() + ((this.f43997b.hashCode() + (this.f43996a.hashCode() * 31)) * 31)) * 31, 31, this.f43999d), 31, this.f44000e);
        BankAccount bankAccount = this.f44001f;
        int iHashCode = (iF + (bankAccount == null ? 0 : bankAccount.hashCode())) * 31;
        Card card = this.f44002g;
        return iHashCode + (card != null ? card.hashCode() : 0);
    }

    public final String toString() {
        return "Token(id=" + this.f43996a + ", type=" + this.f43997b + ", created=" + this.f43998c + ", livemode=" + this.f43999d + ", used=" + this.f44000e + ", bankAccount=" + this.f44001f + ", card=" + this.f44002g + ")";
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int i5) {
        Intrinsics.g(dest, "dest");
        dest.writeString(this.f43996a);
        dest.writeString(this.f43997b.name());
        dest.writeSerializable(this.f43998c);
        dest.writeInt(this.f43999d ? 1 : 0);
        dest.writeInt(this.f44000e ? 1 : 0);
        BankAccount bankAccount = this.f44001f;
        if (bankAccount == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            bankAccount.writeToParcel(dest, i5);
        }
        Card card = this.f44002g;
        if (card == null) {
            dest.writeInt(0);
        } else {
            dest.writeInt(1);
            card.writeToParcel(dest, i5);
        }
    }

    public /* synthetic */ Token(String str, ft.t0 t0Var, Date date, boolean z11, boolean z12, BankAccount bankAccount, Card card, int i5) {
        this(str, t0Var, date, z11, z12, (i5 & 32) != 0 ? null : bankAccount, (i5 & 64) != 0 ? null : card);
    }
}
