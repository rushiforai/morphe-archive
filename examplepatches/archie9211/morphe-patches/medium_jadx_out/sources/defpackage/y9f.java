package defpackage;

import com.adobe.internal.xmp.XMPException;
import com.drew.metadata.mp4.media.Mp4VideoDirectory;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y9f implements Comparable {
    public String a;
    public String b;
    public y9f c;
    public ArrayList d = null;
    public ArrayList e = null;
    public t4a f;
    public boolean g;
    public boolean h;
    public boolean i;
    public boolean j;

    public y9f(String str, String str2, t4a t4aVar) {
        this.a = str;
        this.b = str2;
        this.f = t4aVar;
    }

    public static y9f f(String str, List list) {
        if (list == null) {
            return null;
        }
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            y9f y9fVar = (y9f) it2.next();
            if (y9fVar.a.equals(str)) {
                return y9fVar;
            }
        }
        return null;
    }

    public final void a(y9f y9fVar) {
        d(y9fVar.a);
        y9fVar.c = this;
        ((ArrayList) h()).add(y9fVar);
    }

    public final void b(y9f y9fVar) {
        d(y9fVar.a);
        y9fVar.c = this;
        ((ArrayList) h()).add(0, y9fVar);
    }

    public final void c(y9f y9fVar) {
        String str = y9fVar.a;
        if (!"[]".equals(str) && f(str, this.e) != null) {
            throw new XMPException(ev6.x("Duplicate '", str, "' qualifier"), Mp4VideoDirectory.TAG_SPATIAL_QUALITY);
        }
        y9fVar.c = this;
        y9fVar.j().e(32, true);
        j().e(16, true);
        if ("xml:lang".equals(y9fVar.a)) {
            this.f.e(64, true);
            ((ArrayList) l()).add(0, y9fVar);
        } else {
            if (!"rdf:type".equals(y9fVar.a)) {
                ((ArrayList) l()).add(y9fVar);
                return;
            }
            this.f.e(128, true);
            ((ArrayList) l()).add(this.f.c(64) ? 1 : 0, y9fVar);
        }
    }

    public final Object clone() {
        return e();
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return j().c(Integer.MIN_VALUE) ? this.b.compareTo(((y9f) obj).b) : this.a.compareTo(((y9f) obj).a);
    }

    public final void d(String str) throws XMPException {
        if (!"[]".equals(str) && f(str, h()) != null) {
            throw new XMPException(ev6.x("Duplicate property or field node '", str, "'"), Mp4VideoDirectory.TAG_SPATIAL_QUALITY);
        }
    }

    public final y9f e() {
        t4a t4aVar;
        try {
            t4aVar = new t4a(j().a);
        } catch (XMPException unused) {
            t4aVar = new t4a();
        }
        y9f y9fVar = new y9f(this.a, this.b, t4aVar);
        try {
            Iterator itP = p();
            while (itP.hasNext()) {
                y9f y9fVarE = ((y9f) itP.next()).e();
                if (y9fVarE != null) {
                    y9fVar.a(y9fVarE);
                }
            }
            Iterator itQ = q();
            while (itQ.hasNext()) {
                y9f y9fVarE2 = ((y9f) itQ.next()).e();
                if (y9fVarE2 != null) {
                    y9fVar.c(y9fVarE2);
                }
            }
        } catch (XMPException unused2) {
        }
        return y9fVar;
    }

    public final y9f g(int i) {
        return (y9f) ((ArrayList) h()).get(i - 1);
    }

    public final List h() {
        ArrayList arrayList = this.d;
        if (arrayList != null) {
            return arrayList;
        }
        ArrayList arrayList2 = new ArrayList(0);
        this.d = arrayList2;
        return arrayList2;
    }

    public final int i() {
        ArrayList arrayList = this.d;
        if (arrayList != null) {
            return arrayList.size();
        }
        return 0;
    }

    public final t4a j() {
        t4a t4aVar = this.f;
        if (t4aVar != null) {
            return t4aVar;
        }
        t4a t4aVar2 = new t4a();
        this.f = t4aVar2;
        return t4aVar2;
    }

    public final y9f k(int i) {
        return (y9f) ((ArrayList) l()).get(i - 1);
    }

    public final List l() {
        ArrayList arrayList = this.e;
        if (arrayList != null) {
            return arrayList;
        }
        ArrayList arrayList2 = new ArrayList(0);
        this.e = arrayList2;
        return arrayList2;
    }

    public final int m() {
        ArrayList arrayList = this.e;
        if (arrayList != null) {
            return arrayList.size();
        }
        return 0;
    }

    public final boolean n() {
        ArrayList arrayList = this.d;
        return arrayList != null && arrayList.size() > 0;
    }

    public final boolean o() {
        ArrayList arrayList = this.e;
        return arrayList != null && arrayList.size() > 0;
    }

    public final Iterator p() {
        return this.d != null ? ((ArrayList) h()).iterator() : Collections.EMPTY_LIST.listIterator();
    }

    public final Iterator q() {
        return this.e != null ? new j1e(((ArrayList) l()).iterator()) : Collections.EMPTY_LIST.iterator();
    }

    public final void r(y9f y9fVar) {
        t4a t4aVarJ = j();
        if ("xml:lang".equals(y9fVar.a)) {
            t4aVarJ.e(64, false);
        } else if ("rdf:type".equals(y9fVar.a)) {
            t4aVarJ.e(128, false);
        }
        ((ArrayList) l()).remove(y9fVar);
        if (this.e.isEmpty()) {
            t4aVarJ.e(16, false);
            this.e = null;
        }
    }

    public final void s() {
        if (o()) {
            y9f[] y9fVarArr = (y9f[]) ((ArrayList) l()).toArray(new y9f[m()]);
            int i = 0;
            while (y9fVarArr.length > i && ("xml:lang".equals(y9fVarArr[i].a) || "rdf:type".equals(y9fVarArr[i].a))) {
                y9fVarArr[i].s();
                i++;
            }
            Arrays.sort(y9fVarArr, i, y9fVarArr.length);
            ListIterator listIterator = this.e.listIterator();
            for (int i2 = 0; i2 < y9fVarArr.length; i2++) {
                listIterator.next();
                listIterator.set(y9fVarArr[i2]);
                y9fVarArr[i2].s();
            }
        }
        if (n()) {
            if (!j().c(512)) {
                Collections.sort(this.d);
            }
            Iterator itP = p();
            while (itP.hasNext()) {
                ((y9f) itP.next()).s();
            }
        }
    }
}
