package com.google.android.gms.internal.play_billing;

import sun.misc.Unsafe;

/* loaded from: classes3.dex */
public abstract /* synthetic */ class g1 {
    public static /* synthetic */ boolean a(Unsafe unsafe, e1 e1Var, long j11, Object obj, Object obj2) {
        while (!f1.a(unsafe, e1Var, j11, obj, obj2)) {
            if (unsafe.getObject(e1Var, j11) != obj) {
                return false;
            }
        }
        return true;
    }
}
