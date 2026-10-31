package n00;

import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothManager;
import android.content.Context;
import android.os.Build;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import com.teslacoilsw.conditions.SimpleBluetoothDevice;
import e00.q3;
import e10.z2;
import h6.a0;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Set;
import kotlin.jvm.functions.Function1;
import p1.e1;
import p1.g1;
import p1.o0;
import p1.t1;

/* loaded from: classes4.dex */
public abstract class f {

    /* renamed from: a, reason: collision with root package name */
    public static final String f77555a;

    static {
        f77555a = Build.VERSION.SDK_INT >= 31 ? "android.permission.BLUETOOTH_CONNECT" : "android.permission.BLUETOOTH";
    }

    public static final void a(p6.t tVar, Function1 function1, p1.o oVar, int i5) {
        LinkedHashMap linkedHashMap;
        p6.t tVar2;
        p1.t tVar3 = (p1.t) oVar;
        tVar3.d0(-548997755);
        int i11 = (tVar3.h(tVar) ? 4 : 2) | i5 | (tVar3.h(function1) ? 32 : 16);
        if ((i11 & 19) == 18 && tVar3.E()) {
            tVar3.V();
            tVar2 = tVar;
        } else {
            Context context = (Context) tVar3.j(AndroidCompositionLocals_androidKt.f14166b);
            tVar3.b0(-40645524);
            Object objP = tVar3.P();
            g1 g1Var = p1.n.f81514a;
            if (objP == g1Var) {
                objP = androidx.compose.runtime.d.k(Boolean.valueOf(o4.a.a(context, f77555a) == 0));
                tVar3.m0(objP);
            }
            e1 e1Var = (e1) objP;
            tVar3.p(false);
            tVar3.b0(597840489);
            a0 a0Var = (a0) tVar3.j(AndroidCompositionLocals_androidKt.getLocalLifecycleOwner());
            tVar3.b0(-1773386479);
            Object objP2 = tVar3.P();
            if (objP2 == g1Var) {
                objP2 = androidx.compose.runtime.d.k(h6.s.ON_ANY);
                tVar3.m0(objP2);
            }
            e1 e1Var2 = (e1) objP2;
            tVar3.p(false);
            tVar3.b0(-1773383432);
            boolean zH = tVar3.h(a0Var);
            Object objP3 = tVar3.P();
            if (zH || objP3 == g1Var) {
                objP3 = new jt.e(24, a0Var, e1Var2);
                tVar3.m0(objP3);
            }
            tVar3.p(false);
            o0.b(a0Var, (Function1) objP3, tVar3);
            h6.s sVar = (h6.s) e1Var2.getValue();
            tVar3.p(false);
            tVar3.b0(-40640584);
            boolean zF = tVar3.f(sVar);
            Object objP4 = tVar3.P();
            if (zF || objP4 == g1Var) {
                objP4 = androidx.compose.runtime.d.k(Boolean.valueOf(((BluetoothManager) context.getApplicationContext().getSystemService(BluetoothManager.class)).getAdapter().isEnabled()));
                tVar3.m0(objP4);
            }
            e1 e1Var3 = (e1) objP4;
            tVar3.p(false);
            boolean zBooleanValue = ((Boolean) e1Var.getValue()).booleanValue();
            boolean zBooleanValue2 = ((Boolean) e1Var3.getValue()).booleanValue();
            tVar3.b0(-40630635);
            boolean zF2 = tVar3.f(sVar) | tVar3.g(zBooleanValue) | tVar3.g(zBooleanValue2);
            Object objP5 = tVar3.P();
            if (zF2 || objP5 == g1Var) {
                ArrayList arrayListB = b(context, e1Var, e1Var3);
                if (arrayListB != null) {
                    int iD0 = b70.k.d0(b70.c.u0(arrayListB, 10));
                    linkedHashMap = new LinkedHashMap(iD0 >= 16 ? iD0 : 16);
                    Iterator it = arrayListB.iterator();
                    while (it.hasNext()) {
                        Object next = it.next();
                        linkedHashMap.put(next, Boolean.FALSE);
                    }
                } else {
                    linkedHashMap = null;
                }
                objP5 = androidx.compose.runtime.d.k(linkedHashMap);
                tVar3.m0(objP5);
            }
            e1 e1Var4 = (e1) objP5;
            tVar3.p(false);
            tVar2 = tVar;
            z2.h(2132017558, tVar2, null, null, null, x1.f.d(1862153870, new c(function1, e1Var4, tVar), tVar3), x1.f.d(-1541940152, new q3(e1Var4, e1Var3, context, e1Var), tVar3), tVar3, ((i11 << 3) & 112) | 1769472, 28);
        }
        t1 t1VarU = tVar3.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new a(tVar2, function1, i5, 0);
        }
    }

    public static final ArrayList b(Context context, e1 e1Var, e1 e1Var2) {
        if (!((Boolean) e1Var.getValue()).booleanValue() || !((Boolean) e1Var2.getValue()).booleanValue()) {
            return null;
        }
        Set<BluetoothDevice> bondedDevices = ((BluetoothManager) context.getApplicationContext().getSystemService(BluetoothManager.class)).getAdapter().getBondedDevices();
        ArrayList arrayList = new ArrayList(b70.c.u0(bondedDevices, 10));
        Iterator<T> it = bondedDevices.iterator();
        while (it.hasNext()) {
            arrayList.add(new SimpleBluetoothDevice((BluetoothDevice) it.next()));
        }
        return arrayList;
    }
}
