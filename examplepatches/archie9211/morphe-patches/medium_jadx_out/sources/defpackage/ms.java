package defpackage;

import android.content.Context;
import android.os.Handler;
import com.apollographql.apollo.exception.ApolloException;
import com.apollographql.apollo.exception.ApolloNetworkException;
import java.io.EOFException;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ms implements se8 {
    public boolean a = true;
    public Object b;
    public Object c;
    public Object d;
    public Object e;

    public ms(nig nigVar, String str, n33 n33Var, arf arfVar) {
        this.e = nigVar;
        this.b = str;
        this.c = n33Var;
        this.d = arfVar;
    }

    public static j00 c(hv8 hv8Var, Throwable th) {
        ApolloException apolloNetworkException = th instanceof ApolloException ? (ApolloException) th : new ApolloNetworkException("Error while reading JSON response", th);
        UUID uuidRandomUUID = UUID.randomUUID();
        uuidRandomUUID.getClass();
        return new j00(uuidRandomUUID, hv8Var, null, null, apolloNetworkException, fy3.a, by3.a, true);
    }

    @Override // defpackage.se8
    public bo4 a(h00 h00Var) throws EOFException {
        yl2 yl2Var;
        boolean z;
        jt5 jt5Var;
        h00Var.getClass();
        s44 s44Var = h00Var.c;
        z46 z46Var = yl2.d;
        q44 q44VarD = s44Var.d(z46Var);
        q44VarD.getClass();
        yl2 yl2Var2 = (yl2) q44VarD;
        String str = ((e1g) this.b).b;
        hv8 hv8Var = h00Var.a;
        yl2 yl2Var3 = (yl2) s44Var.d(z46Var);
        if (yl2Var3 == null) {
            yl2Var3 = yl2.e;
        }
        ArrayList arrayList = new ArrayList();
        arrayList.add(new at5("Accept", "multipart/mixed;deferSpec=20220824, application/graphql-response+json, application/json"));
        List list = h00Var.e;
        if (list != null) {
            arrayList.addAll(list);
        }
        Boolean bool = h00Var.f;
        boolean zBooleanValue = bool != null ? bool.booleanValue() : false;
        Boolean bool2 = h00Var.g;
        boolean zBooleanValue2 = bool2 != null ? bool2.booleanValue() : true;
        boolean z2 = h00Var.l;
        et5 et5Var = h00Var.d;
        if (et5Var == null) {
            et5Var = et5.Post;
        }
        int i = kz2.a[et5Var.ordinal()];
        if (i == 1) {
            et5 et5Var2 = et5.Get;
            yl2Var = yl2Var2;
            LinkedHashMap linkedHashMap = new LinkedHashMap();
            boolean z3 = zBooleanValue;
            linkedHashMap.put("operationName", hv8Var.name());
            kz0 kz0Var = new kz0();
            kh4 kh4Var = new kh4(new yz0(kz0Var));
            kh4Var.i();
            hv8Var.serializeVariables(kh4Var, yl2Var3, false);
            kh4Var.e();
            if (!kh4Var.b.isEmpty()) {
                ygf.f("FileUpload and Http GET are not supported at the same time");
                return null;
            }
            linkedHashMap.put("variables", kz0Var.G0());
            if (zBooleanValue2) {
                linkedHashMap.put("query", hv8Var.document());
            }
            kz0 kz0Var2 = new kz0();
            yz0 yz0Var = new yz0(kz0Var2);
            yz0Var.i();
            if (z3) {
                yz0Var.t0("persistedQuery");
                yz0Var.i();
                yz0Var.t0("version");
                z = true;
                yz0Var.u(1);
                yz0Var.t0("sha256Hash");
                yz0Var.E(hv8Var.id());
                yz0Var.e();
            } else {
                z = true;
            }
            if (z2) {
                yz0Var.t0("clientLibrary");
                yz0Var.i();
                yz0Var.t0("name");
                yz0Var.E("apollo-kotlin");
                yz0Var.t0("version");
                yz0Var.E("4.4.1");
                yz0Var.e();
            }
            yz0Var.e();
            String strG0 = kz0Var2.G0();
            if (strG0.length() != 0) {
                linkedHashMap.put("extensions", strG0);
            }
            StringBuilder sb = new StringBuilder(str);
            boolean zQ = muc.Q(str, "?", false);
            for (Map.Entry entry : linkedHashMap.entrySet()) {
                if (zQ) {
                    sb.append('&');
                } else {
                    sb.append('?');
                    zQ = z;
                }
                sb.append(iq7.X((String) entry.getKey()));
                sb.append('=');
                sb.append(iq7.X((String) entry.getValue()));
            }
            jt5 jt5Var2 = new jt5(et5Var2, sb.toString());
            jt5Var2.c.add(new at5("Apollo-Require-Preflight", "true"));
            jt5Var = jt5Var2;
        } else {
            if (i != 2) {
                ygf.a();
                return null;
            }
            String strDocument = zBooleanValue2 ? hv8Var.document() : null;
            x45 csVar = (zBooleanValue || z2) ? new cs(hv8Var.id(), zBooleanValue, z2) : new iz2(0);
            yl2Var3.getClass();
            kz0 kz0Var3 = new kz0();
            yz0 yz0Var2 = new yz0(kz0Var3);
            yz0Var2.i();
            yz0Var2.t0("operationName");
            yz0Var2.E(hv8Var.name());
            yz0Var2.t0("variables");
            kh4 kh4Var2 = new kh4(yz0Var2);
            kh4Var2.i();
            hv8Var.serializeVariables(kh4Var2, yl2Var3, false);
            kh4Var2.e();
            if (strDocument != null) {
                yz0Var2.t0("query");
                yz0Var2.E(strDocument);
            }
            csVar.invoke(yz0Var2);
            yz0Var2.e();
            h21 h21VarR = kz0Var3.r(kz0Var3.b);
            LinkedHashMap linkedHashMap2 = kh4Var2.b;
            zs5 jz2Var = linkedHashMap2.isEmpty() ? new jz2(h21VarR) : new t6e(linkedHashMap2, h21VarR);
            jt5Var = new jt5(et5.Post, str);
            jt5Var.d = jz2Var;
            if (tuc.N(jz2Var.b(), "multipart/form-data", false)) {
                jt5Var.c.add(new at5("Apollo-Require-Preflight", "true"));
            }
            yl2Var = yl2Var2;
        }
        ArrayList arrayList2 = jt5Var.c;
        arrayList2.addAll(arrayList);
        s44 s44VarC = jt5Var.e.c(s44Var);
        jt5Var.e = s44VarC;
        return new u50(12, new i82(this, new jt5(jt5Var.a, jt5Var.b, arrayList2, jt5Var.d, s44VarC), h00Var, yl2Var, (n92) null));
    }

    public void b() {
        synchronized (((x21) this.e)) {
            if (this.a) {
                return;
            }
            this.a = true;
            egf.b((bfc) this.c);
            try {
                ((zf3) this.b).a();
            } catch (IOException unused) {
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public int d(gg5 gg5Var, mn mnVar, boolean z) {
        Object[] objArr;
        int i;
        int i2;
        vn5 vn5Var = (vn5) this.c;
        yn5 yn5Var = (yn5) this.e;
        if (this.a) {
            return 0;
        }
        try {
            this.a = true;
            o72 o72VarJ = ((my6) this.d).J(gg5Var, mnVar);
            ab7 ab7Var = (ab7) o72VarJ.c;
            int iK = ab7Var.k();
            for (int i3 = 0; i3 < iK; i3++) {
                rb9 rb9Var = (rb9) ab7Var.l(i3);
                if (!rb9Var.d && !rb9Var.h) {
                }
                objArr = false;
                break;
            }
            objArr = true;
            int iK2 = ab7Var.k();
            for (int i4 = 0; i4 < iK2; i4++) {
                rb9 rb9Var2 = (rb9) ab7Var.l(i4);
                if (objArr != false || mq7.v(rb9Var2)) {
                    ((aq6) this.b).A(rb9Var2.c, yn5Var, rb9Var2.i, true);
                    if (!yn5Var.a.h()) {
                        vn5Var.a(rb9Var2.a, yn5Var, mq7.v(rb9Var2));
                        yn5Var.clear();
                    }
                }
            }
            boolean zB = vn5Var.b(o72VarJ, z);
            if (o72VarJ.b) {
                i = 0;
            } else {
                int iK3 = ab7Var.k();
                for (int i5 = 0; i5 < iK3; i5++) {
                    rb9 rb9Var3 = (rb9) ab7Var.l(i5);
                    if (!ip8.b(mq7.F(rb9Var3, true), 0L) && rb9Var3.b()) {
                        i = 1;
                        break;
                    }
                }
                i = 0;
            }
            int iK4 = ab7Var.k();
            int i6 = 0;
            while (true) {
                if (i6 >= iK4) {
                    i2 = 0;
                    break;
                }
                if (((rb9) ab7Var.l(i6)).b()) {
                    i2 = 1;
                    break;
                }
                i6++;
            }
            int i7 = (zB ? 1 : 0) | (i << 1) | (i2 << 2);
            this.a = false;
            return i7;
        } catch (Throwable th) {
            this.a = false;
            throw th;
        }
    }

    @Override // defpackage.se8
    public void dispose() {
        Iterator it2 = ((ArrayList) this.d).iterator();
        while (it2.hasNext()) {
            ((ct5) it2.next()).dispose();
        }
    }

    public void e(wm7 wm7Var, Handler handler) {
        synchronized (this.c) {
            try {
                this.b = new WeakReference(wm7Var);
                xc xcVar = (xc) this.e;
                xc xcVar2 = null;
                if (xcVar != null) {
                    xcVar.removeCallbacksAndMessages(null);
                }
                if (handler != null) {
                    xcVar2 = new xc(this, handler.getLooper(), 2);
                }
                this.e = xcVar2;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public synchronized void f() {
        try {
            if (this.a) {
                return;
            }
            this.a = true;
            Context context = (Context) this.e;
            if (context != null) {
                ((ks) this.c).b(context);
                context.unregisterComponentCallbacks((ls) this.d);
            }
            ((WeakReference) this.b).clear();
        } catch (Throwable th) {
            throw th;
        }
    }
}
