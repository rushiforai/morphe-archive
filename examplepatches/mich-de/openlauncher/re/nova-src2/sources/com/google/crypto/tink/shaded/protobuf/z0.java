package com.google.crypto.tink.shaded.protobuf;

import com.google.crypto.tink.shaded.protobuf.InvalidProtocolBufferException;

/* loaded from: classes3.dex */
public abstract class z0 {
    public abstract a1 a(Object obj);

    public final boolean b(int i5, l lVar, Object obj) throws InvalidProtocolBufferException {
        int i11 = lVar.f34625b;
        int i12 = i11 >>> 3;
        int i13 = i11 & 7;
        if (i13 == 0) {
            lVar.y(0);
            ((a1) obj).d(i12 << 3, Long.valueOf(((j) lVar.f34624a).J()));
            return true;
        }
        if (i13 == 1) {
            lVar.y(1);
            ((a1) obj).d((i12 << 3) | 1, Long.valueOf(((j) lVar.f34624a).H()));
            return true;
        }
        if (i13 == 2) {
            ((a1) obj).d((i12 << 3) | 2, lVar.f());
            return true;
        }
        if (i13 != 3) {
            if (i13 == 4) {
                if (i5 != 0) {
                    return false;
                }
                throw new InvalidProtocolBufferException("Protocol message end-group tag did not match expected tag.");
            }
            if (i13 != 5) {
                int i14 = InvalidProtocolBufferException.f34567a;
                throw new InvalidProtocolBufferException.InvalidWireTypeException();
            }
            lVar.y(5);
            ((a1) obj).d(5 | (i12 << 3), Integer.valueOf(((j) lVar.f34624a).G()));
            return true;
        }
        a1 a1VarC = a1.c();
        int i15 = i12 << 3;
        int i16 = i15 | 4;
        int i17 = i5 + 1;
        if (i17 >= 100) {
            throw new InvalidProtocolBufferException("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
        while (lVar.b() != Integer.MAX_VALUE && b(i17, lVar, a1VarC)) {
        }
        if (i16 != lVar.f34625b) {
            throw new InvalidProtocolBufferException("Protocol message end-group tag did not match expected tag.");
        }
        if (a1VarC.f34573e) {
            a1VarC.f34573e = false;
        }
        ((a1) obj).d(i15 | 3, a1VarC);
        return true;
    }
}
