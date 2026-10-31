package x80;

import java.util.List;
import java.util.regex.Pattern;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public final class c0 extends k0 {

    /* renamed from: g, reason: collision with root package name */
    public static final a0 f95411g;

    /* renamed from: h, reason: collision with root package name */
    public static final a0 f95412h;

    /* renamed from: i, reason: collision with root package name */
    public static final byte[] f95413i;

    /* renamed from: j, reason: collision with root package name */
    public static final byte[] f95414j;

    /* renamed from: k, reason: collision with root package name */
    public static final byte[] f95415k;

    /* renamed from: c, reason: collision with root package name */
    public final m90.j f95416c;

    /* renamed from: d, reason: collision with root package name */
    public final List f95417d;

    /* renamed from: e, reason: collision with root package name */
    public final a0 f95418e;

    /* renamed from: f, reason: collision with root package name */
    public long f95419f;

    static {
        Pattern pattern = a0.f95396e;
        f95411g = z.a("multipart/mixed");
        z.a("multipart/alternative");
        z.a("multipart/digest");
        z.a("multipart/parallel");
        f95412h = z.a("multipart/form-data");
        f95413i = new byte[]{58, 32};
        f95414j = new byte[]{13, 10};
        f95415k = new byte[]{45, 45};
    }

    public c0(m90.j boundaryByteString, a0 type, List list) {
        Intrinsics.g(boundaryByteString, "boundaryByteString");
        Intrinsics.g(type, "type");
        this.f95416c = boundaryByteString;
        this.f95417d = list;
        Pattern pattern = a0.f95396e;
        this.f95418e = z.a(type + "; boundary=" + boundaryByteString.r());
        this.f95419f = -1L;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final long a(m90.h hVar, boolean z11) {
        m90.g gVar;
        m90.h gVar2;
        if (z11) {
            gVar2 = new m90.g();
            gVar = gVar2;
        } else {
            gVar = 0;
            gVar2 = hVar;
        }
        List list = this.f95417d;
        int size = list.size();
        long j11 = 0;
        int i5 = 0;
        while (true) {
            m90.j jVar = this.f95416c;
            byte[] bArr = f95415k;
            byte[] bArr2 = f95414j;
            if (i5 >= size) {
                Intrinsics.d(gVar2);
                gVar2.write(bArr);
                gVar2.C(jVar);
                gVar2.write(bArr);
                gVar2.write(bArr2);
                if (!z11) {
                    return j11;
                }
                Intrinsics.d(gVar);
                long j12 = j11 + gVar.f76126b;
                gVar.a();
                return j12;
            }
            b0 b0Var = (b0) list.get(i5);
            u uVar = b0Var.f95405a;
            k0 k0Var = b0Var.f95406b;
            Intrinsics.d(gVar2);
            gVar2.write(bArr);
            gVar2.C(jVar);
            gVar2.write(bArr2);
            int size2 = uVar.size();
            for (int i11 = 0; i11 < size2; i11++) {
                gVar2.u(uVar.c(i11)).write(f95413i).u(uVar.e(i11)).write(bArr2);
            }
            a0 a0VarContentType = k0Var.contentType();
            if (a0VarContentType != null) {
                gVar2.u("Content-Type: ").u(a0VarContentType.f95398a).write(bArr2);
            }
            long jContentLength = k0Var.contentLength();
            if (jContentLength != -1) {
                gVar2.u("Content-Length: ").E(jContentLength).write(bArr2);
            } else if (z11) {
                Intrinsics.d(gVar);
                gVar.a();
                return -1L;
            }
            gVar2.write(bArr2);
            if (z11) {
                j11 += jContentLength;
            } else {
                k0Var.writeTo(gVar2);
            }
            gVar2.write(bArr2);
            i5++;
        }
    }

    @Override // x80.k0
    public final long contentLength() {
        long j11 = this.f95419f;
        if (j11 != -1) {
            return j11;
        }
        long jA = a(null, true);
        this.f95419f = jA;
        return jA;
    }

    @Override // x80.k0
    public final a0 contentType() {
        return this.f95418e;
    }

    @Override // x80.k0
    public final void writeTo(m90.h sink) {
        Intrinsics.g(sink, "sink");
        a(sink, false);
    }
}
