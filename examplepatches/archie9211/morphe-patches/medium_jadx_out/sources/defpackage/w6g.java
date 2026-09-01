package defpackage;

import com.google.android.gms.internal.fido.zzhf;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class w6g extends o7g {
    public final ayf a;
    public final int b;

    public w6g(hzf hzfVar) throws zzhf {
        hzfVar.getClass();
        this.a = hzfVar;
        int i = 0;
        int i2 = 0;
        while (true) {
            ayf ayfVar = this.a;
            if (i >= ayfVar.size()) {
                break;
            }
            int iB = ((o7g) ayfVar.get(i)).b();
            if (i2 < iB) {
                i2 = iB;
            }
            i++;
        }
        int i3 = i2 + 1;
        this.b = i3;
        if (i3 > 8) {
            throw new zzhf("Exceeded cutoff limit for max depth of cbor value");
        }
    }

    @Override // defpackage.o7g
    public final int a() {
        return o7g.d((byte) -128);
    }

    @Override // defpackage.o7g
    public final int b() {
        return this.b;
    }

    @Override // java.lang.Comparable
    public final /* bridge */ /* synthetic */ int compareTo(Object obj) {
        o7g o7gVar = (o7g) obj;
        int iA = o7gVar.a();
        int iD = o7g.d((byte) -128);
        if (iD != iA) {
            return iD - o7gVar.a();
        }
        ayf ayfVar = ((w6g) o7gVar).a;
        ayf ayfVar2 = this.a;
        if (ayfVar2.size() != ayfVar.size()) {
            return ayfVar2.size() - ayfVar.size();
        }
        for (int i = 0; i < ayfVar2.size(); i++) {
            int iCompareTo = ((o7g) ayfVar2.get(i)).compareTo((o7g) ayfVar.get(i));
            if (iCompareTo != 0) {
                return iCompareTo;
            }
        }
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && w6g.class == obj.getClass()) {
            return this.a.equals(((w6g) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(o7g.d((byte) -128)), this.a});
    }

    public final String toString() {
        ayf ayfVar = this.a;
        if (ayfVar.isEmpty()) {
            return "[]";
        }
        ArrayList arrayList = new ArrayList();
        int size = ayfVar.size();
        for (int i = 0; i < size; i++) {
            arrayList.add(((o7g) ayfVar.get(i)).toString().replace("\n", "\n  "));
        }
        StringBuilder sb = new StringBuilder("[\n  ");
        Iterator it2 = arrayList.iterator();
        try {
            if (it2.hasNext()) {
                sb.append(y3b.A(it2.next()));
                while (it2.hasNext()) {
                    sb.append((CharSequence) ",\n  ");
                    sb.append(y3b.A(it2.next()));
                }
            }
            sb.append("\n]");
            return sb.toString();
        } catch (IOException e) {
            ay0.d(e);
            return null;
        }
    }
}
