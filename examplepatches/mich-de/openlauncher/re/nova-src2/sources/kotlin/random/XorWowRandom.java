package kotlin.random;

import java.io.Serializable;
import kotlin.Metadata;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u00002\u00020\u00012\u00060\u0002j\u0002`\u0003¨\u0006\u0004"}, d2 = {"Lkotlin/random/XorWowRandom;", "Lkotlin/random/Random;", "Ljava/io/Serializable;", "Lkotlin/io/Serializable;", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class XorWowRandom extends Random implements Serializable {

    /* renamed from: c, reason: collision with root package name */
    public int f71892c;

    /* renamed from: d, reason: collision with root package name */
    public int f71893d;

    /* renamed from: e, reason: collision with root package name */
    public int f71894e;

    /* renamed from: f, reason: collision with root package name */
    public int f71895f;

    /* renamed from: g, reason: collision with root package name */
    public int f71896g;

    /* renamed from: h, reason: collision with root package name */
    public int f71897h;

    @Override // kotlin.random.Random
    public final int a(int i5) {
        return RandomKt.h(e(), i5);
    }

    @Override // kotlin.random.Random
    public final int e() {
        int i5 = this.f71892c;
        int i11 = i5 ^ (i5 >>> 2);
        this.f71892c = this.f71893d;
        this.f71893d = this.f71894e;
        this.f71894e = this.f71895f;
        int i12 = this.f71896g;
        this.f71895f = i12;
        int i13 = ((i11 ^ (i11 << 1)) ^ i12) ^ (i12 << 4);
        this.f71896g = i13;
        int i14 = this.f71897h + 362437;
        this.f71897h = i14;
        return i13 + i14;
    }
}
