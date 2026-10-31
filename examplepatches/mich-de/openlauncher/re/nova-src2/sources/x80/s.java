package x80;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class s extends k0 {

    /* renamed from: e, reason: collision with root package name */
    public static final a0 f95608e;

    /* renamed from: c, reason: collision with root package name */
    public final List f95609c;

    /* renamed from: d, reason: collision with root package name */
    public final List f95610d;

    static {
        Pattern pattern = a0.f95396e;
        f95608e = z.a("application/x-www-form-urlencoded");
    }

    public s(ArrayList encodedNames, ArrayList encodedValues) {
        Intrinsics.g(encodedNames, "encodedNames");
        Intrinsics.g(encodedValues, "encodedValues");
        this.f95609c = y80.c.v(encodedNames);
        this.f95610d = y80.c.v(encodedValues);
    }

    public final long a(m90.h hVar, boolean z11) {
        m90.g gVarI;
        if (z11) {
            gVarI = new m90.g();
        } else {
            Intrinsics.d(hVar);
            gVarI = hVar.i();
        }
        List list = this.f95609c;
        int size = list.size();
        for (int i5 = 0; i5 < size; i5++) {
            if (i5 > 0) {
                gVarI.g0(38);
            }
            gVarI.m0((String) list.get(i5));
            gVarI.g0(61);
            gVarI.m0((String) this.f95610d.get(i5));
        }
        if (!z11) {
            return 0L;
        }
        long j11 = gVarI.f76126b;
        gVarI.a();
        return j11;
    }

    @Override // x80.k0
    public final long contentLength() {
        return a(null, true);
    }

    @Override // x80.k0
    public final a0 contentType() {
        return f95608e;
    }

    @Override // x80.k0
    public final void writeTo(m90.h sink) {
        Intrinsics.g(sink, "sink");
        a(sink, false);
    }
}
