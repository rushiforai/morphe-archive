package defpackage;

import android.content.Context;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class blb {
    public final wg6 a;
    public final Context b;
    public final String c;
    public Executor f;
    public Executor g;
    public o19 h;
    public boolean i;
    public boolean p;
    public boolean q;
    public final ArrayList d = new ArrayList();
    public final ArrayList e = new ArrayList();
    public final dlb j = dlb.AUTOMATIC;
    public final pkf k = new pkf(28);
    public final LinkedHashSet l = new LinkedHashSet();
    public final LinkedHashSet m = new LinkedHashSet();
    public final ArrayList n = new ArrayList();
    public boolean o = true;

    public blb(Context context, Class cls, String str) {
        this.a = n1b.a.b(cls);
        this.b = context;
        this.c = str;
    }

    public final void a(p08... p08VarArr) {
        for (p08 p08Var : p08VarArr) {
            Integer numValueOf = Integer.valueOf(p08Var.a);
            LinkedHashSet linkedHashSet = this.m;
            linkedHashSet.add(numValueOf);
            linkedHashSet.add(Integer.valueOf(p08Var.b));
        }
        for (p08 p08Var2 : (p08[]) Arrays.copyOf(p08VarArr, p08VarArr.length)) {
            this.k.j(p08Var2);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:74:0x019f, code lost:
    
        defpackage.ay0.e("Unexpected auto migration specs found. Annotate AutoMigrationSpec implementation with @ProvidedAutoMigrationSpec annotation or remove this spec from the builder.");
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x01a6, code lost:
    
        return null;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.elb b() {
        /*
            Method dump skipped, instruction units count: 956
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.blb.b():elb");
    }
}
