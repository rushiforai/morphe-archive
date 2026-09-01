package defpackage;

import com.adobe.internal.xmp.XMPException;
import com.drew.imaging.raf.yvq.AXoTRPEGKEve;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.Schema;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class caf {
    public static final HashSet g = new HashSet(Arrays.asList("xml:lang", "rdf:resource", "rdf:ID", "rdf:bagID", "rdf:nodeID"));
    public w9f a;
    public ac2 b;
    public OutputStreamWriter c;
    public d0c d;
    public int e;
    public int f;

    public static boolean c(y9f y9fVar) {
        return (y9fVar.o() || y9fVar.j().c(2) || y9fVar.j().f() || "[]".equals(y9fVar.a)) ? false : true;
    }

    public final void a(int i) throws XMPException, IOException {
        int i2;
        if (this.d.c(512)) {
            int i3 = (i * this.e) + this.b.b;
            int i4 = this.f;
            if (i3 > i4) {
                ywb.e(107, "Can't fit into specified packet size");
                return;
            }
            this.f = i4 - i3;
        }
        this.f /= this.e;
        int length = this.d.c.length();
        int i5 = this.f;
        if (i5 < length) {
            while (i5 > 0) {
                this.c.write(32);
                i5--;
            }
            return;
        }
        this.f = i5 - length;
        while (true) {
            i2 = this.f;
            int i6 = length + 100;
            if (i2 < i6) {
                break;
            }
            for (int i7 = 100; i7 > 0; i7--) {
                this.c.write(32);
            }
            o();
            this.f -= i6;
        }
        while (i2 > 0) {
            this.c.write(32);
            i2--;
        }
        o();
    }

    public final void b(String str, boolean z) throws IOException {
        if (str == null) {
            str = "";
        }
        boolean[] zArr = kpe.a;
        for (int i = 0; i < str.length(); i++) {
            char cCharAt = str.charAt(i);
            if (cCharAt == '<' || cCharAt == '>' || cCharAt == '&' || cCharAt == '\t' || cCharAt == '\n' || cCharAt == '\r' || (z && cCharAt == '\"')) {
                StringBuffer stringBuffer = new StringBuffer((str.length() * 4) / 3);
                for (int i2 = 0; i2 < str.length(); i2++) {
                    char cCharAt2 = str.charAt(i2);
                    if (cCharAt2 == '\t' || cCharAt2 == '\n' || cCharAt2 == '\r') {
                        stringBuffer.append("&#x");
                        stringBuffer.append(Integer.toHexString(cCharAt2).toUpperCase());
                        stringBuffer.append(';');
                    } else if (cCharAt2 == '\"') {
                        stringBuffer.append(z ? "&quot;" : "\"");
                    } else if (cCharAt2 == '&') {
                        stringBuffer.append("&amp;");
                    } else if (cCharAt2 == '<') {
                        stringBuffer.append("&lt;");
                    } else if (cCharAt2 != '>') {
                        stringBuffer.append(cCharAt2);
                    } else {
                        stringBuffer.append("&gt;");
                    }
                }
                str = stringBuffer.toString();
                m(str);
            }
        }
        m(str);
    }

    public final void d() throws XMPException {
        d0c d0cVar = this.d;
        int i = d0cVar.a;
        if (((i & 3) == 3) | ((i & 3) == 2)) {
            this.e = 2;
        }
        boolean zC = d0cVar.c(512);
        d0c d0cVar2 = this.d;
        if (zC) {
            if (d0cVar2.c(16) || this.d.c(256)) {
                ywb.e(103, "Inconsistent options for exact size serialize");
                return;
            }
            if (((this.e - 1) & this.d.b) == 0) {
                return;
            }
            ywb.e(103, "Exact size must be a multiple of the Unicode element");
            return;
        }
        boolean zC2 = d0cVar2.c(32);
        d0c d0cVar3 = this.d;
        if (zC2) {
            if (!d0cVar3.c(16) && !this.d.c(256)) {
                this.f = 0;
                return;
            } else {
                ywb.e(103, "Inconsistent options for read-only packet");
                return;
            }
        }
        if (d0cVar3.c(16)) {
            if (this.d.c(256)) {
                ywb.e(103, "Inconsistent options for non-packet serialize");
                return;
            } else {
                this.f = 0;
                return;
            }
        }
        if (this.f == 0) {
            this.f = this.e * RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH;
        }
        if (this.d.c(256)) {
            w9f w9fVar = this.a;
            w9fVar.getClass();
            try {
                qo7.j(Schema.XMP_PROPERTIES);
                qo7.i("Thumbnails");
                if (mo7.J(w9fVar.a, no7.p(Schema.XMP_PROPERTIES, "Thumbnails"), false, null) != null) {
                    return;
                }
            } catch (XMPException unused) {
            }
            this.f = (this.e * PhotoshopDirectory.TAG_PRINT_FLAGS_INFO) + this.f;
        }
    }

    public final void e(String str, String str2, HashSet hashSet, int i) throws IOException {
        if (str2 == null) {
            int iIndexOf = str.indexOf(58);
            if (iIndexOf >= 0) {
                String strSubstring = str.substring(0, iIndexOf);
                str.substring(iIndexOf + 1);
                str = strSubstring;
            } else {
                str = "";
            }
            if (str.length() <= 0) {
                return;
            }
            str2 = v9f.a.n(str.concat(":"));
            e(str, str2, hashSet, i);
        }
        if (hashSet.contains(str)) {
            return;
        }
        o();
        n(i);
        m("xmlns:");
        m(str);
        m("=\"");
        m(str2);
        l(34);
        hashSet.add(str);
    }

    public final void f(y9f y9fVar, HashSet hashSet, int i) throws IOException {
        if (y9fVar.j().c(Integer.MIN_VALUE)) {
            e(y9fVar.b.substring(0, r0.length() - 1), y9fVar.a, hashSet, i);
        } else if (y9fVar.j().c(256)) {
            Iterator itP = y9fVar.p();
            while (itP.hasNext()) {
                e(((y9f) itP.next()).a, null, hashSet, i);
            }
        }
        Iterator itP2 = y9fVar.p();
        while (itP2.hasNext()) {
            f((y9f) itP2.next(), hashSet, i);
        }
        Iterator itQ = y9fVar.q();
        while (itQ.hasNext()) {
            y9f y9fVar2 = (y9f) itQ.next();
            e(y9fVar2.a, null, hashSet, i);
            f(y9fVar2, hashSet, i);
        }
    }

    public final void g(y9f y9fVar, boolean z, int i) throws IOException {
        if (z || y9fVar.n()) {
            n(i);
            m(z ? "<rdf:" : "</rdf:");
            if (y9fVar.j().c(RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH)) {
                m("Alt");
            } else if (y9fVar.j().c(1024)) {
                m("Seq");
            } else {
                m("Bag");
            }
            if (!z || y9fVar.n()) {
                m(">");
            } else {
                m("/>");
            }
            o();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0088, code lost:
    
        java.lang.Integer.parseInt(r7.group(1));
        java.lang.Integer.parseInt(r7.group(2));
        java.lang.Integer.parseInt(r7.group(3));
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String h() throws com.adobe.internal.xmp.XMPException, java.io.IOException {
        /*
            Method dump skipped, instruction units count: 588
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.caf.h():java.lang.String");
    }

    public final void i(y9f y9fVar, boolean z, boolean z2, int i) throws XMPException, IOException {
        HashSet hashSet;
        boolean z3;
        int i2 = i;
        String str = y9fVar.a;
        if (z2) {
            str = "rdf:value";
        } else if ("[]".equals(str)) {
            str = "rdf:li";
        }
        n(i2);
        l(60);
        m(str);
        Iterator itQ = y9fVar.q();
        boolean z4 = false;
        boolean z5 = false;
        boolean zEquals = false;
        while (true) {
            boolean zHasNext = itQ.hasNext();
            hashSet = g;
            z3 = true;
            if (!zHasNext) {
                break;
            }
            y9f y9fVar2 = (y9f) itQ.next();
            if (hashSet.contains(y9fVar2.a)) {
                zEquals = "rdf:resource".equals(y9fVar2.a);
                if (!z2) {
                    l(32);
                    m(y9fVar2.a);
                    m("=\"");
                    b(y9fVar2.b, true);
                    l(34);
                }
            } else {
                z5 = true;
            }
        }
        if (!z5 || z2) {
            if (y9fVar.j().f()) {
                if (y9fVar.j().c(512)) {
                    l(62);
                    o();
                    int i3 = i2 + 1;
                    g(y9fVar, true, i3);
                    if (y9fVar.j().c(4096)) {
                        mo7.S(y9fVar);
                    }
                    Iterator itP = y9fVar.p();
                    while (itP.hasNext()) {
                        i((y9f) itP.next(), z, false, i2 + 2);
                    }
                    g(y9fVar, false, i3);
                } else if (zEquals) {
                    Iterator itP2 = y9fVar.p();
                    while (itP2.hasNext()) {
                        y9f y9fVar3 = (y9f) itP2.next();
                        if (!c(y9fVar3)) {
                            ywb.e(Mp4VideoDirectory.TAG_TEMPORAL_QUALITY, "Can't mix rdf:resource and complex fields");
                            return;
                        }
                        o();
                        n(i2 + 1);
                        l(32);
                        m(y9fVar3.a);
                        m("=\"");
                        b(y9fVar3.b, true);
                        l(34);
                    }
                    m("/>");
                    o();
                } else if (y9fVar.n()) {
                    if (z) {
                        m(">");
                        o();
                        i2++;
                        n(i2);
                        m("<rdf:Description");
                        m(">");
                    } else {
                        m(" rdf:parseType=\"Resource\">");
                    }
                    o();
                    Iterator itP3 = y9fVar.p();
                    while (itP3.hasNext()) {
                        i((y9f) itP3.next(), z, false, i2 + 1);
                    }
                    if (z) {
                        n(i2);
                        m("</rdf:Description>");
                        o();
                        i2--;
                    }
                } else {
                    if (z) {
                        m(">");
                        o();
                        n(i2 + 1);
                        m("<rdf:Description/>");
                        z4 = true;
                    } else {
                        m(" rdf:parseType=\"Resource\"/>");
                    }
                    o();
                }
                z4 = true;
            } else if (y9fVar.j().c(2)) {
                m(" rdf:resource=\"");
                b(y9fVar.b, true);
                m("\"/>");
                o();
            } else {
                String str2 = y9fVar.b;
                if (str2 == null || "".equals(str2)) {
                    m("/>");
                    o();
                } else {
                    l(62);
                    b(y9fVar.b, false);
                    z3 = false;
                    z4 = true;
                }
            }
        } else {
            if (zEquals) {
                ywb.e(Mp4VideoDirectory.TAG_TEMPORAL_QUALITY, "Can't mix rdf:resource and general qualifiers");
                return;
            }
            if (z) {
                m(">");
                o();
                i2++;
                n(i2);
                m("<rdf:Description");
                m(">");
            } else {
                m(" rdf:parseType=\"Resource\">");
            }
            o();
            int i4 = i2 + 1;
            i(y9fVar, z, true, i4);
            Iterator itQ2 = y9fVar.q();
            while (itQ2.hasNext()) {
                y9f y9fVar4 = (y9f) itQ2.next();
                if (!hashSet.contains(y9fVar4.a)) {
                    i(y9fVar4, z, false, i4);
                }
            }
            if (z) {
                n(i2);
                m("</rdf:Description>");
                o();
                i2--;
            }
            z4 = true;
        }
        if (z4) {
            if (z3) {
                n(i2);
            }
            m("</");
            m(str);
            l(62);
            o();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:77:0x01b9 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0004 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void k(defpackage.y9f r14, int r15) throws com.adobe.internal.xmp.XMPException, java.io.IOException {
        /*
            Method dump skipped, instruction units count: 463
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.caf.k(y9f, int):void");
    }

    public final void l(int i) throws IOException {
        this.c.write(i);
    }

    public final void m(String str) throws IOException {
        this.c.write(str);
    }

    public final void n(int i) throws IOException {
        this.d.getClass();
        while (i > 0) {
            this.c.write(this.d.d);
            i--;
        }
    }

    public final void o() throws IOException {
        this.c.write(this.d.c);
    }

    public final void p() throws IOException {
        l(34);
        String str = this.a.a.a;
        if (str != null) {
            b(str, true);
        }
        l(34);
    }

    public final boolean j(y9f y9fVar, int i) throws IOException {
        Iterator itP = y9fVar.p();
        boolean z = true;
        while (itP.hasNext()) {
            y9f y9fVar2 = (y9f) itP.next();
            if (c(y9fVar2)) {
                o();
                n(i);
                m(y9fVar2.a);
                m(AXoTRPEGKEve.uXYMb);
                b(y9fVar2.b, true);
                l(34);
            } else {
                z = false;
            }
        }
        return z;
    }
}
