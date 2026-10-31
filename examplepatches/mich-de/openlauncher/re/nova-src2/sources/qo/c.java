package qo;

import ai.y0;
import java.io.File;

/* loaded from: classes3.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final String f84270a;

    /* renamed from: b, reason: collision with root package name */
    public final long[] f84271b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f84272c;

    /* renamed from: d, reason: collision with root package name */
    public y0 f84273d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ d f84274e;

    public c(d dVar, String str) {
        this.f84274e = dVar;
        this.f84270a = str;
        this.f84271b = new long[dVar.f84282g];
    }

    public final File a(int i5) {
        return new File(this.f84274e.f84276a, this.f84270a + "." + i5);
    }

    public final File b(int i5) {
        return new File(this.f84274e.f84276a, this.f84270a + "." + i5 + ".tmp");
    }

    public final String c() {
        StringBuilder sb2 = new StringBuilder();
        for (long j11 : this.f84271b) {
            sb2.append(' ');
            sb2.append(j11);
        }
        return sb2.toString();
    }
}
