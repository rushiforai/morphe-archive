package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class is7 implements c55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ List b;
    public final /* synthetic */ int c;

    public /* synthetic */ is7(int i, List list) {
        this.c = i;
        this.b = list;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                List list = (List) obj;
                x12 x12Var = (x12) obj2;
                ((Integer) obj3).getClass();
                list.getClass();
                int size = list.size() - 1;
                int i2 = this.c;
                if (i2 <= size) {
                    size = i2;
                }
                dy0.a(flb.a0(jfc.e(jfc.d(new v12(new es7(((vj3) this.b.get(size)).a, 0, (g7d) list.get(size))), 1.0f), 1.0f), ((zo7) ((p65) x12Var).j(kt7.b)).n, rv8.r), x12Var, 0);
                break;
            default:
                List list2 = (List) obj;
                int iIntValue = ((Integer) obj3).intValue();
                list2.getClass();
                qs7.a(list2, this.b, this.c, null, null, (x12) obj2, (iIntValue << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ is7(List list, int i) {
        this.b = list;
        this.c = i;
    }
}
