package com.google.android.gms.common;

import com.google.android.gms.common.annotation.KeepName;
import pg.c;

@KeepName
/* loaded from: classes3.dex */
public final class GooglePlayServicesIncorrectManifestValueException extends GooglePlayServicesManifestException {
    public GooglePlayServicesIncorrectManifestValueException(int i5) {
        int i11 = c.f82561a;
        StringBuilder sb2 = new StringBuilder(String.valueOf(i11).length() + 104 + String.valueOf(i5).length() + 194);
        sb2.append("The meta-data tag in your app's AndroidManifest.xml does not have the right value.  Expected ");
        sb2.append(i11);
        sb2.append(" but found ");
        sb2.append(i5);
        sb2.append(".  You must have the following declaration within the <application> element:     <meta-data android:name=\"com.google.android.gms.version\" android:value=\"@integer/google_play_services_version\" />");
        super(sb2.toString());
    }
}
