package vf;

import android.net.Uri;
import fe.i0;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* loaded from: classes3.dex */
public final class l {

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ int f92690h = 0;

    /* renamed from: a, reason: collision with root package name */
    public final Uri f92691a;

    /* renamed from: b, reason: collision with root package name */
    public final int f92692b;

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f92693c;

    /* renamed from: d, reason: collision with root package name */
    public final Map f92694d;

    /* renamed from: e, reason: collision with root package name */
    public final long f92695e;

    /* renamed from: f, reason: collision with root package name */
    public final long f92696f;

    /* renamed from: g, reason: collision with root package name */
    public final int f92697g;

    static {
        i0.a("goog.exo.datasource");
    }

    public l(Uri uri, int i5, byte[] bArr, Map map, long j11, long j12, int i11) {
        wf.a.e(j11 >= 0);
        wf.a.e(j11 >= 0);
        wf.a.e(j12 > 0 || j12 == -1);
        this.f92691a = uri;
        this.f92692b = i5;
        this.f92693c = (bArr == null || bArr.length == 0) ? null : bArr;
        this.f92694d = Collections.unmodifiableMap(new HashMap(map));
        this.f92695e = j11;
        this.f92696f = j12;
        this.f92697g = i11;
    }

    public final String toString() {
        String str;
        StringBuilder sb2 = new StringBuilder("DataSpec[");
        int i5 = this.f92692b;
        if (i5 == 1) {
            str = "GET";
        } else if (i5 == 2) {
            str = "POST";
        } else {
            if (i5 != 3) {
                throw new IllegalStateException();
            }
            str = "HEAD";
        }
        sb2.append(str);
        sb2.append(" ");
        sb2.append(this.f92691a);
        sb2.append(", ");
        sb2.append(this.f92695e);
        sb2.append(", ");
        sb2.append(this.f92696f);
        sb2.append(", null, ");
        return b.c0.o(sb2, this.f92697g, "]");
    }
}
