package com.facebook.ads.redexgen.X;

import android.net.Uri;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: assets/audience_network/classes.dex */
public final class Uc {
    public static final AtomicLong A07 = new AtomicLong();
    public final long A00;
    public final long A01;
    public final long A02;
    public final long A03;
    public final Uri A04;
    public final NX A05;
    public final Map<String, List<String>> A06;

    /* JADX WARN: Illegal instructions before constructor call */
    public Uc(long j11, NX nx2, long j12) {
        Uri uri;
        if (nx2 != null) {
            uri = nx2.A06;
        } else {
            uri = null;
        }
        this(j11, nx2, uri, Collections.emptyMap(), j12, 0L, 0L);
    }

    public Uc(long j11, NX nx2, Uri uri, Map<String, List<String>> responseHeaders, long j12, long j13, long j14) {
        this.A03 = j11;
        this.A05 = nx2;
        this.A04 = uri;
        this.A06 = responseHeaders;
        this.A01 = j12;
        this.A02 = j13;
        this.A00 = j14;
    }

    public static long A00() {
        return A07.getAndIncrement();
    }
}
