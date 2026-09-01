package defpackage;

import com.medium.android.core.models.EntityType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dye extends p4d implements b55 {
    public int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ mya d;
    public final /* synthetic */ EntityType e;
    public final /* synthetic */ String f;
    public final /* synthetic */ boolean g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dye(mya myaVar, EntityType entityType, String str, boolean z, n92 n92Var) {
        super(2, n92Var);
        this.d = myaVar;
        this.e = entityType;
        this.f = str;
        this.g = z;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        dye dyeVar = new dye(this.d, this.e, this.f, this.g, n92Var);
        dyeVar.c = obj;
        return dyeVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((dye) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:63:0x014b A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:64:0x014c A[RETURN] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r15) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 333
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dye.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
