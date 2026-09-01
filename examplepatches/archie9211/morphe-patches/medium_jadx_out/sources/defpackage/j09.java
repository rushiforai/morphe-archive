package defpackage;

import com.medium.android.graphql.fragment.ParagraphData;
import com.medium.proto.model.SectionModel;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class j09 {
    public List a;
    public wl9 b;
    public List c;
    public SectionModel d;
    public int e;
    public String f;
    public List g;

    public final l09 a() {
        return new l09(this.a, this.c, this.d, this.e, this.b, this.f, this.g);
    }

    public final void b(ParagraphData paragraphData) {
        paragraphData.getClass();
        int iIndexOf = this.a.indexOf(paragraphData);
        this.e = iIndexOf;
        if (iIndexOf < 0) {
            Iterator it2 = this.a.iterator();
            int i = 0;
            while (true) {
                if (!it2.hasNext()) {
                    iIndexOf = -1;
                    break;
                } else {
                    if (g76.L(((ParagraphData) it2.next()).getName(), paragraphData.getName())) {
                        iIndexOf = i;
                        break;
                    }
                    i++;
                }
            }
            this.e = iIndexOf;
        }
        if (iIndexOf < 0) {
            this.e = 1;
        }
    }
}
