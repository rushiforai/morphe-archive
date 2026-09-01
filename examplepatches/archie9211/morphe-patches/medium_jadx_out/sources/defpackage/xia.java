package defpackage;

import com.medium.android.graphql.fragment.PostPreviewData;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xia implements aja {
    public final String a;
    public final String b;
    public final ArrayList c;
    public final ArrayList d;

    public xia(String str, String str2, ArrayList arrayList) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = arrayList;
        ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
        Iterator it2 = arrayList.iterator();
        while (it2.hasNext()) {
            arrayList2.add(((PostPreviewData) it2.next()).getId());
        }
        this.d = arrayList2;
    }

    @Override // defpackage.aja
    public final List a() {
        return this.d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xia)) {
            return false;
        }
        xia xiaVar = (xia) obj;
        return g76.L(this.a, xiaVar.a) && g76.L(this.b, xiaVar.b) && this.c.equals(xiaVar.c);
    }

    @Override // defpackage.aja
    public final String getId() {
        return this.a;
    }

    @Override // defpackage.aja
    public final String getTitle() {
        return this.b;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        return this.c.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("PostSectionLoadedState(id=", this.a, ", title=", this.b, ", posts=");
        sbU.append(this.c);
        sbU.append(")");
        return sbU.toString();
    }
}
