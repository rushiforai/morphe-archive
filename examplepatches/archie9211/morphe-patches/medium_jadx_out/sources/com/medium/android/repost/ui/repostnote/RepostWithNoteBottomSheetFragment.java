package com.medium.android.repost.ui.repostnote;

import android.app.Dialog;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import androidx.compose.ui.platform.ComposeView;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.medium.android.core.fragments.AbstractMediumFragment;
import defpackage.d9b;
import defpackage.g08;
import defpackage.g76;
import defpackage.i5b;
import defpackage.jn5;
import defpackage.mz1;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;
import sprig.b.VPIE.gYpYQDQkhfs;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/repost/ui/repostnote/RepostWithNoteBottomSheetFragment;", "Ld0;", "<init>", "()V", "BundleInfo", "repost_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class RepostWithNoteBottomSheetFragment extends jn5 {
    public final vq6 H0 = vx0.d0(yw6.NONE, new i5b(4, this));

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0002\b\f\b\u0081\b\u0018\u00002\u00020\u0001B-\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0002\u0012\b\b\u0002\u0010\b\u001a\u00020\u0007¢\u0006\u0004\b\t\u0010\nJ\u001d\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u001a\u0010\u0018\u001a\u00020\u00072\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016HÖ\u0003¢\u0006\u0004\b\u0018\u0010\u0019R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001a\u001a\u0004\b\u001b\u0010\u0013R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001c\u001a\u0004\b\u001d\u0010\u001eR\u0019\u0010\u0006\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001a\u001a\u0004\b\u001f\u0010\u0013R\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010 \u001a\u0004\b\b\u0010!¨\u0006\""}, d2 = {"Lcom/medium/android/repost/ui/repostnote/RepostWithNoteBottomSheetFragment$BundleInfo;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "", "postId", "Lg08;", "metricsContext", "initialNote", "", "isExistingRepost", "<init>", "(Ljava/lang/String;Lg08;Ljava/lang/String;Z)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getPostId", "Lg08;", "getMetricsContext", "()Lg08;", "getInitialNote", "Z", "()Z", "repost_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo {
        public static final int $stable = AbstractMediumFragment.BundleInfo.$stable;
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final String initialNote;
        private final boolean isExistingRepost;
        private final g08 metricsContext;
        private final String postId;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo(parcel.readString(), (g08) parcel.readParcelable(BundleInfo.class.getClassLoader()), parcel.readString(), parcel.readInt() != 0);
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(String str, g08 g08Var, String str2, boolean z) {
            super(g08Var.a);
            str.getClass();
            g08Var.getClass();
            this.postId = str;
            this.metricsContext = g08Var;
            this.initialNote = str2;
            this.isExistingRepost = z;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BundleInfo)) {
                return false;
            }
            BundleInfo bundleInfo = (BundleInfo) other;
            return g76.L(this.postId, bundleInfo.postId) && g76.L(this.metricsContext, bundleInfo.metricsContext) && g76.L(this.initialNote, bundleInfo.initialNote) && this.isExistingRepost == bundleInfo.isExistingRepost;
        }

        public final String getInitialNote() {
            return this.initialNote;
        }

        public final g08 getMetricsContext() {
            return this.metricsContext;
        }

        public final String getPostId() {
            return this.postId;
        }

        public int hashCode() {
            int iHashCode = (this.metricsContext.hashCode() + (this.postId.hashCode() * 31)) * 31;
            String str = this.initialNote;
            return ((iHashCode + (str == null ? 0 : str.hashCode())) * 31) + (this.isExistingRepost ? 1231 : 1237);
        }

        /* JADX INFO: renamed from: isExistingRepost, reason: from getter */
        public final boolean getIsExistingRepost() {
            return this.isExistingRepost;
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.postId);
            dest.writeParcelable(this.metricsContext, flags);
            dest.writeString(this.initialNote);
            dest.writeInt(this.isExistingRepost ? 1 : 0);
        }

        public String toString() {
            return "BundleInfo(postId=" + this.postId + ", metricsContext=" + this.metricsContext + gYpYQDQkhfs.bGaWaARlKKVUfa + this.initialNote + ", isExistingRepost=" + this.isExistingRepost + ")";
        }
    }

    @Override // defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new d9b(this, 0), true, -325880697));
        return composeView;
    }

    @Override // defpackage.d0, defpackage.dw0, defpackage.i20, defpackage.fb3
    public final Dialog a0(Bundle bundle) {
        Dialog dialogA0 = super.a0(bundle);
        Window window = dialogA0.getWindow();
        if (window != null) {
            window.setSoftInputMode(4);
        }
        return dialogA0;
    }

    @Override // defpackage.d0
    public final void d0(BottomSheetBehavior bottomSheetBehavior) {
        bottomSheetBehavior.L(3);
        bottomSheetBehavior.K = true;
    }
}
