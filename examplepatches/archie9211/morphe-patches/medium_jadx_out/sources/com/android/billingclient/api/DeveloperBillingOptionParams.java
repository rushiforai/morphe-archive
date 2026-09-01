package com.android.billingclient.api;

import android.net.Uri;
import android.text.TextUtils;
import defpackage.ay0;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class DeveloperBillingOptionParams {
    private final Uri zza;
    private final int zzb;
    private final int zzc;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Retention(RetentionPolicy.SOURCE)
    public @interface LaunchMode {
        public static final int CALLER_WILL_LAUNCH_LINK = 2;
        public static final int LAUNCH_IN_EXTERNAL_BROWSER_OR_APP = 1;
        public static final int LAUNCH_MODE_UNSPECIFIED = 0;
    }

    public /* synthetic */ DeveloperBillingOptionParams(Builder builder, zzdi zzdiVar) {
        this.zza = builder.zza;
        this.zzb = builder.zzb;
        this.zzc = builder.zzc;
    }

    public static Builder newBuilder() {
        return new Builder(null);
    }

    public int getBillingProgram() {
        return this.zzc;
    }

    public int getLaunchMode() {
        return this.zzb;
    }

    public Uri getLinkUri() {
        return this.zza;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class Builder {
        private Uri zza;
        private int zzb = 0;
        private int zzc = 0;

        private Builder() {
        }

        public DeveloperBillingOptionParams build() {
            int i = this.zzc;
            zzdi zzdiVar = null;
            if (i == 0) {
                ay0.e("Billing program is required.");
                return null;
            }
            if (i == 5 && this.zza != null && TextUtils.isEmpty(null)) {
                ay0.e("External transaction token is required for side by side billing with an external link.");
                return null;
            }
            Uri uri = this.zza;
            if (uri == null || uri.getScheme() != null) {
                return new DeveloperBillingOptionParams(this, zzdiVar);
            }
            ay0.e("URI must have a scheme.");
            return null;
        }

        public Builder setBillingProgram(int i) {
            this.zzc = i;
            return this;
        }

        public Builder setLaunchMode(int i) {
            this.zzb = i;
            return this;
        }

        public Builder setLinkUri(Uri uri) {
            this.zza = uri;
            return this;
        }

        public /* synthetic */ Builder(zzdi zzdiVar) {
        }
    }
}
