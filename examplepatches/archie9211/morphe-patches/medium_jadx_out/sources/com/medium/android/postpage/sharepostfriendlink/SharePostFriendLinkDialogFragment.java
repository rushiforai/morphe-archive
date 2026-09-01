package com.medium.android.postpage.sharepostfriendlink;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.medium.android.common.ui.Ezz.Plbho;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.core.share.PostShareData;
import com.medium.android.postpage.sharepostfriendlink.SharePostFriendLinkDialogFragment;
import defpackage.bd9;
import defpackage.bx6;
import defpackage.g5c;
import defpackage.g76;
import defpackage.i03;
import defpackage.iq1;
import defpackage.km4;
import defpackage.ln5;
import defpackage.m40;
import defpackage.m45;
import defpackage.mz1;
import defpackage.n1b;
import defpackage.p13;
import defpackage.pj3;
import defpackage.sn2;
import defpackage.v5c;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.wgd;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/postpage/sharepostfriendlink/SharePostFriendLinkDialogFragment;", "Ld0;", "<init>", "()V", "BundleInfo", "postpage_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SharePostFriendLinkDialogFragment extends ln5 {
    public p13 H0;
    public final vq6 I0;
    public i03 J0;
    public sn2 K0;
    public final iq1 L0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\n\b\u0087\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0004¢\u0006\u0004\b\b\u0010\tJ\u001d\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\fHÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0014J\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001a\u001a\u0004\b\u001b\u0010\u001cR\u001a\u0010\u0005\u001a\u00020\u00048\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0005\u0010\u001d\u001a\u0004\b\u001e\u0010\u0012R\u0017\u0010\u0006\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001d\u001a\u0004\b\u001f\u0010\u0012R\u0017\u0010\u0007\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0007\u0010\u001d\u001a\u0004\b \u0010\u0012¨\u0006!"}, d2 = {"Lcom/medium/android/postpage/sharepostfriendlink/SharePostFriendLinkDialogFragment$BundleInfo;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "Lcom/medium/android/core/share/PostShareData;", "postShareData", "", "referrerSource", "source", "location", "<init>", "(Lcom/medium/android/core/share/PostShareData;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/core/share/PostShareData;", "getPostShareData", "()Lcom/medium/android/core/share/PostShareData;", "Ljava/lang/String;", "getReferrerSource", "getSource", "getLocation", "postpage_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo {
        public static final int $stable = AbstractMediumFragment.BundleInfo.$stable;
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final String location;
        private final PostShareData postShareData;
        private final String referrerSource;
        private final String source;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo((PostShareData) parcel.readParcelable(BundleInfo.class.getClassLoader()), parcel.readString(), parcel.readString(), parcel.readString());
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(PostShareData postShareData, String str, String str2, String str3) {
            super(str);
            postShareData.getClass();
            str.getClass();
            str2.getClass();
            str3.getClass();
            this.postShareData = postShareData;
            this.referrerSource = str;
            this.source = str2;
            this.location = str3;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BundleInfo)) {
                return false;
            }
            BundleInfo bundleInfo = (BundleInfo) other;
            return g76.L(this.postShareData, bundleInfo.postShareData) && g76.L(this.referrerSource, bundleInfo.referrerSource) && g76.L(this.source, bundleInfo.source) && g76.L(this.location, bundleInfo.location);
        }

        public final String getLocation() {
            return this.location;
        }

        public final PostShareData getPostShareData() {
            return this.postShareData;
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public final String getSource() {
            return this.source;
        }

        public int hashCode() {
            return this.location.hashCode() + wgd.o(wgd.o(this.postShareData.hashCode() * 31, 31, this.referrerSource), 31, this.source);
        }

        public String toString() {
            PostShareData postShareData = this.postShareData;
            String str = this.referrerSource;
            String str2 = this.source;
            String str3 = this.location;
            StringBuilder sb = new StringBuilder("BundleInfo(postShareData=");
            sb.append(postShareData);
            sb.append(", referrerSource=");
            sb.append(str);
            sb.append(", source=");
            return km4.C(sb, str2, ", location=", str3, ")");
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeParcelable(this.postShareData, flags);
            dest.writeString(this.referrerSource);
            dest.writeString(this.source);
            dest.writeString(this.location);
        }
    }

    public SharePostFriendLinkDialogFragment() {
        yw6 yw6Var = yw6.NONE;
        final int i = 0;
        this.I0 = vx0.d0(yw6Var, new m45(this) { // from class: f5c
            public final /* synthetic */ SharePostFriendLinkDialogFragment b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i2 = i;
                SharePostFriendLinkDialogFragment sharePostFriendLinkDialogFragment = this.b;
                switch (i2) {
                    case 0:
                        Parcelable parcelable = (Parcelable) ht2.r0(dm2.F(sharePostFriendLinkDialogFragment), "bundle_info", SharePostFriendLinkDialogFragment.BundleInfo.class);
                        if (parcelable != null) {
                            return (SharePostFriendLinkDialogFragment.BundleInfo) parcelable;
                        }
                        ay0.e(Plbho.Wznh);
                        return null;
                    default:
                        sn2 sn2Var = sharePostFriendLinkDialogFragment.K0;
                        if (sn2Var == null) {
                            g76.g0("vmFactory");
                            throw null;
                        }
                        PostShareData postShareData = sharePostFriendLinkDialogFragment.g0().getPostShareData();
                        String referrerSource = sharePostFriendLinkDialogFragment.g0().getReferrerSource();
                        String source = sharePostFriendLinkDialogFragment.g0().getSource();
                        String location = sharePostFriendLinkDialogFragment.g0().getLocation();
                        ko2 ko2Var = sn2Var.a.b;
                        gn9 gn9Var = (gn9) ko2Var.u.get();
                        l95 l95VarG = ko2Var.g();
                        i03 i03Var = i03.a;
                        return new v5c(postShareData, referrerSource, source, location, gn9Var, l95VarG, ko2Var.q());
                }
            }
        });
        final int i2 = 1;
        bx6 bx6Var = new bx6(7, new m45(this) { // from class: f5c
            public final /* synthetic */ SharePostFriendLinkDialogFragment b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i22 = i2;
                SharePostFriendLinkDialogFragment sharePostFriendLinkDialogFragment = this.b;
                switch (i22) {
                    case 0:
                        Parcelable parcelable = (Parcelable) ht2.r0(dm2.F(sharePostFriendLinkDialogFragment), "bundle_info", SharePostFriendLinkDialogFragment.BundleInfo.class);
                        if (parcelable != null) {
                            return (SharePostFriendLinkDialogFragment.BundleInfo) parcelable;
                        }
                        ay0.e(Plbho.Wznh);
                        return null;
                    default:
                        sn2 sn2Var = sharePostFriendLinkDialogFragment.K0;
                        if (sn2Var == null) {
                            g76.g0("vmFactory");
                            throw null;
                        }
                        PostShareData postShareData = sharePostFriendLinkDialogFragment.g0().getPostShareData();
                        String referrerSource = sharePostFriendLinkDialogFragment.g0().getReferrerSource();
                        String source = sharePostFriendLinkDialogFragment.g0().getSource();
                        String location = sharePostFriendLinkDialogFragment.g0().getLocation();
                        ko2 ko2Var = sn2Var.a.b;
                        gn9 gn9Var = (gn9) ko2Var.u.get();
                        l95 l95VarG = ko2Var.g();
                        i03 i03Var = i03.a;
                        return new v5c(postShareData, referrerSource, source, location, gn9Var, l95VarG, ko2Var.q());
                }
            }
        });
        vq6 vq6VarD0 = vx0.d0(yw6Var, new bd9(21, new bd9(20, this)));
        this.L0 = m40.I(this, n1b.a.b(v5c.class), new pj3(vq6VarD0, 12), new pj3(vq6VarD0, 13), bx6Var);
    }

    @Override // defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        a aVar = new a(this);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new g5c(this, aVar, 0), true, -664564517));
        return composeView;
    }

    @Override // defpackage.d0
    public final void d0(BottomSheetBehavior bottomSheetBehavior) {
        bottomSheetBehavior.L(3);
        bottomSheetBehavior.K = true;
    }

    public final BundleInfo g0() {
        return (BundleInfo) this.I0.getValue();
    }
}
