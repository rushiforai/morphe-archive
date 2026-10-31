package e80;

import h6.c1;
import java.io.IOException;
import java.io.InputStream;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class c implements e {

    /* renamed from: a, reason: collision with root package name */
    public final InputStream f52248a;

    public c(InputStream input) {
        Intrinsics.g(input, "input");
        this.f52248a = input;
    }

    @Override // e80.e
    public final long B(a aVar, long j11) {
        if (j11 == 0) {
            return 0L;
        }
        if (j11 < 0) {
            throw new IllegalArgumentException(c1.o(j11, "byteCount (", ") < 0").toString());
        }
        boolean z11 = false;
        try {
            h hVarH = aVar.h();
            byte[] bArr = hVarH.f52260a;
            long j12 = this.f52248a.read(bArr, hVarH.f52262c, (int) Math.min(j11, bArr.length - r5));
            int i5 = j12 == -1 ? 0 : (int) j12;
            if (i5 == 1) {
                hVarH.f52262c += i5;
                aVar.f52247c += i5;
                return j12;
            }
            if (i5 >= 0) {
                int length = bArr.length;
                int i11 = hVarH.f52262c;
                if (i5 <= length - i11) {
                    if (i5 != 0) {
                        hVarH.f52262c = i11 + i5;
                        aVar.f52247c += i5;
                        return j12;
                    }
                    if (hVarH.a() == 0) {
                        h hVar = aVar.f52246b;
                        Intrinsics.d(hVar);
                        h hVar2 = hVar.f52266g;
                        aVar.f52246b = hVar2;
                        if (hVar2 == null) {
                            aVar.f52245a = null;
                        } else {
                            hVar2.f52265f = null;
                        }
                        hVar.f52266g = null;
                        i.a(hVar);
                    }
                    return j12;
                }
            }
            throw new IllegalStateException(("Invalid number of bytes written: " + i5 + ". Should be in 0.." + (bArr.length - hVarH.f52262c)).toString());
        } catch (AssertionError e3) {
            if (e3.getCause() != null) {
                String message = e3.getMessage();
                if (message != null ? r70.k.K0(message, "getsockname failed", false) : false) {
                    z11 = true;
                }
            }
            if (z11) {
                throw new IOException(e3);
            }
            throw e3;
        }
    }

    @Override // java.lang.AutoCloseable
    public final void close() {
        this.f52248a.close();
    }

    public final String toString() {
        return "RawSource(" + this.f52248a + ')';
    }
}
