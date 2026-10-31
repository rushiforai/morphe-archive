package com.fyber.inneractive.sdk.config;

import android.content.ContentResolver;
import android.content.Context;
import android.provider.Settings;
import com.amplitude.common.android.AndroidContextProvider;

/* loaded from: classes.dex */
public abstract class q {
    public static void a(Context context, z zVar) {
        String string = null;
        try {
            ContentResolver contentResolver = context.getContentResolver();
            z = Settings.Secure.getInt(contentResolver, AndroidContextProvider.SETTING_LIMIT_AD_TRACKING) != 0;
            if (!z) {
                string = Settings.Secure.getString(contentResolver, AndroidContextProvider.SETTING_ADVERTISING_ID);
            }
        } catch (Settings.SettingNotFoundException unused) {
        }
        if (string != null) {
            synchronized (zVar) {
                y yVar = zVar.f27966b;
                yVar.f27951a = string;
                yVar.f27952b = z;
                yVar.f27953c = true;
            }
        }
    }
}
