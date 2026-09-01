package com.medium.android.followsubscribemodal;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.compose.ui.platform.ComposeView;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.medium.android.core.fragments.AbstractMediumFragment;
import com.medium.android.core.models.EntityType;
import com.medium.android.followsubscribemodal.FollowSubscribeModalFragment;
import defpackage.ay0;
import defpackage.dm2;
import defpackage.g76;
import defpackage.ht2;
import defpackage.ka1;
import defpackage.km4;
import defpackage.l23;
import defpackage.m45;
import defpackage.mz1;
import defpackage.vm5;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0007\u0018\u00002\u00020\u0001:\u0002\u0004\u0005B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0006"}, d2 = {"Lcom/medium/android/followsubscribemodal/FollowSubscribeModalFragment;", "Ld0;", "<init>", "()V", "BundleInfo", "com/medium/android/followsubscribemodal/c", "followsubscribemodal_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class FollowSubscribeModalFragment extends vm5 {
    public final vq6 H0 = vx0.d0(yw6.NONE, new m45() { // from class: com.medium.android.followsubscribemodal.a
        @Override // defpackage.m45
        public final Object invoke() {
            Parcelable parcelable = (Parcelable) ht2.r0(dm2.F(this.a), "bundle_info", FollowSubscribeModalFragment.BundleInfo.class);
            if (parcelable != null) {
                return (FollowSubscribeModalFragment.BundleInfo) parcelable;
            }
            ay0.e("Required 'bundle_info' is null.");
            return null;
        }
    });

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\b\u0083\b\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0002¢\u0006\u0004\b\u0007\u0010\bJ\u001d\u0010\u000e\u001a\u00020\r2\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u000e\u0010\u000fJ\u0010\u0010\u0010\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u000bHÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u001a\u0010\u0017\u001a\u00020\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u0014HÖ\u0003¢\u0006\u0004\b\u0017\u0010\u0018R\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u0019\u001a\u0004\b\u001a\u0010\u0011R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001b\u001a\u0004\b\u001c\u0010\u001dR\u001a\u0010\u0006\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0006\u0010\u0019\u001a\u0004\b\u001e\u0010\u0011¨\u0006\u001f"}, d2 = {"Lcom/medium/android/followsubscribemodal/FollowSubscribeModalFragment$BundleInfo;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "", "entityId", "Lcom/medium/android/core/models/EntityType;", "entityType", "referrerSource", "<init>", "(Ljava/lang/String;Lcom/medium/android/core/models/EntityType;Ljava/lang/String;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getEntityId", "Lcom/medium/android/core/models/EntityType;", "getEntityType", "()Lcom/medium/android/core/models/EntityType;", "getReferrerSource", "followsubscribemodal_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo {
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final String entityId;
        private final EntityType entityType;
        private final String referrerSource;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo(parcel.readString(), EntityType.valueOf(parcel.readString()), parcel.readString());
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(String str, EntityType entityType, String str2) {
            super(str2);
            str.getClass();
            entityType.getClass();
            str2.getClass();
            this.entityId = str;
            this.entityType = entityType;
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
            return g76.L(this.entityId, bundleInfo.entityId) && this.entityType == bundleInfo.entityType && g76.L(this.referrerSource, bundleInfo.referrerSource);
        }

        public final String getEntityId() {
            return this.entityId;
        }

        public final EntityType getEntityType() {
            return this.entityType;
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public int hashCode() {
            return this.referrerSource.hashCode() + ((this.entityType.hashCode() + (this.entityId.hashCode() * 31)) * 31);
        }

        public String toString() {
            String str = this.entityId;
            EntityType entityType = this.entityType;
            return ka1.v(km4.D("BundleInfo(entityId=", entityType, str, ", entityType=", ", referrerSource="), this.referrerSource, ")");
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.entityId);
            dest.writeString(this.entityType.name());
            dest.writeString(this.referrerSource);
        }
    }

    @Override // defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new l23(17, this), true, -548674579));
        return composeView;
    }

    @Override // defpackage.d0
    public final void d0(BottomSheetBehavior bottomSheetBehavior) {
        bottomSheetBehavior.L(3);
        bottomSheetBehavior.K = true;
    }
}
