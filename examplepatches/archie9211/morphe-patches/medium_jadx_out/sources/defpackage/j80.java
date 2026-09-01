package defpackage;

import android.widget.LinearLayout;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class j80 implements mzb {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ j80(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.mzb
    public final Iterator iterator() {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                return new h1((Object[]) obj);
            case 1:
                return ((Iterable) obj).iterator();
            case 2:
                return vn7.F((b55) obj);
            case 3:
                return (Iterator) obj;
            case 4:
                return new tzb(0, obj);
            case 5:
                return new xz6((CharSequence) obj);
            default:
                return new h1(7, (LinearLayout) obj);
        }
    }
}
