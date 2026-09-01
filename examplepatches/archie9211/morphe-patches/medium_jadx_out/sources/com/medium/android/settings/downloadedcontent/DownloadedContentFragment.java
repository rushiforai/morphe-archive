package com.medium.android.settings.downloadedcontent;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.settings.downloadedcontent.DownloadedContentFragment;
import defpackage.ev6;
import defpackage.g76;
import defpackage.iq1;
import defpackage.ir;
import defpackage.km5;
import defpackage.m40;
import defpackage.m45;
import defpackage.mz1;
import defpackage.n1b;
import defpackage.nj3;
import defpackage.pj3;
import defpackage.tj3;
import defpackage.un2;
import defpackage.v2;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/settings/downloadedcontent/DownloadedContentFragment;", "Lcom/medium/android/core/fragments/AbstractMediumFragment;", "<init>", "()V", "BundleInfo", "settings_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class DownloadedContentFragment extends km5 {
    public final vq6 u0;
    public un2 v0;
    public final iq1 w0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u001d\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\r\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\bHÖ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011HÖ\u0003¢\u0006\u0004\b\u0014\u0010\u0015R\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0016\u001a\u0004\b\u0017\u0010\u000e¨\u0006\u0018"}, d2 = {"Lcom/medium/android/settings/downloadedcontent/DownloadedContentFragment$BundleInfo;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "", "referrerSource", "<init>", "(Ljava/lang/String;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getReferrerSource", "settings_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo {
        public static final int $stable = AbstractMediumFragment.BundleInfo.$stable;
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final String referrerSource;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo(parcel.readString());
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(String str) {
            super(str);
            str.getClass();
            this.referrerSource = str;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            return (other instanceof BundleInfo) && g76.L(this.referrerSource, ((BundleInfo) other).referrerSource);
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public int hashCode() {
            return this.referrerSource.hashCode();
        }

        public String toString() {
            return ev6.x("BundleInfo(referrerSource=", this.referrerSource, ")");
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.referrerSource);
        }
    }

    public DownloadedContentFragment() {
        super(17);
        yw6 yw6Var = yw6.NONE;
        final int i = 0;
        this.u0 = vx0.d0(yw6Var, new m45(this) { // from class: mj3
            public final /* synthetic */ DownloadedContentFragment b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i2 = i;
                DownloadedContentFragment downloadedContentFragment = this.b;
                switch (i2) {
                    case 0:
                        Parcelable parcelable = (Parcelable) ht2.r0(dm2.F(downloadedContentFragment), "bundle_info", DownloadedContentFragment.BundleInfo.class);
                        if (parcelable != null) {
                            return (DownloadedContentFragment.BundleInfo) parcelable;
                        }
                        ay0.e("Required 'bundle_info' is null.");
                        return null;
                    default:
                        un2 un2Var = downloadedContentFragment.v0;
                        if (un2Var != null) {
                            return new tj3(((DownloadedContentFragment.BundleInfo) downloadedContentFragment.u0.getValue()).getReferrerSource(), un2Var.a.b.n());
                        }
                        g76.g0("vmFactory");
                        throw null;
                }
            }
        });
        final int i2 = 1;
        int i3 = 12;
        v2 v2Var = new v2(i3, new m45(this) { // from class: mj3
            public final /* synthetic */ DownloadedContentFragment b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i22 = i2;
                DownloadedContentFragment downloadedContentFragment = this.b;
                switch (i22) {
                    case 0:
                        Parcelable parcelable = (Parcelable) ht2.r0(dm2.F(downloadedContentFragment), "bundle_info", DownloadedContentFragment.BundleInfo.class);
                        if (parcelable != null) {
                            return (DownloadedContentFragment.BundleInfo) parcelable;
                        }
                        ay0.e("Required 'bundle_info' is null.");
                        return null;
                    default:
                        un2 un2Var = downloadedContentFragment.v0;
                        if (un2Var != null) {
                            return new tj3(((DownloadedContentFragment.BundleInfo) downloadedContentFragment.u0.getValue()).getReferrerSource(), un2Var.a.b.n());
                        }
                        g76.g0("vmFactory");
                        throw null;
                }
            }
        });
        vq6 vq6VarD0 = vx0.d0(yw6Var, new ir(i3, new ir(11, this)));
        this.w0 = m40.I(this, n1b.a.b(tj3.class), new pj3(vq6VarD0, 0), new pj3(vq6VarD0, 1), v2Var);
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        super.B(layoutInflater, viewGroup, bundle);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new nj3(this, 0), true, -2038658358));
        return composeView;
    }
}
