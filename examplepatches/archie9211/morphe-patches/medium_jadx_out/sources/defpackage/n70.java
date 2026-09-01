package defpackage;

import java.lang.reflect.Type;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class n70 implements ib6 {
    public final /* synthetic */ int a;

    public /* synthetic */ n70(int i) {
        this.a = i;
    }

    public static void b(Type type, Class cls) {
        Class<?> clsD = vn7.D(type);
        if (cls.isAssignableFrom(clsD)) {
            StringBuilder sb = new StringBuilder("No JsonAdapter for ");
            sb.append(type);
            String simpleName = cls.getSimpleName();
            String simpleName2 = clsD.getSimpleName();
            sb.append(", you should probably use ");
            sb.append(simpleName);
            sb.append(" instead of ");
            sb.append(simpleName2);
            sb.append(" (Moshi only supports the collection interfaces by default) or else register a custom JsonAdapter.");
            throw new IllegalArgumentException(sb.toString());
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:210:0x0394  */
    /* JADX WARN: Removed duplicated region for block: B:230:0x040c  */
    /* JADX WARN: Removed duplicated region for block: B:235:0x0440  */
    /* JADX WARN: Removed duplicated region for block: B:237:0x0449  */
    /* JADX WARN: Removed duplicated region for block: B:326:0x06d2  */
    @Override // defpackage.ib6
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.jb6 a(java.lang.reflect.Type r24, java.util.Set r25, defpackage.x38 r26) {
        /*
            Method dump skipped, instruction units count: 2070
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n70.a(java.lang.reflect.Type, java.util.Set, x38):jb6");
    }
}
