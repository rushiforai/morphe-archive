package com.fyber.inneractive.sdk.player.exoplayer2.upstream;

import android.net.Uri;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class k {

    /* renamed from: a, reason: collision with root package name */
    public final Uri f30365a;

    /* renamed from: b, reason: collision with root package name */
    public final long f30366b;

    /* renamed from: c, reason: collision with root package name */
    public final long f30367c;

    /* renamed from: d, reason: collision with root package name */
    public final long f30368d;

    /* renamed from: e, reason: collision with root package name */
    public final String f30369e;

    /* renamed from: f, reason: collision with root package name */
    public final int f30370f;

    public k(Uri uri, long j11, long j12, long j13, String str, int i5) {
        if (j11 < 0) {
            throw new IllegalArgumentException();
        }
        if (j12 < 0) {
            throw new IllegalArgumentException();
        }
        if (j13 <= 0 && j13 != -1) {
            throw new IllegalArgumentException();
        }
        this.f30365a = uri;
        this.f30366b = j11;
        this.f30367c = j12;
        this.f30368d = j13;
        this.f30369e = str;
        this.f30370f = i5;
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("DataSpec[");
        sb2.append(this.f30365a);
        sb2.append(", ");
        sb2.append(Arrays.toString((byte[]) null));
        sb2.append(", ");
        sb2.append(this.f30366b);
        sb2.append(", ");
        sb2.append(this.f30367c);
        sb2.append(", ");
        sb2.append(this.f30368d);
        sb2.append(", ");
        sb2.append(this.f30369e);
        sb2.append(", ");
        return b.c0.o(sb2, this.f30370f, "]");
    }
}
