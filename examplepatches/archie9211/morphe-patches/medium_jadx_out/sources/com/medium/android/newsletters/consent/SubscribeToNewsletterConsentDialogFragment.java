package com.medium.android.newsletters.consent;

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
import com.medium.android.newsletters.consent.SubscribeToNewsletterConsentDialogFragment;
import com.squareup.wire.sjIw.ezwlgQm;
import defpackage.bd9;
import defpackage.bx6;
import defpackage.g76;
import defpackage.gwc;
import defpackage.hwc;
import defpackage.iq1;
import defpackage.ka1;
import defpackage.km4;
import defpackage.m40;
import defpackage.m45;
import defpackage.mz1;
import defpackage.n1b;
import defpackage.nn5;
import defpackage.owc;
import defpackage.pj3;
import defpackage.rn2;
import defpackage.vq6;
import defpackage.vx0;
import defpackage.wgd;
import defpackage.yw6;
import defpackage.zi5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Lcom/medium/android/newsletters/consent/SubscribeToNewsletterConsentDialogFragment;", "Ld0;", "<init>", "()V", "BundleInfo", "newsletters_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SubscribeToNewsletterConsentDialogFragment extends nn5 {
    public rn2 H0;
    public final vq6 I0;
    public final iq1 J0;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u000b\b\u0081\b\u0018\u00002\u00020\u0001B1\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0002\u0012\b\u0010\u0007\u001a\u0004\u0018\u00010\u0002\u0012\u0006\u0010\b\u001a\u00020\u0002¢\u0006\u0004\b\t\u0010\nJ\u001d\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\f\u001a\u00020\u000b2\u0006\u0010\u000e\u001a\u00020\r¢\u0006\u0004\b\u0010\u0010\u0011J\u0010\u0010\u0012\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\rHÖ\u0001¢\u0006\u0004\b\u0014\u0010\u0015J\u001a\u0010\u0019\u001a\u00020\u00182\b\u0010\u0017\u001a\u0004\u0018\u00010\u0016HÖ\u0003¢\u0006\u0004\b\u0019\u0010\u001aR\u0017\u0010\u0003\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0003\u0010\u001b\u001a\u0004\b\u001c\u0010\u0013R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u001d\u001a\u0004\b\u001e\u0010\u001fR\u0017\u0010\u0006\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u0006\u0010\u001b\u001a\u0004\b \u0010\u0013R\u0019\u0010\u0007\u001a\u0004\u0018\u00010\u00028\u0006¢\u0006\f\n\u0004\b\u0007\u0010\u001b\u001a\u0004\b!\u0010\u0013R\u001a\u0010\b\u001a\u00020\u00028\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\b\u0010\u001b\u001a\u0004\b\"\u0010\u0013¨\u0006#"}, d2 = {"Lcom/medium/android/newsletters/consent/SubscribeToNewsletterConsentDialogFragment$BundleInfo;", "Lcom/medium/android/core/fragments/AbstractMediumFragment$BundleInfo;", "", "entityId", "Lcom/medium/android/core/models/EntityType;", "entityType", "entityName", "newsletterId", "referrerSource", "<init>", "(Ljava/lang/String;Lcom/medium/android/core/models/EntityType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "Landroid/os/Parcel;", "dest", "", "flags", "Lc1e;", "writeToParcel", "(Landroid/os/Parcel;I)V", "toString", "()Ljava/lang/String;", "hashCode", "()I", "", "other", "", "equals", "(Ljava/lang/Object;)Z", "Ljava/lang/String;", "getEntityId", "Lcom/medium/android/core/models/EntityType;", "getEntityType", "()Lcom/medium/android/core/models/EntityType;", "getEntityName", "getNewsletterId", "getReferrerSource", "newsletters_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
    public static final /* data */ class BundleInfo extends AbstractMediumFragment.BundleInfo {
        public static final int $stable = AbstractMediumFragment.BundleInfo.$stable;
        public static final Parcelable.Creator<BundleInfo> CREATOR = new Creator();
        private final String entityId;
        private final String entityName;
        private final EntityType entityType;
        private final String newsletterId;
        private final String referrerSource;

        /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
        public final class Creator implements Parcelable.Creator<BundleInfo> {
            @Override // android.os.Parcelable.Creator
            public final BundleInfo createFromParcel(Parcel parcel) {
                parcel.getClass();
                return new BundleInfo(parcel.readString(), EntityType.valueOf(parcel.readString()), parcel.readString(), parcel.readString(), parcel.readString());
            }

            @Override // android.os.Parcelable.Creator
            public final BundleInfo[] newArray(int i) {
                return new BundleInfo[i];
            }
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public BundleInfo(String str, EntityType entityType, String str2, String str3, String str4) {
            super(str4);
            str.getClass();
            entityType.getClass();
            str2.getClass();
            str4.getClass();
            this.entityId = str;
            this.entityType = entityType;
            this.entityName = str2;
            this.newsletterId = str3;
            this.referrerSource = str4;
        }

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof BundleInfo)) {
                return false;
            }
            BundleInfo bundleInfo = (BundleInfo) other;
            return g76.L(this.entityId, bundleInfo.entityId) && this.entityType == bundleInfo.entityType && g76.L(this.entityName, bundleInfo.entityName) && g76.L(this.newsletterId, bundleInfo.newsletterId) && g76.L(this.referrerSource, bundleInfo.referrerSource);
        }

        public final String getEntityId() {
            return this.entityId;
        }

        public final String getEntityName() {
            return this.entityName;
        }

        public final EntityType getEntityType() {
            return this.entityType;
        }

        public final String getNewsletterId() {
            return this.newsletterId;
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo
        public String getReferrerSource() {
            return this.referrerSource;
        }

        public int hashCode() {
            int iO = wgd.o((this.entityType.hashCode() + (this.entityId.hashCode() * 31)) * 31, 31, this.entityName);
            String str = this.newsletterId;
            return this.referrerSource.hashCode() + ((iO + (str == null ? 0 : str.hashCode())) * 31);
        }

        @Override // com.medium.android.core.fragments.AbstractMediumFragment.BundleInfo, android.os.Parcelable
        public final void writeToParcel(Parcel dest, int flags) {
            dest.getClass();
            dest.writeString(this.entityId);
            dest.writeString(this.entityType.name());
            dest.writeString(this.entityName);
            dest.writeString(this.newsletterId);
            dest.writeString(this.referrerSource);
        }

        public String toString() {
            String str = this.entityId;
            EntityType entityType = this.entityType;
            String str2 = this.entityName;
            String str3 = this.newsletterId;
            String str4 = this.referrerSource;
            StringBuilder sbD = km4.D("BundleInfo(entityId=", entityType, str, ", entityType=", ezwlgQm.naKQmb);
            ka1.C(sbD, str2, ", newsletterId=", str3, ", referrerSource=");
            return ka1.v(sbD, str4, ")");
        }
    }

    public SubscribeToNewsletterConsentDialogFragment() {
        yw6 yw6Var = yw6.NONE;
        final int i = 0;
        this.I0 = vx0.d0(yw6Var, new m45(this) { // from class: fwc
            public final /* synthetic */ SubscribeToNewsletterConsentDialogFragment b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i2 = i;
                SubscribeToNewsletterConsentDialogFragment subscribeToNewsletterConsentDialogFragment = this.b;
                switch (i2) {
                    case 0:
                        Parcelable parcelable = (Parcelable) ht2.r0(dm2.F(subscribeToNewsletterConsentDialogFragment), "bundle_info", SubscribeToNewsletterConsentDialogFragment.BundleInfo.class);
                        if (parcelable != null) {
                            return (SubscribeToNewsletterConsentDialogFragment.BundleInfo) parcelable;
                        }
                        ay0.e("Required 'bundle_info' is null.");
                        return null;
                    default:
                        vq6 vq6Var = subscribeToNewsletterConsentDialogFragment.I0;
                        rn2 rn2Var = subscribeToNewsletterConsentDialogFragment.H0;
                        if (rn2Var == null) {
                            g76.g0("vmFactory");
                            throw null;
                        }
                        EntityType entityType = ((SubscribeToNewsletterConsentDialogFragment.BundleInfo) vq6Var.getValue()).getEntityType();
                        String entityId = ((SubscribeToNewsletterConsentDialogFragment.BundleInfo) vq6Var.getValue()).getEntityId();
                        String entityName = ((SubscribeToNewsletterConsentDialogFragment.BundleInfo) vq6Var.getValue()).getEntityName();
                        String newsletterId = ((SubscribeToNewsletterConsentDialogFragment.BundleInfo) vq6Var.getValue()).getNewsletterId();
                        String referrerSource = ((SubscribeToNewsletterConsentDialogFragment.BundleInfo) vq6Var.getValue()).getReferrerSource();
                        eo2 eo2Var = rn2Var.a;
                        fo2 fo2Var = (fo2) eo2Var.e;
                        ko2 ko2Var = eo2Var.b;
                        ko2 ko2Var2 = fo2Var.b;
                        return new owc(entityId, entityType, entityName, newsletterId, referrerSource, new o2b(ko2Var2.h(), (zk2) ko2Var2.r.get(), new pf8((e00) ko2Var2.p.get()), fo2Var.c.d()), ko2Var.t(), ko2Var.m());
                }
            }
        });
        final int i2 = 1;
        bx6 bx6Var = new bx6(10, new m45(this) { // from class: fwc
            public final /* synthetic */ SubscribeToNewsletterConsentDialogFragment b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i22 = i2;
                SubscribeToNewsletterConsentDialogFragment subscribeToNewsletterConsentDialogFragment = this.b;
                switch (i22) {
                    case 0:
                        Parcelable parcelable = (Parcelable) ht2.r0(dm2.F(subscribeToNewsletterConsentDialogFragment), "bundle_info", SubscribeToNewsletterConsentDialogFragment.BundleInfo.class);
                        if (parcelable != null) {
                            return (SubscribeToNewsletterConsentDialogFragment.BundleInfo) parcelable;
                        }
                        ay0.e("Required 'bundle_info' is null.");
                        return null;
                    default:
                        vq6 vq6Var = subscribeToNewsletterConsentDialogFragment.I0;
                        rn2 rn2Var = subscribeToNewsletterConsentDialogFragment.H0;
                        if (rn2Var == null) {
                            g76.g0("vmFactory");
                            throw null;
                        }
                        EntityType entityType = ((SubscribeToNewsletterConsentDialogFragment.BundleInfo) vq6Var.getValue()).getEntityType();
                        String entityId = ((SubscribeToNewsletterConsentDialogFragment.BundleInfo) vq6Var.getValue()).getEntityId();
                        String entityName = ((SubscribeToNewsletterConsentDialogFragment.BundleInfo) vq6Var.getValue()).getEntityName();
                        String newsletterId = ((SubscribeToNewsletterConsentDialogFragment.BundleInfo) vq6Var.getValue()).getNewsletterId();
                        String referrerSource = ((SubscribeToNewsletterConsentDialogFragment.BundleInfo) vq6Var.getValue()).getReferrerSource();
                        eo2 eo2Var = rn2Var.a;
                        fo2 fo2Var = (fo2) eo2Var.e;
                        ko2 ko2Var = eo2Var.b;
                        ko2 ko2Var2 = fo2Var.b;
                        return new owc(entityId, entityType, entityName, newsletterId, referrerSource, new o2b(ko2Var2.h(), (zk2) ko2Var2.r.get(), new pf8((e00) ko2Var2.p.get()), fo2Var.c.d()), ko2Var.t(), ko2Var.m());
                }
            }
        });
        vq6 vq6VarD0 = vx0.d0(yw6Var, new bd9(26, new bd9(25, this)));
        this.J0 = m40.I(this, n1b.a.b(owc.class), new pj3(vq6VarD0, 16), new pj3(vq6VarD0, 17), bx6Var);
    }

    @Override // defpackage.j15
    public final View B(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        layoutInflater.getClass();
        hwc hwcVar = new hwc(this);
        ComposeView composeView = new ComposeView(S(), null, 6);
        composeView.setViewCompositionStrategy(zi5.h);
        composeView.setContent(new mz1(new gwc(this, hwcVar, 0), true, -780277349));
        return composeView;
    }

    @Override // defpackage.d0
    public final void d0(BottomSheetBehavior bottomSheetBehavior) {
        bottomSheetBehavior.L(3);
        bottomSheetBehavior.K = true;
    }
}
