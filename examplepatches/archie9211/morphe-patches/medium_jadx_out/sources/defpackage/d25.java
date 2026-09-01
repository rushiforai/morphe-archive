package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d25 implements c25 {
    public final String a;
    public final int b;
    public final int c;
    public final /* synthetic */ f25 d;

    public d25(f25 f25Var, String str, int i, int i2) {
        this.d = f25Var;
        this.a = str;
        this.b = i;
        this.c = i2;
    }

    @Override // defpackage.c25
    public final boolean a(ArrayList arrayList, ArrayList arrayList2) {
        j15 j15Var = this.d.y;
        if (j15Var != null && this.b < 0 && this.a == null && j15Var.h().R(-1, 0)) {
            return false;
        }
        return this.d.S(arrayList, arrayList2, this.a, this.b, this.c);
    }
}
