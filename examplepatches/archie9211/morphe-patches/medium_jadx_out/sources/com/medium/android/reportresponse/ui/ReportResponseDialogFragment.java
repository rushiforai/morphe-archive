package com.medium.android.reportresponse.ui;

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
import defpackage.a7b;
import defpackage.bd9;
import defpackage.cn;
import defpackage.eb8;
import defpackage.g76;
import defpackage.hn5;
import defpackage.i03;
import defpackage.i5b;
import defpackage.iq1;
import defpackage.ka1;
import defpackage.l6b;
import defpackage.m40;
import defpackage.m6b;
import defpackage.mz1;
import defpackage.n1b;
import defpackage.p13;
import defpackage.pj3;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.wgd;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/reportresponse/ui/ReportResponseDialogFragment;", "Ld0;", "<init>", "()V", "BundleInfo", "reportresponse_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ReportResponseDialogFragment extends hn5 {
    public p13 H0;
    public i03 I0;
    public final vq6 J0;
    public final iq1 K0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\b\u0081\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0004¢\u0006\u0004\b\u0007\u0010\bJ\u001d\u0010\u000e\u001a\u00020\r2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u000bHÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\u001bR\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001c\u001a\u0004\b\u001d\u0010\u0011R\u001a\u0010\u0006\u001a\u00020\u00048\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0006\u0010\u001c\u001a\u0004\b\u001e\u0010\u0011¨\u0006\u001f"}, d2 = {"Lcom/medium/android/reportresponse/ui/ReportResponseDialogFragment$BundleInfo;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "Lcom/medium/android/reportresponse/ui/ReportResponseReference;", "reportResponseReference", "", "authorId", "referrerSource", "<init>", "(Lcom/medium/android/reportresponse/ui/ReportResponseReference;Ljava/lang/String;Ljava/lang/String;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/reportresponse/ui/ReportResponseReference;", "getReportResponseReference", "()Lcom/medium/android/reportresponse/ui/ReportResponseReference;", "Ljava/lang/String;", "getAuthorId", "getReferrerSource", "reportresponse_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo {
        public static final int $stable = AbstractMediumFragment.BundleInfo.$stable;
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final String authorId;
        private final String referrerSource;
        private final ReportResponseReference reportResponseReference;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo((ReportResponseReference) parcel.readParcelable(BundleInfo.class.getClassLoader()), parcel.readString(), parcel.readString());
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(ReportResponseReference reportResponseReference, String str, String str2) {
            super(str2);
            reportResponseReference.getClass();
            str.getClass();
            str2.getClass();
            this.reportResponseReference = reportResponseReference;
            this.authorId = str;
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
            return g76.L(this.reportResponseReference, bundleInfo.reportResponseReference) && g76.L(this.authorId, bundleInfo.authorId) && g76.L(this.referrerSource, bundleInfo.referrerSource);
        }

        public final String getAuthorId() {
            return this.authorId;
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public final ReportResponseReference getReportResponseReference() {
            return this.reportResponseReference;
        }

        public int hashCode() {
            return this.referrerSource.hashCode() + wgd.o(this.reportResponseReference.hashCode() * 31, 31, this.authorId);
        }

        public String toString() {
            ReportResponseReference reportResponseReference = this.reportResponseReference;
            String str = this.authorId;
            String str2 = this.referrerSource;
            StringBuilder sb = new StringBuilder("BundleInfo(reportResponseReference=");
            sb.append(reportResponseReference);
            sb.append(", authorId=");
            sb.append(str);
            sb.append(", referrerSource=");
            return ka1.v(sb, str2, ")");
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeParcelable(this.reportResponseReference, flags);
            dest.writeString(this.authorId);
            dest.writeString(this.referrerSource);
        }
    }

    public ReportResponseDialogFragment() {
        yw6 yw6Var = yw6.NONE;
        this.J0 = vx0.d0(yw6Var, new i5b(2, this));
        int i = 20;
        a3 a3Var = new a3(this, new eb8(i, this), false, 25);
        vq6 vq6VarD0 = vx0.d0(yw6Var, new bd9(12, new bd9(11, this)));
        this.K0 = m40.I(this, n1b.a.b(a7b.class), new pj3(vq6VarD0, 9), new bd9(a3Var, vq6VarD0, 13), new cn(this, i, vq6VarD0));
    }

    @Override // defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        m6b m6bVar = new m6b(this);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new l6b(this, m6bVar, 0), true, 1076646580));
        return composeView;
    }

    @Override // defpackage.d0
    public final void d0(BottomSheetBehavior bottomSheetBehavior) {
        bottomSheetBehavior.L(3);
        bottomSheetBehavior.K = true;
        bottomSheetBehavior.l = -1;
    }

    public final a7b g0() {
        return (a7b) this.K0.getValue();
    }
}
