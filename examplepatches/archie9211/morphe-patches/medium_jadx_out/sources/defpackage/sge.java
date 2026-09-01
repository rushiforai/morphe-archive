package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class sge implements c55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ float b;

    public /* synthetic */ sge(int i, float f) {
        this.a = i;
        this.b = f;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        o28 o28Var = o28.b;
        float f = this.b;
        switch (i) {
            case 0:
                String str = (String) obj;
                x12 x12Var = (x12) obj2;
                int iIntValue = ((Integer) obj3).intValue();
                str.getClass();
                if ((iIntValue & 6) == 0) {
                    iIntValue |= ((p65) x12Var).f(str) ? 4 : 2;
                }
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 19) != 18)) {
                    p65Var.S();
                } else {
                    w2g.e(vn7.J(R.drawable.ic_book_author, 0, p65Var), str, jfc.l(o28Var, f), null, null, 0.0f, null, p65Var, 8 | ((iIntValue << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION), 120);
                }
                break;
            default:
                String str2 = (String) obj;
                x12 x12Var2 = (x12) obj2;
                int iIntValue2 = ((Integer) obj3).intValue();
                str2.getClass();
                if ((iIntValue2 & 6) == 0) {
                    iIntValue2 |= ((p65) x12Var2).f(str2) ? 4 : 2;
                }
                p65 p65Var2 = (p65) x12Var2;
                if (!p65Var2.P(iIntValue2 & 1, (iIntValue2 & 19) != 18)) {
                    p65Var2.S();
                } else {
                    w2g.e(vn7.J(R.drawable.ic_book_author, 0, p65Var2), str2, jfc.l(o28Var, f), null, null, 0.0f, null, p65Var2, 8 | ((iIntValue2 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION), 120);
                }
                break;
        }
        return c1eVar;
    }
}
