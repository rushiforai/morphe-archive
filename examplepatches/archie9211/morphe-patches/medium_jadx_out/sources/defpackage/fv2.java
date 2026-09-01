package defpackage;

import java.util.HashSet;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fv2 extends co6 implements b55 {
    public final /* synthetic */ iq1 a;
    public final /* synthetic */ int b;
    public final /* synthetic */ String c;
    public final /* synthetic */ Throwable d;
    public final /* synthetic */ LinkedHashMap e;
    public final /* synthetic */ HashSet f;
    public final /* synthetic */ String g;
    public final /* synthetic */ long h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public fv2(iq1 iq1Var, int i, String str, Throwable th, LinkedHashMap linkedHashMap, HashSet hashSet, String str2, long j) {
        super(2);
        this.a = iq1Var;
        this.b = i;
        this.c = str;
        this.d = th;
        this.e = linkedHashMap;
        this.f = hashSet;
        this.g = str2;
        this.h = j;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        vu2 vu2Var = (vu2) obj;
        x45 x45Var = (x45) obj2;
        vu2Var.getClass();
        x45Var.getClass();
        String str = this.g;
        str.getClass();
        iq1 iq1Var = this.a;
        x45Var.invoke(new jr(iq1Var, 8, vx0.O((ev2) iq1Var.c, this.b, this.c, this.d, this.e, this.f, this.h, str, vu2Var, (String) iq1Var.b, true)));
        return c1e.a;
    }
}
