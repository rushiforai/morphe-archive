package o9;

import android.graphics.Rect;
import android.view.View;
import com.android.launcher3.CellLayout;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

/* loaded from: classes2.dex */
public final class y {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f80250a;

    /* renamed from: b, reason: collision with root package name */
    public final u f80251b;

    /* renamed from: c, reason: collision with root package name */
    public final Rect f80252c = new Rect();

    /* renamed from: d, reason: collision with root package name */
    public final int[] f80253d;

    /* renamed from: e, reason: collision with root package name */
    public final int[] f80254e;

    /* renamed from: f, reason: collision with root package name */
    public final int[] f80255f;

    /* renamed from: g, reason: collision with root package name */
    public final int[] f80256g;

    /* renamed from: h, reason: collision with root package name */
    public int f80257h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f80258i;

    /* renamed from: j, reason: collision with root package name */
    public final x f80259j;

    /* renamed from: k, reason: collision with root package name */
    public final /* synthetic */ CellLayout f80260k;

    public y(CellLayout cellLayout, ArrayList arrayList, u uVar) {
        this.f80260k = cellLayout;
        int i5 = cellLayout.f20904h;
        this.f80253d = new int[i5];
        this.f80254e = new int[i5];
        int i11 = cellLayout.f20903g;
        this.f80255f = new int[i11];
        this.f80256g = new int[i11];
        this.f80259j = new x(this);
        this.f80250a = (ArrayList) arrayList.clone();
        this.f80251b = uVar;
        d();
    }

    public final void a(View view) {
        this.f80250a.add(view);
        d();
    }

    public final Rect b() {
        boolean z11 = this.f80258i;
        Rect rect = this.f80252c;
        if (z11) {
            this.f80251b.c(this.f80250a, rect);
        }
        return rect;
    }

    public final boolean c(int i5, View view) {
        boolean z11;
        int i11;
        u uVar = this.f80251b;
        ya.a aVar = (ya.a) uVar.f80141e.get(view);
        int i12 = this.f80257h & i5;
        int[] iArr = this.f80253d;
        int[] iArr2 = this.f80255f;
        int[] iArr3 = this.f80254e;
        int[] iArr4 = this.f80256g;
        int i13 = 4;
        int i14 = 2;
        int i15 = 1;
        if (i12 == i5) {
            ArrayList arrayList = this.f80250a;
            int size = arrayList.size();
            int i16 = 0;
            while (i16 < size) {
                ya.a aVar2 = (ya.a) uVar.f80141e.get(arrayList.get(i16));
                if (i5 == i15) {
                    int i17 = aVar2.f97095a;
                    for (int i18 = aVar2.f97096b; i18 < aVar2.f97096b + aVar2.f97098d; i18++) {
                        int i19 = iArr[i18];
                        if (i17 < i19 || i19 < 0) {
                            iArr[i18] = i17;
                        }
                    }
                } else if (i5 == i14) {
                    int i21 = aVar2.f97096b;
                    for (int i22 = aVar2.f97095a; i22 < aVar2.f97095a + aVar2.f97097c; i22++) {
                        int i23 = iArr2[i22];
                        if (i21 < i23 || i23 < 0) {
                            iArr2[i22] = i21;
                        }
                    }
                } else if (i5 == i13) {
                    int i24 = aVar2.f97095a + aVar2.f97097c;
                    for (int i25 = aVar2.f97096b; i25 < aVar2.f97096b + aVar2.f97098d; i25++) {
                        if (i24 > iArr3[i25]) {
                            iArr3[i25] = i24;
                        }
                    }
                } else if (i5 == 8) {
                    int i26 = aVar2.f97096b + aVar2.f97098d;
                    for (int i27 = aVar2.f97095a; i27 < aVar2.f97095a + aVar2.f97097c; i27++) {
                        if (i26 > iArr4[i27]) {
                            iArr4[i27] = i26;
                        }
                    }
                }
                i16++;
                i13 = 4;
                i14 = 2;
                i15 = 1;
            }
            z11 = false;
            this.f80257h &= ~i5;
            i11 = 1;
        } else {
            z11 = false;
            i11 = 1;
        }
        if (i5 == i11) {
            for (int i28 = aVar.f97096b; i28 < aVar.f97096b + aVar.f97098d; i28++) {
                if (iArr[i28] == aVar.f97095a + aVar.f97097c) {
                    return true;
                }
            }
        } else if (i5 == 2) {
            for (int i29 = aVar.f97095a; i29 < aVar.f97095a + aVar.f97097c; i29++) {
                if (iArr2[i29] == aVar.f97096b + aVar.f97098d) {
                    return true;
                }
            }
        } else if (i5 == 4) {
            for (int i31 = aVar.f97096b; i31 < aVar.f97096b + aVar.f97098d; i31++) {
                if (iArr3[i31] == aVar.f97095a) {
                    return true;
                }
            }
        } else if (i5 == 8) {
            for (int i32 = aVar.f97095a; i32 < aVar.f97095a + aVar.f97097c; i32++) {
                if (iArr4[i32] == aVar.f97096b) {
                    return true;
                }
            }
        }
        return z11;
    }

    public final void d() {
        CellLayout cellLayout;
        int i5 = 0;
        while (true) {
            cellLayout = this.f80260k;
            if (i5 >= cellLayout.f20903g) {
                break;
            }
            this.f80255f[i5] = -1;
            this.f80256g[i5] = -1;
            i5++;
        }
        for (int i11 = 0; i11 < cellLayout.f20904h; i11++) {
            this.f80253d[i11] = -1;
            this.f80254e[i11] = -1;
        }
        this.f80257h = 15;
        this.f80258i = true;
    }

    public final void e(int i5) {
        Iterator it = this.f80250a.iterator();
        while (it.hasNext()) {
            ya.a aVar = (ya.a) this.f80251b.f80141e.get((View) it.next());
            if (i5 == 1) {
                aVar.f97095a--;
            } else if (i5 == 2) {
                aVar.f97096b--;
            } else if (i5 != 4) {
                aVar.f97096b++;
            } else {
                aVar.f97095a++;
            }
        }
        d();
    }

    public final void f(int i5) {
        x xVar = this.f80259j;
        xVar.f80227a = i5;
        Collections.sort(this.f80251b.f80143g, xVar);
    }
}
