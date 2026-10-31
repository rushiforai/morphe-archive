package mh;

import com.google.android.gms.internal.fido.zzho;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Arrays;

/* loaded from: classes3.dex */
public abstract class s0 implements Comparable {
    public static int c(byte b11) {
        return (b11 >> 5) & 7;
    }

    public static s0 d(byte... bArr) {
        bArr.getClass();
        u0 u0Var = new u0(new ByteArrayInputStream(Arrays.copyOf(bArr, bArr.length)));
        try {
            return a.k(u0Var);
        } finally {
            try {
                u0Var.close();
            } catch (IOException unused) {
            }
        }
    }

    public int a() {
        return 0;
    }

    public final s0 b(Class cls) throws zzho {
        if (cls.isInstance(this)) {
            return (s0) cls.cast(this);
        }
        throw new zzho(b.c0.m("Expected a ", cls.getName(), " value, but got ", getClass().getName()));
    }

    public abstract int zza();
}
