package com.fyber.inneractive.sdk.player.mediaplayer;

import android.media.AudioManager;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class m implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ p f30618a;

    public m(p pVar) {
        this.f30618a = pVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        p pVar = this.f30618a;
        String strB = pVar.b();
        long jCurrentTimeMillis = System.currentTimeMillis();
        AudioManager audioManager = (AudioManager) pVar.f30619a.getSystemService("audio");
        int streamVolume = audioManager.getStreamVolume(3);
        int streamMaxVolume = audioManager.getStreamMaxVolume(3);
        float f11 = streamVolume / streamMaxVolume;
        IAlog.a("%s unmute maxVolume = %d currentVolume = %d targetVolume = %s", pVar.b(), Integer.valueOf(streamMaxVolume), Integer.valueOf(streamVolume), Float.valueOf(f11));
        if (f11 == 0.0f) {
            f11 = 0.1f;
        }
        pVar.setVolume(f11, f11);
        IAlog.e(strB + "timelog: unmute took " + (System.currentTimeMillis() - jCurrentTimeMillis) + " msec", new Object[0]);
    }
}
