package defpackage;

import com.medium.android.core.models.EntityType;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yu4 extends p4d implements b55 {
    public final /* synthetic */ int b = 1;
    public Object c;
    public Object d;
    public int e;
    public Object f;
    public String g;
    public String h;
    public final /* synthetic */ Object i;
    public final /* synthetic */ String j;
    public final /* synthetic */ String k;
    public final /* synthetic */ Object l;
    public Object m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yu4(ku3 ku3Var, String str, String str2, SourceParameter sourceParameter, String str3, String str4, EntityType entityType, n92 n92Var) {
        super(2, n92Var);
        this.m = ku3Var;
        this.g = str;
        this.h = str2;
        this.i = sourceParameter;
        this.j = str3;
        this.k = str4;
        this.l = entityType;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.l;
        Object obj3 = this.i;
        switch (i) {
            case 0:
                yu4 yu4Var = new yu4((ku3) this.m, this.g, this.h, (SourceParameter) obj3, this.j, this.k, (EntityType) obj2, n92Var);
                yu4Var.f = obj;
                return yu4Var;
            case 1:
                yu4 yu4Var2 = new yu4(this.g, (o2b) this.m, this.h, (SourceParameter) obj3, this.j, this.k, (EntityType) obj2, n92Var);
                yu4Var2.f = obj;
                return yu4Var2;
            default:
                String str = this.k;
                yu4 yu4Var3 = new yu4((nig) obj3, this.j, (ms) obj2, str, n92Var);
                yu4Var3.d = obj;
                return yu4Var3;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((yu4) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((yu4) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((yu4) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:40:0x014c, code lost:
    
        if (r3 == r4) goto L41;
     */
    /* JADX WARN: Code restructure failed: missing block: B:74:0x0228, code lost:
    
        if (r4 == r7) goto L75;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r22) throws java.lang.Exception {
        /*
            Method dump skipped, instruction units count: 634
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yu4.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yu4(String str, o2b o2bVar, String str2, SourceParameter sourceParameter, String str3, String str4, EntityType entityType, n92 n92Var) {
        super(2, n92Var);
        this.g = str;
        this.m = o2bVar;
        this.h = str2;
        this.i = sourceParameter;
        this.j = str3;
        this.k = str4;
        this.l = entityType;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yu4(nig nigVar, String str, ms msVar, String str2, n92 n92Var) {
        super(2, n92Var);
        this.i = nigVar;
        this.j = str;
        this.l = msVar;
        this.k = str2;
    }
}
