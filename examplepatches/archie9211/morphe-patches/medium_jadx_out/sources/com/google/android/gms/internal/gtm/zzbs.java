package com.google.android.gms.internal.gtm;

import com.drew.metadata.photoshop.PhotoshopDirectory;
import defpackage.be5;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class zzbs {
    public static final String zza;
    public static final String zzb;

    static {
        String strReplaceAll = String.valueOf(be5.a / PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE).replaceAll("(\\d+)(\\d)(\\d\\d)", "$1.$2.$3");
        zza = strReplaceAll;
        zzb = "ma".concat(String.valueOf(strReplaceAll));
    }
}
