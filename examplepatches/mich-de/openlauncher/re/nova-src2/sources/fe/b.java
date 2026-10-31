package fe;

import android.media.AudioManager;
import android.os.Handler;

/* loaded from: classes3.dex */
public final class b implements AudioManager.OnAudioFocusChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final Handler f54713a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ab.h f54714b;

    public b(ab.h hVar, Handler handler) {
        this.f54714b = hVar;
        this.f54713a = handler;
    }

    @Override // android.media.AudioManager.OnAudioFocusChangeListener
    public final void onAudioFocusChange(int i5) {
        this.f54713a.post(new ab.k(this, i5, 6));
    }
}
