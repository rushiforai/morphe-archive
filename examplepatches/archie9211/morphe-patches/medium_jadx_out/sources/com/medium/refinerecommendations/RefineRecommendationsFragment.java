package com.medium.refinerecommendations;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.medium.android.core.fragments.AbstractMediumFragment;
import defpackage.cn5;
import defpackage.g76;
import defpackage.ka1;
import defpackage.mz1;
import defpackage.tza;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.yj8;
import defpackage.yw6;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0007²\u0006\f\u0010\u0006\u001a\u00020\u00058\nX\u008a\u0084\u0002"}, d2 = {"Lcom/medium/refinerecommendations/RefineRecommendationsFragment;", "Lcom/medium/android/core/fragments/AbstractMediumFragment;", "<init>", "()V", "BundleInfo", "Lvj3;", "bottomMargin", "refinerecommendations_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class RefineRecommendationsFragment extends cn5 {
    public final vq6 u0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\b\u0081\b\u0018\u00002\u00020\u00012\u00020\u0002B\u001f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u001d\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0007HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u001a\u0010\u0019\u001a\u00020\u00182\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016HÖ\u0003¢\u0006\u0004\b\u0019\u0010\u001aR\u0017\u0010\u0004\u001a\u00020\u00038\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u001b\u001a\u0004\b\u001c\u0010\u001dR\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001e\u001a\u0004\b\u001f\u0010 R\u001a\u0010\b\u001a\u00020\u00078\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\b\u0010!\u001a\u0004\b\"\u0010\u0013¨\u0006#"}, d2 = {"Lcom/medium/refinerecommendations/RefineRecommendationsFragment$BundleInfo;", "Landroid/os/Parcelable;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "Lcom/medium/refinerecommendations/RefineRecommendationsTab;", "tab", "Lcom/medium/refinerecommendations/RefineRecommendationsFilter;", "filter", "", "referrerSource", "<init>", "(Lcom/medium/refinerecommendations/RefineRecommendationsTab;Lcom/medium/refinerecommendations/RefineRecommendationsFilter;Ljava/lang/String;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Lcom/medium/refinerecommendations/RefineRecommendationsTab;", "getTab", "()Lcom/medium/refinerecommendations/RefineRecommendationsTab;", "Lcom/medium/refinerecommendations/RefineRecommendationsFilter;", "getFilter", "()Lcom/medium/refinerecommendations/RefineRecommendationsFilter;", "Ljava/lang/String;", "getReferrerSource", "refinerecommendations_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo implements Parcelable {
        public static final int $stable = AbstractMediumFragment.BundleInfo.$stable;
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final RefineRecommendationsFilter filter;
        private final String referrerSource;
        private final RefineRecommendationsTab tab;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        /* JADX INFO: loaded from: classes4.dex */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo(RefineRecommendationsTab.valueOf(parcel.readString()), RefineRecommendationsFilter.valueOf(parcel.readString()), parcel.readString());
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(RefineRecommendationsTab refineRecommendationsTab, RefineRecommendationsFilter refineRecommendationsFilter, String str) {
            super(str);
            refineRecommendationsTab.getClass();
            refineRecommendationsFilter.getClass();
            str.getClass();
            this.tab = refineRecommendationsTab;
            this.filter = refineRecommendationsFilter;
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
            return this.tab == bundleInfo.tab && this.filter == bundleInfo.filter && g76.L(this.referrerSource, bundleInfo.referrerSource);
        }

        public final RefineRecommendationsFilter getFilter() {
            return this.filter;
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public final RefineRecommendationsTab getTab() {
            return this.tab;
        }

        public int hashCode() {
            return this.referrerSource.hashCode() + ((this.filter.hashCode() + (this.tab.hashCode() * 31)) * 31);
        }

        public String toString() {
            RefineRecommendationsTab refineRecommendationsTab = this.tab;
            RefineRecommendationsFilter refineRecommendationsFilter = this.filter;
            String str = this.referrerSource;
            StringBuilder sb = new StringBuilder("BundleInfo(tab=");
            sb.append(refineRecommendationsTab);
            sb.append(", filter=");
            sb.append(refineRecommendationsFilter);
            sb.append(", referrerSource=");
            return ka1.v(sb, str, ")");
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.tab.name());
            dest.writeString(this.filter.name());
            dest.writeString(this.referrerSource);
        }
    }

    public RefineRecommendationsFragment() {
        super(14);
        this.u0 = vx0.d0(yw6.NONE, new yj8(29, this));
    }

    @Override // com.medium.android.core.fragments.AbstractMediumFragment, defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        super.B(layoutInflater, viewGroup, bundle);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setContent(new mz1(new tza(this, 0), true, -1721859935));
        return composeView;
    }
}
