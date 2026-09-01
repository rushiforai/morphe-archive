package defpackage;

import android.content.Context;
import android.graphics.Bitmap;
import android.net.Uri;
import android.view.MotionEvent;
import gen.model.SourceParameter;
import j$.util.Optional;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lm1 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ lm1(Object obj, Object obj2, Object obj3, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = obj;
        this.d = obj2;
        this.e = obj3;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.e;
        Object obj3 = this.d;
        switch (i) {
            case 0:
                return new lm1((xm1) this.c, (i49) obj3, (h49) obj2, n92Var, 0);
            case 1:
                return new lm1((l78) this.c, (ob3) obj3, (ejc) obj2, n92Var, 1);
            case 2:
                return new lm1((dm4) this.c, (nl4) obj3, this.e, n92Var, 2);
            case 3:
                return new lm1((xm4) this.c, (ArrayList) obj3, (String) obj2, n92Var, 3);
            case 4:
                return new lm1((xm4) this.c, (Set) obj3, (String) obj2, n92Var, 4);
            case 5:
                return new lm1((wu4) this.c, (l78) obj3, (l78) obj2, n92Var, 5);
            case 6:
                return new lm1((jt4) this.c, (String) obj3, (SourceParameter) obj2, n92Var, 6);
            case 7:
                lm1 lm1Var = new lm1((ny9) obj3, (Long) obj2, n92Var, 7);
                lm1Var.c = obj;
                return lm1Var;
            case 8:
                lm1 lm1Var2 = new lm1((vb9) obj3, (rhd) obj2, n92Var, 8);
                lm1Var2.c = obj;
                return lm1Var2;
            case 9:
                return new lm1((Bitmap) this.c, (go8) obj3, (String) obj2, n92Var, 9);
            case 10:
                lm1 lm1Var3 = new lm1((String) obj3, (qx9) obj2, n92Var, 10);
                lm1Var3.c = obj;
                return lm1Var3;
            case 11:
                return new lm1((sr4) this.c, (akc) obj3, (upc) obj2, n92Var, 11);
            case 12:
                return new lm1((bc7) this.c, (Context) obj3, (String) obj2, n92Var, 12);
            case 13:
                return new lm1((mya) this.c, (Uri) obj3, (String) obj2, n92Var, 13);
            case 14:
                return new lm1((ms) this.c, (String) obj3, (MotionEvent) obj2, n92Var, 14);
            case 15:
                return new lm1((Long) this.c, (w3g) obj3, (Optional) obj2, n92Var, 15);
            default:
                lm1 lm1Var4 = new lm1((w3g) obj3, (jrf) obj2, n92Var, 16);
                lm1Var4.c = obj;
                return lm1Var4;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) throws IOException {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                ((lm1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 1:
                ((lm1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 2:
                ((lm1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 3:
                ((lm1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 4:
                ((lm1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 5:
                ((lm1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 6:
                ((lm1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 7:
                ((lm1) create((b78) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 8:
                return ((lm1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 9:
                ((lm1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 10:
                ((lm1) create((qz8) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 11:
                ((lm1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 12:
                ((lm1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 13:
                return ((lm1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 14:
                ((lm1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
            case 15:
                return ((lm1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                ((lm1) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
                return c1eVar;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:14:0x004e A[Catch: Exception -> 0x0059, TryCatch #10 {Exception -> 0x0059, blocks: (B:7:0x0039, B:9:0x003f, B:12:0x0048, B:14:0x004e, B:18:0x0054), top: B:193:0x0039 }] */
    /* JADX WARN: Type inference failed for: r4v0, types: [n92] */
    /* JADX WARN: Type inference failed for: r4v10 */
    /* JADX WARN: Type inference failed for: r4v11 */
    /* JADX WARN: Type inference failed for: r4v2, types: [java.lang.Throwable] */
    /* JADX WARN: Type inference failed for: r4v3 */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r15) throws java.io.IOException {
        /*
            Method dump skipped, instruction units count: 1040
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lm1.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ lm1(Object obj, Object obj2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
        this.e = obj2;
    }
}
