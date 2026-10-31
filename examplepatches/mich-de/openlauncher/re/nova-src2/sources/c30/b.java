package c30;

import android.graphics.Color;
import android.util.SparseIntArray;
import androidx.recyclerview.widget.c0;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.PriorityQueue;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: e, reason: collision with root package name */
    public static final c0 f19526e = new c0(4);

    /* renamed from: a, reason: collision with root package name */
    public final float[] f19527a = new float[3];

    /* renamed from: b, reason: collision with root package name */
    public final int[] f19528b;

    /* renamed from: c, reason: collision with root package name */
    public final SparseIntArray f19529c;

    /* renamed from: d, reason: collision with root package name */
    public final ArrayList f19530d;

    public b(c cVar) {
        a aVar;
        int i5;
        int i11 = cVar.f19532b;
        int[] iArr = (int[]) cVar.f19533c;
        int[] iArr2 = (int[]) cVar.f19534d;
        this.f19529c = new SparseIntArray(i11);
        for (int i12 = 0; i12 < iArr.length; i12++) {
            this.f19529c.append(iArr[i12], iArr2[i12]);
        }
        this.f19528b = new int[i11];
        float[] fArr = this.f19527a;
        int i13 = 0;
        int i14 = 0;
        int i15 = 0;
        for (int i16 : iArr) {
            r4.a.c(Color.red(i16), Color.green(i16), Color.blue(i16), fArr);
            if (Color.alpha(i16) > 16) {
                float f11 = fArr[2];
                if (f11 >= 0.95f) {
                    i14++;
                } else if (f11 <= 0.05f) {
                    i15++;
                } else {
                    this.f19528b[i13] = i16;
                    i13++;
                }
            }
        }
        if (i13 == 0) {
            if (i14 > i15) {
                i5 = i13 + 1;
                this.f19528b[i13] = -1;
            } else {
                i5 = i13 + 1;
                this.f19528b[i13] = -16777216;
            }
            i13 = i5;
        }
        if (i13 <= 16) {
            this.f19530d = new ArrayList();
            for (int i17 = 0; i17 < i13; i17++) {
                int i18 = this.f19528b[i17];
                this.f19530d.add(new e(i18, this.f19529c.get(i18)));
            }
            return;
        }
        int i19 = 1;
        PriorityQueue priorityQueue = new PriorityQueue(16, f19526e);
        priorityQueue.offer(new a(this, 0, i13 - 1));
        while (priorityQueue.size() < 16 && (aVar = (a) priorityQueue.poll()) != null) {
            int i21 = aVar.f19518b;
            int i22 = aVar.f19517a;
            if ((i21 - i22) + i19 <= i19) {
                break;
            }
            b bVar = aVar.f19525i;
            if ((i21 - i22) + i19 <= i19) {
                throw new IllegalStateException("Can not split a box with only 1 color");
            }
            int i23 = aVar.f19520d - aVar.f19519c;
            int i24 = aVar.f19522f - aVar.f19521e;
            int i25 = aVar.f19524h - aVar.f19523g;
            int i26 = i19;
            int i27 = (i23 < i24 || i23 < i25) ? (i24 < i23 || i24 < i25) ? -1 : -2 : -3;
            a(bVar, i27, i22, i21);
            int[] iArr3 = bVar.f19528b;
            Arrays.sort(iArr3, i22, aVar.f19518b + 1);
            a(bVar, i27, i22, aVar.f19518b);
            int i28 = i27 != -2 ? i27 != -1 ? (aVar.f19519c + aVar.f19520d) / 2 : (aVar.f19523g + aVar.f19524h) / 2 : (aVar.f19521e + aVar.f19522f) / 2;
            for (int i29 = i22; i29 <= aVar.f19518b; i29++) {
                int i31 = iArr3[i29];
                if (i27 == -3) {
                    if (Color.red(i31) >= i28) {
                        i22 = i29;
                        break;
                        break;
                    }
                } else if (i27 != -2) {
                    if (i27 == -1 && Color.blue(i31) > i28) {
                        i22 = i29;
                        break;
                    }
                } else {
                    if (Color.green(i31) >= i28) {
                        i22 = i29;
                        break;
                        break;
                    }
                }
            }
            a aVar2 = new a(bVar, i22 + 1, aVar.f19518b);
            aVar.f19518b = i22;
            aVar.a();
            priorityQueue.offer(aVar2);
            priorityQueue.offer(aVar);
            i19 = i26;
        }
        ArrayList arrayList = new ArrayList(priorityQueue.size());
        Iterator it = priorityQueue.iterator();
        while (it.hasNext()) {
            a aVar3 = (a) it.next();
            int iRed = 0;
            int i32 = 0;
            int iGreen = 0;
            int iBlue = 0;
            for (int i33 = aVar3.f19517a; i33 <= aVar3.f19518b; i33++) {
                b bVar2 = aVar3.f19525i;
                int i34 = bVar2.f19528b[i33];
                int i35 = bVar2.f19529c.get(i34);
                i32 += i35;
                iRed += Color.red(i34) * i35;
                iGreen += Color.green(i34) * i35;
                iBlue += Color.blue(i34) * i35;
            }
            float f12 = i32;
            e eVar = new e(Math.round(iRed / f12), Math.round(iGreen / f12), Math.round(iBlue / f12), i32);
            float f13 = eVar.a()[2];
            if (f13 < 0.95f && f13 > 0.05f) {
                arrayList.add(eVar);
            }
        }
        this.f19530d = arrayList;
    }

    public static void a(b bVar, int i5, int i11, int i12) {
        int[] iArr = bVar.f19528b;
        if (i5 == -2) {
            while (i11 <= i12) {
                int i13 = iArr[i11];
                iArr[i11] = Color.rgb((i13 >> 8) & 255, (i13 >> 16) & 255, i13 & 255);
                i11++;
            }
            return;
        }
        if (i5 != -1) {
            return;
        }
        while (i11 <= i12) {
            int i14 = iArr[i11];
            iArr[i11] = Color.rgb(i14 & 255, (i14 >> 8) & 255, (i14 >> 16) & 255);
            i11++;
        }
    }
}
