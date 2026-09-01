package defpackage;

import com.google.android.gms.internal.fido.zzho;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class o7g implements Comparable {
    public static int d(byte b) {
        return (b >> 5) & 7;
    }

    public static o7g e(byte... bArr) {
        bArr.getClass();
        u7g u7gVar = new u7g(new ByteArrayInputStream(Arrays.copyOf(bArr, bArr.length)));
        try {
            return ep7.D(u7gVar);
        } finally {
            try {
                u7gVar.close();
            } catch (IOException unused) {
            }
        }
    }

    public abstract int a();

    public int b() {
        return 0;
    }

    public final o7g c(Class cls) throws zzho {
        if (cls.isInstance(this)) {
            return (o7g) cls.cast(this);
        }
        throw new zzho(lv8.r("Expected a ", cls.getName(), " value, but got ", getClass().getName()));
    }
}
