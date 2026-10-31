package com.stripe.android.financialconnections.launcher;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.financialconnections.ElementsSessionContext;
import com.stripe.android.financialconnections.FinancialConnectionsSheetConfiguration;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b7\u0018\u00002\u00020\u0001:\u0003\u0002\u0003\u0004\u0082\u0001\u0003\u0005\u0006\u0007¨\u0006\b"}, d2 = {"Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityArgs;", "Landroid/os/Parcelable;", "ForData", "ForToken", "ForInstantDebits", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityArgs$ForData;", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityArgs$ForInstantDebits;", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityArgs$ForToken;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public abstract class FinancialConnectionsSheetActivityArgs implements Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityArgs$ForData;", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityArgs;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ForData extends FinancialConnectionsSheetActivityArgs {

        @NotNull
        public static final Parcelable.Creator<ForData> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public final FinancialConnectionsSheetConfiguration f42668a;

        /* renamed from: b, reason: collision with root package name */
        public final ElementsSessionContext f42669b;

        public ForData(FinancialConnectionsSheetConfiguration configuration, ElementsSessionContext elementsSessionContext) {
            Intrinsics.g(configuration, "configuration");
            this.f42668a = configuration;
            this.f42669b = elementsSessionContext;
        }

        @Override // com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityArgs
        /* renamed from: b, reason: from getter */
        public final FinancialConnectionsSheetConfiguration getF42672a() {
            return this.f42668a;
        }

        @Override // com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityArgs
        /* renamed from: d, reason: from getter */
        public final ElementsSessionContext getF42673b() {
            return this.f42669b;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof ForData)) {
                return false;
            }
            ForData forData = (ForData) obj;
            return Intrinsics.b(this.f42668a, forData.f42668a) && Intrinsics.b(this.f42669b, forData.f42669b);
        }

        public final int hashCode() {
            int iHashCode = this.f42668a.hashCode() * 31;
            ElementsSessionContext elementsSessionContext = this.f42669b;
            return iHashCode + (elementsSessionContext == null ? 0 : elementsSessionContext.hashCode());
        }

        public final String toString() {
            return "ForData(configuration=" + this.f42668a + ", elementsSessionContext=" + this.f42669b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f42668a.writeToParcel(dest, i5);
            ElementsSessionContext elementsSessionContext = this.f42669b;
            if (elementsSessionContext == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                elementsSessionContext.writeToParcel(dest, i5);
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityArgs$ForInstantDebits;", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityArgs;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ForInstantDebits extends FinancialConnectionsSheetActivityArgs {

        @NotNull
        public static final Parcelable.Creator<ForInstantDebits> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final FinancialConnectionsSheetConfiguration f42670a;

        /* renamed from: b, reason: collision with root package name */
        public final ElementsSessionContext f42671b;

        public ForInstantDebits(FinancialConnectionsSheetConfiguration configuration, ElementsSessionContext elementsSessionContext) {
            Intrinsics.g(configuration, "configuration");
            this.f42670a = configuration;
            this.f42671b = elementsSessionContext;
        }

        @Override // com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityArgs
        /* renamed from: b, reason: from getter */
        public final FinancialConnectionsSheetConfiguration getF42672a() {
            return this.f42670a;
        }

        @Override // com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityArgs
        /* renamed from: d, reason: from getter */
        public final ElementsSessionContext getF42673b() {
            return this.f42671b;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof ForInstantDebits)) {
                return false;
            }
            ForInstantDebits forInstantDebits = (ForInstantDebits) obj;
            return Intrinsics.b(this.f42670a, forInstantDebits.f42670a) && Intrinsics.b(this.f42671b, forInstantDebits.f42671b);
        }

        public final int hashCode() {
            int iHashCode = this.f42670a.hashCode() * 31;
            ElementsSessionContext elementsSessionContext = this.f42671b;
            return iHashCode + (elementsSessionContext == null ? 0 : elementsSessionContext.hashCode());
        }

        public final String toString() {
            return "ForInstantDebits(configuration=" + this.f42670a + ", elementsSessionContext=" + this.f42671b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f42670a.writeToParcel(dest, i5);
            ElementsSessionContext elementsSessionContext = this.f42671b;
            if (elementsSessionContext == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                elementsSessionContext.writeToParcel(dest, i5);
            }
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityArgs$ForToken;", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityArgs;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class ForToken extends FinancialConnectionsSheetActivityArgs {

        @NotNull
        public static final Parcelable.Creator<ForToken> CREATOR = new c();

        /* renamed from: a, reason: collision with root package name */
        public final FinancialConnectionsSheetConfiguration f42672a;

        /* renamed from: b, reason: collision with root package name */
        public final ElementsSessionContext f42673b;

        public ForToken(FinancialConnectionsSheetConfiguration configuration, ElementsSessionContext elementsSessionContext) {
            Intrinsics.g(configuration, "configuration");
            this.f42672a = configuration;
            this.f42673b = elementsSessionContext;
        }

        @Override // com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityArgs
        /* renamed from: b, reason: from getter */
        public final FinancialConnectionsSheetConfiguration getF42672a() {
            return this.f42672a;
        }

        @Override // com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityArgs
        /* renamed from: d, reason: from getter */
        public final ElementsSessionContext getF42673b() {
            return this.f42673b;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof ForToken)) {
                return false;
            }
            ForToken forToken = (ForToken) obj;
            return Intrinsics.b(this.f42672a, forToken.f42672a) && Intrinsics.b(this.f42673b, forToken.f42673b);
        }

        public final int hashCode() {
            int iHashCode = this.f42672a.hashCode() * 31;
            ElementsSessionContext elementsSessionContext = this.f42673b;
            return iHashCode + (elementsSessionContext == null ? 0 : elementsSessionContext.hashCode());
        }

        public final String toString() {
            return "ForToken(configuration=" + this.f42672a + ", elementsSessionContext=" + this.f42673b + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f42672a.writeToParcel(dest, i5);
            ElementsSessionContext elementsSessionContext = this.f42673b;
            if (elementsSessionContext == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                elementsSessionContext.writeToParcel(dest, i5);
            }
        }
    }

    /* renamed from: b */
    public abstract FinancialConnectionsSheetConfiguration getF42672a();

    /* renamed from: d */
    public abstract ElementsSessionContext getF42673b();
}
