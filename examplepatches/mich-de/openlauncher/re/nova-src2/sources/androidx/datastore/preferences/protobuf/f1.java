package androidx.datastore.preferences.protobuf;

/* loaded from: classes.dex */
public abstract class f1 {
    public abstract g1 a(Object obj);

    public final boolean b(int i5, l lVar, Object obj) throws InvalidProtocolBufferException {
        int i11 = lVar.f14348b;
        int i12 = i11 >>> 3;
        int i13 = i11 & 7;
        if (i13 == 0) {
            lVar.w(0);
            ((g1) obj).c(i12 << 3, Long.valueOf(lVar.f14347a.r()));
            return true;
        }
        if (i13 == 1) {
            lVar.w(1);
            ((g1) obj).c((i12 << 3) | 1, Long.valueOf(lVar.f14347a.o()));
            return true;
        }
        if (i13 == 2) {
            ((g1) obj).c((i12 << 3) | 2, lVar.e());
            return true;
        }
        if (i13 != 3) {
            if (i13 == 4) {
                return false;
            }
            if (i13 != 5) {
                throw InvalidProtocolBufferException.b();
            }
            lVar.w(5);
            ((g1) obj).c(5 | (i12 << 3), Integer.valueOf(lVar.f14347a.n()));
            return true;
        }
        g1 g1Var = new g1(0, new int[8], new Object[8], true);
        int i14 = i12 << 3;
        int i15 = i14 | 4;
        int i16 = i5 + 1;
        if (i16 >= 100) {
            throw new InvalidProtocolBufferException("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        while (lVar.a() != Integer.MAX_VALUE && b(i16, lVar, g1Var)) {
        }
        if (i15 != lVar.f14348b) {
            throw new InvalidProtocolBufferException("Protocol message end-group tag did not match expected tag.");
        }
        if (g1Var.f14323e) {
            g1Var.f14323e = false;
        }
        ((g1) obj).c(i14 | 3, g1Var);
        return true;
    }
}
