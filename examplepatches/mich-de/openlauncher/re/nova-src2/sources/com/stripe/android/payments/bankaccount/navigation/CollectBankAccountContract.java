package com.stripe.android.payments.bankaccount.navigation;

import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import b.c9;
import com.stripe.android.payments.bankaccount.CollectBankAccountConfiguration;
import com.stripe.android.payments.bankaccount.navigation.CollectBankAccountResultInternal;
import com.stripe.android.payments.bankaccount.ui.CollectBankAccountActivity;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0007\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001:\u0002\u0006\u0007B\u0007¢\u0006\u0004\b\u0004\u0010\u0005¨\u0006\b"}, d2 = {"Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountContract;", "Lk/b;", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountContract$Args;", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountResultInternal;", "<init>", "()V", "Args", "Result", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class CollectBankAccountContract extends k.b {

    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005\u0082\u0001\u0004\u0006\u0007\b\t¨\u0006\n"}, d2 = {"Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountContract$Args;", "Landroid/os/Parcelable;", "ForPaymentIntent", "ForSetupIntent", "ForDeferredPaymentIntent", "ForDeferredSetupIntent", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountContract$Args$ForDeferredPaymentIntent;", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountContract$Args$ForDeferredSetupIntent;", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountContract$Args$ForPaymentIntent;", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountContract$Args$ForSetupIntent;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static abstract class Args implements Parcelable {

        /* renamed from: a, reason: collision with root package name */
        public final String f44252a;

        /* renamed from: b, reason: collision with root package name */
        public final boolean f44253b;

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountContract$Args$ForDeferredPaymentIntent;", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountContract$Args;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class ForDeferredPaymentIntent extends Args {

            @NotNull
            public static final Parcelable.Creator<ForDeferredPaymentIntent> CREATOR = new a();

            /* renamed from: c, reason: collision with root package name */
            public final String f44254c;

            /* renamed from: d, reason: collision with root package name */
            public final String f44255d;

            /* renamed from: e, reason: collision with root package name */
            public final CollectBankAccountConfiguration f44256e;

            /* renamed from: f, reason: collision with root package name */
            public final mu.b f44257f;

            /* renamed from: g, reason: collision with root package name */
            public final String f44258g;

            /* renamed from: h, reason: collision with root package name */
            public final String f44259h;

            /* renamed from: i, reason: collision with root package name */
            public final String f44260i;

            /* renamed from: j, reason: collision with root package name */
            public final String f44261j;

            /* renamed from: k, reason: collision with root package name */
            public final Integer f44262k;

            /* renamed from: l, reason: collision with root package name */
            public final String f44263l;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public ForDeferredPaymentIntent(String publishableKey, String str, CollectBankAccountConfiguration configuration, mu.b bVar, String str2, String elementsSessionId, String str3, String str4, Integer num, String str5) {
                super(null, false);
                Intrinsics.g(publishableKey, "publishableKey");
                Intrinsics.g(configuration, "configuration");
                Intrinsics.g(elementsSessionId, "elementsSessionId");
                this.f44254c = publishableKey;
                this.f44255d = str;
                this.f44256e = configuration;
                this.f44257f = bVar;
                this.f44258g = str2;
                this.f44259h = elementsSessionId;
                this.f44260i = str3;
                this.f44261j = str4;
                this.f44262k = num;
                this.f44263l = str5;
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: d, reason: from getter */
            public final CollectBankAccountConfiguration getF44282f() {
                return this.f44256e;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: e, reason: from getter */
            public final mu.b getF44284h() {
                return this.f44257f;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof ForDeferredPaymentIntent)) {
                    return false;
                }
                ForDeferredPaymentIntent forDeferredPaymentIntent = (ForDeferredPaymentIntent) obj;
                return Intrinsics.b(this.f44254c, forDeferredPaymentIntent.f44254c) && Intrinsics.b(this.f44255d, forDeferredPaymentIntent.f44255d) && Intrinsics.b(this.f44256e, forDeferredPaymentIntent.f44256e) && this.f44257f == forDeferredPaymentIntent.f44257f && Intrinsics.b(this.f44258g, forDeferredPaymentIntent.f44258g) && Intrinsics.b(this.f44259h, forDeferredPaymentIntent.f44259h) && Intrinsics.b(this.f44260i, forDeferredPaymentIntent.f44260i) && Intrinsics.b(this.f44261j, forDeferredPaymentIntent.f44261j) && Intrinsics.b(this.f44262k, forDeferredPaymentIntent.f44262k) && Intrinsics.b(this.f44263l, forDeferredPaymentIntent.f44263l);
            }

            public final int hashCode() {
                int iHashCode = this.f44254c.hashCode() * 31;
                String str = this.f44255d;
                int iHashCode2 = (this.f44256e.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31)) * 31;
                mu.b bVar = this.f44257f;
                int iHashCode3 = (iHashCode2 + (bVar == null ? 0 : bVar.hashCode())) * 31;
                String str2 = this.f44258g;
                int iE = c0.e((iHashCode3 + (str2 == null ? 0 : str2.hashCode())) * 31, 31, this.f44259h);
                String str3 = this.f44260i;
                int iHashCode4 = (iE + (str3 == null ? 0 : str3.hashCode())) * 31;
                String str4 = this.f44261j;
                int iHashCode5 = (iHashCode4 + (str4 == null ? 0 : str4.hashCode())) * 31;
                Integer num = this.f44262k;
                int iHashCode6 = (iHashCode5 + (num == null ? 0 : num.hashCode())) * 31;
                String str5 = this.f44263l;
                return iHashCode6 + (str5 != null ? str5.hashCode() : 0);
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: i, reason: from getter */
            public final String getF44279c() {
                return this.f44254c;
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: l, reason: from getter */
            public final String getF44280d() {
                return this.f44255d;
            }

            public final String toString() {
                StringBuilder sbW = c0.w("ForDeferredPaymentIntent(publishableKey=", this.f44254c, ", stripeAccountId=", this.f44255d, ", configuration=");
                sbW.append(this.f44256e);
                sbW.append(", financialConnectionsAvailability=");
                sbW.append(this.f44257f);
                sbW.append(", hostedSurface=");
                c0.D(sbW, this.f44258g, ", elementsSessionId=", this.f44259h, ", customerId=");
                c0.D(sbW, this.f44260i, ", onBehalfOf=", this.f44261j, ", amount=");
                sbW.append(this.f44262k);
                sbW.append(", currency=");
                sbW.append(this.f44263l);
                sbW.append(")");
                return sbW.toString();
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f44254c);
                dest.writeString(this.f44255d);
                dest.writeParcelable(this.f44256e, i5);
                mu.b bVar = this.f44257f;
                if (bVar == null) {
                    dest.writeInt(0);
                } else {
                    dest.writeInt(1);
                    dest.writeString(bVar.name());
                }
                dest.writeString(this.f44258g);
                dest.writeString(this.f44259h);
                dest.writeString(this.f44260i);
                dest.writeString(this.f44261j);
                Integer num = this.f44262k;
                if (num == null) {
                    dest.writeInt(0);
                } else {
                    fq.c.q(dest, 1, num);
                }
                dest.writeString(this.f44263l);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountContract$Args$ForDeferredSetupIntent;", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountContract$Args;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class ForDeferredSetupIntent extends Args {

            @NotNull
            public static final Parcelable.Creator<ForDeferredSetupIntent> CREATOR = new b();

            /* renamed from: c, reason: collision with root package name */
            public final String f44264c;

            /* renamed from: d, reason: collision with root package name */
            public final String f44265d;

            /* renamed from: e, reason: collision with root package name */
            public final CollectBankAccountConfiguration f44266e;

            /* renamed from: f, reason: collision with root package name */
            public final String f44267f;

            /* renamed from: g, reason: collision with root package name */
            public final mu.b f44268g;

            /* renamed from: h, reason: collision with root package name */
            public final String f44269h;

            /* renamed from: i, reason: collision with root package name */
            public final String f44270i;

            /* renamed from: j, reason: collision with root package name */
            public final String f44271j;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public ForDeferredSetupIntent(String publishableKey, String str, CollectBankAccountConfiguration configuration, String str2, mu.b bVar, String elementsSessionId, String str3, String str4) {
                super(null, false);
                Intrinsics.g(publishableKey, "publishableKey");
                Intrinsics.g(configuration, "configuration");
                Intrinsics.g(elementsSessionId, "elementsSessionId");
                this.f44264c = publishableKey;
                this.f44265d = str;
                this.f44266e = configuration;
                this.f44267f = str2;
                this.f44268g = bVar;
                this.f44269h = elementsSessionId;
                this.f44270i = str3;
                this.f44271j = str4;
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: d, reason: from getter */
            public final CollectBankAccountConfiguration getF44282f() {
                return this.f44266e;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: e, reason: from getter */
            public final mu.b getF44284h() {
                return this.f44268g;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof ForDeferredSetupIntent)) {
                    return false;
                }
                ForDeferredSetupIntent forDeferredSetupIntent = (ForDeferredSetupIntent) obj;
                return Intrinsics.b(this.f44264c, forDeferredSetupIntent.f44264c) && Intrinsics.b(this.f44265d, forDeferredSetupIntent.f44265d) && Intrinsics.b(this.f44266e, forDeferredSetupIntent.f44266e) && Intrinsics.b(this.f44267f, forDeferredSetupIntent.f44267f) && this.f44268g == forDeferredSetupIntent.f44268g && Intrinsics.b(this.f44269h, forDeferredSetupIntent.f44269h) && Intrinsics.b(this.f44270i, forDeferredSetupIntent.f44270i) && Intrinsics.b(this.f44271j, forDeferredSetupIntent.f44271j);
            }

            public final int hashCode() {
                int iHashCode = this.f44264c.hashCode() * 31;
                String str = this.f44265d;
                int iHashCode2 = (this.f44266e.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31)) * 31;
                String str2 = this.f44267f;
                int iHashCode3 = (iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31;
                mu.b bVar = this.f44268g;
                int iE = c0.e((iHashCode3 + (bVar == null ? 0 : bVar.hashCode())) * 31, 31, this.f44269h);
                String str3 = this.f44270i;
                int iHashCode4 = (iE + (str3 == null ? 0 : str3.hashCode())) * 31;
                String str4 = this.f44271j;
                return iHashCode4 + (str4 != null ? str4.hashCode() : 0);
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: i, reason: from getter */
            public final String getF44279c() {
                return this.f44264c;
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: l, reason: from getter */
            public final String getF44280d() {
                return this.f44265d;
            }

            public final String toString() {
                StringBuilder sbW = c0.w("ForDeferredSetupIntent(publishableKey=", this.f44264c, ", stripeAccountId=", this.f44265d, ", configuration=");
                sbW.append(this.f44266e);
                sbW.append(", hostedSurface=");
                sbW.append(this.f44267f);
                sbW.append(", financialConnectionsAvailability=");
                sbW.append(this.f44268g);
                sbW.append(", elementsSessionId=");
                sbW.append(this.f44269h);
                sbW.append(", customerId=");
                return c0.s(sbW, this.f44270i, ", onBehalfOf=", this.f44271j, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f44264c);
                dest.writeString(this.f44265d);
                dest.writeParcelable(this.f44266e, i5);
                dest.writeString(this.f44267f);
                mu.b bVar = this.f44268g;
                if (bVar == null) {
                    dest.writeInt(0);
                } else {
                    dest.writeInt(1);
                    dest.writeString(bVar.name());
                }
                dest.writeString(this.f44269h);
                dest.writeString(this.f44270i);
                dest.writeString(this.f44271j);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountContract$Args$ForPaymentIntent;", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountContract$Args;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class ForPaymentIntent extends Args {

            @NotNull
            public static final Parcelable.Creator<ForPaymentIntent> CREATOR = new c();

            /* renamed from: c, reason: collision with root package name */
            public final String f44272c;

            /* renamed from: d, reason: collision with root package name */
            public final String f44273d;

            /* renamed from: e, reason: collision with root package name */
            public final String f44274e;

            /* renamed from: f, reason: collision with root package name */
            public final CollectBankAccountConfiguration f44275f;

            /* renamed from: g, reason: collision with root package name */
            public final boolean f44276g;

            /* renamed from: h, reason: collision with root package name */
            public final mu.b f44277h;

            /* renamed from: i, reason: collision with root package name */
            public final String f44278i;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public ForPaymentIntent(String publishableKey, String str, String clientSecret, CollectBankAccountConfiguration configuration, boolean z11, mu.b bVar, String str2) {
                super(clientSecret, z11);
                Intrinsics.g(publishableKey, "publishableKey");
                Intrinsics.g(clientSecret, "clientSecret");
                Intrinsics.g(configuration, "configuration");
                this.f44272c = publishableKey;
                this.f44273d = str;
                this.f44274e = clientSecret;
                this.f44275f = configuration;
                this.f44276g = z11;
                this.f44277h = bVar;
                this.f44278i = str2;
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: b, reason: from getter */
            public final boolean getF44253b() {
                return this.f44276g;
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: d, reason: from getter */
            public final CollectBankAccountConfiguration getF44282f() {
                return this.f44275f;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: e, reason: from getter */
            public final mu.b getF44284h() {
                return this.f44277h;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof ForPaymentIntent)) {
                    return false;
                }
                ForPaymentIntent forPaymentIntent = (ForPaymentIntent) obj;
                return Intrinsics.b(this.f44272c, forPaymentIntent.f44272c) && Intrinsics.b(this.f44273d, forPaymentIntent.f44273d) && Intrinsics.b(this.f44274e, forPaymentIntent.f44274e) && Intrinsics.b(this.f44275f, forPaymentIntent.f44275f) && this.f44276g == forPaymentIntent.f44276g && this.f44277h == forPaymentIntent.f44277h && Intrinsics.b(this.f44278i, forPaymentIntent.f44278i);
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: g, reason: from getter */
            public final String getF44252a() {
                return this.f44274e;
            }

            public final int hashCode() {
                int iHashCode = this.f44272c.hashCode() * 31;
                String str = this.f44273d;
                int iF = c9.f((this.f44275f.hashCode() + c0.e((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.f44274e)) * 31, 31, this.f44276g);
                mu.b bVar = this.f44277h;
                int iHashCode2 = (iF + (bVar == null ? 0 : bVar.hashCode())) * 31;
                String str2 = this.f44278i;
                return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: i, reason: from getter */
            public final String getF44279c() {
                return this.f44272c;
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: l, reason: from getter */
            public final String getF44280d() {
                return this.f44273d;
            }

            public final String toString() {
                StringBuilder sbW = c0.w("ForPaymentIntent(publishableKey=", this.f44272c, ", stripeAccountId=", this.f44273d, ", clientSecret=");
                sbW.append(this.f44274e);
                sbW.append(", configuration=");
                sbW.append(this.f44275f);
                sbW.append(", attachToIntent=");
                sbW.append(this.f44276g);
                sbW.append(", financialConnectionsAvailability=");
                sbW.append(this.f44277h);
                sbW.append(", hostedSurface=");
                return c0.q(sbW, this.f44278i, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f44272c);
                dest.writeString(this.f44273d);
                dest.writeString(this.f44274e);
                dest.writeParcelable(this.f44275f, i5);
                dest.writeInt(this.f44276g ? 1 : 0);
                mu.b bVar = this.f44277h;
                if (bVar == null) {
                    dest.writeInt(0);
                } else {
                    dest.writeInt(1);
                    dest.writeString(bVar.name());
                }
                dest.writeString(this.f44278i);
            }
        }

        @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountContract$Args$ForSetupIntent;", "Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountContract$Args;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
        public static final /* data */ class ForSetupIntent extends Args {

            @NotNull
            public static final Parcelable.Creator<ForSetupIntent> CREATOR = new d();

            /* renamed from: c, reason: collision with root package name */
            public final String f44279c;

            /* renamed from: d, reason: collision with root package name */
            public final String f44280d;

            /* renamed from: e, reason: collision with root package name */
            public final String f44281e;

            /* renamed from: f, reason: collision with root package name */
            public final CollectBankAccountConfiguration f44282f;

            /* renamed from: g, reason: collision with root package name */
            public final boolean f44283g;

            /* renamed from: h, reason: collision with root package name */
            public final mu.b f44284h;

            /* renamed from: i, reason: collision with root package name */
            public final String f44285i;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public ForSetupIntent(String publishableKey, String str, String clientSecret, CollectBankAccountConfiguration configuration, boolean z11, mu.b bVar, String str2) {
                super(clientSecret, z11);
                Intrinsics.g(publishableKey, "publishableKey");
                Intrinsics.g(clientSecret, "clientSecret");
                Intrinsics.g(configuration, "configuration");
                this.f44279c = publishableKey;
                this.f44280d = str;
                this.f44281e = clientSecret;
                this.f44282f = configuration;
                this.f44283g = z11;
                this.f44284h = bVar;
                this.f44285i = str2;
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: b, reason: from getter */
            public final boolean getF44253b() {
                return this.f44283g;
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: d, reason: from getter */
            public final CollectBankAccountConfiguration getF44282f() {
                return this.f44282f;
            }

            @Override // android.os.Parcelable
            public final int describeContents() {
                return 0;
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: e, reason: from getter */
            public final mu.b getF44284h() {
                return this.f44284h;
            }

            public final boolean equals(Object obj) {
                if (this == obj) {
                    return true;
                }
                if (!(obj instanceof ForSetupIntent)) {
                    return false;
                }
                ForSetupIntent forSetupIntent = (ForSetupIntent) obj;
                return Intrinsics.b(this.f44279c, forSetupIntent.f44279c) && Intrinsics.b(this.f44280d, forSetupIntent.f44280d) && Intrinsics.b(this.f44281e, forSetupIntent.f44281e) && Intrinsics.b(this.f44282f, forSetupIntent.f44282f) && this.f44283g == forSetupIntent.f44283g && this.f44284h == forSetupIntent.f44284h && Intrinsics.b(this.f44285i, forSetupIntent.f44285i);
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: g, reason: from getter */
            public final String getF44252a() {
                return this.f44281e;
            }

            public final int hashCode() {
                int iHashCode = this.f44279c.hashCode() * 31;
                String str = this.f44280d;
                int iF = c9.f((this.f44282f.hashCode() + c0.e((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.f44281e)) * 31, 31, this.f44283g);
                mu.b bVar = this.f44284h;
                int iHashCode2 = (iF + (bVar == null ? 0 : bVar.hashCode())) * 31;
                String str2 = this.f44285i;
                return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: i, reason: from getter */
            public final String getF44279c() {
                return this.f44279c;
            }

            @Override // com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.Args
            /* renamed from: l, reason: from getter */
            public final String getF44280d() {
                return this.f44280d;
            }

            public final String toString() {
                StringBuilder sbW = c0.w("ForSetupIntent(publishableKey=", this.f44279c, ", stripeAccountId=", this.f44280d, ", clientSecret=");
                sbW.append(this.f44281e);
                sbW.append(", configuration=");
                sbW.append(this.f44282f);
                sbW.append(", attachToIntent=");
                sbW.append(this.f44283g);
                sbW.append(", financialConnectionsAvailability=");
                sbW.append(this.f44284h);
                sbW.append(", hostedSurface=");
                return c0.q(sbW, this.f44285i, ")");
            }

            @Override // android.os.Parcelable
            public final void writeToParcel(Parcel dest, int i5) {
                Intrinsics.g(dest, "dest");
                dest.writeString(this.f44279c);
                dest.writeString(this.f44280d);
                dest.writeString(this.f44281e);
                dest.writeParcelable(this.f44282f, i5);
                dest.writeInt(this.f44283g ? 1 : 0);
                mu.b bVar = this.f44284h;
                if (bVar == null) {
                    dest.writeInt(0);
                } else {
                    dest.writeInt(1);
                    dest.writeString(bVar.name());
                }
                dest.writeString(this.f44285i);
            }
        }

        public Args(String str, boolean z11) {
            this.f44252a = str;
            this.f44253b = z11;
        }

        /* renamed from: b, reason: from getter */
        public boolean getF44253b() {
            return this.f44253b;
        }

        /* renamed from: d */
        public abstract CollectBankAccountConfiguration getF44282f();

        /* renamed from: e */
        public abstract mu.b getF44284h();

        /* renamed from: g, reason: from getter */
        public String getF44252a() {
            return this.f44252a;
        }

        /* renamed from: i */
        public abstract String getF44279c();

        /* renamed from: l */
        public abstract String getF44280d();
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/payments/bankaccount/navigation/CollectBankAccountContract$Result;", "Landroid/os/Parcelable;", "payments-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Result implements Parcelable {

        @NotNull
        public static final Parcelable.Creator<Result> CREATOR = new e();

        /* renamed from: a, reason: collision with root package name */
        public final CollectBankAccountResultInternal f44286a;

        public Result(CollectBankAccountResultInternal collectBankAccountResult) {
            Intrinsics.g(collectBankAccountResult, "collectBankAccountResult");
            this.f44286a = collectBankAccountResult;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Result) && Intrinsics.b(this.f44286a, ((Result) obj).f44286a);
        }

        public final int hashCode() {
            return this.f44286a.hashCode();
        }

        public final String toString() {
            return "Result(collectBankAccountResult=" + this.f44286a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f44286a, i5);
        }
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        Args input = (Args) obj;
        Intrinsics.g(input, "input");
        Intent intentPutExtra = new Intent(context, (Class<?>) CollectBankAccountActivity.class).putExtra("com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.extra_args", input);
        Intrinsics.f(intentPutExtra, "putExtra(...)");
        return intentPutExtra;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        Result result;
        CollectBankAccountResultInternal collectBankAccountResultInternal = (intent == null || (result = (Result) intent.getParcelableExtra("com.stripe.android.payments.bankaccount.navigation.CollectBankAccountContract.extra_result")) == null) ? null : result.f44286a;
        return collectBankAccountResultInternal == null ? new CollectBankAccountResultInternal.Failed(new IllegalArgumentException("Failed to retrieve a CollectBankAccountResult.")) : collectBankAccountResultInternal;
    }
}
