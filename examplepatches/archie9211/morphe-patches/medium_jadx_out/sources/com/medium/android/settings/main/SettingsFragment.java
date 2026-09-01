package com.medium.android.settings.main;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.core.fragments.AbstractMediumFragment;
import defpackage.a3;
import defpackage.bd9;
import defpackage.c2c;
import defpackage.cn;
import defpackage.cn5;
import defpackage.d2c;
import defpackage.ev6;
import defpackage.f3c;
import defpackage.g76;
import defpackage.hu7;
import defpackage.i03;
import defpackage.i5b;
import defpackage.iq1;
import defpackage.m40;
import defpackage.mz1;
import defpackage.n1b;
import defpackage.pj3;
import defpackage.py2;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.xpc;
import defpackage.yi3;
import defpackage.yw6;
import defpackage.zi5;
import defpackage.zzb;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0007²\u0006\f\u0010\u0006\u001a\u00020\u00058\nX\u008a\u0084\u0002"}, d2 = {"Lcom/medium/android/settings/main/SettingsFragment;", "Lcom/medium/android/core/fragments/AbstractMediumFragment;", "<init>", "()V", "BundleInfo", "Lvj3;", "bottomMargin", "settings_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SettingsFragment extends cn5 {
    public i03 u0;
    public py2 v0;
    public yi3 w0;
    public List x0;
    public final vq6 y0;
    public final iq1 z0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\b\u0087\b\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u001d\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\r\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\bHÖ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u001a\u0010\u0014\u001a\u00020\u00132\b\u0010\u0012\u001a\u0004\u0018\u00010\u0011HÖ\u0003¢\u0006\u0004\b\u0014\u0010\u0015R\u001a\u0010\u0003\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0016\u001a\u0004\b\u0017\u0010\u000e¨\u0006\u0018"}, d2 = {"Lcom/medium/android/settings/main/SettingsFragment$BundleInfo;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "", "referrerSource", "<init>", "(Ljava/lang/String;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getReferrerSource", "settings_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
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

    public SettingsFragment() {
        super(18);
        yw6 yw6Var = yw6.NONE;
        this.y0 = vx0.d0(yw6Var, new i5b(20, this));
        a3 a3Var = new a3(this, new zzb(1, this), false, 27);
        vq6 vq6VarD0 = vx0.d0(yw6Var, new bd9(18, new bd9(17, this)));
        this.z0 = m40.I(this, n1b.a.b(f3c.class), new pj3(vq6VarD0, 11), new bd9(a3Var, vq6VarD0, 19), new cn(this, 22, vq6VarD0));
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        super.B(layoutInflater, viewGroup, bundle);
        d2c d2cVar = new d2c(this);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new c2c(this, d2cVar, 0), true, 229032029));
        return composeView;
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final void I() {
        super.I();
        f3c f3cVarJ1 = j1();
        xpc xpcVar = f3cVarJ1.C;
        Boolean boolValueOf = Boolean.valueOf(f3cVarJ1.p.b());
        xpcVar.getClass();
        xpcVar.m(null, boolValueOf);
    }

    public final hu7 i1() {
        i03 i03Var = this.u0;
        if (i03Var != null) {
            return i03Var;
        }
        g76.g0("mediumUris");
        throw null;
    }

    public final f3c j1() {
        return (f3c) this.z0.getValue();
    }
}
