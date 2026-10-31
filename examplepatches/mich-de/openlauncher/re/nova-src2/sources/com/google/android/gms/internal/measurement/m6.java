package com.google.android.gms.internal.measurement;

import java.util.Arrays;
import java.util.Comparator;

/* loaded from: classes3.dex */
public final class m6 implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t4 f32816a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ j8 f32817b;

    public m6(t4 t4Var, j8 j8Var) {
        this.f32816a = t4Var;
        this.f32817b = j8Var;
    }

    @Override // java.util.Comparator
    public final /* bridge */ /* synthetic */ int compare(Object obj, Object obj2) {
        f6 f6Var = (f6) obj;
        f6 f6Var2 = (f6) obj2;
        if (f6Var instanceof j6) {
            return !(f6Var2 instanceof j6) ? 1 : 0;
        }
        if (f6Var2 instanceof j6) {
            return -1;
        }
        t4 t4Var = this.f32816a;
        return t4Var == null ? f6Var.zzc().compareTo(f6Var2.zzc()) : (int) gh.l(t4Var.a(this.f32817b, Arrays.asList(f6Var, f6Var2)).zzd().doubleValue());
    }
}
