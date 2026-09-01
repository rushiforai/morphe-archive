package com.medium.android.susi.ui.magicLinkConfirmation;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import defpackage.em4;
import defpackage.g76;
import defpackage.gd7;
import defpackage.km5;
import defpackage.lig;
import defpackage.mz1;
import defpackage.py2;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.wgd;
import defpackage.y30;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/susi/ui/magicLinkConfirmation/MagicLinkConfirmationFragment;", "Lcom/medium/android/core/fragments/AbstractMediumFragment;", "<init>", "()V", "BundleInfo", "susi_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class MagicLinkConfirmationFragment extends km5 {
    public lig u0;
    public py2 v0;
    public final vq6 w0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\f\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002B+\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\t\u001a\u0004\u0018\u00010\b¢\u0006\u0004\b\n\u0010\u000bJ\u001d\u0010\u0011\u001a\u00020\u00102\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000e¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0014J\u0010\u0010\u0015\u001a\u00020\u000eHÖ\u0001¢\u0006\u0004\b\u0015\u0010\u0016J\u001a\u0010\u001a\u001a\u00020\u00192\b\u0010\u0018\u001a\u0004\u0018\u00010\u0017HÖ\u0003¢\u0006\u0004\b\u001a\u0010\u001bR\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u001c\u001a\u0004\b\u001d\u0010\u0014R\u0017\u0010\u0005\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001c\u001a\u0004\b\u001e\u0010\u0014R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010\u001f\u001a\u0004\b \u0010!R\u0019\u0010\t\u001a\u0004\u0018\u00010\b8\u0006¢\u0006\f\n\u0004\b\t\u0010\"\u001a\u0004\b#\u0010$¨\u0006%"}, d2 = {"Lcom/medium/android/susi/ui/magicLinkConfirmation/MagicLinkConfirmationFragment$BundleInfo;", "Landroid/os/Parcelable;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "", "referrerSource", "token", "Lcom/medium/android/core/susi/SusiDestination;", "susiDestination", "Lcom/medium/android/core/susi/SusiOperation;", "susiOperation", "<init>", "(Ljava/lang/String;Ljava/lang/String;Lcom/medium/android/core/susi/SusiDestination;Lcom/medium/android/core/susi/SusiOperation;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getReferrerSource", "getToken", "Lcom/medium/android/core/susi/SusiDestination;", "getSusiDestination", "()Lcom/medium/android/core/susi/SusiDestination;", "Lcom/medium/android/core/susi/SusiOperation;", "getSusiOperation", "()Lcom/medium/android/core/susi/SusiOperation;", "susi_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo implements Parcelable {
        public static final int $stable = AbstractMediumFragment.BundleInfo.$stable;
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final String referrerSource;
        private final SusiDestination susiDestination;
        private final SusiOperation susiOperation;
        private final String token;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo(parcel.readString(), parcel.readString(), (SusiDestination) parcel.readParcelable(BundleInfo.class.getClassLoader()), parcel.readInt() == 0 ? null : SusiOperation.valueOf(parcel.readString()));
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(String str, String str2, SusiDestination susiDestination, SusiOperation susiOperation) {
            super(str);
            str.getClass();
            str2.getClass();
            this.referrerSource = str;
            this.token = str2;
            this.susiDestination = susiDestination;
            this.susiOperation = susiOperation;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BundleInfo)) {
                return false;
            }
            BundleInfo bundleInfo = (BundleInfo) other;
            return g76.L(this.referrerSource, bundleInfo.referrerSource) && g76.L(this.token, bundleInfo.token) && g76.L(this.susiDestination, bundleInfo.susiDestination) && this.susiOperation == bundleInfo.susiOperation;
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public final SusiDestination getSusiDestination() {
            return this.susiDestination;
        }

        public final SusiOperation getSusiOperation() {
            return this.susiOperation;
        }

        public final String getToken() {
            return this.token;
        }

        public int hashCode() {
            int iO = wgd.o(this.referrerSource.hashCode() * 31, 31, this.token);
            SusiDestination susiDestination = this.susiDestination;
            int iHashCode = (iO + (susiDestination == null ? 0 : susiDestination.hashCode())) * 31;
            SusiOperation susiOperation = this.susiOperation;
            return iHashCode + (susiOperation != null ? susiOperation.hashCode() : 0);
        }

        public String toString() {
            String str = this.referrerSource;
            String str2 = this.token;
            SusiDestination susiDestination = this.susiDestination;
            SusiOperation susiOperation = this.susiOperation;
            StringBuilder sbU = y30.u("BundleInfo(referrerSource=", str, ", token=", str2, ", susiDestination=");
            sbU.append(susiDestination);
            sbU.append(", susiOperation=");
            sbU.append(susiOperation);
            sbU.append(")");
            return sbU.toString();
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.referrerSource);
            dest.writeString(this.token);
            dest.writeParcelable(this.susiDestination, flags);
            SusiOperation susiOperation = this.susiOperation;
            if (susiOperation == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(susiOperation.name());
            }
        }
    }

    public MagicLinkConfirmationFragment() {
        super(28);
        this.w0 = vx0.d0(yw6.NONE, new em4(19, this));
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        super.B(layoutInflater, viewGroup, bundle);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new gd7(this, 0), true, -1379071953));
        return composeView;
    }
}
