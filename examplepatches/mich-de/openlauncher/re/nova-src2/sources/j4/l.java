package j4;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.SparseIntArray;

/* loaded from: classes2.dex */
public final class l {
    public static final SparseIntArray n;

    /* renamed from: a, reason: collision with root package name */
    public float f69030a;

    /* renamed from: b, reason: collision with root package name */
    public float f69031b;

    /* renamed from: c, reason: collision with root package name */
    public float f69032c;

    /* renamed from: d, reason: collision with root package name */
    public float f69033d;

    /* renamed from: e, reason: collision with root package name */
    public float f69034e;

    /* renamed from: f, reason: collision with root package name */
    public float f69035f;

    /* renamed from: g, reason: collision with root package name */
    public float f69036g;

    /* renamed from: h, reason: collision with root package name */
    public int f69037h;

    /* renamed from: i, reason: collision with root package name */
    public float f69038i;

    /* renamed from: j, reason: collision with root package name */
    public float f69039j;

    /* renamed from: k, reason: collision with root package name */
    public float f69040k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f69041l;

    /* renamed from: m, reason: collision with root package name */
    public float f69042m;

    static {
        SparseIntArray sparseIntArray = new SparseIntArray();
        n = sparseIntArray;
        sparseIntArray.append(6, 1);
        sparseIntArray.append(7, 2);
        sparseIntArray.append(8, 3);
        sparseIntArray.append(4, 4);
        sparseIntArray.append(5, 5);
        sparseIntArray.append(0, 6);
        sparseIntArray.append(1, 7);
        sparseIntArray.append(2, 8);
        sparseIntArray.append(3, 9);
        sparseIntArray.append(9, 10);
        sparseIntArray.append(10, 11);
        sparseIntArray.append(11, 12);
    }

    public final void a(Context context, AttributeSet attributeSet) {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, p.f69057i);
        int indexCount = typedArrayObtainStyledAttributes.getIndexCount();
        for (int i5 = 0; i5 < indexCount; i5++) {
            int index = typedArrayObtainStyledAttributes.getIndex(i5);
            switch (n.get(index)) {
                case 1:
                    this.f69030a = typedArrayObtainStyledAttributes.getFloat(index, this.f69030a);
                    break;
                case 2:
                    this.f69031b = typedArrayObtainStyledAttributes.getFloat(index, this.f69031b);
                    break;
                case 3:
                    this.f69032c = typedArrayObtainStyledAttributes.getFloat(index, this.f69032c);
                    break;
                case 4:
                    this.f69033d = typedArrayObtainStyledAttributes.getFloat(index, this.f69033d);
                    break;
                case 5:
                    this.f69034e = typedArrayObtainStyledAttributes.getFloat(index, this.f69034e);
                    break;
                case 6:
                    this.f69035f = typedArrayObtainStyledAttributes.getDimension(index, this.f69035f);
                    break;
                case 7:
                    this.f69036g = typedArrayObtainStyledAttributes.getDimension(index, this.f69036g);
                    break;
                case 8:
                    this.f69038i = typedArrayObtainStyledAttributes.getDimension(index, this.f69038i);
                    break;
                case 9:
                    this.f69039j = typedArrayObtainStyledAttributes.getDimension(index, this.f69039j);
                    break;
                case 10:
                    this.f69040k = typedArrayObtainStyledAttributes.getDimension(index, this.f69040k);
                    break;
                case 11:
                    this.f69041l = true;
                    this.f69042m = typedArrayObtainStyledAttributes.getDimension(index, this.f69042m);
                    break;
                case 12:
                    this.f69037h = m.f(typedArrayObtainStyledAttributes, index, this.f69037h);
                    break;
            }
        }
        typedArrayObtainStyledAttributes.recycle();
    }
}
