package com.google.android.libraries.places.internal;

/* loaded from: classes3.dex */
final class zzja {
    private zza[] addressComponents;
    private String businessStatus;
    private Boolean curbsidePickup;
    private zzd currentOpeningHours;
    private Boolean delivery;
    private Boolean dineIn;
    private zzb editorialSummary;
    private String formattedAddress;
    private zzc geometry;
    private String icon;
    private String iconBackgroundColor;
    private String iconMaskBaseUri;
    private String internationalPhoneNumber;
    private String name;
    private zzd openingHours;
    private zze[] photos;
    private String placeId;
    private zzf plusCode;
    private Integer priceLevel;
    private Double rating;
    private Boolean reservable;
    private zzd[] secondaryOpeningHours;
    private Boolean servesBeer;
    private Boolean servesBreakfast;
    private Boolean servesBrunch;
    private Boolean servesDinner;
    private Boolean servesLunch;
    private Boolean servesVegetarianFood;
    private Boolean servesWine;
    private Boolean takeout;
    private String[] types;
    private Integer userRatingsTotal;
    private Integer utcOffset;
    private String website;
    private Boolean wheelchairAccessibleEntrance;

    class zza {
        private String longName;
        private String shortName;
        private String[] types;

        public final zznx zza() {
            String[] strArr = this.types;
            return strArr != null ? zznx.zzk(strArr) : zznx.zzl();
        }

        public final String zzb() {
            return this.longName;
        }

        public final String zzc() {
            return this.shortName;
        }
    }

    class zzb {
        private String language;
        private String overview;

        public final String zza() {
            return this.language;
        }

        public final String zzb() {
            return this.overview;
        }
    }

    class zzc {
        private zza location;
        private zzb viewport;

        class zza {
            private Double lat;
            private Double lng;

            public final Double zza() {
                return this.lat;
            }

            public final Double zzb() {
                return this.lng;
            }
        }

        class zzb {
            private zza northeast;
            private zza southwest;

            public final zza zza() {
                return this.northeast;
            }

            public final zza zzb() {
                return this.southwest;
            }
        }

        public final zza zza() {
            return this.location;
        }

        public final zzb zzb() {
            return this.viewport;
        }
    }

    class zzd {
        private zza[] periods;
        private zzb[] specialDays;
        private String type;
        private String[] weekdayText;

        class zza {
            private zzc close;
            private zzc open;

            public final zzc zza() {
                return this.close;
            }

            public final zzc zzb() {
                return this.open;
            }
        }

        class zzb {
            private String date;
            private Boolean exceptionalHours;

            public final Boolean zza() {
                return this.exceptionalHours;
            }

            public final String zzb() {
                return this.date;
            }
        }

        class zzc {
            private String date;
            private Integer day;
            private String time;
            private Boolean truncated;

            public final Boolean zza() {
                return this.truncated;
            }

            public final Integer zzb() {
                return this.day;
            }

            public final String zzc() {
                return this.date;
            }

            public final String zzd() {
                return this.time;
            }
        }

        public final zznx zza() {
            zza[] zzaVarArr = this.periods;
            return zzaVarArr != null ? zznx.zzk(zzaVarArr) : zznx.zzl();
        }

        public final zznx zzb() {
            zzb[] zzbVarArr = this.specialDays;
            return zzbVarArr != null ? zznx.zzk(zzbVarArr) : zznx.zzl();
        }

        public final zznx zzc() {
            String[] strArr = this.weekdayText;
            return strArr != null ? zznx.zzk(strArr) : zznx.zzl();
        }

        public final String zzd() {
            return this.type;
        }
    }

    class zze {
        private Integer height;
        private String[] htmlAttributions;
        private String photoReference;
        private Integer width;

        public final zznx zza() {
            String[] strArr = this.htmlAttributions;
            return strArr != null ? zznx.zzk(strArr) : zznx.zzl();
        }

        public final Integer zzb() {
            return this.height;
        }

        public final Integer zzc() {
            return this.width;
        }

        public final String zzd() {
            return this.photoReference;
        }
    }

    class zzf {
        private String compoundCode;
        private String globalCode;

        public final String zza() {
            return this.compoundCode;
        }

        public final String zzb() {
            return this.globalCode;
        }
    }

    public final String zzA() {
        return this.formattedAddress;
    }

    public final String zzB() {
        return this.iconBackgroundColor;
    }

    public final String zzC() {
        return this.iconMaskBaseUri;
    }

    public final String zzD() {
        return this.internationalPhoneNumber;
    }

    public final String zzE() {
        return this.name;
    }

    public final String zzF() {
        return this.placeId;
    }

    public final String zzG() {
        return this.website;
    }

    public final zzb zza() {
        return this.editorialSummary;
    }

    public final zzc zzb() {
        return this.geometry;
    }

    public final zzd zzc() {
        return this.currentOpeningHours;
    }

    public final zzd zzd() {
        return this.openingHours;
    }

    public final zzf zze() {
        return this.plusCode;
    }

    public final zznx zzf() {
        zza[] zzaVarArr = this.addressComponents;
        return zzaVarArr != null ? zznx.zzk(zzaVarArr) : zznx.zzl();
    }

    public final zznx zzg() {
        zze[] zzeVarArr = this.photos;
        return zzeVarArr != null ? zznx.zzk(zzeVarArr) : zznx.zzl();
    }

    public final zznx zzh() {
        zzd[] zzdVarArr = this.secondaryOpeningHours;
        return zzdVarArr != null ? zznx.zzk(zzdVarArr) : zznx.zzl();
    }

    public final zznx zzi() {
        String[] strArr = this.types;
        return strArr != null ? zznx.zzk(strArr) : zznx.zzl();
    }

    public final Boolean zzj() {
        return this.curbsidePickup;
    }

    public final Boolean zzk() {
        return this.delivery;
    }

    public final Boolean zzl() {
        return this.dineIn;
    }

    public final Boolean zzm() {
        return this.reservable;
    }

    public final Boolean zzn() {
        return this.servesBeer;
    }

    public final Boolean zzo() {
        return this.servesBreakfast;
    }

    public final Boolean zzp() {
        return this.servesDinner;
    }

    public final Boolean zzq() {
        return this.servesLunch;
    }

    public final Boolean zzr() {
        return this.servesVegetarianFood;
    }

    public final Boolean zzs() {
        return this.servesWine;
    }

    public final Boolean zzt() {
        return this.takeout;
    }

    public final Boolean zzu() {
        return this.wheelchairAccessibleEntrance;
    }

    public final Double zzv() {
        return this.rating;
    }

    public final Integer zzw() {
        return this.priceLevel;
    }

    public final Integer zzx() {
        return this.userRatingsTotal;
    }

    public final Integer zzy() {
        return this.utcOffset;
    }

    public final String zzz() {
        return this.businessStatus;
    }
}
