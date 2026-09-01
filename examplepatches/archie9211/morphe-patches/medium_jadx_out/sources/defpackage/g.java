package defpackage;

import com.medium.proto.model.MarkupModel;
import com.medium.proto.obv.post.MarkupType;
import java.io.File;
import java.util.Comparator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class g implements Comparator {
    public final /* synthetic */ int a;

    public /* synthetic */ g(int i) {
        this.a = i;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        int value;
        switch (this.a) {
            case 0:
                z36 z36Var = (z36) obj;
                z36 z36Var2 = (z36) obj2;
                if (!ec2.a.contains(i.class)) {
                    try {
                        z36Var2.getClass();
                        Long l = z36Var.g;
                        if (l == null) {
                            return -1;
                        }
                        long jLongValue = l.longValue();
                        Long l2 = z36Var2.g;
                        if (l2 != null) {
                            return g76.R(l2.longValue(), jLongValue);
                        }
                        return 1;
                    } catch (Throwable th) {
                        ec2.a(i.class, th);
                    }
                }
                return 0;
            case 1:
                return g76.Q(((d1a) obj2).a, ((d1a) obj).a);
            case 2:
                z36 z36Var3 = (z36) obj2;
                z36Var3.getClass();
                Long l3 = ((z36) obj).g;
                if (l3 == null) {
                    return -1;
                }
                long jLongValue2 = l3.longValue();
                Long l4 = z36Var3.g;
                if (l4 != null) {
                    return g76.R(l4.longValue(), jLongValue2);
                }
                return 1;
            case 3:
                return Long.compare(((File) obj2).lastModified(), ((File) obj).lastModified());
            case 4:
                return ((File) obj2).getName().compareTo(((File) obj).getName());
            case 5:
                String name = ((File) obj).getName();
                int i = sd2.f;
                return name.substring(0, i).compareTo(((File) obj2).getName().substring(0, i));
            case 6:
                p14 p14Var = (p14) obj;
                p14 p14Var2 = (p14) obj2;
                p14Var2.getClass();
                p14Var.getClass();
                Long l5 = p14Var.c;
                if (l5 == null) {
                    return -1;
                }
                long jLongValue3 = l5.longValue();
                Long l6 = p14Var2.c;
                if (l6 != null) {
                    return g76.R(l6.longValue(), jLongValue3);
                }
                return 1;
            case 7:
                byte[] bArr = (byte[]) obj;
                byte[] bArr2 = (byte[]) obj2;
                if (bArr.length != bArr2.length) {
                    return bArr.length - bArr2.length;
                }
                for (int i2 = 0; i2 < bArr.length; i2++) {
                    byte b = bArr[i2];
                    byte b2 = bArr2[i2];
                    if (b != b2) {
                        return b - b2;
                    }
                }
                return 0;
            case 8:
                return g76.Q(((r76) obj).b, ((r76) obj2).b);
            case 9:
                return Integer.parseInt(((String) obj).split(":")[0]) - Integer.parseInt(((String) obj2).split(":")[0]);
            case 10:
                n46 n46Var = (n46) obj;
                n46 n46Var2 = (n46) obj2;
                return (n46Var.b - n46Var.a) - (n46Var2.b - n46Var2.a);
            case 11:
                aq6 aq6Var = (aq6) obj;
                aq6 aq6Var2 = (aq6) obj2;
                float f = aq6Var.G.p.F;
                float f2 = aq6Var2.G.p.F;
                return f == f2 ? g76.Q(aq6Var.w(), aq6Var2.w()) : Float.compare(f, f2);
            case 12:
                return g76.Q(((zt6) obj).getIndex(), ((zt6) obj2).getIndex());
            case 13:
                MarkupModel markupModel = (MarkupModel) obj;
                MarkupModel markupModel2 = (MarkupModel) obj2;
                markupModel.getClass();
                markupModel2.getClass();
                Map map = si7.a;
                Integer num = (Integer) map.get(markupModel.type);
                Integer num2 = (Integer) map.get(markupModel2.type);
                if (num == null || num2 == null) {
                    MarkupType markupType = markupModel.type;
                    int value2 = markupType != null ? markupType.getValue() : 0;
                    MarkupType markupType2 = markupModel2.type;
                    value = value2 - (markupType2 != null ? markupType2.getValue() : 0);
                } else {
                    value = num.intValue() - num2.intValue();
                }
                if (value != 0) {
                    return value;
                }
                Integer num3 = markupModel.start;
                int iIntValue = num3 != null ? num3.intValue() : 0;
                Integer num4 = markupModel2.start;
                int iIntValue2 = iIntValue - (num4 != null ? num4.intValue() : 0);
                if (iIntValue2 != 0) {
                    return iIntValue2;
                }
                Integer num5 = markupModel.end;
                int iIntValue3 = num5 != null ? num5.intValue() : 0;
                Integer num6 = markupModel2.end;
                int iIntValue4 = iIntValue3 - (num6 != null ? num6.intValue() : 0);
                return iIntValue4 != 0 ? iIntValue4 : g76.Q(markupModel.hashCode(), markupModel2.hashCode());
            default:
                return ((ai0) ((sc2) obj)).a.compareTo(((ai0) ((sc2) obj2)).a);
        }
    }
}
