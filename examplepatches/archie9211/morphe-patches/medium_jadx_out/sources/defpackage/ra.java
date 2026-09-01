package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Rect;
import android.view.ScrollCaptureSession;
import androidx.work.impl.workers.ConstraintTrackingWorker;
import gen.model.SourceParameter;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ra extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public Object e;
    public /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ra(String str, Context context, yd0 yd0Var, vq6 vq6Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 22;
        this.e = str;
        this.d = context;
        this.f = yd0Var;
        this.g = vq6Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.g;
        switch (i) {
            case 0:
                return new ra((ua) this.d, (String) this.e, (String) this.f, (SourceParameter) obj2, n92Var, 0);
            case 1:
                return new ra((ze) this.d, (nhc) this.e, (Resources) this.f, (pe) obj2, n92Var, 1);
            case 2:
                return new ra((que) this.f, (String) this.e, (SourceParameter) obj2, n92Var, 2);
            case 3:
                return new ra((que) this.f, (String) this.e, (SourceParameter) obj2, n92Var, 3);
            case 4:
                return new ra((qf) this.d, (nhc) this.e, (Resources) this.f, (cf) obj2, n92Var, 4);
            case 5:
                return new ra((que) this.f, (String) this.e, (SourceParameter) obj2, n92Var, 5);
            case 6:
                return new ra((que) this.f, (String) this.e, (SourceParameter) obj2, n92Var, 6);
            case 7:
                return new ra((eg) this.d, (nhc) this.e, (Resources) this.f, (uf) obj2, n92Var, 7);
            case 8:
                return new ra((que) this.f, (String) this.e, (SourceParameter) obj2, n92Var, 8);
            case 9:
                return new ra((ug) this.d, (nhc) this.e, (Resources) this.f, (hg) obj2, n92Var, 9);
            case 10:
                return new ra((gh) this.d, (nhc) this.e, (Resources) this.f, (xg) obj2, n92Var, 10);
            case 11:
                return new ra((que) this.f, (String) this.e, (SourceParameter) obj2, n92Var, 11);
            case 12:
                return new ra((que) this.f, (String) this.e, (SourceParameter) obj2, n92Var, 12);
            case 13:
                return new ra((qh) this.d, (nhc) this.e, (Resources) this.f, (ph) obj2, n92Var, 13);
            case 14:
                return new ra((si) this.d, (nhc) this.e, (Resources) this.f, (gi) obj2, n92Var, 14);
            case 15:
                return new ra((ej) this.d, (nhc) this.e, (Resources) this.f, (ui) obj2, n92Var, 15);
            case 16:
                return new ra((rj) this.d, (nhc) this.e, (Resources) this.f, (gj) obj2, n92Var, 16);
            case 17:
                return new ra((que) this.f, (String) this.e, (SourceParameter) obj2, n92Var, 17);
            case 18:
                ra raVar = new ra((x45) this.e, (cq) this.f, (fx6) obj2, n92Var, 18);
                raVar.d = obj;
                return raVar;
            case 19:
                return new ra(this.d, (ou) this.e, (l78) this.f, (l78) obj2, n92Var, 19);
            case 20:
                ra raVar2 = new ra((sz) this.e, (h00) this.f, (yl2) obj2, n92Var, 20);
                raVar2.d = obj;
                return raVar2;
            case 21:
                ra raVar3 = new ra((lb0) obj2, n92Var);
                raVar3.f = obj;
                return raVar3;
            case 22:
                return new ra((String) this.e, (Context) this.d, (yd0) this.f, (vq6) obj2, n92Var);
            case 23:
                return new ra((bc1) this.d, (nhc) this.e, (Resources) this.f, (v91) obj2, n92Var, 23);
            case 24:
                return new ra((iu1) this.d, (nhc) this.e, (Resources) this.f, (lig) obj2, n92Var, 24);
            case 25:
                return new ra((l12) this.d, (ScrollCaptureSession) this.e, (Rect) this.f, (Consumer) obj2, n92Var, 25);
            case 26:
                return new ra((ru) this.d, (c8f) this.e, (AtomicInteger) this.f, (d37) obj2, n92Var, 26);
            case 27:
                return new ra((ConstraintTrackingWorker) this.d, (k37) this.e, (ru) this.f, (c8f) obj2, n92Var, 27);
            case 28:
                return new ra((bo4) this.d, (xd2) this.e, (nhc) this.f, (Resources) obj2, n92Var, 28);
            default:
                ra raVar4 = new ra((do4) this.e, (ek2) this.f, (yaf) obj2, n92Var, 29);
                raVar4.d = obj;
                return raVar4;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
        }
        return ((ra) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:104:0x0296, code lost:
    
        if (defpackage.r6c.m(r4, r6, r5) != r1) goto L106;
     */
    /* JADX WARN: Code restructure failed: missing block: B:152:0x03ba, code lost:
    
        if (r1.a(r2, r5) == r12) goto L153;
     */
    /* JADX WARN: Code restructure failed: missing block: B:208:0x0501, code lost:
    
        if (r1.a(r2, r5) == r12) goto L209;
     */
    /* JADX WARN: Code restructure failed: missing block: B:225:0x056b, code lost:
    
        if (r1.a(r2, r5) == r12) goto L226;
     */
    /* JADX WARN: Code restructure failed: missing block: B:262:0x064d, code lost:
    
        if (r1.a(r2, r5) == r13) goto L263;
     */
    /* JADX WARN: Code restructure failed: missing block: B:289:0x06f3, code lost:
    
        if (r1.a(r2, r5) == r13) goto L290;
     */
    /* JADX WARN: Code restructure failed: missing block: B:306:0x0761, code lost:
    
        if (r1.a(r2, r5) == r13) goto L307;
     */
    /* JADX WARN: Code restructure failed: missing block: B:333:0x0807, code lost:
    
        if (r1.a(r2, r5) == r13) goto L334;
     */
    /* JADX WARN: Code restructure failed: missing block: B:350:0x087c, code lost:
    
        if (r1.a(r2, r5) == r13) goto L351;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r21) {
        /*
            Method dump skipped, instruction units count: 2408
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ra.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ra(que queVar, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = queVar;
        this.e = str;
        this.g = sourceParameter;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ra(Object obj, Object obj2, Object obj3, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
        this.f = obj2;
        this.g = obj3;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ra(Object obj, Object obj2, Object obj3, Object obj4, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = obj;
        this.e = obj2;
        this.f = obj3;
        this.g = obj4;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ra(lb0 lb0Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 21;
        this.g = lb0Var;
    }
}
