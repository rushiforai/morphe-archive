package o9;

import android.view.View;
import java.util.Comparator;

/* loaded from: classes2.dex */
public final class x implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public int f80227a = 0;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ y f80228b;

    public x(y yVar) {
        this.f80228b = yVar;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        int i5;
        int i11;
        int i12;
        int i13;
        int i14;
        y yVar = this.f80228b;
        ya.a aVar = (ya.a) yVar.f80251b.f80141e.get((View) obj);
        ya.a aVar2 = (ya.a) yVar.f80251b.f80141e.get((View) obj2);
        int i15 = this.f80227a;
        if (i15 == 1) {
            i5 = aVar2.f97095a + aVar2.f97097c;
            i11 = aVar.f97095a;
            i12 = aVar.f97097c;
        } else {
            if (i15 != 2) {
                if (i15 != 4) {
                    i13 = aVar.f97096b;
                    i14 = aVar2.f97096b;
                } else {
                    i13 = aVar.f97095a;
                    i14 = aVar2.f97095a;
                }
                return i13 - i14;
            }
            i5 = aVar2.f97096b + aVar2.f97098d;
            i11 = aVar.f97096b;
            i12 = aVar.f97098d;
        }
        return i5 - (i11 + i12);
    }
}
