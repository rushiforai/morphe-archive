package com.google.android.libraries.places.internal;

import java.util.Iterator;

/* loaded from: classes3.dex */
public final class zzsc {
    public static final /* synthetic */ int zza = 0;
    private static final zzob zzb = zzob.zzn("http", "https", "mailto", "ftp");
    private static final zzob zzc = zzob.zzp("audio/3gpp2", "audio/3gpp", "audio/aac", "audio/midi", "audio/mp3", "audio/mp4", "audio/mpeg", "audio/oga", "audio/ogg", "audio/opus", "audio/x-m4a", "audio/x-matroska", "audio/x-wav", "audio/wav", "audio/webm", "image/bmp", "image/gif", "image/jpeg", "image/jpg", "image/png", "image/svg+xml", "image/tiff", "image/webp", "image/x-icon", "video/mpeg", "video/mp4", "video/ogg", "video/webm", "video/x-matroska", "font/ttf");
    private static final zzob zzd = zzob.zzk();

    public static zzsb zza(String str, zzsb zzsbVar) {
        char cCharAt;
        int i5;
        char cCharAt2;
        char cCharAt3;
        zzob zzobVar = zzd;
        String strZza = zzlu.zza(str);
        zzox it = zzb.iterator();
        while (true) {
            if (!it.hasNext()) {
                if (strZza.startsWith("data:")) {
                    String strZza2 = zzlu.zza(str);
                    if (strZza2.startsWith("data:") && strZza2.length() > 5) {
                        int i11 = 5;
                        while (i11 < strZza2.length() && (cCharAt3 = strZza2.charAt(i11)) != ';' && cCharAt3 != ',') {
                            i11++;
                        }
                        if (zzc.contains(strZza2.substring(5, i11)) && strZza2.startsWith(";base64,", i11) && (i5 = i11 + 8) < strZza2.length()) {
                            while (i5 < strZza2.length() && (cCharAt2 = strZza2.charAt(i5)) != '=') {
                                if ((cCharAt2 < 'a' || cCharAt2 > 'z') && !((cCharAt2 >= '0' && cCharAt2 <= '9') || cCharAt2 == '+' || cCharAt2 == '/')) {
                                    break;
                                }
                                i5++;
                            }
                            while (i5 < strZza2.length()) {
                                if (strZza2.charAt(i5) == '=') {
                                    i5++;
                                }
                            }
                        }
                    }
                    return zzsbVar;
                }
                Iterator it2 = zzobVar.iterator();
                while (true) {
                    if (it2.hasNext()) {
                        if (strZza.startsWith(String.valueOf(zzlu.zza(((zzry) it2.next()).name()).replace('_', '-')).concat(":"))) {
                            break;
                        }
                    } else {
                        for (int i12 = 0; i12 < str.length() && (cCharAt = str.charAt(i12)) != '#' && cCharAt != '/'; i12++) {
                            if (cCharAt != ':') {
                                if (cCharAt == '?') {
                                    break;
                                }
                            }
                        }
                    }
                }
            } else {
                if (strZza.startsWith(String.valueOf((String) it.next()).concat(":"))) {
                    break;
                }
            }
        }
        return new zzsb(str);
    }
}
