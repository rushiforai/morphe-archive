package we;

import android.media.MediaCodec;
import android.os.Handler;
import android.os.Message;
import com.google.android.exoplayer2.ExoPlaybackException;
import wf.v;

/* loaded from: classes3.dex */
public final /* synthetic */ class a implements MediaCodec.OnFrameRenderedListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94209a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ea.a f94210b;

    public /* synthetic */ a(j jVar, ea.a aVar, int i5) {
        this.f94209a = i5;
        this.f94210b = aVar;
    }

    @Override // android.media.MediaCodec.OnFrameRenderedListener
    public final void onFrameRendered(MediaCodec mediaCodec, long j11, long j12) {
        switch (this.f94209a) {
            case 0:
                ea.a aVar = this.f94210b;
                Handler handler = (Handler) aVar.f52418b;
                if (v.f94376a < 30) {
                    handler.sendMessageAtFrontOfQueue(Message.obtain(handler, 0, (int) (j11 >> 32), (int) j11));
                    break;
                } else {
                    xf.f fVar = (xf.f) aVar.f52419c;
                    if (aVar == fVar.f95794l1) {
                        if (j11 == Long.MAX_VALUE) {
                            fVar.f94291x0 = true;
                            break;
                        } else {
                            try {
                                fVar.p0(j11);
                                fVar.x0();
                                fVar.f94295z0.f61571e++;
                                fVar.w0();
                                fVar.Y(j11);
                                break;
                            } catch (ExoPlaybackException e3) {
                                fVar.f94293y0 = e3;
                                return;
                            }
                        }
                    }
                }
                break;
            default:
                ea.a aVar2 = this.f94210b;
                Handler handler2 = (Handler) aVar2.f52418b;
                if (v.f94376a < 30) {
                    handler2.sendMessageAtFrontOfQueue(Message.obtain(handler2, 0, (int) (j11 >> 32), (int) j11));
                    break;
                } else {
                    xf.f fVar2 = (xf.f) aVar2.f52419c;
                    if (aVar2 == fVar2.f95794l1) {
                        if (j11 == Long.MAX_VALUE) {
                            fVar2.f94291x0 = true;
                            break;
                        } else {
                            try {
                                fVar2.p0(j11);
                                fVar2.x0();
                                fVar2.f94295z0.f61571e++;
                                fVar2.w0();
                                fVar2.Y(j11);
                                break;
                            } catch (ExoPlaybackException e11) {
                                fVar2.f94293y0 = e11;
                            }
                        }
                    }
                }
                break;
        }
    }
}
