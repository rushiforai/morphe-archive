package com.android.billingclient.api;

import android.net.Uri;
import android.text.TextUtils;
import defpackage.ay0;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class LaunchExternalLinkParams {
    private final Uri zza;
    private final int zzb;
    private final int zzc;
    private final int zzd;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Retention(RetentionPolicy.SOURCE)
    public @interface LaunchMode {
        public static final int CALLER_WILL_LAUNCH_LINK = 2;
        public static final int LAUNCH_IN_EXTERNAL_BROWSER_OR_APP = 1;
        public static final int LAUNCH_MODE_UNSPECIFIED = 0;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Retention(RetentionPolicy.SOURCE)
    public @interface LinkType {
        public static final int LINK_TO_APP_DOWNLOAD = 2;
        public static final int LINK_TO_DIGITAL_CONTENT_OFFER = 1;
        public static final int LINK_TYPE_UNSPECIFIED = 0;
    }

    public /* synthetic */ LaunchExternalLinkParams(Builder builder, zzdt zzdtVar) {
        this.zza = builder.zza;
        this.zzb = builder.zzb;
        this.zzc = builder.zzc;
        this.zzd = builder.zzd;
    }

    public static Builder newBuilder() {
        return new Builder(null);
    }

    public int getBillingProgram() {
        return this.zzd;
    }

    public int getLaunchMode() {
        return this.zzb;
    }

    public int getLinkType() {
        return this.zzc;
    }

    public Uri getLinkUri() {
        return this.zza;
    }

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static final class Builder {
        private Uri zza;
        private int zzb = 0;
        private int zzc = 0;
        private int zzd = 0;

        private Builder() {
        }

        public LaunchExternalLinkParams build() {
            int i = this.zzc;
            zzdt zzdtVar = null;
            if (i == 0) {
                ay0.e("Link type is required.");
                return null;
            }
            int i2 = this.zzb;
            if (i2 == 0) {
                ay0.e("Launch mode is required.");
                return null;
            }
            if (i2 != 1 && i == 2) {
                ay0.e("App downloads must launch in an external browser or app.");
                return null;
            }
            int i3 = this.zzd;
            if (i3 == 0) {
                ay0.e("Billing program is required.");
                return null;
            }
            if (i3 == 5) {
                if (TextUtils.isEmpty(null)) {
                    ay0.e("External transaction token is required for side by side billing with an external link.");
                    return null;
                }
                if (this.zzc != 1) {
                    ay0.e("Link type must be LINK_TO_DIGITAL_CONTENT_OFFER for side by side billing with an external link.");
                    return null;
                }
            }
            Uri uri = this.zza;
            if (uri == null) {
                ay0.e("URI must be set.");
                return null;
            }
            if (uri.getScheme() != null) {
                return new LaunchExternalLinkParams(this, zzdtVar);
            }
            ay0.e("URI must have a scheme.");
            return null;
        }

        public Builder setBillingProgram(int i) {
            this.zzd = i;
            return this;
        }

        public Builder setLaunchMode(int i) {
            this.zzb = i;
            return this;
        }

        public Builder setLinkType(int i) {
            this.zzc = i;
            return this;
        }

        public Builder setLinkUri(Uri uri) {
            this.zza = uri;
            return this;
        }

        public /* synthetic */ Builder(zzdt zzdtVar) {
        }
    }
}
