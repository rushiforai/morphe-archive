package j3;

import a5.d1;
import androidx.compose.ui.semantics.AppendedSemanticsElement;
import c3.q2;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public abstract class n {

    /* renamed from: a, reason: collision with root package name */
    public static final AtomicInteger f68816a = new AtomicInteger(0);

    public static final void a(q2 q2Var, k kVar) {
        d1 d1VarB = q2Var.b();
        int iD0 = b70.k.d0(b70.c.u0(kVar, 10));
        if (iD0 < 16) {
            iD0 = 16;
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
        Iterator it = kVar.iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            linkedHashMap.put(((a0) entry.getKey()).f68766a, entry.getValue());
        }
        d1VarB.b("properties", linkedHashMap);
    }

    public static final b2.t b(b2.t tVar, boolean z11, Function1 function1) {
        return tVar.then(new AppendedSemanticsElement(z11, function1));
    }
}
