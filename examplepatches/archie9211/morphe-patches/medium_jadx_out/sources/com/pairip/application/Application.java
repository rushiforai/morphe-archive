package com.pairip.application;

import android.content.Context;
import com.medium.android.donkey.DonkeyApplication;
import com.pairip.SignatureCheck;
import com.pairip.VMRunner;
import com.pairip.licensecheck.LicenseClient;

/* JADX INFO: loaded from: classes2.dex */
public class Application extends DonkeyApplication {
    @Override // android.content.ContextWrapper
    protected void attachBaseContext(Context context) {
        VMRunner.setContext(context);
        SignatureCheck.verifyIntegrity(context);
        LicenseClient.checkLicense(context);
        super.attachBaseContext(context);
    }
}
