package n90;

import b.c0;
import java.io.IOException;
import kotlin.jvm.internal.Intrinsics;
import m90.j0;
import m90.o;

/* loaded from: classes5.dex */
public final class f extends o {

    /* renamed from: b, reason: collision with root package name */
    public final long f78041b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f78042c;

    /* renamed from: d, reason: collision with root package name */
    public long f78043d;

    public f(j0 j0Var, long j11, boolean z11) {
        super(j0Var);
        this.f78041b = j11;
        this.f78042c = z11;
    }

    @Override // m90.o, m90.j0
    public final long read(m90.g sink, long j11) throws IOException {
        Intrinsics.g(sink, "sink");
        long j12 = this.f78043d;
        long j13 = this.f78041b;
        if (j12 > j13) {
            j11 = 0;
        } else if (this.f78042c) {
            long j14 = j13 - j12;
            if (j14 == 0) {
                return -1L;
            }
            j11 = Math.min(j11, j14);
        }
        long j15 = super.read(sink, j11);
        if (j15 != -1) {
            this.f78043d += j15;
        }
        long j16 = this.f78043d;
        if ((j16 >= j13 || j15 != -1) && j16 <= j13) {
            return j15;
        }
        if (j15 > 0 && j16 > j13) {
            long j17 = sink.f76126b - (j16 - j13);
            m90.g gVar = new m90.g();
            gVar.I(sink);
            sink.Z(gVar, j17);
            gVar.a();
        }
        StringBuilder sbU = c0.u(j13, "expected ", " bytes but got ");
        sbU.append(this.f78043d);
        throw new IOException(sbU.toString());
    }
}
