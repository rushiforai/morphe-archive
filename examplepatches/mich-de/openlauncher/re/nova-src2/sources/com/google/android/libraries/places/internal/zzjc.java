package com.google.android.libraries.places.internal;

import android.location.Location;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.libraries.places.api.model.LocationBias;
import com.google.android.libraries.places.api.model.LocationRestriction;
import com.google.android.libraries.places.api.model.RectangularBounds;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.IOException;
import java.util.Iterator;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class zzjc {
    private static final zzoa zza;

    static {
        zznz zznzVar = new zznz();
        zznzVar.zza(zzen.NONE, "NONE");
        zznzVar.zza(zzen.PSK, "WPA_PSK");
        zznzVar.zza(zzen.EAP, "WPA_EAP");
        zznzVar.zza(zzen.OTHER, "SECURED_NONE");
        zza = zznzVar.zzc();
    }

    public static String zza(Location location) {
        if (location == null) {
            return null;
        }
        return zzf(location.getLatitude(), location.getLongitude());
    }

    public static String zzb(LatLng latLng) {
        if (latLng == null) {
            return null;
        }
        return zzf(latLng.f33742f, latLng.f33743g);
    }

    public static String zzc(LocationBias locationBias) {
        if (locationBias == null) {
            return null;
        }
        if (locationBias instanceof RectangularBounds) {
            return zzg((RectangularBounds) locationBias);
        }
        throw new AssertionError("Unknown LocationBias type.");
    }

    public static String zzd(LocationRestriction locationRestriction) {
        if (locationRestriction == null) {
            return null;
        }
        if (locationRestriction instanceof RectangularBounds) {
            return zzg((RectangularBounds) locationRestriction);
        }
        throw new AssertionError("Unknown LocationRestriction type.");
    }

    public static String zze(zznx zznxVar, int i5) {
        StringBuilder sb2 = new StringBuilder();
        int size = zznxVar.size();
        for (int i11 = 0; i11 < size; i11++) {
            zzeo zzeoVar = (zzeo) zznxVar.get(i11);
            int length = sb2.length();
            zznz zznzVar = new zznz();
            zznzVar.zza("mac", zzeoVar.zzd());
            zznzVar.zza("strength_dbm", Integer.valueOf(zzeoVar.zzb()));
            zznzVar.zza("wifi_auth_type", zza.get(zzeoVar.zzc()));
            zznzVar.zza("is_connected", Boolean.valueOf(zzeoVar.zze()));
            zznzVar.zza("frequency_mhz", Integer.valueOf(zzeoVar.zza()));
            zzoa zzoaVarZzc = zznzVar.zzc();
            zzmh zzmhVarZzc = zzmh.zzc(",");
            Iterator<E> it = zzoaVarZzc.entrySet().iterator();
            StringBuilder sb3 = new StringBuilder();
            try {
                zzmf.zza(sb3, it, zzmhVarZzc, "=");
                String string = sb3.toString();
                int length2 = sb2.length();
                String strConcat = (length > 0 ? "|" : b.f42142b).concat(string);
                if (strConcat.length() + length2 > 4000) {
                    break;
                }
                sb2.append(strConcat);
            } catch (IOException e3) {
                throw new AssertionError(e3);
            }
        }
        return sb2.toString();
    }

    private static String zzf(double d5, double d11) {
        return String.format(Locale.US, "%.15f,%.15f", Double.valueOf(d5), Double.valueOf(d11));
    }

    private static String zzg(RectangularBounds rectangularBounds) {
        LatLng southwest = rectangularBounds.getSouthwest();
        double d5 = southwest.f33742f;
        double d11 = southwest.f33743g;
        LatLng northeast = rectangularBounds.getNortheast();
        return String.format(Locale.US, "rectangle:%.15f,%.15f|%.15f,%.15f", Double.valueOf(d5), Double.valueOf(d11), Double.valueOf(northeast.f33742f), Double.valueOf(northeast.f33743g));
    }
}
