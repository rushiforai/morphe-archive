package e80;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes5.dex */
public abstract class m {
    public static final String a(a aVar, long j11) {
        if (j11 == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        h hVar = aVar.f52245a;
        if (hVar == null) {
            throw new IllegalStateException("Unreacheable");
        }
        if (hVar.a() < j11) {
            byte[] bArrA = l.a(aVar, (int) j11);
            return g80.a.a(0, bArrA.length, bArrA);
        }
        byte[] bArr = hVar.f52260a;
        int i5 = hVar.f52261b;
        String strA = g80.a.a(i5, Math.min(hVar.f52262c, ((int) j11) + i5), bArr);
        aVar.skip(j11);
        return strA;
    }

    public static final String b(a aVar) {
        Intrinsics.g(aVar, "<this>");
        return a(aVar, aVar.f52247c);
    }

    public static final String c(k kVar) {
        Intrinsics.g(kVar, "<this>");
        kVar.j(Long.MAX_VALUE);
        return a(kVar.i(), kVar.i().f52247c);
    }
}
