package com.android.billingclient.api;

import android.net.Uri;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@zzl
/* loaded from: classes2.dex */
public final class DeveloperBillingOptionParams {
    private final Uri zza;
    private final int zzb;
    private final int zzc;

    @zzl
    public static final class Builder {
        private Uri zza;
        private int zzb = 0;
        private int zzc = 0;

        private Builder() {
        }

        @zzl
        public DeveloperBillingOptionParams build() {
            if (this.zzc == 0) {
                throw new IllegalArgumentException("Billing program is required.");
            }
            Uri uri = this.zza;
            if (uri == null || uri.getScheme() != null) {
                return new DeveloperBillingOptionParams(this.zza, this.zzb, this.zzc, null);
            }
            throw new IllegalArgumentException("URI must have a scheme.");
        }

        public Builder setBillingProgram(int i5) {
            this.zzc = i5;
            return this;
        }

        public Builder setLaunchMode(int i5) {
            this.zzb = i5;
            return this;
        }

        public Builder setLinkUri(Uri uri) {
            this.zza = uri;
            return this;
        }

        public /* synthetic */ Builder(zzdi zzdiVar) {
        }
    }

    @Retention(RetentionPolicy.SOURCE)
    @zzl
    public @interface LaunchMode {
        public static final int CALLER_WILL_LAUNCH_LINK = 2;
        public static final int LAUNCH_IN_EXTERNAL_BROWSER_OR_APP = 1;
        public static final int LAUNCH_MODE_UNSPECIFIED = 0;
    }

    public /* synthetic */ DeveloperBillingOptionParams(Uri uri, int i5, int i11, zzdi zzdiVar) {
        this.zza = uri;
        this.zzb = i5;
        this.zzc = i11;
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
}
