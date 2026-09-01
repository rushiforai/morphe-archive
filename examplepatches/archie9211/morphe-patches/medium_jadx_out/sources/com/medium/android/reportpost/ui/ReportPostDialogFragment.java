package com.medium.android.reportpost.ui;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.medium.android.core.fragments.AbstractMediumFragment;
import defpackage.a3;
import defpackage.b09;
import defpackage.bd9;
import defpackage.cn;
import defpackage.eb8;
import defpackage.fn5;
import defpackage.g76;
import defpackage.i03;
import defpackage.i5b;
import defpackage.iq1;
import defpackage.j5b;
import defpackage.k5b;
import defpackage.ka1;
import defpackage.m40;
import defpackage.mz1;
import defpackage.n1b;
import defpackage.p13;
import defpackage.pj3;
import defpackage.v5b;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.wgd;
import defpackage.y30;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/reportpost/ui/ReportPostDialogFragment;", "Ld0;", "<init>", "()V", "BundleInfo", "reportpost_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ReportPostDialogFragment extends fn5 {
    public p13 H0;
    public i03 I0;
    public final vq6 J0;
    public final iq1 K0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0007\b\u0081\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0002¢\u0006\u0004\b\u0006\u0010\u0007J\u001d\u0010\r\u001a\u00020\f2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u001a\u0010\u0016\u001a\u00020\u00152\b\u0010\u0014\u001a\u0004\u0018\u00010\u0013HÖ\u0003¢\u0006\u0004\b\u0016\u0010\u0017R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0018\u001a\u0004\b\u0019\u0010\u0010R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0018\u001a\u0004\b\u001a\u0010\u0010R\u001a\u0010\u0005\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0005\u0010\u0018\u001a\u0004\b\u001b\u0010\u0010¨\u0006\u001c"}, d2 = {"Lcom/medium/android/reportpost/ui/ReportPostDialogFragment$BundleInfo;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "", "postId", "authorId", "referrerSource", "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "getAuthorId", "getReferrerSource", "reportpost_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo {
        public static final int $stable = AbstractMediumFragment.BundleInfo.$stable;
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final String authorId;
        private final String postId;
        private final String referrerSource;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo(parcel.readString(), parcel.readString(), parcel.readString());
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(String str, String str2, String str3) {
            super(str3);
            b09.I(str, str2, str3);
            this.postId = str;
            this.authorId = str2;
            this.referrerSource = str3;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BundleInfo)) {
                return false;
            }
            BundleInfo bundleInfo = (BundleInfo) other;
            return g76.L(this.postId, bundleInfo.postId) && g76.L(this.authorId, bundleInfo.authorId) && g76.L(this.referrerSource, bundleInfo.referrerSource);
        }

        public final String getAuthorId() {
            return this.authorId;
        }

        public final String getPostId() {
            return this.postId;
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public int hashCode() {
            return this.referrerSource.hashCode() + wgd.o(this.postId.hashCode() * 31, 31, this.authorId);
        }

        public String toString() {
            String str = this.postId;
            String str2 = this.authorId;
            return ka1.v(y30.u("BundleInfo(postId=", str, ", authorId=", str2, ", referrerSource="), this.referrerSource, ")");
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.postId);
            dest.writeString(this.authorId);
            dest.writeString(this.referrerSource);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public ReportPostDialogFragment() {
        yw6 yw6Var = yw6.NONE;
        this.J0 = vx0.d0(yw6Var, new i5b(0, this));
        a3 a3Var = new a3(this, new eb8(17, this), 0 == true ? 1 : 0, 24);
        vq6 vq6VarD0 = vx0.d0(yw6Var, new bd9(9, new bd9(8, this)));
        this.K0 = m40.I(this, n1b.a.b(v5b.class), new pj3(vq6VarD0, 8), new bd9(a3Var, vq6VarD0, 10), new cn(this, 19, vq6VarD0));
    }

    @Override // defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        k5b k5bVar = new k5b(this);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new j5b(this, k5bVar, 0), true, -2015243277));
        return composeView;
    }

    @Override // defpackage.d0
    public final void d0(BottomSheetBehavior bottomSheetBehavior) {
        bottomSheetBehavior.L(3);
        bottomSheetBehavior.K = true;
        bottomSheetBehavior.l = -1;
    }

    public final v5b g0() {
        return (v5b) this.K0.getValue();
    }
}
