package com.google.android.gms.internal.measurement;

import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public final class bg extends cl.s {

    /* renamed from: h, reason: collision with root package name */
    public bn.i f32412h;

    /* renamed from: i, reason: collision with root package name */
    public final int f32413i;

    public bg(bn.i iVar, int i5) {
        this.f32412h = iVar;
        this.f32413i = i5;
    }

    @Override // cl.s
    public final void e() {
        AtomicLong atomicLong;
        long j11;
        int i5;
        int i11;
        boolean z11;
        bn.i iVar = this.f32412h;
        this.f32412h = null;
        if (iVar == null) {
            return;
        }
        AtomicReference atomicReference = (AtomicReference) iVar.f18211c;
        do {
            atomicLong = (AtomicLong) iVar.f18210b;
            j11 = atomicLong.get();
            i5 = (int) j11;
            long j12 = j11 >>> 32;
            if (i5 == Integer.MIN_VALUE) {
                StringBuilder sb2 = new StringBuilder(String.valueOf(j11).length() + 13);
                sb2.append("Refcount is: ");
                sb2.append(j11);
                throw new AssertionError(sb2.toString());
            }
            i11 = (int) j12;
            z11 = i5 == -2147483647;
            if (z11) {
                i11++;
            }
        } while (!atomicLong.compareAndSet(j11, (i11 << 32) | (4294967295L & (i5 - 1))));
        if (z11) {
            while (true) {
                cg cgVar = (cg) atomicReference.get();
                if (cgVar != null) {
                    if (cgVar.f32443h <= this.f32413i) {
                        cgVar.cancel(true);
                        while (!atomicReference.compareAndSet(cgVar, null)) {
                            if (atomicReference.get() != cgVar) {
                                break;
                            }
                        }
                        return;
                    }
                    return;
                }
                return;
            }
        }
    }

    @Override // cl.s
    public final String l() {
        cl.c0 c0Var;
        bn.i iVar = this.f32412h;
        if (iVar == null || (c0Var = (cl.c0) ((vd) iVar.f18209a).f33144b) == null) {
            return null;
        }
        String string = c0Var.toString();
        String strR = b.c0.r(new StringBuilder(string.length() + 11), "callable=[", string, "]");
        cg cgVar = (cg) ((AtomicReference) this.f32412h.f18211c).get();
        if (cgVar == null) {
            return strR;
        }
        int length = strR.length();
        String string2 = cgVar.toString();
        return b.c0.s(new StringBuilder(string2.length() + length + 9 + 1), strR, ", trial=[", string2, "]");
    }
}
