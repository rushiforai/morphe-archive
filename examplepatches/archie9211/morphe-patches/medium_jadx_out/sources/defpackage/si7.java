package defpackage;

import com.medium.proto.model.MarkupModel;
import com.medium.proto.obv.post.AnchorType;
import com.medium.proto.obv.post.MarkupType;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class si7 {
    public static final Map a = ei7.Q(new f09(MarkupType.COMMENT, 1), new f09(MarkupType.HIGHLIGHT, 2), new f09(MarkupType.QUOTE, 3), new f09(MarkupType.QUERY, 4), new f09(MarkupType.A, 5), new f09(MarkupType.CODE, 6), new f09(MarkupType.STRONG, 7), new f09(MarkupType.EM, 8), new f09(MarkupType.WARNING, 9));
    public static final g b = new g(13);

    public static boolean a(MarkupModel markupModel, Integer num, boolean z, boolean z2) {
        markupModel.getClass();
        Integer num2 = markupModel.start;
        int iIntValue = num2 != null ? num2.intValue() : 0;
        Integer num3 = markupModel.end;
        int iIntValue2 = num3 != null ? num3.intValue() : 0;
        int iIntValue3 = num != null ? num.intValue() : 0;
        return (!z ? iIntValue3 > iIntValue : iIntValue3 >= iIntValue) && (!z2 ? iIntValue3 < iIntValue2 : iIntValue3 <= iIntValue2);
    }

    public static MarkupModel b(int i, int i2, String str) {
        li7 li7Var = new li7();
        li7Var.a = MarkupType.A;
        li7Var.b = Integer.valueOf(i);
        li7Var.c = Integer.valueOf(i2);
        li7Var.d = str;
        li7Var.g = AnchorType.LINK;
        return li7Var.build();
    }
}
