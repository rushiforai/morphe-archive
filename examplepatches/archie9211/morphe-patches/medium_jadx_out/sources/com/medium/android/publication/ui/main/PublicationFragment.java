package com.medium.android.publication.ui.main;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.core.navigation.PublicationReference;
import com.medium.android.core.navigation.PublicationTab;
import defpackage.cn5;
import defpackage.g76;
import defpackage.jia;
import defpackage.kia;
import defpackage.mz1;
import defpackage.py2;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.wgd;
import defpackage.yj8;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0007²\u0006\f\u0010\u0006\u001a\u00020\u00058\nX\u008a\u0084\u0002"}, d2 = {"Lcom/medium/android/publication/ui/main/PublicationFragment;", "Lcom/medium/android/core/fragments/AbstractMediumFragment;", "<init>", "()V", "BundleInfo", "Lvj3;", "bottomMargin", "publication_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PublicationFragment extends cn5 {
    public final vq6 u0;
    public py2 v0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\b\u0087\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\b\u0010\tJ\u001d\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\fHÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0014J\u001a\u0010\u0018\u001a\u00020\u00172\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001a\u001a\u0004\b\u001b\u0010\u001cR\u001a\u0010\u0005\u001a\u00020\u00048\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0005\u0010\u001d\u001a\u0004\b\u001e\u0010\u0012R\u0017\u0010\u0007\u001a\u00020\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010\u001f\u001a\u0004\b \u0010!¨\u0006\""}, d2 = {"Lcom/medium/android/publication/ui/main/PublicationFragment$BundleInfo;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "Lcom/medium/android/core/navigation/PublicationReference;", "publicationReference", "", "referrerSource", "Lcom/medium/android/core/navigation/PublicationTab;", "publicationTab", "<init>", "(Lcom/medium/android/core/navigation/PublicationReference;Ljava/lang/String;Lcom/medium/android/core/navigation/PublicationTab;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/core/navigation/PublicationReference;", "getPublicationReference", "()Lcom/medium/android/core/navigation/PublicationReference;", "Ljava/lang/String;", "getReferrerSource", "Lcom/medium/android/core/navigation/PublicationTab;", "getPublicationTab", "()Lcom/medium/android/core/navigation/PublicationTab;", "publication_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo {
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final PublicationReference publicationReference;
        private final PublicationTab publicationTab;
        private final String referrerSource;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo((PublicationReference) parcel.readParcelable(BundleInfo.class.getClassLoader()), parcel.readString(), (PublicationTab) parcel.readParcelable(BundleInfo.class.getClassLoader()));
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(PublicationReference publicationReference, String str, PublicationTab publicationTab) {
            super(str);
            publicationReference.getClass();
            str.getClass();
            publicationTab.getClass();
            this.publicationReference = publicationReference;
            this.referrerSource = str;
            this.publicationTab = publicationTab;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BundleInfo)) {
                return false;
            }
            BundleInfo bundleInfo = (BundleInfo) other;
            return g76.L(this.publicationReference, bundleInfo.publicationReference) && g76.L(this.referrerSource, bundleInfo.referrerSource) && g76.L(this.publicationTab, bundleInfo.publicationTab);
        }

        public final PublicationReference getPublicationReference() {
            return this.publicationReference;
        }

        public final PublicationTab getPublicationTab() {
            return this.publicationTab;
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public int hashCode() {
            return this.publicationTab.hashCode() + wgd.o(this.publicationReference.hashCode() * 31, 31, this.referrerSource);
        }

        public String toString() {
            return "BundleInfo(publicationReference=" + this.publicationReference + ", referrerSource=" + this.referrerSource + ", publicationTab=" + this.publicationTab + ")";
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeParcelable(this.publicationReference, flags);
            dest.writeString(this.referrerSource);
            dest.writeParcelable(this.publicationTab, flags);
        }
    }

    public PublicationFragment() {
        super(11);
        this.u0 = vx0.d0(yw6.NONE, new yj8(21, this));
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        super.B(layoutInflater, viewGroup, bundle);
        kia kiaVar = new kia(this);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new jia(this, kiaVar, 0), true, -1140962776));
        return composeView;
    }
}
