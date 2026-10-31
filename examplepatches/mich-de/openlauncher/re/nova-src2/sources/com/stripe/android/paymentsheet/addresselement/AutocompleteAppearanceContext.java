package com.stripe.android.paymentsheet.addresselement;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.paymentsheet.PaymentSheet$Appearance;
import com.stripe.android.paymentsheet.p0;
import com.vungle.ads.internal.protos.Sdk;
import f1.t0;
import f1.u0;
import kotlin.Metadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bp\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AutocompleteAppearanceContext;", "Landroid/os/Parcelable;", "Link", "PaymentElement", "Lcom/stripe/android/paymentsheet/addresselement/AutocompleteAppearanceContext$Link;", "Lcom/stripe/android/paymentsheet/addresselement/AutocompleteAppearanceContext$PaymentElement;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface AutocompleteAppearanceContext extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bÇ\n\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AutocompleteAppearanceContext$Link;", "Lcom/stripe/android/paymentsheet/addresselement/AutocompleteAppearanceContext;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final /* data */ class Link implements AutocompleteAppearanceContext {

        /* renamed from: a, reason: collision with root package name */
        public static final Link f44708a = new Link();

        @NotNull
        public static final Parcelable.Creator<Link> CREATOR = new s();

        @Override // com.stripe.android.paymentsheet.addresselement.AutocompleteAppearanceContext
        public final long V(p1.o oVar) {
            p1.t tVar = (p1.t) oVar;
            tVar.b0(491402441);
            tVar.b0(-443512897);
            os.b bVar = (os.b) tVar.j(os.g.f80779c);
            tVar.p(false);
            long j11 = bVar.f80738b;
            tVar.p(false);
            return j11;
        }

        @Override // com.stripe.android.paymentsheet.addresselement.AutocompleteAppearanceContext
        public final void c(boolean z11, Function0 onBack, p1.o oVar, int i5) {
            Intrinsics.g(onBack, "onBack");
            p1.t tVar = (p1.t) oVar;
            tVar.b0(1210515695);
            boolean z12 = true;
            ps.m mVar = new ps.m(false, !z11, null, false);
            tVar.b0(1091838719);
            if ((((i5 & 112) ^ 48) <= 32 || !tVar.f(onBack)) && (i5 & 48) != 32) {
                z12 = false;
            }
            Object objP = tVar.P();
            if (z12 || objP == p1.n.f81514a) {
                objP = new b20.v(onBack, 26);
                tVar.m0(objP);
            }
            tVar.p(false);
            ps.k.b(mVar, null, (Function0) objP, tVar, 0);
            tVar.p(false);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            return this == obj || (obj instanceof Link);
        }

        public final int hashCode() {
            return 367777705;
        }

        @Override // com.stripe.android.paymentsheet.addresselement.AutocompleteAppearanceContext
        public final void m0() {
        }

        @Override // com.stripe.android.paymentsheet.addresselement.AutocompleteAppearanceContext
        public final void t0(x1.e eVar, p1.t tVar) {
            tVar.b0(418825729);
            os.g.a(null, x1.f.d(368993405, new u(eVar), tVar), tVar, 48);
            tVar.p(false);
        }

        public final String toString() {
            return "Link";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeInt(1);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/paymentsheet/addresselement/AutocompleteAppearanceContext$PaymentElement;", "Lcom/stripe/android/paymentsheet/addresselement/AutocompleteAppearanceContext;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    @SourceDebugExtension
    public static final /* data */ class PaymentElement implements AutocompleteAppearanceContext {

        @NotNull
        public static final Parcelable.Creator<PaymentElement> CREATOR = new v();

        /* renamed from: a, reason: collision with root package name */
        public final PaymentSheet$Appearance f44709a;

        public PaymentElement(PaymentSheet$Appearance appearance) {
            Intrinsics.g(appearance, "appearance");
            this.f44709a = appearance;
        }

        @Override // com.stripe.android.paymentsheet.addresselement.AutocompleteAppearanceContext
        public final long V(p1.o oVar) {
            p1.t tVar = (p1.t) oVar;
            tVar.b0(-252909403);
            long jH = ((t0) tVar.j(u0.f54013a)).h();
            tVar.p(false);
            return jH;
        }

        @Override // com.stripe.android.paymentsheet.addresselement.AutocompleteAppearanceContext
        public final void c(boolean z11, Function0 onBack, p1.o oVar, int i5) {
            Intrinsics.g(onBack, "onBack");
            p1.t tVar = (p1.t) oVar;
            tVar.b0(-1859306165);
            tVar.b0(-548047581);
            boolean z12 = (((i5 & 112) ^ 48) > 32 && tVar.f(onBack)) || (i5 & 48) == 32;
            Object objP = tVar.P();
            if (z12 || objP == p1.n.f81514a) {
                objP = new b20.v(onBack, 27);
                tVar.m0(objP);
            }
            tVar.p(false);
            io.sentry.config.a.a(z11, (Function0) objP, tVar, i5 & 14);
            tVar.p(false);
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof PaymentElement) && Intrinsics.b(this.f44709a, ((PaymentElement) obj).f44709a);
        }

        public final int hashCode() {
            return this.f44709a.hashCode();
        }

        @Override // com.stripe.android.paymentsheet.addresselement.AutocompleteAppearanceContext
        public final void m0() {
            p0.b(this.f44709a);
        }

        @Override // com.stripe.android.paymentsheet.addresselement.AutocompleteAppearanceContext
        public final void t0(x1.e eVar, p1.t tVar) {
            tVar.b0(1625248733);
            hw.r.a(null, null, null, null, null, null, null, x1.f.d(-806558713, new w(eVar), tVar), tVar, 12582912, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE);
            tVar.p(false);
        }

        public final String toString() {
            return "PaymentElement(appearance=" + this.f44709a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            this.f44709a.writeToParcel(dest, i5);
        }
    }

    long V(p1.o oVar);

    void c(boolean z11, Function0 function0, p1.o oVar, int i5);

    void m0();

    void t0(x1.e eVar, p1.t tVar);
}
