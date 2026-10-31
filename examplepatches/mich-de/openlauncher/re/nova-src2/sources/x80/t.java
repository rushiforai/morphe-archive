package x80;

import java.security.cert.Certificate;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;
import kotlin.LazyKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public final class t {

    /* renamed from: a, reason: collision with root package name */
    public final r0 f95611a;

    /* renamed from: b, reason: collision with root package name */
    public final m f95612b;

    /* renamed from: c, reason: collision with root package name */
    public final List f95613c;

    /* renamed from: d, reason: collision with root package name */
    public final a70.d f95614d;

    public t(r0 r0Var, m mVar, List localCertificates, Function0 function0) {
        Intrinsics.g(localCertificates, "localCertificates");
        this.f95611a = r0Var;
        this.f95612b = mVar;
        this.f95613c = localCertificates;
        this.f95614d = LazyKt.a(new a3.e(function0));
    }

    public final List a() {
        return (List) this.f95614d.getValue();
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof t)) {
            return false;
        }
        t tVar = (t) obj;
        return tVar.f95611a == this.f95611a && Intrinsics.b(tVar.f95612b, this.f95612b) && Intrinsics.b(tVar.a(), a()) && Intrinsics.b(tVar.f95613c, this.f95613c);
    }

    public final int hashCode() {
        return this.f95613c.hashCode() + ((a().hashCode() + ((this.f95612b.hashCode() + ((this.f95611a.hashCode() + 527) * 31)) * 31)) * 31);
    }

    public final String toString() {
        String type;
        String type2;
        List<Certificate> listA = a();
        ArrayList arrayList = new ArrayList(b70.c.u0(listA, 10));
        for (Certificate certificate : listA) {
            if (certificate instanceof X509Certificate) {
                type2 = ((X509Certificate) certificate).getSubjectDN().toString();
            } else {
                type2 = certificate.getType();
                Intrinsics.f(type2, "type");
            }
            arrayList.add(type2);
        }
        String string = arrayList.toString();
        StringBuilder sb2 = new StringBuilder("Handshake{tlsVersion=");
        sb2.append(this.f95611a);
        sb2.append(" cipherSuite=");
        sb2.append(this.f95612b);
        sb2.append(" peerCertificates=");
        sb2.append(string);
        sb2.append(" localCertificates=");
        List<Certificate> list = this.f95613c;
        ArrayList arrayList2 = new ArrayList(b70.c.u0(list, 10));
        for (Certificate certificate2 : list) {
            if (certificate2 instanceof X509Certificate) {
                type = ((X509Certificate) certificate2).getSubjectDN().toString();
            } else {
                type = certificate2.getType();
                Intrinsics.f(type, "type");
            }
            arrayList2.add(type);
        }
        sb2.append(arrayList2);
        sb2.append(AbstractJsonLexerKt.END_OBJ);
        return sb2.toString();
    }
}
