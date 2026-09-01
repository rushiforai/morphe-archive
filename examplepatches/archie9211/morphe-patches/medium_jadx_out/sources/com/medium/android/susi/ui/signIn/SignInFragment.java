package com.medium.android.susi.ui.signIn;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.core.susi.SusiDestination;
import defpackage.cn5;
import defpackage.g76;
import defpackage.i5b;
import defpackage.lig;
import defpackage.mz1;
import defpackage.v9c;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.wgd;
import defpackage.y30;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/susi/ui/signIn/SignInFragment;", "Lcom/medium/android/core/fragments/AbstractMediumFragment;", "<init>", "()V", "BundleInfo", "susi_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SignInFragment extends cn5 {
    public lig u0;
    public final vq6 v0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0002\b\r\b\u0081\b\u0018\u00002\u00020\u0001B)\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u001d\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u001a\u0010\u0018\u001a\u00020\u00072\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u001a\u001a\u0004\b\u001b\u0010\u0013R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001a\u001a\u0004\b\u001c\u0010\u0013R\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001d\u001a\u0004\b\u001e\u0010\u001fR\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010 \u001a\u0004\b!\u0010\"¨\u0006#"}, d2 = {"Lcom/medium/android/susi/ui/signIn/SignInFragment$BundleInfo;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "", "referrerSource", "email", "Lcom/medium/android/core/susi/SusiDestination;", "susiDestination", "", "rememberMe", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/core/susi/SusiDestination;Z)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getReferrerSource", "getEmail", "Lcom/medium/android/core/susi/SusiDestination;", "getSusiDestination", "()Lcom/medium/android/core/susi/SusiDestination;", "Z", "getRememberMe", "()Z", "susi_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo {
        public static final int $stable = AbstractMediumFragment.BundleInfo.$stable;
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final String email;
        private final String referrerSource;
        private final boolean rememberMe;
        private final SusiDestination susiDestination;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo(parcel.readString(), parcel.readString(), (SusiDestination) parcel.readParcelable(BundleInfo.class.getClassLoader()), parcel.readInt() != 0);
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(String str, String str2, SusiDestination susiDestination, boolean z) {
            super(str);
            str.getClass();
            str2.getClass();
            this.referrerSource = str;
            this.email = str2;
            this.susiDestination = susiDestination;
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
            return g76.L(this.referrerSource, bundleInfo.referrerSource) && g76.L(this.email, bundleInfo.email) && g76.L(this.susiDestination, bundleInfo.susiDestination) && this.rememberMe == bundleInfo.rememberMe;
        }

        public final String getEmail() {
            return this.email;
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

        public int hashCode() {
            int iO = wgd.o(this.referrerSource.hashCode() * 31, 31, this.email);
            SusiDestination susiDestination = this.susiDestination;
            return ((iO + (susiDestination == null ? 0 : susiDestination.hashCode())) * 31) + (this.rememberMe ? 1231 : 1237);
        }

        public String toString() {
            String str = this.referrerSource;
            String str2 = this.email;
            SusiDestination susiDestination = this.susiDestination;
            boolean z = this.rememberMe;
            StringBuilder sbU = y30.u("BundleInfo(referrerSource=", str, ", email=", str2, ", susiDestination=");
            sbU.append(susiDestination);
            sbU.append(", rememberMe=");
            sbU.append(z);
            sbU.append(")");
            return sbU.toString();
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.referrerSource);
            dest.writeString(this.email);
            dest.writeParcelable(this.susiDestination, flags);
            dest.writeInt(this.rememberMe ? 1 : 0);
        }
    }

    public SignInFragment() {
        super(19);
        this.v0 = vx0.d0(yw6.NONE, new i5b(24, this));
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        super.B(layoutInflater, viewGroup, bundle);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new v9c(this, 0), true, -10944897));
        return composeView;
    }

    public final lig i1() {
        lig ligVar = this.u0;
        if (ligVar != null) {
            return ligVar;
        }
        g76.g0("susiRouter");
        throw null;
    }
}
