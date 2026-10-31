package we;

import android.os.HandlerThread;
import vk.u;

/* loaded from: classes3.dex */
public final /* synthetic */ class b implements u {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94211a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f94212b;

    public /* synthetic */ b(int i5, int i11) {
        this.f94211a = i11;
        this.f94212b = i5;
    }

    @Override // vk.u
    public final Object get() {
        switch (this.f94211a) {
            case 0:
                return new HandlerThread(vf.o.o(this.f94212b, "ExoPlayer:MediaCodecAsyncAdapter:"));
            default:
                return new HandlerThread(vf.o.o(this.f94212b, "ExoPlayer:MediaCodecQueueingThread:"));
        }
    }
}
