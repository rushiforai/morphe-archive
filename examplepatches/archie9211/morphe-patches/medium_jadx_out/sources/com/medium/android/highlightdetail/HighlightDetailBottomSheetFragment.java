package com.medium.android.highlightdetail;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.core.navigation.HighlightReference;
import com.medium.android.highlightdetail.HighlightDetailBottomSheetFragment;
import defpackage.ay0;
import defpackage.dm2;
import defpackage.ev6;
import defpackage.g76;
import defpackage.ht2;
import defpackage.km4;
import defpackage.l23;
import defpackage.m45;
import defpackage.mz1;
import defpackage.p13;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.wgd;
import defpackage.wm5;
import defpackage.yw6;
import defpackage.zi5;
import gen.model.SourceParameter;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0007\u0018\u00002\u00020\u0001:\u0002\u0004\u0005B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0006"}, d2 = {"Lcom/medium/android/highlightdetail/HighlightDetailBottomSheetFragment;", "Ld0;", "<init>", "()V", "BundleInfo", "com/medium/android/highlightdetail/c", "highlightdetail_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class HighlightDetailBottomSheetFragment extends wm5 {
    public p13 H0;
    public final vq6 I0 = vx0.d0(yw6.NONE, new m45() { // from class: com.medium.android.highlightdetail.a
        @Override // defpackage.m45
        public final Object invoke() {
            Parcelable parcelable = (Parcelable) ht2.r0(dm2.F(this.a), "bundle_info", HighlightDetailBottomSheetFragment.BundleInfo.class);
            if (parcelable != null) {
                return (HighlightDetailBottomSheetFragment.BundleInfo) parcelable;
            }
            ay0.e("Required 'bundle_info' is null.");
            return null;
        }
    });

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\f\b\u0083\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\b\u001a\u00020\u0006¢\u0006\u0004\b\t\u0010\nJ\u001d\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u001a\u0010\u0019\u001a\u00020\u00182\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016HÖ\u0003¢\u0006\u0004\b\u0019\u0010\u001aR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001b\u001a\u0004\b\u001c\u0010\u001dR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001e\u001a\u0004\b\u001f\u0010 R\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010!\u001a\u0004\b\"\u0010\u0013R\u001a\u0010\b\u001a\u00020\u00068\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\b\u0010!\u001a\u0004\b#\u0010\u0013¨\u0006$"}, d2 = {"Lcom/medium/android/highlightdetail/HighlightDetailBottomSheetFragment$BundleInfo;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "Lcom/medium/android/core/navigation/HighlightReference;", "highlightReference", "Lgen/model/SourceParameter;", "screenSourceParameter", "", "location", "referrerSource", "<init>", "(Lcom/medium/android/core/navigation/HighlightReference;Lgen/model/SourceParameter;Ljava/lang/String;Ljava/lang/String;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/core/navigation/HighlightReference;", "getHighlightReference", "()Lcom/medium/android/core/navigation/HighlightReference;", "Lgen/model/SourceParameter;", "getScreenSourceParameter", "()Lgen/model/SourceParameter;", "Ljava/lang/String;", "getLocation", "getReferrerSource", "highlightdetail_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo {
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final HighlightReference highlightReference;
        private final String location;
        private final String referrerSource;
        private final SourceParameter screenSourceParameter;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo((HighlightReference) parcel.readParcelable(BundleInfo.class.getClassLoader()), (SourceParameter) parcel.readParcelable(BundleInfo.class.getClassLoader()), parcel.readString(), parcel.readString());
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(HighlightReference highlightReference, SourceParameter sourceParameter, String str, String str2) {
            super(str2);
            highlightReference.getClass();
            sourceParameter.getClass();
            str.getClass();
            str2.getClass();
            this.highlightReference = highlightReference;
            this.screenSourceParameter = sourceParameter;
            this.location = str;
            this.referrerSource = str2;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BundleInfo)) {
                return false;
            }
            BundleInfo bundleInfo = (BundleInfo) other;
            return g76.L(this.highlightReference, bundleInfo.highlightReference) && g76.L(this.screenSourceParameter, bundleInfo.screenSourceParameter) && g76.L(this.location, bundleInfo.location) && g76.L(this.referrerSource, bundleInfo.referrerSource);
        }

        public final HighlightReference getHighlightReference() {
            return this.highlightReference;
        }

        public final String getLocation() {
            return this.location;
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public final SourceParameter getScreenSourceParameter() {
            return this.screenSourceParameter;
        }

        public int hashCode() {
            return this.referrerSource.hashCode() + wgd.o(ev6.o(this.screenSourceParameter, this.highlightReference.hashCode() * 31, 31), 31, this.location);
        }

        public String toString() {
            HighlightReference highlightReference = this.highlightReference;
            SourceParameter sourceParameter = this.screenSourceParameter;
            String str = this.location;
            String str2 = this.referrerSource;
            StringBuilder sb = new StringBuilder("BundleInfo(highlightReference=");
            sb.append(highlightReference);
            sb.append(", screenSourceParameter=");
            sb.append(sourceParameter);
            sb.append(", location=");
            return km4.C(sb, str, ", referrerSource=", str2, ")");
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeParcelable(this.highlightReference, flags);
            dest.writeParcelable(this.screenSourceParameter, flags);
            dest.writeString(this.location);
            dest.writeString(this.referrerSource);
        }
    }

    @Override // defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new l23(22, this), true, 1611185052));
        return composeView;
    }

    @Override // defpackage.d0
    public final void d0(BottomSheetBehavior bottomSheetBehavior) {
        bottomSheetBehavior.L(3);
        bottomSheetBehavior.K = true;
    }
}
