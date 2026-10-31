package com.stripe.android.link.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.stripe.android.model.ConsentUi;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\bp\u0018\u00002\u00020\u0001:\u0002\u0002\u0003\u0082\u0001\u0002\u0004\u0005¨\u0006\u0006"}, d2 = {"Lcom/stripe/android/link/model/ConsentPresentation;", "Landroid/os/Parcelable;", "Inline", "FullScreen", "Lcom/stripe/android/link/model/ConsentPresentation$FullScreen;", "Lcom/stripe/android/link/model/ConsentPresentation$Inline;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface ConsentPresentation extends Parcelable {

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/model/ConsentPresentation$FullScreen;", "Lcom/stripe/android/link/model/ConsentPresentation;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class FullScreen implements ConsentPresentation {

        @NotNull
        public static final Parcelable.Creator<FullScreen> CREATOR = new a();

        /* renamed from: a, reason: collision with root package name */
        public final ConsentUi.ConsentPane f43007a;

        public FullScreen(ConsentUi.ConsentPane consentPane) {
            Intrinsics.g(consentPane, "consentPane");
            this.f43007a = consentPane;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof FullScreen) && Intrinsics.b(this.f43007a, ((FullScreen) obj).f43007a);
        }

        public final int hashCode() {
            return this.f43007a.hashCode();
        }

        public final String toString() {
            return "FullScreen(consentPane=" + this.f43007a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f43007a, i5);
        }
    }

    @Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/model/ConsentPresentation$Inline;", "Lcom/stripe/android/link/model/ConsentPresentation;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Inline implements ConsentPresentation {

        @NotNull
        public static final Parcelable.Creator<Inline> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public final ConsentUi.ConsentSection f43008a;

        public Inline(ConsentUi.ConsentSection consentSection) {
            Intrinsics.g(consentSection, "consentSection");
            this.f43008a = consentSection;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            return (obj instanceof Inline) && Intrinsics.b(this.f43008a, ((Inline) obj).f43008a);
        }

        public final int hashCode() {
            return this.f43008a.f43268a.hashCode();
        }

        public final String toString() {
            return "Inline(consentSection=" + this.f43008a + ")";
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel dest, int i5) {
            Intrinsics.g(dest, "dest");
            dest.writeParcelable(this.f43008a, i5);
        }
    }
}
