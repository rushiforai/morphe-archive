package com.vungle.ads.internal.ui.view;

import android.media.MediaPlayer;
import java.lang.ref.WeakReference;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final WeakReference f47594a;

    public a(d adVideoView) {
        Intrinsics.g(adVideoView, "adVideoView");
        this.f47594a = new WeakReference(adVideoView);
    }

    @Override // java.lang.Runnable
    public final void run() {
        MediaPlayer mediaPlayer;
        d dVar = (d) this.f47594a.get();
        if (dVar == null) {
            return;
        }
        dVar.b();
        if (!dVar.f47604i.get() || (mediaPlayer = dVar.f47602g) == null || !mediaPlayer.isPlaying() || dVar.f47610q) {
            return;
        }
        dVar.f47616w.postDelayed(this, 1000L);
    }
}
