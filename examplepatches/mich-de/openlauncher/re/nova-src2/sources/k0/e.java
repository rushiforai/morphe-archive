package k0;

import android.view.View;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import androidx.core.graphics.Insets;
import java.util.WeakHashMap;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class e implements j {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70593a;

    public /* synthetic */ e(int i5) {
        this.f70593a = i5;
    }

    public static final b c(int i5, String str) {
        WeakHashMap weakHashMap = h2.f70617v;
        return new b(i5, str);
    }

    public static final e2 d(int i5, String str) {
        WeakHashMap weakHashMap = h2.f70617v;
        return new e2(i2.i(Insets.NONE), str);
    }

    public static h2 e(p1.o oVar) {
        h2 h2Var;
        p1.t tVar = (p1.t) oVar;
        View view = (View) tVar.j(AndroidCompositionLocals_androidKt.f14170f);
        WeakHashMap weakHashMap = h2.f70617v;
        synchronized (weakHashMap) {
            try {
                Object h2Var2 = weakHashMap.get(view);
                if (h2Var2 == null) {
                    h2Var2 = new h2(view);
                    weakHashMap.put(view, h2Var2);
                }
                h2Var = (h2) h2Var2;
            } catch (Throwable th2) {
                throw th2;
            }
        }
        boolean zH = tVar.h(h2Var) | tVar.h(view);
        Object objP = tVar.P();
        if (zH || objP == p1.n.f81514a) {
            objP = new b00.x(5, h2Var, view);
            tVar.m0(objP);
        }
        p1.o0.b(h2Var, (Function1) objP, tVar);
        return h2Var;
    }

    @Override // k0.j
    public void b(y3.c cVar, int i5, int[] iArr, int[] iArr2) {
        switch (this.f70593a) {
            case 0:
                k.c(i5, iArr, iArr2, false);
                break;
            default:
                k.b(iArr, iArr2, false);
                break;
        }
    }

    public String toString() {
        switch (this.f70593a) {
            case 0:
                return "Arrangement#Bottom";
            case 1:
                return "Arrangement#Top";
            default:
                return super.toString();
        }
    }
}
