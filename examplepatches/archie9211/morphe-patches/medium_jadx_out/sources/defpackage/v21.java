package defpackage;

import com.squareup.wire.sjIw.ezwlgQm;
import java.io.IOException;
import java.security.cert.Certificate;
import java.security.cert.CertificateEncodingException;
import java.security.cert.CertificateException;
import java.security.cert.CertificateFactory;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class v21 {
    public static final String k;
    public static final String l;
    public final qt5 a;
    public final yi5 b;
    public final String c;
    public final c8a d;
    public final int e;
    public final String f;
    public final yi5 g;
    public final ji5 h;
    public final long i;
    public final long j;

    public v21(ikc ikcVar) throws IOException {
        qt5 qt5VarC;
        nmd nmdVarA;
        ikcVar.getClass();
        try {
            yua yuaVar = new yua(ikcVar);
            String strI = yuaVar.I(Long.MAX_VALUE);
            try {
                pt5 pt5Var = new pt5();
                pt5Var.f(null, strI);
                qt5VarC = pt5Var.c();
            } catch (IllegalArgumentException unused) {
                qt5VarC = null;
            }
            if (qt5VarC == null) {
                IOException iOException = new IOException("Cache corruption for ".concat(strI));
                ea9 ea9Var = ea9.a;
                ea9.a.i(5, "cache corruption", iOException);
                throw iOException;
            }
            this.a = qt5VarC;
            this.c = yuaVar.I(Long.MAX_VALUE);
            ru ruVar = new ru(3);
            int iL = rv8.L(yuaVar);
            for (int i = 0; i < iL; i++) {
                ruVar.d(yuaVar.I(Long.MAX_VALUE));
            }
            this.b = iq7.C(ruVar);
            xp xpVarY = lk7.y(yuaVar.I(Long.MAX_VALUE));
            this.d = (c8a) xpVarY.c;
            this.e = xpVarY.b;
            this.f = (String) xpVarY.d;
            ru ruVar2 = new ru(3);
            int iL2 = rv8.L(yuaVar);
            for (int i2 = 0; i2 < iL2; i2++) {
                ruVar2.d(yuaVar.I(Long.MAX_VALUE));
            }
            String str = k;
            String strF = ruVar2.f(str);
            String str2 = l;
            String strF2 = ruVar2.f(str2);
            ruVar2.i(str);
            ruVar2.i(str2);
            this.i = strF != null ? Long.parseLong(strF) : 0L;
            this.j = strF2 != null ? Long.parseLong(strF2) : 0L;
            this.g = iq7.C(ruVar2);
            if (this.a.f()) {
                String strI2 = yuaVar.I(Long.MAX_VALUE);
                if (strI2.length() > 0) {
                    throw new IOException("expected \"\" but was \"" + strI2 + '\"');
                }
                zl1 zl1VarA = zl1.b.A(yuaVar.I(Long.MAX_VALUE));
                List listA = a(yuaVar);
                List listA2 = a(yuaVar);
                if (yuaVar.H()) {
                    nmdVarA = nmd.SSL_3_0;
                } else {
                    mmd mmdVar = nmd.Companion;
                    String strI3 = yuaVar.I(Long.MAX_VALUE);
                    mmdVar.getClass();
                    nmdVarA = mmd.a(strI3);
                }
                nmdVarA.getClass();
                this.h = new ji5(nmdVarA, zl1VarA, ggf.j(listA2), new c13(ggf.j(listA), 1));
            } else {
                this.h = null;
            }
            ikcVar.close();
        } catch (Throwable th) {
            try {
                throw th;
            } catch (Throwable th2) {
                k50.X(ikcVar, th);
                throw th2;
            }
        }
    }

    public static List a(yua yuaVar) throws IOException {
        int iL = rv8.L(yuaVar);
        if (iL == -1) {
            return ey3.a;
        }
        try {
            CertificateFactory certificateFactory = CertificateFactory.getInstance("X.509");
            ArrayList arrayList = new ArrayList(iL);
            for (int i = 0; i < iL; i++) {
                String strI = yuaVar.I(Long.MAX_VALUE);
                kz0 kz0Var = new kz0();
                h21 h21Var = h21.d;
                h21 h21VarM = dq1.m(strI);
                if (h21VarM == null) {
                    throw new IOException("Corrupt certificate in cache entry");
                }
                kz0Var.J0(h21VarM);
                arrayList.add(certificateFactory.generateCertificate(new iz0(kz0Var, 0)));
            }
            return arrayList;
        } catch (CertificateException e) {
            ik4.g(e.getMessage());
            return null;
        }
    }

    public static void b(xua xuaVar, List list) throws IOException {
        try {
            xuaVar.y0(list.size());
            xuaVar.writeByte(10);
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                byte[] encoded = ((Certificate) it2.next()).getEncoded();
                h21 h21Var = h21.d;
                encoded.getClass();
                xuaVar.Y(dq1.D(encoded).a());
                xuaVar.writeByte(10);
            }
        } catch (CertificateEncodingException e) {
            ik4.g(e.getMessage());
        }
    }

    public final void c(zf3 zf3Var) {
        qt5 qt5Var = this.a;
        ji5 ji5Var = this.h;
        yi5 yi5Var = this.g;
        yi5 yi5Var2 = this.b;
        xua xuaVar = new xua(zf3Var.l(0));
        try {
            xuaVar.Y(qt5Var.i);
            xuaVar.writeByte(10);
            xuaVar.Y(this.c);
            xuaVar.writeByte(10);
            xuaVar.y0(yi5Var2.size());
            xuaVar.writeByte(10);
            int size = yi5Var2.size();
            for (int i = 0; i < size; i++) {
                xuaVar.Y(iq7.D(yi5Var2, i));
                xuaVar.Y(": ");
                xuaVar.Y(iq7.F(yi5Var2, i));
                xuaVar.writeByte(10);
            }
            c8a c8aVar = this.d;
            int i2 = this.e;
            String str = this.f;
            c8aVar.getClass();
            str.getClass();
            StringBuilder sb = new StringBuilder();
            if (c8aVar == c8a.HTTP_1_0) {
                sb.append("HTTP/1.0");
            } else {
                sb.append("HTTP/1.1");
            }
            sb.append(' ');
            sb.append(i2);
            sb.append(' ');
            sb.append(str);
            xuaVar.Y(sb.toString());
            xuaVar.writeByte(10);
            xuaVar.y0(yi5Var.size() + 2);
            xuaVar.writeByte(10);
            int size2 = yi5Var.size();
            for (int i3 = 0; i3 < size2; i3++) {
                xuaVar.Y(iq7.D(yi5Var, i3));
                xuaVar.Y(": ");
                xuaVar.Y(iq7.F(yi5Var, i3));
                xuaVar.writeByte(10);
            }
            xuaVar.Y(k);
            xuaVar.Y(": ");
            xuaVar.y0(this.i);
            xuaVar.writeByte(10);
            xuaVar.Y(l);
            xuaVar.Y(": ");
            xuaVar.y0(this.j);
            xuaVar.writeByte(10);
            if (qt5Var.f()) {
                xuaVar.writeByte(10);
                ji5Var.getClass();
                xuaVar.Y(ji5Var.b.a);
                xuaVar.writeByte(10);
                b(xuaVar, ji5Var.a());
                b(xuaVar, ji5Var.c);
                xuaVar.Y(ji5Var.a.javaName());
                xuaVar.writeByte(10);
            }
            xuaVar.close();
        } finally {
        }
    }

    static {
        ea9 ea9Var = ea9.a;
        ea9.a.getClass();
        k = ezwlgQm.oPB;
        ea9.a.getClass();
        l = "OkHttp-Received-Millis";
    }

    public v21(adb adbVar) {
        yi5 yi5VarC;
        kbb kbbVar = adbVar.a;
        this.a = kbbVar.a;
        adb adbVar2 = adbVar.i;
        adbVar2.getClass();
        yi5 yi5Var = adbVar2.a.c;
        yi5 yi5Var2 = adbVar.f;
        Set setW = rv8.W(yi5Var2);
        if (setW.isEmpty()) {
            yi5VarC = yi5.b;
        } else {
            ru ruVar = new ru(3);
            int size = yi5Var.size();
            for (int i = 0; i < size; i++) {
                String strD = iq7.D(yi5Var, i);
                if (setW.contains(strD)) {
                    ruVar.c(strD, iq7.F(yi5Var, i));
                }
            }
            yi5VarC = iq7.C(ruVar);
        }
        this.b = yi5VarC;
        this.c = kbbVar.b;
        this.d = adbVar.b;
        this.e = adbVar.d;
        this.f = adbVar.c;
        this.g = yi5Var2;
        this.h = adbVar.e;
        this.i = adbVar.l;
        this.j = adbVar.m;
    }
}
