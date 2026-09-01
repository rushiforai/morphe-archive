package defpackage;

import android.content.Context;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class px2 extends p4d implements b55 {
    public final /* synthetic */ int b = 2;
    public int c;
    public int d;
    public Object e;
    public Object f;
    public Object g;
    public Object h;
    public final /* synthetic */ Object i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public px2(ol3 ol3Var, Context context, jc7 jc7Var, l78 l78Var, n92 n92Var) {
        super(2, n92Var);
        this.f = ol3Var;
        this.g = context;
        this.h = jc7Var;
        this.i = l78Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.i;
        switch (i) {
            case 0:
                return new px2((xx2) this.g, (Set) obj2, n92Var);
            case 1:
                return new px2((ol3) this.f, (Context) this.g, (jc7) this.h, (l78) obj2, n92Var);
            default:
                px2 px2Var = new px2((l9c) obj2, n92Var);
                px2Var.h = obj;
                return px2Var;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((px2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((px2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((px2) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Can't wrap try/catch for region: R(13:66|149|67|(3:70|(1:73)|72)(1:69)|74|(1:80)|79|81|82|155|83|84|(3:87|88|1f9)) */
    /* JADX WARN: Code restructure failed: missing block: B:100:0x021f, code lost:
    
        r0 = th;
     */
    /* JADX WARN: Code restructure failed: missing block: B:101:0x0220, code lost:
    
        r5 = r16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x00f5, code lost:
    
        if (r6.a(r1, r5) == r11) goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:41:0x0122, code lost:
    
        if (r6.a(r0, r5) == r11) goto L42;
     */
    /* JADX WARN: Code restructure failed: missing block: B:62:0x018f, code lost:
    
        if (r2 == r11) goto L86;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x0198, code lost:
    
        if (((java.lang.Boolean) r2).booleanValue() != false) goto L66;
     */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0242 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:138:0x02eb  */
    /* JADX WARN: Removed duplicated region for block: B:153:0x01fa A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00d4  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00db  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00ff  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0176  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:104:0x0226 -> B:58:0x015e). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:87:0x01ec -> B:88:0x01ed). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r17) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 770
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.px2.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public px2(xx2 xx2Var, Set set, n92 n92Var) {
        super(2, n92Var);
        this.g = xx2Var;
        this.i = set;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public px2(l9c l9cVar, n92 n92Var) {
        super(2, n92Var);
        this.i = l9cVar;
    }
}
