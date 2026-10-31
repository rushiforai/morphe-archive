package ie;

import b.c0;
import java.util.Locale;
import wf.v;

/* loaded from: classes3.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public int f61567a;

    /* renamed from: b, reason: collision with root package name */
    public int f61568b;

    /* renamed from: c, reason: collision with root package name */
    public int f61569c;

    /* renamed from: d, reason: collision with root package name */
    public int f61570d;

    /* renamed from: e, reason: collision with root package name */
    public int f61571e;

    /* renamed from: f, reason: collision with root package name */
    public int f61572f;

    /* renamed from: g, reason: collision with root package name */
    public int f61573g;

    /* renamed from: h, reason: collision with root package name */
    public int f61574h;

    /* renamed from: i, reason: collision with root package name */
    public int f61575i;

    /* renamed from: j, reason: collision with root package name */
    public int f61576j;

    /* renamed from: k, reason: collision with root package name */
    public long f61577k;

    /* renamed from: l, reason: collision with root package name */
    public int f61578l;

    public final String toString() {
        int i5 = this.f61567a;
        int i11 = this.f61568b;
        int i12 = this.f61569c;
        int i13 = this.f61570d;
        int i14 = this.f61571e;
        int i15 = this.f61572f;
        int i16 = this.f61573g;
        int i17 = this.f61574h;
        int i18 = this.f61575i;
        int i19 = this.f61576j;
        long j11 = this.f61577k;
        int i21 = this.f61578l;
        int i22 = v.f94376a;
        Locale locale = Locale.US;
        StringBuilder sbT = c0.t(i5, "DecoderCounters {\n decoderInits=", ",\n decoderReleases=", i11, "\n queuedInputBuffers=");
        c0.A(sbT, i12, "\n skippedInputBuffers=", i13, "\n renderedOutputBuffers=");
        c0.A(sbT, i14, "\n skippedOutputBuffers=", i15, "\n droppedBuffers=");
        c0.A(sbT, i16, "\n droppedInputBuffers=", i17, "\n maxConsecutiveDroppedBuffers=");
        c0.A(sbT, i18, "\n droppedToKeyframeEvents=", i19, "\n totalVideoFrameProcessingOffsetUs=");
        sbT.append(j11);
        sbT.append("\n videoFrameProcessingOffsetCount=");
        sbT.append(i21);
        sbT.append("\n}");
        return sbT.toString();
    }
}
