package ads_mobile_sdk;

import b.c0;
import b.x8;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes.dex */
public abstract class g {

    /* renamed from: a, reason: collision with root package name */
    public transient int f3587a;

    public abstract int a(x8 x8Var);

    public final byte[] a() {
        try {
            int iA = ((cu0) this).a((x8) null);
            byte[] bArr = new byte[iA];
            vu vuVar = new vu(bArr, iA);
            ((cu0) this).a(vuVar);
            vuVar.a();
            return bArr;
        } catch (IOException e3) {
            throw new RuntimeException(c0.l("Serializing ", getClass().getName(), " to a byte array threw an IOException (should never happen)."), e3);
        }
    }

    public final void a(OutputStream outputStream) {
        cu0 cu0Var = (cu0) this;
        int iA = cu0Var.a((x8) null);
        if (iA > 4096) {
            iA = 4096;
        }
        xu xuVar = new xu(outputStream, iA);
        cu0Var.a(xuVar);
        int i5 = xuVar.f11832d;
        if (i5 > 0) {
            outputStream.write(xuVar.f11830b, 0, i5);
            xuVar.f11832d = 0;
        }
    }
}
