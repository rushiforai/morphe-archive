package defpackage;

import com.medium.android.domain.post.models.Highlight;
import com.medium.android.graphql.fragment.ParagraphData;
import com.medium.android.graphql.type.ParagraphType;
import com.medium.proto.model.SectionModel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l09 {
    public static final Set i = k80.S0(new ParagraphType[]{ParagraphType.IMG, ParagraphType.IFRAME});
    public static final Set j = k80.S0(new ParagraphType[]{ParagraphType.H3, ParagraphType.H4});
    public final List a;
    public final List b;
    public final SectionModel c;
    public final int d;
    public final wl9 e;
    public final String f;
    public final List g;
    public final Set h;

    public l09(List list, List list2, SectionModel sectionModel, int i2, wl9 wl9Var, String str, List list3) {
        this.a = list;
        this.b = list2;
        this.c = sectionModel;
        this.d = i2;
        this.e = wl9Var;
        this.f = str;
        this.g = list3;
        ArrayList arrayList = new ArrayList(cu1.k0(list3, 10));
        Iterator it2 = list3.iterator();
        while (it2.hasNext()) {
            arrayList.add(Integer.valueOf(((SectionModel) it2.next()).start_index));
        }
        this.h = bu1.q1(arrayList);
    }

    public final int a() {
        int i2 = this.d;
        int i3 = 1;
        while (i2 > 0) {
            if (((ParagraphData) this.a.get(i2 - 1)).getType() != ParagraphType.OLI) {
                break;
            }
            i2--;
            i3++;
        }
        return i3;
    }

    public final ParagraphData b() {
        return (ParagraphData) this.a.get(this.d);
    }

    public final ArrayList c() {
        ParagraphData paragraphDataB = b();
        ArrayList arrayList = new ArrayList();
        for (Object obj : this.b) {
            if (g76.L(((Highlight) obj).getParagraphName(), paragraphDataB.getName())) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    public final boolean d() {
        ParagraphData paragraphDataJ = j(this.d + 1);
        return (paragraphDataJ != null ? paragraphDataJ.getType() : null) == b().getType();
    }

    public final boolean e(int i2) {
        ParagraphData paragraphDataJ = j(i2);
        if ((paragraphDataJ != null ? paragraphDataJ.getType() : null) != ParagraphType.H4 || !g(i2)) {
            return false;
        }
        int i3 = i2 + 1;
        ParagraphData paragraphDataJ2 = j(i3);
        if ((paragraphDataJ2 != null ? paragraphDataJ2.getType() : null) != ParagraphType.H2) {
            ParagraphData paragraphDataJ3 = j(i3);
            if ((paragraphDataJ3 != null ? paragraphDataJ3.getType() : null) != ParagraphType.H3) {
                return false;
            }
        }
        return true;
    }

    public final boolean f() {
        return this.d == this.a.size() - 1;
    }

    public final boolean g(int i2) {
        List listD1 = bu1.d1(this.a, iq7.W(0, i2));
        if (listD1.isEmpty()) {
            return true;
        }
        Iterator it2 = listD1.iterator();
        while (it2.hasNext()) {
            if (!fo7.M((ParagraphData) it2.next())) {
                return false;
            }
        }
        return true;
    }

    public final boolean h(int i2) {
        ParagraphData paragraphDataJ = j(i2);
        return (paragraphDataJ != null ? paragraphDataJ.getType() : null) == ParagraphType.H4 && i(i2 - 1);
    }

    public final boolean i(int i2) {
        ParagraphData paragraphDataJ = j(i2);
        if ((paragraphDataJ != null ? paragraphDataJ.getType() : null) != ParagraphType.H2) {
            ParagraphData paragraphDataJ2 = j(i2);
            if ((paragraphDataJ2 != null ? paragraphDataJ2.getType() : null) != ParagraphType.H3) {
                return false;
            }
        }
        return g(i2) || e(i2 - 1);
    }

    public final ParagraphData j(int i2) {
        return (ParagraphData) bu1.A0(i2, this.a);
    }
}
