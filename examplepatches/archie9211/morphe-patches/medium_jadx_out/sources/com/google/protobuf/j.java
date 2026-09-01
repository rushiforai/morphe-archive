package com.google.protobuf;

import defpackage.sp1;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class j {
    public abstract k a(Object obj);

    public final boolean b(Object obj, d dVar) throws InvalidProtocolBufferException {
        sp1 sp1Var = dVar.a;
        int i = dVar.b;
        int i2 = i >>> 3;
        int i3 = i & 7;
        if (i3 == 0) {
            dVar.w(0);
            ((k) obj).f(i2 << 3, Long.valueOf(sp1Var.r()));
            return true;
        }
        if (i3 == 1) {
            dVar.w(1);
            ((k) obj).f((i2 << 3) | 1, Long.valueOf(sp1Var.o()));
            return true;
        }
        if (i3 == 2) {
            ((k) obj).f((i2 << 3) | 2, dVar.e());
            return true;
        }
        if (i3 != 3) {
            if (i3 == 4) {
                return false;
            }
            if (i3 != 5) {
                throw InvalidProtocolBufferException.c();
            }
            dVar.w(5);
            ((k) obj).f(5 | (i2 << 3), Integer.valueOf(sp1Var.n()));
            return true;
        }
        k kVar = new k();
        int i4 = i2 << 3;
        int i5 = i4 | 4;
        while (dVar.a() != Integer.MAX_VALUE && b(kVar, dVar)) {
        }
        if (i5 != dVar.b) {
            throw new InvalidProtocolBufferException("Protocol message end-group tag did not match expected tag.");
        }
        kVar.e = false;
        ((k) obj).f(i4 | 3, kVar);
        return true;
    }
}
