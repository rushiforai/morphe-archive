package com.teslacoilsw.launcher.screenoff;

import android.os.Bundle;
import android.provider.Settings;
import w20.a;

/* loaded from: classes4.dex */
public class TimeOutActivity extends a {

    /* renamed from: b, reason: collision with root package name */
    public int f46164b = Integer.MIN_VALUE;

    @Override // w20.a, android.app.Activity
    public final void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        getWindow().getAttributes().screenBrightness = 0.0f;
        getWindow().getDecorView().setSystemUiVisibility(2);
        this.f46164b = Settings.System.getInt(getContentResolver(), "screen_off_timeout", Integer.MIN_VALUE);
        Settings.System.putInt(getContentResolver(), "screen_off_timeout", 1000);
    }

    @Override // android.app.Activity
    public final void onPause() {
        super.onPause();
        if (this.f46164b != Integer.MIN_VALUE) {
            Settings.System.putInt(getContentResolver(), "screen_off_timeout", this.f46164b);
        }
        finish();
    }
}
