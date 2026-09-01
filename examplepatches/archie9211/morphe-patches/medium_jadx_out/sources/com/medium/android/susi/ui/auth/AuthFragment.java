package com.medium.android.susi.ui.auth;

import android.content.SharedPreferences;
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
import defpackage.aa7;
import defpackage.ac0;
import defpackage.f94;
import defpackage.g76;
import defpackage.i03;
import defpackage.iq1;
import defpackage.km5;
import defpackage.l8;
import defpackage.lig;
import defpackage.m50;
import defpackage.mz1;
import defpackage.n01;
import defpackage.o41;
import defpackage.py2;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.w3;
import defpackage.yw6;
import defpackage.zg7;
import defpackage.zi5;
import java.util.Date;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/susi/ui/auth/AuthFragment;", "Lcom/medium/android/core/fragments/AbstractMediumFragment;", "<init>", "()V", "BundleInfo", "susi_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class AuthFragment extends km5 {
    public lig A0;
    public final vq6 B0;
    public String u0;
    public List v0;
    public o41 w0;
    public aa7 x0;
    public py2 y0;
    public i03 z0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    /* JADX INFO: loaded from: classes4.dex */
    @Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\b\u0087\b\u0018\u00002\u00020\u00012\u00020\u0002B!\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u001d\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0003HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u001a\u0010\u0019\u001a\u00020\u00182\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016HÖ\u0003¢\u0006\u0004\b\u0019\u0010\u001aR\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u001b\u001a\u0004\b\u001c\u0010\u0013R\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001d\u001a\u0004\b\u001e\u0010\u001fR\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010 \u001a\u0004\b!\u0010\"¨\u0006#"}, d2 = {"Lcom/medium/android/susi/ui/auth/AuthFragment$BundleInfo;", "Landroid/os/Parcelable;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "", "referrerSource", "Lcom/medium/android/core/susi/SusiDestination;", "susiDestination", "Lcom/medium/android/core/susi/SusiOperation;", "susiOperation", "<init>", "(Ljava/lang/String;Lcom/medium/android/core/susi/SusiDestination;Lcom/medium/android/core/susi/SusiOperation;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getReferrerSource", "Lcom/medium/android/core/susi/SusiDestination;", "getSusiDestination", "()Lcom/medium/android/core/susi/SusiDestination;", "Lcom/medium/android/core/susi/SusiOperation;", "getSusiOperation", "()Lcom/medium/android/core/susi/SusiOperation;", "susi_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo implements Parcelable {
        public static final int $stable = AbstractMediumFragment.BundleInfo.$stable;
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final String referrerSource;
        private final SusiDestination susiDestination;
        private final SusiOperation susiOperation;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo(parcel.readString(), (SusiDestination) parcel.readParcelable(BundleInfo.class.getClassLoader()), SusiOperation.valueOf(parcel.readString()));
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(String str, SusiDestination susiDestination, SusiOperation susiOperation) {
            super(str);
            str.getClass();
            susiOperation.getClass();
            this.referrerSource = str;
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
            return g76.L(this.referrerSource, bundleInfo.referrerSource) && g76.L(this.susiDestination, bundleInfo.susiDestination) && this.susiOperation == bundleInfo.susiOperation;
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

        public int hashCode() {
            int iHashCode = this.referrerSource.hashCode() * 31;
            SusiDestination susiDestination = this.susiDestination;
            return this.susiOperation.hashCode() + ((iHashCode + (susiDestination == null ? 0 : susiDestination.hashCode())) * 31);
        }

        public String toString() {
            return "BundleInfo(referrerSource=" + this.referrerSource + ", susiDestination=" + this.susiDestination + ", susiOperation=" + this.susiOperation + ")";
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.referrerSource);
            dest.writeParcelable(this.susiDestination, flags);
            dest.writeString(this.susiOperation.name());
        }
    }

    public AuthFragment() {
        super(12);
        this.B0 = vx0.d0(yw6.NONE, new l8(13, this));
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        super.B(layoutInflater, viewGroup, bundle);
        zg7 zg7Var = new zg7(12, this);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new ac0(this, zg7Var, 0), true, 1085401933));
        return composeView;
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final void C() {
        super.C();
        if (f94.q.get()) {
            try {
                if (this.x0 == null) {
                    g76.g0("facebookLoginManager");
                    throw null;
                }
                o41 o41Var = this.w0;
                if (o41Var == null) {
                    g76.g0("facebookCallbackManager");
                    throw null;
                }
                aa7.f(o41Var);
                aa7 aa7Var = this.x0;
                if (aa7Var == null) {
                    g76.g0("facebookLoginManager");
                    throw null;
                }
                Date date = w3.l;
                iq1.i.t().R(null, true);
                n01.h0(null);
                m50.o.T().N(null, true);
                SharedPreferences.Editor editorEdit = aa7Var.c.edit();
                editorEdit.putBoolean("express_login_allowed", false);
                editorEdit.apply();
            } catch (Exception unused) {
            }
        }
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment
    public final AbstractMediumFragment.BundleInfo Y() {
        return (BundleInfo) this.B0.getValue();
    }

    public final lig i1() {
        lig ligVar = this.A0;
        if (ligVar != null) {
            return ligVar;
        }
        g76.g0("susiRouter");
        throw null;
    }
}
