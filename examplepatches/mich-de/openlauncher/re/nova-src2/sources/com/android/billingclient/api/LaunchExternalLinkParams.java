package com.android.billingclient.api;

import android.net.Uri;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@zzo
/* loaded from: classes2.dex */
public final class LaunchExternalLinkParams {
    private final Uri zza;
    private final int zzb;
    private final int zzc;
    private final int zzd;

    @zzo
    public static final class Builder {
        private Uri zza;
        private int zzb = 0;
        private int zzc = 0;
        private int zzd = 0;

        private Builder() {
        }

        @zzo
        public LaunchExternalLinkParams build() {
            int i5 = this.zzc;
            if (i5 == 0) {
                throw new IllegalArgumentException("Link type is required.");
            }
            int i11 = this.zzb;
            if (i11 == 0) {
                throw new IllegalArgumentException("Launch mode is required.");
            }
            if (i11 != 1 && i5 == 2) {
                throw new IllegalArgumentException("App downloads must launch in an external browser or app.");
            }
            if (this.zzd == 0) {
                throw new IllegalArgumentException("Billing program is required.");
            }
            Uri uri = this.zza;
            if (uri == null) {
                throw new IllegalArgumentException("URI must be set.");
            }
            if (uri.getScheme() != null) {
                return new LaunchExternalLinkParams(this.zza, this.zzb, this.zzc, this.zzd, null);
            }
            throw new IllegalArgumentException("URI must have a scheme.");
        }

        @zzo
        public Builder setBillingProgram(int i5) {
            this.zzd = i5;
            return this;
        }

        @zzo
        public Builder setLaunchMode(int i5) {
            this.zzb = i5;
            return this;
        }

        @zzo
        public Builder setLinkType(int i5) {
            this.zzc = i5;
            return this;
        }

        @zzo
        public Builder setLinkUri(Uri uri) {
            this.zza = uri;
            return this;
        }

        public /* synthetic */ Builder(zzdr zzdrVar) {
        }
    }

    @zzo
    @Retention(RetentionPolicy.SOURCE)
    public @interface LaunchMode {

        @zzo
        public static final int CALLER_WILL_LAUNCH_LINK = 2;

        @zzo
        public static final int LAUNCH_IN_EXTERNAL_BROWSER_OR_APP = 1;

        @zzo
        public static final int LAUNCH_MODE_UNSPECIFIED = 0;
    }

    @zzo
    @Retention(RetentionPolicy.SOURCE)
    public @interface LinkType {

        @zzp
        public static final int LINK_TO_APP_DOWNLOAD = 2;

        @zzo
        public static final int LINK_TO_DIGITAL_CONTENT_OFFER = 1;

        @zzo
        public static final int LINK_TYPE_UNSPECIFIED = 0;
    }

    public /* synthetic */ LaunchExternalLinkParams(Uri uri, int i5, int i11, int i12, zzdr zzdrVar) {
        this.zza = uri;
        this.zzb = i5;
        this.zzc = i11;
        this.zzd = i12;
    }

    @zzo
    public static Builder newBuilder() {
        return new Builder(null);
    }

    @zzo
    public int getBillingProgram() {
        return this.zzd;
    }

    @zzo
    public int getLaunchMode() {
        return this.zzb;
    }

    @zzo
    public int getLinkType() {
        return this.zzc;
    }

    @zzo
    public Uri getLinkUri() {
        return this.zza;
    }
}
