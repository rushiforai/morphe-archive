package com.google.android.gms.internal.gtm;

import android.content.res.Resources;
import android.content.res.XmlResourceParser;
import android.text.TextUtils;
import java.io.IOException;
import java.util.Locale;
import org.xmlpull.v1.XmlPullParserException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
class zzcr extends zzbq {
    final zzcq zza;

    public zzcr(zzbu zzbuVar, zzcq zzcqVar) {
        super(zzbuVar);
        this.zza = zzcqVar;
    }

    private final zzcp zzb(XmlResourceParser xmlResourceParser) {
        try {
            xmlResourceParser.next();
            int eventType = xmlResourceParser.getEventType();
            while (eventType != 1) {
                if (xmlResourceParser.getEventType() == 2) {
                    String lowerCase = xmlResourceParser.getName().toLowerCase(Locale.US);
                    if (lowerCase.equals("screenname")) {
                        String attributeValue = xmlResourceParser.getAttributeValue(null, "name");
                        String strTrim = xmlResourceParser.nextText().trim();
                        if (!TextUtils.isEmpty(attributeValue) && !TextUtils.isEmpty(strTrim)) {
                            this.zza.zzb(attributeValue, strTrim);
                        }
                    } else if (lowerCase.equals("string")) {
                        String attributeValue2 = xmlResourceParser.getAttributeValue(null, "name");
                        String strTrim2 = xmlResourceParser.nextText().trim();
                        if (!TextUtils.isEmpty(attributeValue2) && strTrim2 != null) {
                            this.zza.zze(attributeValue2, strTrim2);
                        }
                    } else if (lowerCase.equals("bool")) {
                        String attributeValue3 = xmlResourceParser.getAttributeValue(null, "name");
                        String strTrim3 = xmlResourceParser.nextText().trim();
                        if (!TextUtils.isEmpty(attributeValue3) && !TextUtils.isEmpty(strTrim3)) {
                            try {
                                this.zza.zzc(attributeValue3, Boolean.parseBoolean(strTrim3));
                            } catch (NumberFormatException e) {
                                zzS("Error parsing bool configuration value", strTrim3, e);
                            }
                        }
                    } else if (lowerCase.equals("integer")) {
                        String attributeValue4 = xmlResourceParser.getAttributeValue(null, "name");
                        String strTrim4 = xmlResourceParser.nextText().trim();
                        if (!TextUtils.isEmpty(attributeValue4) && !TextUtils.isEmpty(strTrim4)) {
                            try {
                                this.zza.zzd(attributeValue4, Integer.parseInt(strTrim4));
                            } catch (NumberFormatException e2) {
                                zzS("Error parsing int configuration value", strTrim4, e2);
                            }
                        }
                    }
                }
                eventType = xmlResourceParser.next();
            }
        } catch (IOException e3) {
            zzJ("Error parsing tracker configuration file", e3);
        } catch (XmlPullParserException e4) {
            zzJ("Error parsing tracker configuration file", e4);
        }
        return this.zza.zza();
    }

    public final zzcp zza(int i) {
        try {
            return zzb(zzt().zzb().getResources().getXml(i));
        } catch (Resources.NotFoundException e) {
            this.zzR("inflate() called with unknown resourceId", e);
            return null;
        }
    }
}
