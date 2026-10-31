package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzhq {
    private String description;
    private Integer distanceMeters;
    private zzb[] matchedSubstrings;
    private String placeId;
    private zza structuredFormatting;
    private String[] types;

    class zza {
        private String mainText;
        private zzb[] mainTextMatchedSubstrings;
        private String secondaryText;
        private zzb[] secondaryTextMatchedSubstrings;

        public final zznx zza() {
            zzb[] zzbVarArr = this.mainTextMatchedSubstrings;
            return zzbVarArr != null ? zznx.zzk(zzbVarArr) : zznx.zzl();
        }

        public final zznx zzb() {
            zzb[] zzbVarArr = this.secondaryTextMatchedSubstrings;
            return zzbVarArr != null ? zznx.zzk(zzbVarArr) : zznx.zzl();
        }

        public final String zzc() {
            return this.mainText;
        }

        public final String zzd() {
            return this.secondaryText;
        }
    }

    class zzb {
        Integer length;
        Integer offset;
    }

    public final zza zza() {
        return this.structuredFormatting;
    }

    public final zznx zzb() {
        zzb[] zzbVarArr = this.matchedSubstrings;
        return zzbVarArr != null ? zznx.zzk(zzbVarArr) : zznx.zzl();
    }

    public final zznx zzc() {
        String[] strArr = this.types;
        return strArr != null ? zznx.zzk(strArr) : zznx.zzl();
    }

    public final Integer zzd() {
        return this.distanceMeters;
    }

    public final String zze() {
        return this.description;
    }

    public final String zzf() {
        return this.placeId;
    }
}
