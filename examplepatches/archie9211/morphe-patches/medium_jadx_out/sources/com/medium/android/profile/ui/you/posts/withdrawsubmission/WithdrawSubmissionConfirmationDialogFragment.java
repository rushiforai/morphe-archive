package com.medium.android.profile.ui.you.posts.withdrawsubmission;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.donkey.main.MainActivity;
import defpackage.b09;
import defpackage.g76;
import defpackage.l2f;
import defpackage.mz1;
import defpackage.q6f;
import defpackage.r6f;
import defpackage.tn5;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.wgd;
import defpackage.y30;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/profile/ui/you/posts/withdrawsubmission/WithdrawSubmissionConfirmationDialogFragment;", "Ld0;", "<init>", "()V", "BundleInfo", "profile_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class WithdrawSubmissionConfirmationDialogFragment extends tn5 {
    public final vq6 H0 = vx0.d0(yw6.NONE, new l2f(1, this));

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0002\b\n\b\u0081\b\u0018\u00002\u00020\u0001B'\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0007\u001a\u00020\u0002¢\u0006\u0004\b\b\u0010\tJ\u001d\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u000b\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\f¢\u0006\u0004\b\u000f\u0010\u0010J\u0010\u0010\u0011\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0011\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\fHÖ\u0001¢\u0006\u0004\b\u0013\u0010\u0014J\u001a\u0010\u0017\u001a\u00020\u00052\b\u0010\u0016\u001a\u0004\u0018\u00010\u0015HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\u0012R\u0017\u0010\u0004\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0004\u0010\u0019\u001a\u0004\b\u001b\u0010\u0012R\u0017\u0010\u0006\u001a\u00020\u00058\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001c\u001a\u0004\b\u0006\u0010\u001dR\u001a\u0010\u0007\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0007\u0010\u0019\u001a\u0004\b\u001e\u0010\u0012¨\u0006\u001f"}, d2 = {"Lcom/medium/android/profile/ui/you/posts/withdrawsubmission/WithdrawSubmissionConfirmationDialogFragment$BundleInfo;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "", "postId", "publicationId", "", "isPostPublished", "referrerSource", "<init>", "(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "getPublicationId", "Z", "()Z", "getReferrerSource", "profile_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo {
        public static final int $stable = AbstractMediumFragment.BundleInfo.$stable;
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final boolean isPostPublished;
        private final String postId;
        private final String publicationId;
        private final String referrerSource;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo(parcel.readString(), parcel.readString(), parcel.readInt() != 0, parcel.readString());
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(String str, String str2, boolean z, String str3) {
            super(str3);
            b09.I(str, str2, str3);
            this.postId = str;
            this.publicationId = str2;
            this.isPostPublished = z;
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
            return g76.L(this.postId, bundleInfo.postId) && g76.L(this.publicationId, bundleInfo.publicationId) && this.isPostPublished == bundleInfo.isPostPublished && g76.L(this.referrerSource, bundleInfo.referrerSource);
        }

        public final String getPostId() {
            return this.postId;
        }

        public final String getPublicationId() {
            return this.publicationId;
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public int hashCode() {
            return this.referrerSource.hashCode() + ((wgd.o(this.postId.hashCode() * 31, 31, this.publicationId) + (this.isPostPublished ? 1231 : 1237)) * 31);
        }

        /* JADX INFO: renamed from: isPostPublished, reason: from getter */
        public final boolean getIsPostPublished() {
            return this.isPostPublished;
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.postId);
            dest.writeString(this.publicationId);
            dest.writeInt(this.isPostPublished ? 1 : 0);
            dest.writeString(this.referrerSource);
        }

        public String toString() {
            String str = this.postId;
            String str2 = this.publicationId;
            boolean z = this.isPostPublished;
            String str3 = this.referrerSource;
            StringBuilder sbU = y30.u("BundleInfo(postId=", str, AXoTRPEGKEve.NDtTimOJ, str2, ", isPostPublished=");
            sbU.append(z);
            sbU.append(", referrerSource=");
            sbU.append(str3);
            sbU.append(")");
            return sbU.toString();
        }
    }

    @Override // defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        r6f r6fVar = new r6f(this, ((MainActivity) Q()).u());
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new q6f(this, r6fVar, 0), true, 296438860));
        return composeView;
    }

    @Override // defpackage.d0
    public final void d0(BottomSheetBehavior bottomSheetBehavior) {
        bottomSheetBehavior.L(3);
        bottomSheetBehavior.K = true;
    }
}
