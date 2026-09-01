package defpackage;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.JarURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ncb extends ch4 {
    public static final g59 f;
    public final ClassLoader c;
    public final ch4 d;
    public final w5d e;

    static {
        String str = g59.b;
        f = cd7.r("/");
    }

    public ncb(ClassLoader classLoader) {
        ig6 ig6Var = ch4.a;
        ig6Var.getClass();
        this.c = classLoader;
        this.d = ig6Var;
        this.e = new w5d(new i5b(6, this));
    }

    @Override // defpackage.ch4
    public final void B(g59 g59Var) throws IOException {
        g59Var.getClass();
        throw new IOException(this + " is read-only");
    }

    @Override // defpackage.ch4
    public final void D(g59 g59Var) throws IOException {
        g59Var.getClass();
        throw new IOException(this + " is read-only");
    }

    @Override // defpackage.ch4
    public final List N(g59 g59Var) throws FileNotFoundException {
        g59 g59Var2 = f;
        g59Var2.getClass();
        String strT = d.a(g59Var2, g59Var, true).d(g59Var2).a.t();
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        boolean z = false;
        for (f09 f09Var : (List) this.e.getValue()) {
            ch4 ch4Var = (ch4) f09Var.a;
            g59 g59Var3 = (g59) f09Var.b;
            try {
                List listN = ch4Var.N(g59Var3.e(strT));
                ArrayList<g59> arrayList = new ArrayList();
                for (Object obj : listN) {
                    if (to7.p((g59) obj)) {
                        arrayList.add(obj);
                    }
                }
                ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
                for (g59 g59Var4 : arrayList) {
                    g59Var4.getClass();
                    String strReplace = muc.j0(g59Var3.a.t(), g59Var4.a.t()).replace('\\', '/');
                    strReplace.getClass();
                    arrayList2.add(g59Var2.e(strReplace));
                }
                bu1.n0(arrayList2, linkedHashSet);
                z = true;
            } catch (IOException unused) {
            }
        }
        if (z) {
            return bu1.m1(linkedHashSet);
        }
        fm3.g("file not found: ", g59Var);
        return null;
    }

    @Override // defpackage.ch4
    public final w73 R(g59 g59Var) {
        g59Var.getClass();
        if (!to7.p(g59Var)) {
            return null;
        }
        g59 g59Var2 = f;
        g59Var2.getClass();
        String strT = d.a(g59Var2, g59Var, true).d(g59Var2).a.t();
        for (f09 f09Var : (List) this.e.getValue()) {
            w73 w73VarR = ((ch4) f09Var.a).R(((g59) f09Var.b).e(strT));
            if (w73VarR != null) {
                return w73VarR;
            }
        }
        return null;
    }

    @Override // defpackage.ch4
    public final we6 T(g59 g59Var) throws FileNotFoundException {
        if (!to7.p(g59Var)) {
            fm3.g("file not found: ", g59Var);
            return null;
        }
        g59 g59Var2 = f;
        g59Var2.getClass();
        String strT = d.a(g59Var2, g59Var, true).d(g59Var2).a.t();
        Iterator it2 = ((List) this.e.getValue()).iterator();
        while (it2.hasNext()) {
            f09 f09Var = (f09) it2.next();
            try {
                return ((ch4) f09Var.a).T(((g59) f09Var.b).e(strT));
            } catch (FileNotFoundException unused) {
            }
        }
        fm3.g("file not found: ", g59Var);
        return null;
    }

    @Override // defpackage.ch4
    public final bfc U(g59 g59Var, boolean z) throws IOException {
        g59Var.getClass();
        throw new IOException(this + " is read-only");
    }

    @Override // defpackage.ch4
    public final bfc f(g59 g59Var) throws IOException {
        g59Var.getClass();
        throw new IOException(this + " is read-only");
    }

    @Override // defpackage.ch4
    public final ikc g0(g59 g59Var) throws IOException {
        g59Var.getClass();
        if (!to7.p(g59Var)) {
            fm3.g("file not found: ", g59Var);
            return null;
        }
        g59 g59Var2 = f;
        g59Var2.getClass();
        URL resource = this.c.getResource(d.a(g59Var2, g59Var, false).d(g59Var2).a.t());
        if (resource == null) {
            fm3.g("file not found: ", g59Var);
            return null;
        }
        URLConnection uRLConnectionOpenConnection = resource.openConnection();
        if (uRLConnectionOpenConnection instanceof JarURLConnection) {
            ((JarURLConnection) uRLConnectionOpenConnection).setUseCaches(false);
        }
        InputStream inputStream = uRLConnectionOpenConnection.getInputStream();
        inputStream.getClass();
        return vo7.N(inputStream);
    }

    @Override // defpackage.ch4
    public final void m(g59 g59Var, g59 g59Var2) throws IOException {
        g59Var.getClass();
        g59Var2.getClass();
        throw new IOException(this + " is read-only");
    }
}
