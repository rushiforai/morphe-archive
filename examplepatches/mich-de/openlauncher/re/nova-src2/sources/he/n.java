package he;

import android.media.AudioTrack;

/* loaded from: classes3.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final m f59751a;

    /* renamed from: b, reason: collision with root package name */
    public int f59752b;

    /* renamed from: c, reason: collision with root package name */
    public long f59753c;

    /* renamed from: d, reason: collision with root package name */
    public long f59754d;

    /* renamed from: e, reason: collision with root package name */
    public long f59755e;

    /* renamed from: f, reason: collision with root package name */
    public long f59756f;

    public n(AudioTrack audioTrack) {
        if (wf.v.f94376a >= 19) {
            this.f59751a = new m(audioTrack);
            a();
        } else {
            this.f59751a = null;
            b(3);
        }
    }

    public final void a() {
        if (this.f59751a != null) {
            b(0);
        }
    }

    public final void b(int i5) {
        this.f59752b = i5;
        if (i5 == 0) {
            this.f59755e = 0L;
            this.f59756f = -1L;
            this.f59753c = System.nanoTime() / 1000;
            this.f59754d = com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c;
            return;
        }
        if (i5 == 1) {
            this.f59754d = com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c;
            return;
        }
        if (i5 == 2 || i5 == 3) {
            this.f59754d = 10000000L;
        } else {
            if (i5 != 4) {
                throw new IllegalStateException();
            }
            this.f59754d = 500000L;
        }
    }
}
