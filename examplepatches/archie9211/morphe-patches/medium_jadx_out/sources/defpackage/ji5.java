package defpackage;

import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ji5 {
    public final nmd a;
    public final zl1 b;
    public final List c;
    public final w5d d;

    public ji5(nmd nmdVar, zl1 zl1Var, List list, m45 m45Var) {
        nmdVar.getClass();
        this.a = nmdVar;
        this.b = zl1Var;
        this.c = list;
        this.d = new w5d(new z23(3, m45Var));
    }

    public final List a() {
        return (List) this.d.getValue();
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof ji5)) {
            return false;
        }
        ji5 ji5Var = (ji5) obj;
        return ji5Var.a == this.a && ji5Var.b == this.b && g76.L(ji5Var.a(), a()) && ji5Var.c.equals(this.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + ((a().hashCode() + ((this.b.hashCode() + ((this.a.hashCode() + 527) * 31)) * 31)) * 31);
    }

    public final String toString() {
        String type;
        String type2;
        List<Certificate> listA = a();
        ArrayList arrayList = new ArrayList(cu1.k0(listA, 10));
        for (Certificate certificate : listA) {
            if (certificate instanceof X509Certificate) {
                type2 = ((X509Certificate) certificate).getSubjectDN().toString();
            } else {
                type2 = certificate.getType();
                type2.getClass();
            }
            arrayList.add(type2);
        }
        String string = arrayList.toString();
        StringBuilder sb = new StringBuilder("Handshake{tlsVersion=");
        sb.append(this.a);
        sb.append(" cipherSuite=");
        sb.append(this.b);
        sb.append(" peerCertificates=");
        sb.append(string);
        sb.append(" localCertificates=");
        List<Certificate> list = this.c;
        ArrayList arrayList2 = new ArrayList(cu1.k0(list, 10));
        for (Certificate certificate2 : list) {
            if (certificate2 instanceof X509Certificate) {
                type = ((X509Certificate) certificate2).getSubjectDN().toString();
            } else {
                type = certificate2.getType();
                type.getClass();
            }
            arrayList2.add(type);
        }
        sb.append(arrayList2);
        sb.append('}');
        return sb.toString();
    }
}
