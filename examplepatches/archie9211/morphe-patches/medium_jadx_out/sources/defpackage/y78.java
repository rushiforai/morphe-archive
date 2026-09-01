package defpackage;

import android.content.res.Resources;
import android.widget.ImageView;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y78 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public Object c;
    public int d;
    public Object e;
    public Object f;
    public /* synthetic */ Object g;
    public final /* synthetic */ Object h;
    public Object i;
    public final /* synthetic */ Object j;
    public final /* synthetic */ Object k;
    public final /* synthetic */ Object l;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ y78(que queVar, Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7, Object obj8, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = queVar;
        this.c = obj;
        this.e = obj2;
        this.g = obj3;
        this.h = obj4;
        this.i = obj5;
        this.j = obj6;
        this.k = obj7;
        this.l = obj8;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.h;
        Object obj3 = this.l;
        Object obj4 = this.k;
        Object obj5 = this.j;
        switch (i) {
            case 0:
                y78 y78Var = new y78((s78) obj4, (z78) obj5, (b55) obj3, this.h, n92Var);
                y78Var.g = obj;
                return y78Var;
            case 1:
                y78 y78Var2 = new y78((tl) this.g, (String) obj2, (String) this.i, (SourceParameter) obj5, (String) obj4, (String) obj3, n92Var);
                y78Var2.e = obj;
                return y78Var2;
            case 2:
                return new y78((sw9) this.f, (String) this.c, (String) this.e, (String) this.g, (Integer) obj2, (Integer) this.i, (String) obj5, (ImageView) obj4, (cx7) obj3, n92Var, 2);
            default:
                return new y78((odd) this.f, (nhc) this.c, (sb2) this.e, (Resources) this.g, (jbd) obj2, (u8d) this.i, (kbd) obj5, (mbd) obj4, (nbd) obj3, n92Var, 3);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((y78) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /*  JADX ERROR: JadxRuntimeException in pass: ConstInlineVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Unexpected instance arg in invoke
        	at jadx.core.dex.visitors.ConstInlineVisitor.addExplicitCast(ConstInlineVisitor.java:285)
        	at jadx.core.dex.visitors.ConstInlineVisitor.replaceArg(ConstInlineVisitor.java:267)
        	at jadx.core.dex.visitors.ConstInlineVisitor.replaceConst(ConstInlineVisitor.java:177)
        	at jadx.core.dex.visitors.ConstInlineVisitor.checkInsn(ConstInlineVisitor.java:110)
        	at jadx.core.dex.visitors.ConstInlineVisitor.process(ConstInlineVisitor.java:55)
        	at jadx.core.dex.visitors.ConstInlineVisitor.visit(ConstInlineVisitor.java:47)
        */
    @Override // defpackage.kn0
    public final java.lang.Object invokeSuspend(java.lang.Object r22) {
        /*
            Method dump skipped, instruction units count: 606
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.y78.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y78(s78 s78Var, z78 z78Var, b55 b55Var, Object obj, n92 n92Var) {
        super(2, n92Var);
        this.b = 0;
        this.k = s78Var;
        this.j = z78Var;
        this.l = b55Var;
        this.h = obj;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y78(tl tlVar, String str, String str2, SourceParameter sourceParameter, String str3, String str4, n92 n92Var) {
        super(2, n92Var);
        this.b = 1;
        this.g = tlVar;
        this.h = str;
        this.i = str2;
        this.j = sourceParameter;
        this.k = str3;
        this.l = str4;
    }
}
