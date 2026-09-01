package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class w03 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public Object c;
    public Object d;
    public Iterator e;
    public Collection f;
    public int g;
    public int h;
    public int i;
    public int j;
    public /* synthetic */ Object k;
    public final /* synthetic */ z03 l;
    public final /* synthetic */ List m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ w03(List list, z03 z03Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.m = list;
        this.l = z03Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        z03 z03Var = this.l;
        List list = this.m;
        switch (i) {
            case 0:
                w03 w03Var = new w03(list, z03Var, n92Var, 0);
                w03Var.k = obj;
                return w03Var;
            default:
                w03 w03Var2 = new w03((ArrayList) list, z03Var, n92Var, 1);
                w03Var2.k = obj;
                return w03Var2;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        do4 do4Var = (do4) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((w03) create(do4Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x00b1  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00c0  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x0143  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x017b  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x018a  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:23:0x00a3 -> B:24:0x00a4). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:50:0x016c -> B:51:0x016e). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r17) {
        /*
            Method dump skipped, instruction units count: 434
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w03.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
