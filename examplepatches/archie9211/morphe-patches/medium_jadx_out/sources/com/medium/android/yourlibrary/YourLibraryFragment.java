package com.medium.android.yourlibrary;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.yourlibrary.YourLibraryFragment;
import defpackage.ay0;
import defpackage.bsb;
import defpackage.dm2;
import defpackage.f4e;
import defpackage.g76;
import defpackage.ht2;
import defpackage.k40;
import defpackage.ka1;
import defpackage.m45;
import defpackage.mz1;
import defpackage.o7f;
import defpackage.ood;
import defpackage.pn5;
import defpackage.r6c;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u00012\u00020\u0002:\u0002\u0005\u0006B\u0007¢\u0006\u0004\b\u0003\u0010\u0004¨\u0006\t²\u0006\f\u0010\b\u001a\u00020\u00078\nX\u008a\u0084\u0002"}, d2 = {"Lcom/medium/android/yourlibrary/YourLibraryFragment;", "Lcom/medium/android/core/fragments/AbstractMediumFragment;", "Lbsb;", "<init>", "()V", "BundleInfo", "com/medium/android/yourlibrary/c", "Lvj3;", "bottomMargin", "yourlibrary_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class YourLibraryFragment extends pn5 implements bsb {
    public final vq6 u0;
    public final r6c v0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\b\u0083\b\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0004¢\u0006\u0004\b\u0007\u0010\bJ\u001d\u0010\u000e\u001a\u00020\r2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u000bHÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\u001bR\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001c\u001a\u0004\b\u001d\u0010\u0011R\u001a\u0010\u0006\u001a\u00020\u00048\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0006\u0010\u001c\u001a\u0004\b\u001e\u0010\u0011¨\u0006\u001f"}, d2 = {"Lcom/medium/android/yourlibrary/YourLibraryFragment$BundleInfo;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "Lcom/medium/android/yourlibrary/YourLibraryTab;", "preselectedTab", "", "digestId", "referrerSource", "<init>", "(Lcom/medium/android/yourlibrary/YourLibraryTab;Ljava/lang/String;Ljava/lang/String;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/yourlibrary/YourLibraryTab;", "getPreselectedTab", "()Lcom/medium/android/yourlibrary/YourLibraryTab;", "Ljava/lang/String;", "getDigestId", "getReferrerSource", "yourlibrary_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo {
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final String digestId;
        private final YourLibraryTab preselectedTab;
        private final String referrerSource;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo(YourLibraryTab.valueOf(parcel.readString()), parcel.readString(), parcel.readString());
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(YourLibraryTab yourLibraryTab, String str, String str2) {
            super(str2);
            yourLibraryTab.getClass();
            str2.getClass();
            this.preselectedTab = yourLibraryTab;
            this.digestId = str;
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
            return this.preselectedTab == bundleInfo.preselectedTab && g76.L(this.digestId, bundleInfo.digestId) && g76.L(this.referrerSource, bundleInfo.referrerSource);
        }

        public final String getDigestId() {
            return this.digestId;
        }

        public final YourLibraryTab getPreselectedTab() {
            return this.preselectedTab;
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public int hashCode() {
            int iHashCode = this.preselectedTab.hashCode() * 31;
            String str = this.digestId;
            return this.referrerSource.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
        }

        public String toString() {
            YourLibraryTab yourLibraryTab = this.preselectedTab;
            String str = this.digestId;
            String str2 = this.referrerSource;
            StringBuilder sb = new StringBuilder("BundleInfo(preselectedTab=");
            sb.append(yourLibraryTab);
            sb.append(", digestId=");
            sb.append(str);
            sb.append(", referrerSource=");
            return ka1.v(sb, str2, ")");
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.preselectedTab.name());
            dest.writeString(this.digestId);
            dest.writeString(this.referrerSource);
        }
    }

    public YourLibraryFragment() {
        super(10);
        this.u0 = vx0.d0(yw6.NONE, new m45() { // from class: com.medium.android.yourlibrary.a
            @Override // defpackage.m45
            public final Object invoke() {
                Parcelable parcelable = (Parcelable) ht2.r0(dm2.F(this.a), "bundle_info", YourLibraryFragment.BundleInfo.class);
                if (parcelable != null) {
                    return (YourLibraryFragment.BundleInfo) parcelable;
                }
                ay0.e("Required 'bundle_info' is null.");
                return null;
            }
        });
        this.v0 = k40.x(0, 7, null);
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        super.B(layoutInflater, viewGroup, bundle);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new f4e(11, this), true, 2049758983));
        return composeView;
    }

    @Override // defpackage.bsb
    public final void b() {
        vx0.c0(o7f.x(q()), null, null, new ood(this, null, 10), 3);
    }
}
