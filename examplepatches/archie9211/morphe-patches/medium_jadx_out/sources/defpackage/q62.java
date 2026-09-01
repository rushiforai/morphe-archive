package defpackage;

import android.content.Context;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class q62 {
    public final Object a;
    public final Object b;
    public final Object c;
    public Object d;
    public final Serializable e;

    public q62(sc8 sc8Var, String str) {
        sc8Var.getClass();
        this.a = sc8Var;
        this.b = str;
        this.c = new LinkedHashMap();
        this.d = new ArrayList();
        this.e = new LinkedHashMap();
    }

    public va8 a() {
        va8 va8VarB = b();
        va8VarB.d = null;
        for (Map.Entry entry : ((LinkedHashMap) this.c).entrySet()) {
            String str = (String) entry.getKey();
            aa8 aa8Var = (aa8) entry.getValue();
            str.getClass();
            aa8Var.getClass();
            ym6 ym6Var = va8VarB.b;
            ym6Var.getClass();
            ((LinkedHashMap) ym6Var.f).put(str, aa8Var);
        }
        Iterator it2 = ((ArrayList) this.d).iterator();
        while (it2.hasNext()) {
            va8VarB.d((qa8) it2.next());
        }
        for (Map.Entry entry2 : ((LinkedHashMap) this.e).entrySet()) {
            va8VarB.t(((Number) entry2.getKey()).intValue(), (z98) entry2.getValue());
        }
        String str2 = (String) this.b;
        if (str2 != null) {
            va8VarB.u(str2);
        }
        return va8VarB;
    }

    public va8 b() {
        return ((sc8) this.a).a();
    }

    public abstract Object c();

    public void d(Object obj) {
        synchronized (this.c) {
            Object obj2 = this.d;
            if (obj2 == null || !obj2.equals(obj)) {
                this.d = obj;
                ((q7f) this.a).d.execute(new ho(bu1.m1((LinkedHashSet) this.e), 13, this));
            }
        }
    }

    public abstract void e();

    public abstract void f();

    public q62(Context context, q7f q7fVar) {
        this.a = q7fVar;
        Context applicationContext = context.getApplicationContext();
        applicationContext.getClass();
        this.b = applicationContext;
        this.c = new Object();
        this.e = new LinkedHashSet();
    }

    public q62(l3d l3dVar, String str, String str2, String str3, String str4, int i) {
        str2 = (i & 4) != 0 ? null : str2;
        str3 = (i & 8) != 0 ? null : str3;
        str4 = (i & 16) != 0 ? null : str4;
        this.a = l3dVar;
        this.b = str;
        this.c = str2;
        this.d = str3;
        this.e = str4;
    }
}
