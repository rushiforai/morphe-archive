package defpackage;

import com.medium.android.graphql.fragment.ParagraphData;
import com.medium.android.graphql.type.ParagraphType;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class z6e {
    public static final Set a = k80.S0(new ParagraphType[]{ParagraphType.H1, ParagraphType.H2, ParagraphType.H3, ParagraphType.H4});
    public static final Set b = k80.S0(new ParagraphType[]{ParagraphType.ULI, ParagraphType.OLI});

    public static ParagraphType a(que queVar) {
        ParagraphData paragraphData;
        n39 n39Var = queVar instanceof n39 ? (n39) queVar : null;
        if (n39Var == null || (paragraphData = n39Var.b) == null) {
            return null;
        }
        return paragraphData.getType();
    }
}
