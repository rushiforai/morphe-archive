package com.medium.android.publication.ui.archive;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.core.navigation.PublicationReference;
import defpackage.cn5;
import defpackage.dba;
import defpackage.g76;
import defpackage.ka1;
import defpackage.mz1;
import defpackage.olb;
import defpackage.rba;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.yj8;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0007²\u0006\f\u0010\u0006\u001a\u00020\u00058\nX\u008a\u0084\u0002"}, d2 = {"Lcom/medium/android/publication/ui/archive/PublicationArchiveFragment;", "Lcom/medium/android/core/fragments/AbstractMediumFragment;", "<init>", "()V", "BundleInfo", "Lvj3;", "bottomMargin", "publication_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PublicationArchiveFragment extends cn5 {
    public final vq6 u0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000f\b\u0087\b\u0018\u00002\u00020\u0001B5\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0006\u0012\b\u0010\t\u001a\u0004\u0018\u00010\b\u0012\u0006\u0010\n\u001a\u00020\u0006¢\u0006\u0004\b\u000b\u0010\fJ\u001d\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u000f\u001a\u00020\u0004¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0014J\u0010\u0010\u0015\u001a\u00020\u0004HÖ\u0001¢\u0006\u0004\b\u0015\u0010\u0016J\u001a\u0010\u001a\u001a\u00020\u00192\b\u0010\u0018\u001a\u0004\u0018\u00010\u0017HÖ\u0003¢\u0006\u0004\b\u001a\u0010\u001bR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001c\u001a\u0004\b\u001d\u0010\u001eR\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001f\u001a\u0004\b \u0010!R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00068\u0006¢\u0006\f\n\u0004\b\u0007\u0010\"\u001a\u0004\b#\u0010\u0014R\u0019\u0010\t\u001a\u0004\u0018\u00010\b8\u0006¢\u0006\f\n\u0004\b\t\u0010$\u001a\u0004\b%\u0010&R\u001a\u0010\n\u001a\u00020\u00068\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\n\u0010\"\u001a\u0004\b'\u0010\u0014¨\u0006("}, d2 = {"Lcom/medium/android/publication/ui/archive/PublicationArchiveFragment$BundleInfo;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "Lcom/medium/android/core/navigation/PublicationReference;", "publicationReference", "", "yearFilter", "", "topic", "Lrba;", "sort", "referrerSource", "<init>", "(Lcom/medium/android/core/navigation/PublicationReference;Ljava/lang/Integer;Ljava/lang/String;Lrba;Ljava/lang/String;)V", "Landroid/os/Parcel;", "dest", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/android/core/navigation/PublicationReference;", "getPublicationReference", "()Lcom/medium/android/core/navigation/PublicationReference;", "Ljava/lang/Integer;", "getYearFilter", "()Ljava/lang/Integer;", "Ljava/lang/String;", "getTopic", "Lrba;", "getSort", "()Lrba;", "getReferrerSource", "publication_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo {
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final PublicationReference publicationReference;
        private final String referrerSource;
        private final rba sort;
        private final String topic;
        private final Integer yearFilter;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo((PublicationReference) parcel.readParcelable(BundleInfo.class.getClassLoader()), parcel.readInt() == 0 ? null : Integer.valueOf(parcel.readInt()), parcel.readString(), parcel.readInt() != 0 ? rba.valueOf(parcel.readString()) : null, parcel.readString());
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(PublicationReference publicationReference, Integer num, String str, rba rbaVar, String str2) {
            super(str2);
            publicationReference.getClass();
            str2.getClass();
            this.publicationReference = publicationReference;
            this.yearFilter = num;
            this.topic = str;
            this.sort = rbaVar;
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
            return g76.L(this.publicationReference, bundleInfo.publicationReference) && g76.L(this.yearFilter, bundleInfo.yearFilter) && g76.L(this.topic, bundleInfo.topic) && this.sort == bundleInfo.sort && g76.L(this.referrerSource, bundleInfo.referrerSource);
        }

        public final PublicationReference getPublicationReference() {
            return this.publicationReference;
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public final rba getSort() {
            return this.sort;
        }

        public final String getTopic() {
            return this.topic;
        }

        public final Integer getYearFilter() {
            return this.yearFilter;
        }

        public int hashCode() {
            int iHashCode = this.publicationReference.hashCode() * 31;
            Integer num = this.yearFilter;
            int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
            String str = this.topic;
            int iHashCode3 = (iHashCode2 + (str == null ? 0 : str.hashCode())) * 31;
            rba rbaVar = this.sort;
            return this.referrerSource.hashCode() + ((iHashCode3 + (rbaVar != null ? rbaVar.hashCode() : 0)) * 31);
        }

        public String toString() {
            PublicationReference publicationReference = this.publicationReference;
            Integer num = this.yearFilter;
            String str = this.topic;
            rba rbaVar = this.sort;
            String str2 = this.referrerSource;
            StringBuilder sb = new StringBuilder("BundleInfo(publicationReference=");
            sb.append(publicationReference);
            sb.append(", yearFilter=");
            sb.append(num);
            sb.append(", topic=");
            sb.append(str);
            sb.append(", sort=");
            sb.append(rbaVar);
            sb.append(", referrerSource=");
            return ka1.v(sb, str2, ")");
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeParcelable(this.publicationReference, flags);
            Integer num = this.yearFilter;
            if (num == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeInt(num.intValue());
            }
            dest.writeString(this.topic);
            rba rbaVar = this.sort;
            if (rbaVar == null) {
                dest.writeInt(0);
            } else {
                dest.writeInt(1);
                dest.writeString(rbaVar.name());
            }
            dest.writeString(this.referrerSource);
        }
    }

    public PublicationArchiveFragment() {
        super(7);
        this.u0 = vx0.d0(yw6.NONE, new yj8(16, this));
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        super.B(layoutInflater, viewGroup, bundle);
        olb olbVar = new olb(24, this);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new dba(this, olbVar, 0), true, 512029139));
        return composeView;
    }
}
