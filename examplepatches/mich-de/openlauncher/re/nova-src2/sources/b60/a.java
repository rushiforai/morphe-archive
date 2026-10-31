package b60;

import androidx.recyclerview.widget.u1;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes4.dex */
public final class a extends d {

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f17578f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ a(int i5, int i11) {
        super(i5);
        this.f17578f = i11;
    }

    @Override // b60.d
    public Object a(Object obj) {
        switch (this.f17578f) {
            case 1:
                p50.c cVar = (p50.c) obj;
                ArrayList arrayList = cVar.f82094a;
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    p50.e.f82099a.W((int[]) it.next());
                }
                arrayList.clear();
                return cVar;
            case 2:
                int[] iArr = (int[]) obj;
                u90.b.C(-1, 0, 6, iArr);
                return iArr;
            default:
                return obj;
        }
    }

    @Override // b60.d
    public final Object b() {
        switch (this.f17578f) {
            case 0:
                return new byte[u1.FLAG_APPEARED_IN_PRE_LAYOUT];
            case 1:
                p50.c cVar = new p50.c();
                cVar.f82094a = new ArrayList();
                return cVar;
            case 2:
                int[] iArr = new int[768];
                for (int i5 = 0; i5 < 768; i5++) {
                    iArr[i5] = -1;
                }
                return iArr;
            default:
                return new char[2048];
        }
    }
}
