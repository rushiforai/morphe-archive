package com.medium.android.susi.ui.welcome;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.core.susi.SusiDestination;
import defpackage.b4d;
import defpackage.cn5;
import defpackage.doc;
import defpackage.g76;
import defpackage.lig;
import defpackage.mz1;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/susi/ui/welcome/SusiWelcomeFragment;", "Lcom/medium/android/core/fragments/AbstractMediumFragment;", "<init>", "()V", "BundleInfo", "susi_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SusiWelcomeFragment extends cn5 {
    public lig u0;
    public final vq6 v0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002B\u0019\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005¢\u0006\u0004\b\u0007\u0010\bJ\u001d\u0010\u000e\u001a\u00020\r2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u000bHÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0019\u001a\u0004\b\u001a\u0010\u0011R\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001b\u001a\u0004\b\u001c\u0010\u001d¨\u0006\u001e"}, d2 = {"Lcom/medium/android/susi/ui/welcome/SusiWelcomeFragment$BundleInfo;", "Landroid/os/Parcelable;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "", "referrerSource", "Lcom/medium/android/core/susi/SusiDestination;", "susiDestination", "<init>", "(Ljava/lang/String;Lcom/medium/android/core/susi/SusiDestination;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getReferrerSource", "Lcom/medium/android/core/susi/SusiDestination;", "getSusiDestination", "()Lcom/medium/android/core/susi/SusiDestination;", "susi_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo implements Parcelable {
        public static final int $stable = AbstractMediumFragment.BundleInfo.$stable;
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final String referrerSource;
        private final SusiDestination susiDestination;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo(parcel.readString(), (SusiDestination) parcel.readParcelable(BundleInfo.class.getClassLoader()));
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(String str, SusiDestination susiDestination) {
            super(str);
            str.getClass();
            this.referrerSource = str;
            this.susiDestination = susiDestination;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BundleInfo)) {
                return false;
            }
            BundleInfo bundleInfo = (BundleInfo) other;
            return g76.L(this.referrerSource, bundleInfo.referrerSource) && g76.L(this.susiDestination, bundleInfo.susiDestination);
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public final SusiDestination getSusiDestination() {
            return this.susiDestination;
        }

        public int hashCode() {
            int iHashCode = this.referrerSource.hashCode() * 31;
            SusiDestination susiDestination = this.susiDestination;
            return iHashCode + (susiDestination == null ? 0 : susiDestination.hashCode());
        }

        public String toString() {
            return "BundleInfo(referrerSource=" + this.referrerSource + ", susiDestination=" + this.susiDestination + ")";
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.referrerSource);
            dest.writeParcelable(this.susiDestination, flags);
        }
    }

    public SusiWelcomeFragment() {
        super(25);
        this.v0 = vx0.d0(yw6.NONE, new doc(5, this));
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        super.B(layoutInflater, viewGroup, bundle);
        a aVar = new a(this);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new b4d(this, aVar, 0), true, -671909159));
        return composeView;
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment
    public final AbstractMediumFragment.BundleInfo Y() {
        return (BundleInfo) this.v0.getValue();
    }
}
