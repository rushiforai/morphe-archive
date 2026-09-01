package defpackage;

import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cp extends uib implements b55 {
    public final /* synthetic */ int c;
    public int d;
    public /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ cp(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.c = i;
        this.f = obj;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.c;
        Object obj2 = this.f;
        switch (i) {
            case 0:
                cp cpVar = new cp((ep) obj2, n92Var, 0);
                cpVar.e = obj;
                return cpVar;
            case 1:
                cp cpVar2 = new cp((mb9) obj2, n92Var, 1);
                cpVar2.e = obj;
                return cpVar2;
            case 2:
                cp cpVar3 = new cp((x45) obj2, n92Var, 2);
                cpVar3.e = obj;
                return cpVar3;
            case 3:
                cp cpVar4 = new cp((qa2) obj2, n92Var, 3);
                cpVar4.e = obj;
                return cpVar4;
            default:
                cp cpVar5 = new cp((View) obj2, n92Var, 4);
                cpVar5.e = obj;
                return cpVar5;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.c;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((cp) create((u4d) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((cp) create((u4d) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((cp) create((u4d) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 3:
                return ((cp) create((u4d) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((cp) create((nzb) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:34:0x0097  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:33:0x0095 -> B:36:0x0099). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:75:0x016b -> B:77:0x016f). Please report as a decompilation issue!!! */
    /*  JADX ERROR: JadxOverflowException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxOverflowException: Regions count limit reached
        	at jadx.core.utils.ErrorsCounter.addError(ErrorsCounter.java:59)
        	at jadx.core.utils.ErrorsCounter.error(ErrorsCounter.java:31)
        	at jadx.core.dex.attributes.nodes.NotificationAttrNode.addError(NotificationAttrNode.java:19)
        */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r14) {
        /*
            Method dump skipped, instruction units count: 478
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cp.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
