package com.medium.android.profile.ui.premium;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.profile.ui.premium.ProfilePremiumBottomSheetDialogFragment;
import defpackage.bd9;
import defpackage.bx6;
import defpackage.dn5;
import defpackage.ev6;
import defpackage.f3a;
import defpackage.g76;
import defpackage.i03;
import defpackage.iq1;
import defpackage.m40;
import defpackage.m45;
import defpackage.mz1;
import defpackage.n1b;
import defpackage.p13;
import defpackage.pj3;
import defpackage.py2;
import defpackage.tn2;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.w2a;
import defpackage.x2a;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/profile/ui/premium/ProfilePremiumBottomSheetDialogFragment;", "Ld0;", "<init>", "()V", "BundleInfo", "profile_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ProfilePremiumBottomSheetDialogFragment extends dn5 {
    public p13 H0;
    public tn2 I0;
    public py2 J0;
    public i03 K0;
    public final vq6 L0;
    public final iq1 M0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0006\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002B\u0017\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003¢\u0006\u0004\b\u0006\u0010\u0007J\u001d\u0010\r\u001a\u00020\f2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u001a\u0010\u0016\u001a\u00020\u00152\b\u0010\u0014\u001a\u0004\u0018\u00010\u0013HÖ\u0003¢\u0006\u0004\b\u0016\u0010\u0017R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0018\u001a\u0004\b\u0019\u0010\u0010R\u0017\u0010\u0005\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0018\u001a\u0004\b\u001a\u0010\u0010¨\u0006\u001b"}, d2 = {"Lcom/medium/android/profile/ui/premium/ProfilePremiumBottomSheetDialogFragment$BundleInfo;", "Landroid/os/Parcelable;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "", "referrerSource", "userId", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getReferrerSource", "getUserId", "profile_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo implements Parcelable {
        public static final int $stable = AbstractMediumFragment.BundleInfo.$stable;
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final String referrerSource;
        private final String userId;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo(parcel.readString(), parcel.readString());
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(String str, String str2) {
            super(str);
            str.getClass();
            str2.getClass();
            this.referrerSource = str;
            this.userId = str2;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BundleInfo)) {
                return false;
            }
            BundleInfo bundleInfo = (BundleInfo) other;
            return g76.L(this.referrerSource, bundleInfo.referrerSource) && g76.L(this.userId, bundleInfo.userId);
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public final String getUserId() {
            return this.userId;
        }

        public int hashCode() {
            return this.userId.hashCode() + (this.referrerSource.hashCode() * 31);
        }

        public String toString() {
            return ev6.y("BundleInfo(referrerSource=", this.referrerSource, ", userId=", this.userId, ")");
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.referrerSource);
            dest.writeString(this.userId);
        }
    }

    public ProfilePremiumBottomSheetDialogFragment() {
        yw6 yw6Var = yw6.NONE;
        final int i = 0;
        this.L0 = vx0.d0(yw6Var, new m45(this) { // from class: v2a
            public final /* synthetic */ ProfilePremiumBottomSheetDialogFragment b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i2 = i;
                ProfilePremiumBottomSheetDialogFragment profilePremiumBottomSheetDialogFragment = this.b;
                switch (i2) {
                    case 0:
                        Parcelable parcelable = (Parcelable) ht2.r0(dm2.F(profilePremiumBottomSheetDialogFragment), "bundle_info", ProfilePremiumBottomSheetDialogFragment.BundleInfo.class);
                        if (parcelable != null) {
                            return (ProfilePremiumBottomSheetDialogFragment.BundleInfo) parcelable;
                        }
                        ay0.e("Required 'bundle_info' is null.");
                        return null;
                    default:
                        vq6 vq6Var = profilePremiumBottomSheetDialogFragment.L0;
                        tn2 tn2Var = profilePremiumBottomSheetDialogFragment.I0;
                        if (tn2Var == null) {
                            g76.g0("vmFactory");
                            throw null;
                        }
                        String userId = ((ProfilePremiumBottomSheetDialogFragment.BundleInfo) vq6Var.getValue()).getUserId();
                        String referrerSource = ((ProfilePremiumBottomSheetDialogFragment.BundleInfo) vq6Var.getValue()).getReferrerSource();
                        eo2 eo2Var = tn2Var.a;
                        xm2 xm2Var = (xm2) eo2Var.d;
                        return new f3a(userId, referrerSource, xm2Var.b(), eo2Var.b.h(), xm2Var.d());
                }
            }
        });
        final int i2 = 1;
        bx6 bx6Var = new bx6(5, new m45(this) { // from class: v2a
            public final /* synthetic */ ProfilePremiumBottomSheetDialogFragment b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i22 = i2;
                ProfilePremiumBottomSheetDialogFragment profilePremiumBottomSheetDialogFragment = this.b;
                switch (i22) {
                    case 0:
                        Parcelable parcelable = (Parcelable) ht2.r0(dm2.F(profilePremiumBottomSheetDialogFragment), "bundle_info", ProfilePremiumBottomSheetDialogFragment.BundleInfo.class);
                        if (parcelable != null) {
                            return (ProfilePremiumBottomSheetDialogFragment.BundleInfo) parcelable;
                        }
                        ay0.e("Required 'bundle_info' is null.");
                        return null;
                    default:
                        vq6 vq6Var = profilePremiumBottomSheetDialogFragment.L0;
                        tn2 tn2Var = profilePremiumBottomSheetDialogFragment.I0;
                        if (tn2Var == null) {
                            g76.g0("vmFactory");
                            throw null;
                        }
                        String userId = ((ProfilePremiumBottomSheetDialogFragment.BundleInfo) vq6Var.getValue()).getUserId();
                        String referrerSource = ((ProfilePremiumBottomSheetDialogFragment.BundleInfo) vq6Var.getValue()).getReferrerSource();
                        eo2 eo2Var = tn2Var.a;
                        xm2 xm2Var = (xm2) eo2Var.d;
                        return new f3a(userId, referrerSource, xm2Var.b(), eo2Var.b.h(), xm2Var.d());
                }
            }
        });
        vq6 vq6VarD0 = vx0.d0(yw6Var, new bd9(6, new bd9(5, this)));
        this.M0 = m40.I(this, n1b.a.b(f3a.class), new pj3(vq6VarD0, 6), new pj3(vq6VarD0, 7), bx6Var);
    }

    @Override // defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        x2a x2aVar = new x2a(this);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new w2a(this, x2aVar, 0), true, 466790725));
        return composeView;
    }

    @Override // defpackage.d0
    public final void d0(BottomSheetBehavior bottomSheetBehavior) {
        bottomSheetBehavior.L(3);
        bottomSheetBehavior.K = true;
    }
}
