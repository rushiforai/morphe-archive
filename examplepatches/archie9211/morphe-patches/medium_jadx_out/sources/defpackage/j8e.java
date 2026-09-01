package defpackage;

import androidx.work.impl.WorkerStoppedException;
import com.google.android.gms.tasks.RuntimeExecutionException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j8e implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ j8e(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj2 = this.c;
        Object obj3 = this.b;
        switch (i) {
            case 0:
                int iIntValue = ((Number) obj).intValue();
                return ((n2c) obj3).invoke(Integer.valueOf(iIntValue), ((List) obj2).get(iIntValue));
            case 1:
                int iIntValue2 = ((Number) obj).intValue();
                return ((n2c) obj3).invoke(Integer.valueOf(iIntValue2), ((ArrayList) obj2).get(iIntValue2));
            case 2:
                int iIntValue3 = ((Number) obj).intValue();
                return ((n2c) obj3).invoke(Integer.valueOf(iIntValue3), ((List) obj2).get(iIntValue3));
            case 3:
                int iIntValue4 = ((Number) obj).intValue();
                return ((n2c) obj3).invoke(Integer.valueOf(iIntValue4), ((List) obj2).get(iIntValue4));
            case 4:
                return ((tjd) obj3).invoke(((List) obj2).get(((Number) obj).intValue()));
            case 5:
                String str = (String) obj;
                str.getClass();
                ((b55) obj3).invoke(((uwe) obj2).a, str);
                return c1eVar;
            case 6:
                int iIntValue5 = ((Number) obj).intValue();
                return ((n2c) obj3).invoke(Integer.valueOf(iIntValue5), ((List) obj2).get(iIntValue5));
            case 7:
                Throwable th = (Throwable) obj;
                if (th instanceof WorkerStoppedException) {
                    ((k37) obj3).stop(((WorkerStoppedException) th).a);
                }
                ((d37) obj2).cancel(false);
                return c1eVar;
            case 8:
                int iIntValue6 = ((Number) obj).intValue();
                return ((n2c) obj3).invoke(Integer.valueOf(iIntValue6), ((List) obj2).get(iIntValue6));
            case 9:
                int iIntValue7 = ((Number) obj).intValue();
                return ((n2c) obj3).invoke(Integer.valueOf(iIntValue7), ((List) obj2).get(iIntValue7));
            case 10:
                int iIntValue8 = ((Number) obj).intValue();
                return ((n2c) obj3).invoke(Integer.valueOf(iIntValue8), ((ArrayList) obj2).get(iIntValue8));
            case 11:
                int iIntValue9 = ((Number) obj).intValue();
                return ((n2c) obj3).invoke(Integer.valueOf(iIntValue9), ((List) obj2).get(iIntValue9));
            case 12:
                arf arfVar = (arf) obj;
                String strV = arfVar.v();
                arf arfVar2 = (arf) ((ms) obj3).d;
                if (!g76.L(arfVar2 != null ? arfVar2.v() : null, strV)) {
                    return null;
                }
                qsf qsfVar = (qsf) obj2;
                zqf zqfVar = (zqf) arfVar.i();
                String strV2 = qsfVar.v();
                zqfVar.c();
                ((arf) zqfVar.b).C(strV2);
                pmf pmfVarW = qsfVar.w();
                zqfVar.c();
                ((arf) zqfVar.b).D(pmfVarW);
                return (arf) zqfVar.e();
            default:
                Throwable th2 = (Throwable) obj;
                wfd wfdVar = (wfd) obj3;
                if (th2 instanceof CancellationException) {
                    wfdVar.a((Exception) th2);
                    return c1eVar;
                }
                o33 o33Var = (o33) obj2;
                Object objH = o33Var.H();
                if (objH instanceof m06) {
                    ygf.f("This job has not completed yet");
                    return null;
                }
                cy1 cy1Var = objH instanceof cy1 ? (cy1) objH : null;
                Throwable th3 = cy1Var != null ? cy1Var.a : null;
                if (th3 == null) {
                    wfdVar.b(o33Var.A());
                    return c1eVar;
                }
                Exception runtimeExecutionException = th3 instanceof Exception ? (Exception) th3 : null;
                if (runtimeExecutionException == null) {
                    runtimeExecutionException = new RuntimeExecutionException(th3);
                }
                wfdVar.a(runtimeExecutionException);
                return c1eVar;
        }
    }
}
