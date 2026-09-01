package androidx.datastore.preferences.protobuf;

import defpackage.up1;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class j {
    public abstract k a(Object obj);

    public final boolean b(int i, d dVar, Object obj) throws InvalidProtocolBufferException {
        up1 up1Var = dVar.a;
        int i2 = dVar.b;
        int i3 = i2 >>> 3;
        int i4 = i2 & 7;
        if (i4 == 0) {
            dVar.w(0);
            ((k) obj).c(i3 << 3, Long.valueOf(up1Var.r()));
            return true;
        }
        if (i4 == 1) {
            dVar.w(1);
            ((k) obj).c((i3 << 3) | 1, Long.valueOf(up1Var.o()));
            return true;
        }
        if (i4 == 2) {
            ((k) obj).c((i3 << 3) | 2, dVar.e());
            return true;
        }
        if (i4 != 3) {
            if (i4 == 4) {
                return false;
            }
            if (i4 != 5) {
                throw InvalidProtocolBufferException.b();
            }
            dVar.w(5);
            ((k) obj).c(5 | (i3 << 3), Integer.valueOf(up1Var.n()));
            return true;
        }
        k kVar = new k(0, new int[8], new Object[8], true);
        int i5 = i3 << 3;
        int i6 = i5 | 4;
        int i7 = i + 1;
        if (i7 >= 100) {
            throw new InvalidProtocolBufferException("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        while (dVar.a() != Integer.MAX_VALUE && b(i7, dVar, kVar)) {
        }
        if (i6 != dVar.b) {
            throw new InvalidProtocolBufferException("Protocol message end-group tag did not match expected tag.");
        }
        if (kVar.e) {
            kVar.e = false;
        }
        ((k) obj).c(i5 | 3, kVar);
        return true;
    }
}
