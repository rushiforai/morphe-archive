package wb;

import android.media.MediaPlayer;
import com.bytedance.sdk.openadsdk.oty.sya;

/* loaded from: classes2.dex */
public final class b implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94132a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f94133b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ d f94134c;

    public /* synthetic */ b(d dVar, boolean z11, int i5) {
        this.f94132a = i5;
        this.f94134c = dVar;
        this.f94133b = z11;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f94132a) {
            case 0:
                boolean z11 = this.f94133b;
                d dVar = this.f94134c;
                if (!dVar.fby() && dVar.f94144jc != null) {
                    try {
                        dVar.f94138av = z11;
                        MediaPlayer mediaPlayer = ((n) dVar.f94144jc).f94163i;
                        if (mediaPlayer != null) {
                            if (z11) {
                                mediaPlayer.setVolume(0.0f, 0.0f);
                            } else {
                                mediaPlayer.setVolume(1.0f, 1.0f);
                            }
                        }
                        break;
                    } catch (Throwable th2) {
                        sya.ycx(th2, "WOEg2wGlYtHOXNwTgwGlJk3lY5YMsXnIjk/ZScIHqSxe4WOYBrhgxs5c3lmJHrAkWvcohw==", "aN0AkAe1aPeMS85YniayKUv+KIdH7T8=", "Sfsj", 1291);
                        return;
                    }
                }
                break;
            default:
                d dVar2 = this.f94134c;
                if (dVar2.f94144jc != null) {
                    ((n) dVar2.f94144jc).f94162h = this.f94133b;
                    break;
                }
                break;
        }
    }
}
