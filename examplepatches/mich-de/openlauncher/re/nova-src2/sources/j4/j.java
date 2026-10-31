package j4;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.util.SparseIntArray;

/* loaded from: classes2.dex */
public final class j {

    /* renamed from: j, reason: collision with root package name */
    public static final SparseIntArray f69016j;

    /* renamed from: a, reason: collision with root package name */
    public int f69017a;

    /* renamed from: b, reason: collision with root package name */
    public int f69018b;

    /* renamed from: c, reason: collision with root package name */
    public int f69019c;

    /* renamed from: d, reason: collision with root package name */
    public float f69020d;

    /* renamed from: e, reason: collision with root package name */
    public float f69021e;

    /* renamed from: f, reason: collision with root package name */
    public float f69022f;

    /* renamed from: g, reason: collision with root package name */
    public int f69023g;

    /* renamed from: h, reason: collision with root package name */
    public String f69024h;

    /* renamed from: i, reason: collision with root package name */
    public int f69025i;

    static {
        SparseIntArray sparseIntArray = new SparseIntArray();
        f69016j = sparseIntArray;
        sparseIntArray.append(3, 1);
        sparseIntArray.append(5, 2);
        sparseIntArray.append(9, 3);
        sparseIntArray.append(2, 4);
        sparseIntArray.append(1, 5);
        sparseIntArray.append(0, 6);
        sparseIntArray.append(4, 7);
        sparseIntArray.append(8, 8);
        sparseIntArray.append(7, 9);
        sparseIntArray.append(6, 10);
    }

    public final void a(Context context, AttributeSet attributeSet) {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, p.f69054f);
        int indexCount = typedArrayObtainStyledAttributes.getIndexCount();
        for (int i5 = 0; i5 < indexCount; i5++) {
            int index = typedArrayObtainStyledAttributes.getIndex(i5);
            switch (f69016j.get(index)) {
                case 1:
                    this.f69021e = typedArrayObtainStyledAttributes.getFloat(index, this.f69021e);
                    break;
                case 2:
                    this.f69019c = typedArrayObtainStyledAttributes.getInt(index, this.f69019c);
                    break;
                case 3:
                    if (typedArrayObtainStyledAttributes.peekValue(index).type == 3) {
                        typedArrayObtainStyledAttributes.getString(index);
                        break;
                    } else {
                        String str = f4.a.f54305a[typedArrayObtainStyledAttributes.getInteger(index, 0)];
                        break;
                    }
                case 4:
                    typedArrayObtainStyledAttributes.getInt(index, 0);
                    break;
                case 5:
                    this.f69017a = m.f(typedArrayObtainStyledAttributes, index, this.f69017a);
                    break;
                case 6:
                    this.f69018b = typedArrayObtainStyledAttributes.getInteger(index, this.f69018b);
                    break;
                case 7:
                    this.f69020d = typedArrayObtainStyledAttributes.getFloat(index, this.f69020d);
                    break;
                case 8:
                    this.f69023g = typedArrayObtainStyledAttributes.getInteger(index, this.f69023g);
                    break;
                case 9:
                    this.f69022f = typedArrayObtainStyledAttributes.getFloat(index, this.f69022f);
                    break;
                case 10:
                    int i11 = typedArrayObtainStyledAttributes.peekValue(index).type;
                    if (i11 == 1) {
                        this.f69025i = typedArrayObtainStyledAttributes.getResourceId(index, -1);
                        break;
                    } else if (i11 == 3) {
                        String string = typedArrayObtainStyledAttributes.getString(index);
                        this.f69024h = string;
                        if (string.indexOf("/") > 0) {
                            this.f69025i = typedArrayObtainStyledAttributes.getResourceId(index, -1);
                            break;
                        } else {
                            break;
                        }
                    } else {
                        typedArrayObtainStyledAttributes.getInteger(index, this.f69025i);
                        break;
                    }
            }
        }
        typedArrayObtainStyledAttributes.recycle();
    }
}
