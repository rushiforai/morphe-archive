package com.medium.android.reportuser.ui;

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
import defpackage.b7b;
import defpackage.bd9;
import defpackage.c7b;
import defpackage.cn;
import defpackage.eb8;
import defpackage.ev6;
import defpackage.g76;
import defpackage.i03;
import defpackage.i5b;
import defpackage.in5;
import defpackage.iq1;
import defpackage.m40;
import defpackage.mz1;
import defpackage.n1b;
import defpackage.o7b;
import defpackage.p13;
import defpackage.pj3;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/reportuser/ui/ReportUserDialogFragment;", "Ld0;", "<init>", "()V", "BundleInfo", "reportuser_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ReportUserDialogFragment extends in5 {
    public p13 H0;
    public i03 I0;
    public final vq6 J0;
    public final iq1 K0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0006\b\u0081\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002¢\u0006\u0004\b\u0005\u0010\u0006J\u001d\u0010\f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\t¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000e\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\tHÖ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u001a\u0010\u0015\u001a\u00020\u00142\b\u0010\u0013\u001a\u0004\u0018\u00010\u0012HÖ\u0003¢\u0006\u0004\b\u0015\u0010\u0016R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0017\u001a\u0004\b\u0018\u0010\u000fR\u001a\u0010\u0004\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0017\u001a\u0004\b\u0019\u0010\u000f¨\u0006\u001a"}, d2 = {"Lcom/medium/android/reportuser/ui/ReportUserDialogFragment$BundleInfo;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "", "userId", "referrerSource", "<init>", "(Ljava/lang/String;Ljava/lang/String;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getUserId", "getReferrerSource", "reportuser_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo {
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
            super(str2);
            str.getClass();
            str2.getClass();
            this.userId = str;
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
            return g76.L(this.userId, bundleInfo.userId) && g76.L(this.referrerSource, bundleInfo.referrerSource);
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public final String getUserId() {
            return this.userId;
        }

        public int hashCode() {
            return this.referrerSource.hashCode() + (this.userId.hashCode() * 31);
        }

        public String toString() {
            return ev6.y("BundleInfo(userId=", this.userId, ", referrerSource=", this.referrerSource, ")");
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.userId);
            dest.writeString(this.referrerSource);
        }
    }

    public ReportUserDialogFragment() {
        yw6 yw6Var = yw6.NONE;
        this.J0 = vx0.d0(yw6Var, new i5b(3, this));
        int i = 21;
        a3 a3Var = new a3(this, new eb8(i, this), false, 26);
        vq6 vq6VarD0 = vx0.d0(yw6Var, new bd9(15, new bd9(14, this)));
        this.K0 = m40.I(this, n1b.a.b(o7b.class), new pj3(vq6VarD0, 10), new bd9(a3Var, vq6VarD0, 16), new cn(this, i, vq6VarD0));
    }

    @Override // defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        c7b c7bVar = new c7b(this);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new b7b(this, c7bVar, 0), true, 1643081086));
        return composeView;
    }

    @Override // defpackage.d0
    public final void d0(BottomSheetBehavior bottomSheetBehavior) {
        bottomSheetBehavior.L(3);
        bottomSheetBehavior.K = true;
        bottomSheetBehavior.l = -1;
    }

    public final o7b g0() {
        return (o7b) this.K0.getValue();
    }
}
