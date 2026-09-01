package defpackage;

import java.io.File;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nc extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ oc c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ nc(oc ocVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = ocVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        oc ocVar = this.c;
        switch (i) {
            case 0:
                return new nc(ocVar, n92Var, 0);
            case 1:
                return new nc(ocVar, n92Var, 1);
            default:
                return new nc(ocVar, n92Var, 2);
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
        return ((nc) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        oc ocVar = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                gva gvaVar = (gva) ((kva) ocVar.c).a.e.getValue();
                if (gvaVar == null) {
                    return null;
                }
                gvaVar.a();
                return c1eVar;
            case 1:
                br7.v(obj);
                pva pvaVarD = ((kva) ocVar.c).d();
                if (pvaVarD == null) {
                    return null;
                }
                pvaVarD.a();
                return c1eVar;
            default:
                br7.v(obj);
                File file = new File(ocVar.d.getExternalFilesDir(null), b09.x("logcat_", ".txt", System.currentTimeMillis()));
                try {
                    Runtime.getRuntime().exec("logcat -f " + file);
                    Runtime.getRuntime().exec("logcat -T 2000");
                    break;
                } catch (IOException e) {
                    wld.a.d(e);
                }
                return file;
        }
    }
}
