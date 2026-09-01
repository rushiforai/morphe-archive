package defpackage;

import android.os.Bundle;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class bb8 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ rya b;

    public /* synthetic */ bb8(rya ryaVar, int i) {
        this.a = i;
        this.b = ryaVar;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        rya ryaVar = this.b;
        switch (i) {
            case 0:
                String str = (String) obj;
                str.getClass();
                Object obj2 = ryaVar.a;
                return Boolean.valueOf(obj2 == null || !((Bundle) obj2).containsKey(str));
            default:
                ssd ssdVar = (ssd) obj;
                ssdVar.getClass();
                gu6 gu6Var = ((usd) ssdVar).o;
                List listT = (List) ryaVar.a;
                if (listT != null) {
                    listT.add(gu6Var);
                } else {
                    listT = d46.T(gu6Var);
                }
                ryaVar.a = listT;
                return rsd.SkipSubtreeAndContinueTraversal;
        }
    }
}
