package com.google.android.gms.internal.measurement;

import ads_mobile_sdk.nl0;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class q0 {

    /* renamed from: a, reason: collision with root package name */
    public int f32977a;

    /* renamed from: b, reason: collision with root package name */
    public long f32978b;

    /* renamed from: c, reason: collision with root package name */
    public Object f32979c;

    /* renamed from: d, reason: collision with root package name */
    public int f32980d;

    public q0(e1 e1Var) {
        e1Var.getClass();
    }

    public static /* synthetic */ String c(int i5, int i11, byte b11, String str, String str2) {
        StringBuilder sb2 = new StringBuilder(String.valueOf(i11).length() + b11 + String.valueOf(i5).length());
        sb2.append(str);
        sb2.append(i11);
        sb2.append(str2);
        sb2.append(i5);
        return sb2.toString();
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x003a  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0049  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public k0.l0 a(k0.m0 m0Var, boolean z11, int i5, int i11, int i12, int i13) {
        k0.l0 l0Var;
        z2.q0 q0Var;
        z.j jVar;
        z2.i1 i1Var;
        if (m0Var.f70678b) {
            k0.q0 q0Var2 = (k0.q0) this.f32979c;
            int iOrdinal = q0Var2.f70714a.ordinal();
            boolean z12 = true;
            if (iOrdinal == 0 || iOrdinal == 1) {
                l0Var = null;
                if (l0Var != null) {
                    if (i5 < 0 || (i13 != 0 && (i12 - ((int) (l0Var.f70667c >> 32)) < 0 || i13 >= Integer.MAX_VALUE))) {
                        z12 = false;
                    }
                    l0Var.f70668d = z12;
                    return l0Var;
                }
            } else {
                if (iOrdinal != 2 && iOrdinal != 3) {
                    throw new NoWhenBranchMatchedException();
                }
                if (z11) {
                    q0Var = q0Var2.f70715b;
                    jVar = q0Var2.f70719f;
                    i1Var = q0Var2.f70716c;
                } else {
                    q0Var = (i5 < -1 || i11 < 0) ? null : q0Var2.f70717d;
                    jVar = q0Var2.f70720g;
                    i1Var = q0Var2.f70718e;
                }
                if (q0Var != null) {
                    Intrinsics.d(jVar);
                    l0Var = new k0.l0(q0Var, i1Var, jVar.f97781a);
                }
                if (l0Var != null) {
                }
            }
        }
        return null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:12:0x003f, code lost:
    
        if ((((int) (r24 & 4294967295L)) - ((int) (r19 & 4294967295L))) < 0) goto L13;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public k0.m0 b(boolean z11, int i5, long j11, z.j jVar, int i11, int i12, int i13, boolean z12, boolean z13) {
        long j12;
        int i14 = this.f32977a;
        int i15 = this.f32980d;
        long j13 = this.f32978b;
        k0.q0 q0Var = (k0.q0) this.f32979c;
        int i16 = i12 + i13;
        if (jVar == null) {
            return new k0.m0(true, true);
        }
        long j14 = jVar.f97781a;
        if (q0Var.f70714a != k0.p0.f70698a) {
            if (i11 < Integer.MAX_VALUE) {
                j12 = j14;
            }
            return new k0.m0(true, true);
        }
        j12 = j14;
        if (i5 != 0 && (i5 >= Integer.MAX_VALUE || ((int) (j11 >> 32)) - ((int) (j12 >> 32)) < 0)) {
            return z12 ? new k0.m0(true, true) : new k0.m0(true, b(z11, 0, z.j.a(y3.a.h(j13), (((int) (j11 & 4294967295L)) - i15) - i13), new z.j(z.j.a(((int) (j12 >> 32)) - i14, (int) (j12 & 4294967295L))), i11 + 1, i16, 0, true, false).f70678b);
        }
        int i17 = (int) (j12 & 4294967295L);
        int iMax = Math.max(i13, i17) + i12;
        z.j jVarA = z13 ? null : q0Var.a(i11, iMax, z11);
        if (jVarA == null || (i5 + 1 < Integer.MAX_VALUE && ((((int) (j11 >> 32)) - ((int) (j12 >> 32))) - i14) - ((int) (jVarA.f97781a >> 32)) >= 0)) {
            return new k0.m0(false, false);
        }
        if (z13) {
            return new k0.m0(true, true);
        }
        boolean z14 = b(false, 0, z.j.a(y3.a.h(j13), (((int) (j11 & 4294967295L)) - i15) - Math.max(i13, i17)), jVarA, i11 + 1, iMax, 0, true, true).f70678b;
        return new k0.m0(z14, z14);
    }

    public q0(k0.q0 q0Var, long j11, int i5, int i11) {
        this.f32979c = q0Var;
        this.f32978b = j11;
        this.f32977a = i5;
        this.f32980d = i11;
    }

    public q0(com.google.crypto.tink.shaded.protobuf.p pVar) {
        pVar.getClass();
    }

    public q0(nl0 nl0Var) {
    }
}
