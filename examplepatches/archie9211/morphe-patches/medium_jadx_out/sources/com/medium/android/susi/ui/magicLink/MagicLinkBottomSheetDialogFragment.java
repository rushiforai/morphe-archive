package com.medium.android.susi.ui.magicLink;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import defpackage.an5;
import defpackage.ed7;
import defpackage.em4;
import defpackage.g76;
import defpackage.mz1;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.wgd;
import defpackage.yw6;
import defpackage.zi5;
import defpackage.zm7;
import kotlin.Metadata;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/susi/ui/magicLink/MagicLinkBottomSheetDialogFragment;", "Ld0;", "<init>", "()V", "BundleInfo", "susi_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MagicLinkBottomSheetDialogFragment extends an5 {
    public final vq6 H0 = vx0.d0(yw6.NONE, new em4(18, this));

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0002\b\u0011\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002B;\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\b\u0010\b\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\t\u001a\u00020\u0003\u0012\b\u0010\n\u001a\u0004\u0018\u00010\u0003\u0012\u0006\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\r\u0010\u000eJ\u001d\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0012\u001a\u00020\u0011¢\u0006\u0004\b\u0014\u0010\u0015J\u0010\u0010\u0016\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u0016\u0010\u0017J\u0010\u0010\u0018\u001a\u00020\u0011HÖ\u0001¢\u0006\u0004\b\u0018\u0010\u0019J\u001a\u0010\u001c\u001a\u00020\u000b2\b\u0010\u001b\u001a\u0004\u0018\u00010\u001aHÖ\u0003¢\u0006\u0004\b\u001c\u0010\u001dR\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u001e\u001a\u0004\b\u001f\u0010\u0017R\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010 \u001a\u0004\b!\u0010\"R\u0019\u0010\b\u001a\u0004\u0018\u00010\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010#\u001a\u0004\b$\u0010%R\u0017\u0010\t\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\t\u0010\u001e\u001a\u0004\b&\u0010\u0017R\u0019\u0010\n\u001a\u0004\u0018\u00010\u00038\u0006¢\u0006\f\n\u0004\b\n\u0010\u001e\u001a\u0004\b'\u0010\u0017R\u0017\u0010\f\u001a\u00020\u000b8\u0006¢\u0006\f\n\u0004\b\f\u0010(\u001a\u0004\b)\u0010*¨\u0006+"}, d2 = {"Lcom/medium/android/susi/ui/magicLink/MagicLinkBottomSheetDialogFragment$BundleInfo;", "Landroid/os/Parcelable;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "", "referrerSource", "Lcom/medium/android/core/susi/SusiOperation;", "susiOperation", "Lcom/medium/android/core/susi/SusiDestination;", "susiDestination", "email", "fullName", "", "rememberMe", "<init>", "(Ljava/lang/String;Lcom/medium/android/core/susi/SusiOperation;Lcom/medium/android/core/susi/SusiDestination;Ljava/lang/String;Ljava/lang/String;Z)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getReferrerSource", "Lcom/medium/android/core/susi/SusiOperation;", "getSusiOperation", "()Lcom/medium/android/core/susi/SusiOperation;", "Lcom/medium/android/core/susi/SusiDestination;", "getSusiDestination", "()Lcom/medium/android/core/susi/SusiDestination;", "getEmail", "getFullName", "Z", "getRememberMe", "()Z", "susi_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo implements Parcelable {
        public static final int $stable = AbstractMediumFragment.BundleInfo.$stable;
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final String email;
        private final String fullName;
        private final String referrerSource;
        private final boolean rememberMe;
        private final SusiDestination susiDestination;
        private final SusiOperation susiOperation;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo(parcel.readString(), SusiOperation.valueOf(parcel.readString()), (SusiDestination) parcel.readParcelable(BundleInfo.class.getClassLoader()), parcel.readString(), parcel.readString(), parcel.readInt() != 0);
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(String str, SusiOperation susiOperation, SusiDestination susiDestination, String str2, String str3, boolean z) {
            super(str);
            str.getClass();
            susiOperation.getClass();
            str2.getClass();
            this.referrerSource = str;
            this.susiOperation = susiOperation;
            this.susiDestination = susiDestination;
            this.email = str2;
            this.fullName = str3;
            this.rememberMe = z;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BundleInfo)) {
                return false;
            }
            BundleInfo bundleInfo = (BundleInfo) other;
            return g76.L(this.referrerSource, bundleInfo.referrerSource) && this.susiOperation == bundleInfo.susiOperation && g76.L(this.susiDestination, bundleInfo.susiDestination) && g76.L(this.email, bundleInfo.email) && g76.L(this.fullName, bundleInfo.fullName) && this.rememberMe == bundleInfo.rememberMe;
        }

        public final String getEmail() {
            return this.email;
        }

        public final String getFullName() {
            return this.fullName;
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public final boolean getRememberMe() {
            return this.rememberMe;
        }

        public final SusiDestination getSusiDestination() {
            return this.susiDestination;
        }

        public final SusiOperation getSusiOperation() {
            return this.susiOperation;
        }

        public int hashCode() {
            int iHashCode = (this.susiOperation.hashCode() + (this.referrerSource.hashCode() * 31)) * 31;
            SusiDestination susiDestination = this.susiDestination;
            int iO = wgd.o((iHashCode + (susiDestination == null ? 0 : susiDestination.hashCode())) * 31, 31, this.email);
            String str = this.fullName;
            return ((iO + (str != null ? str.hashCode() : 0)) * 31) + (this.rememberMe ? 1231 : 1237);
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.referrerSource);
            dest.writeString(this.susiOperation.name());
            dest.writeParcelable(this.susiDestination, flags);
            dest.writeString(this.email);
            dest.writeString(this.fullName);
            dest.writeInt(this.rememberMe ? 1 : 0);
        }

        public String toString() {
            return eoLmc.vcSt + this.referrerSource + ", susiOperation=" + this.susiOperation + ", susiDestination=" + this.susiDestination + ", email=" + this.email + ", fullName=" + this.fullName + ", rememberMe=" + this.rememberMe + ")";
        }
    }

    @Override // defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        zm7 zm7Var = new zm7(19, this);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new ed7(this, zm7Var, 0), true, 1630131454));
        return composeView;
    }

    @Override // defpackage.d0
    public final void d0(BottomSheetBehavior bottomSheetBehavior) {
        bottomSheetBehavior.L(3);
        bottomSheetBehavior.K = true;
        bottomSheetBehavior.l = -1;
    }

    public final BundleInfo f0() {
        return (BundleInfo) this.H0.getValue();
    }
}
