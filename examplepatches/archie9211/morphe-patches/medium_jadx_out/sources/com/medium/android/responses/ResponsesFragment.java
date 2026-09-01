package com.medium.android.responses;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.core.navigation.ResponsesReference;
import com.medium.android.donkey.main.MainActivity;
import com.medium.android.responses.ResponsesFragment;
import defpackage.ay0;
import defpackage.cn5;
import defpackage.dm2;
import defpackage.g76;
import defpackage.ht2;
import defpackage.i03;
import defpackage.m45;
import defpackage.mz1;
import defpackage.pma;
import defpackage.py2;
import defpackage.tfb;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0007\u0018\u00002\u00020\u0001:\u0002\u0004\u0005B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0006"}, d2 = {"Lcom/medium/android/responses/ResponsesFragment;", "Lcom/medium/android/core/fragments/AbstractMediumFragment;", "<init>", "()V", "com/medium/android/responses/c", "BundleInfo", "responses_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class ResponsesFragment extends cn5 {
    public py2 u0;
    public i03 v0;
    public final vq6 w0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\b\u0083\b\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u001d\u0010\r\u001a\u00020\f2\u0006\u0010\t\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\nHÖ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u001a\u0010\u0016\u001a\u00020\u00152\b\u0010\u0014\u001a\u0004\u0018\u00010\u0013HÖ\u0003¢\u0006\u0004\b\u0016\u0010\u0017R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0018\u001a\u0004\b\u0019\u0010\u001aR\u001a\u0010\u0005\u001a\u00020\u00048\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0005\u0010\u001b\u001a\u0004\b\u001c\u0010\u0010¨\u0006\u001d"}, d2 = {"Lcom/medium/android/responses/ResponsesFragment$BundleInfo;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "Lcom/medium/android/core/navigation/ResponsesReference;", "responsesReference", "", "referrerSource", "<init>", "(Lcom/medium/android/core/navigation/ResponsesReference;Ljava/lang/String;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/core/navigation/ResponsesReference;", "getResponsesReference", "()Lcom/medium/android/core/navigation/ResponsesReference;", "Ljava/lang/String;", "getReferrerSource", "responses_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo {
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final String referrerSource;
        private final ResponsesReference responsesReference;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo((ResponsesReference) parcel.readParcelable(BundleInfo.class.getClassLoader()), parcel.readString());
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(ResponsesReference responsesReference, String str) {
            super(str);
            responsesReference.getClass();
            str.getClass();
            this.responsesReference = responsesReference;
            this.referrerSource = str;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BundleInfo)) {
                return false;
            }
            BundleInfo bundleInfo = (BundleInfo) other;
            return g76.L(this.responsesReference, bundleInfo.responsesReference) && g76.L(this.referrerSource, bundleInfo.referrerSource);
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public final ResponsesReference getResponsesReference() {
            return this.responsesReference;
        }

        public int hashCode() {
            return this.referrerSource.hashCode() + (this.responsesReference.hashCode() * 31);
        }

        public String toString() {
            return "BundleInfo(responsesReference=" + this.responsesReference + ", referrerSource=" + this.referrerSource + ")";
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeParcelable(this.responsesReference, flags);
            dest.writeString(this.referrerSource);
        }
    }

    public ResponsesFragment() {
        super(16);
        this.w0 = vx0.d0(yw6.NONE, new m45() { // from class: com.medium.android.responses.a
            @Override // defpackage.m45
            public final Object invoke() {
                Parcelable parcelable = (Parcelable) ht2.r0(dm2.F(this.a), "bundle_info", ResponsesFragment.BundleInfo.class);
                if (parcelable != null) {
                    return (ResponsesFragment.BundleInfo) parcelable;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            }
        });
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        super.B(layoutInflater, viewGroup, bundle);
        tfb tfbVar = new tfb(this);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new pma(this, 19, tfbVar), true, -912491939));
        return composeView;
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final void H() {
        MainActivity mainActivity = (MainActivity) Q();
        mainActivity.x(true);
        mainActivity.y(true);
        super.H();
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final void I() {
        super.I();
        MainActivity mainActivity = (MainActivity) Q();
        mainActivity.x(false);
        mainActivity.y(false);
    }
}
