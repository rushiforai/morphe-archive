package com.android.billingclient.api;

import j$.util.DesugarCollections;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class InAppMessageParams {
    private final ArrayList zza;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class Builder {
        private final Set zza = new HashSet();

        public Builder addAllInAppMessageCategoriesToShow() {
            this.zza.add(2);
            return this;
        }

        public Builder addInAppMessageCategoryToShow(int i) {
            this.zza.add(Integer.valueOf(i));
            return this;
        }

        public InAppMessageParams build() {
            return new InAppMessageParams(this.zza, null);
        }
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Retention(RetentionPolicy.SOURCE)
    public @interface InAppMessageCategoryId {
        public static final int TRANSACTIONAL = 2;
        public static final int UNKNOWN_IN_APP_MESSAGE_CATEGORY_ID = 0;
    }

    public /* synthetic */ InAppMessageParams(Set set, zzds zzdsVar) {
        this.zza = new ArrayList(DesugarCollections.unmodifiableList(new ArrayList(set)));
    }

    public static Builder newBuilder() {
        return new Builder();
    }

    public final ArrayList zza() {
        return this.zza;
    }
}
