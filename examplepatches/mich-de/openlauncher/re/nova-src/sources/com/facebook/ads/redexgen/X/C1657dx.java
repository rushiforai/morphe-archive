package com.facebook.ads.redexgen.X;

import android.media.AudioManager;
import android.os.Handler;
import android.os.Looper;

/* renamed from: com.facebook.ads.redexgen.X.dx, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1657dx implements AudioManager.OnAudioFocusChangeListener {
    public final /* synthetic */ C5N A00;

    public C1657dx(C5N c5n) {
        this.A00 = c5n;
    }

    @Override // android.media.AudioManager.OnAudioFocusChangeListener
    public final void onAudioFocusChange(int i5) {
        new Handler(Looper.getMainLooper()).post(new C0792Ax(this, i5));
    }
}
