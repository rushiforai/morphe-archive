package ie;

import android.media.MediaCodec;
import wf.v;

/* loaded from: classes3.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public byte[] f61557a;

    /* renamed from: b, reason: collision with root package name */
    public byte[] f61558b;

    /* renamed from: c, reason: collision with root package name */
    public int f61559c;

    /* renamed from: d, reason: collision with root package name */
    public int[] f61560d;

    /* renamed from: e, reason: collision with root package name */
    public int[] f61561e;

    /* renamed from: f, reason: collision with root package name */
    public int f61562f;

    /* renamed from: g, reason: collision with root package name */
    public int f61563g;

    /* renamed from: h, reason: collision with root package name */
    public int f61564h;

    /* renamed from: i, reason: collision with root package name */
    public final MediaCodec.CryptoInfo f61565i;

    /* renamed from: j, reason: collision with root package name */
    public final io.sentry.internal.debugmeta.c f61566j;

    public c() {
        io.sentry.internal.debugmeta.c cVar;
        MediaCodec.CryptoInfo cryptoInfo = new MediaCodec.CryptoInfo();
        this.f61565i = cryptoInfo;
        if (v.f94376a >= 24) {
            cVar = new io.sentry.internal.debugmeta.c();
            cVar.f67327a = cryptoInfo;
            cVar.f67328b = new MediaCodec.CryptoInfo.Pattern(0, 0);
        } else {
            cVar = null;
        }
        this.f61566j = cVar;
    }
}
