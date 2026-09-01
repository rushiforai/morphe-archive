package com.medium.android.payments.ui.subscription;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.core.membership.UpsellInfo;
import com.medium.android.graphql.type.MembershipType;
import defpackage.cr0;
import defpackage.doc;
import defpackage.g76;
import defpackage.i03;
import defpackage.mz1;
import defpackage.on5;
import defpackage.p13;
import defpackage.sxc;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/payments/ui/subscription/SubscriptionBottomSheetDialogFragment;", "Ld0;", "<init>", "()V", "BundleInfo", "payments_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SubscriptionBottomSheetDialogFragment extends on5 {
    public p13 H0;
    public cr0 I0;
    public i03 J0;
    public final vq6 K0 = vx0.d0(yw6.NONE, new doc(3, this));

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002B!\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007¢\u0006\u0004\b\t\u0010\nJ\u001d\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u001a\u0010\u0019\u001a\u00020\u00182\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016HÖ\u0003¢\u0006\u0004\b\u0019\u0010\u001aR\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u001b\u001a\u0004\b\u001c\u0010\u0013R\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001d\u001a\u0004\b\u001e\u0010\u001fR\u0019\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010 \u001a\u0004\b!\u0010\"¨\u0006#"}, d2 = {"Lcom/medium/android/payments/ui/subscription/SubscriptionBottomSheetDialogFragment$BundleInfo;", "Landroid/os/Parcelable;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "", "referrerSource", "Lcom/medium/android/core/membership/UpsellInfo;", "upsellInfo", "Lcom/medium/android/graphql/type/MembershipType;", "initialMembershipType", "<init>", "(Ljava/lang/String;Lcom/medium/android/core/membership/UpsellInfo;Lcom/medium/android/graphql/type/MembershipType;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getReferrerSource", "Lcom/medium/android/core/membership/UpsellInfo;", "getUpsellInfo", "()Lcom/medium/android/core/membership/UpsellInfo;", "Lcom/medium/android/graphql/type/MembershipType;", "getInitialMembershipType", "()Lcom/medium/android/graphql/type/MembershipType;", "payments_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo implements Parcelable {
        public static final int $stable = AbstractMediumFragment.BundleInfo.$stable | UpsellInfo.$stable;
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final MembershipType initialMembershipType;
        private final String referrerSource;
        private final UpsellInfo upsellInfo;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo(parcel.readString(), (UpsellInfo) parcel.readParcelable(BundleInfo.class.getClassLoader()), parcel.readInt() == 0 ? null : MembershipType.valueOf(parcel.readString()));
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(String str, UpsellInfo upsellInfo, MembershipType membershipType) {
            super(str);
            str.getClass();
            upsellInfo.getClass();
            this.referrerSource = str;
            this.upsellInfo = upsellInfo;
            this.initialMembershipType = membershipType;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BundleInfo)) {
                return false;
            }
            BundleInfo bundleInfo = (BundleInfo) other;
            return g76.L(this.referrerSource, bundleInfo.referrerSource) && g76.L(this.upsellInfo, bundleInfo.upsellInfo) && this.initialMembershipType == bundleInfo.initialMembershipType;
        }

        public final MembershipType getInitialMembershipType() {
            return this.initialMembershipType;
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public final UpsellInfo getUpsellInfo() {
            return this.upsellInfo;
        }

        public int hashCode() {
            int iHashCode = (this.upsellInfo.hashCode() + (this.referrerSource.hashCode() * 31)) * 31;
            MembershipType membershipType = this.initialMembershipType;
            return iHashCode + (membershipType == null ? 0 : membershipType.hashCode());
        }

        public String toString() {
            return "BundleInfo(referrerSource=" + this.referrerSource + ", upsellInfo=" + this.upsellInfo + ", initialMembershipType=" + this.initialMembershipType + ")";
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.referrerSource);
            dest.writeParcelable(this.upsellInfo, flags);
            MembershipType membershipType = this.initialMembershipType;
            if (membershipType == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(membershipType.name());
            }
        }
    }

    @Override // defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        a aVar = new a(this);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new sxc(this, aVar, 0), true, 1835926713));
        return composeView;
    }

    @Override // defpackage.d0
    public final void d0(BottomSheetBehavior bottomSheetBehavior) {
        bottomSheetBehavior.L(3);
        bottomSheetBehavior.K = true;
        bottomSheetBehavior.l = -1;
    }
}
