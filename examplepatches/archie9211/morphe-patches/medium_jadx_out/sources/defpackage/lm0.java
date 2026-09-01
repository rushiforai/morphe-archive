package defpackage;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.Log;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lm0 implements Parcelable {
    public static final Parcelable.Creator<lm0> CREATOR = new xkf(7);
    public final int[] a;
    public final ArrayList b;
    public final int[] c;
    public final int[] d;
    public final int e;
    public final String f;
    public final int g;
    public final int h;
    public final CharSequence i;
    public final int j;
    public final CharSequence k;
    public final ArrayList l;
    public final ArrayList m;
    public final boolean n;

    public lm0(km0 km0Var) {
        int size = km0Var.a.size();
        this.a = new int[size * 6];
        if (!km0Var.g) {
            ygf.f("Not on back stack");
            throw null;
        }
        this.b = new ArrayList(size);
        this.c = new int[size];
        this.d = new int[size];
        int i = 0;
        for (int i2 = 0; i2 < size; i2++) {
            v25 v25Var = (v25) km0Var.a.get(i2);
            int i3 = i + 1;
            this.a[i] = v25Var.a;
            ArrayList arrayList = this.b;
            j15 j15Var = v25Var.b;
            arrayList.add(j15Var != null ? j15Var.e : null);
            int[] iArr = this.a;
            iArr[i3] = v25Var.c ? 1 : 0;
            iArr[i + 2] = v25Var.d;
            iArr[i + 3] = v25Var.e;
            int i4 = i + 5;
            iArr[i + 4] = v25Var.f;
            i += 6;
            iArr[i4] = v25Var.g;
            this.c[i2] = v25Var.h.ordinal();
            this.d[i2] = v25Var.i.ordinal();
        }
        this.e = km0Var.f;
        this.f = km0Var.i;
        this.g = km0Var.s;
        this.h = km0Var.j;
        this.i = km0Var.k;
        this.j = km0Var.l;
        this.k = km0Var.m;
        this.l = km0Var.n;
        this.m = km0Var.o;
        this.n = km0Var.p;
    }

    public final void a(km0 km0Var) {
        int i = 0;
        int i2 = 0;
        while (true) {
            int[] iArr = this.a;
            boolean z = true;
            if (i >= iArr.length) {
                km0Var.f = this.e;
                km0Var.i = this.f;
                km0Var.g = true;
                km0Var.j = this.h;
                km0Var.k = this.i;
                km0Var.l = this.j;
                km0Var.m = this.k;
                km0Var.n = this.l;
                km0Var.o = this.m;
                km0Var.p = this.n;
                return;
            }
            v25 v25Var = new v25();
            int i3 = i + 1;
            v25Var.a = iArr[i];
            if (f25.I(2)) {
                Log.v("FragmentManager", "Instantiate " + km0Var + " op #" + i2 + " base fragment #" + iArr[i3]);
            }
            v25Var.h = vx6.values()[this.c[i2]];
            v25Var.i = vx6.values()[this.d[i2]];
            int i4 = i + 2;
            if (iArr[i3] == 0) {
                z = false;
            }
            v25Var.c = z;
            int i5 = iArr[i4];
            v25Var.d = i5;
            int i6 = iArr[i + 3];
            v25Var.e = i6;
            int i7 = i + 5;
            int i8 = iArr[i + 4];
            v25Var.f = i8;
            i += 6;
            int i9 = iArr[i7];
            v25Var.g = i9;
            km0Var.b = i5;
            km0Var.c = i6;
            km0Var.d = i8;
            km0Var.e = i9;
            km0Var.b(v25Var);
            i2++;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i) {
        parcel.writeIntArray(this.a);
        parcel.writeStringList(this.b);
        parcel.writeIntArray(this.c);
        parcel.writeIntArray(this.d);
        parcel.writeInt(this.e);
        parcel.writeString(this.f);
        parcel.writeInt(this.g);
        parcel.writeInt(this.h);
        TextUtils.writeToParcel(this.i, parcel, 0);
        parcel.writeInt(this.j);
        TextUtils.writeToParcel(this.k, parcel, 0);
        parcel.writeStringList(this.l);
        parcel.writeStringList(this.m);
        parcel.writeInt(this.n ? 1 : 0);
    }

    public lm0(Parcel parcel) {
        this.a = parcel.createIntArray();
        this.b = parcel.createStringArrayList();
        this.c = parcel.createIntArray();
        this.d = parcel.createIntArray();
        this.e = parcel.readInt();
        this.f = parcel.readString();
        this.g = parcel.readInt();
        this.h = parcel.readInt();
        Parcelable.Creator creator = TextUtils.CHAR_SEQUENCE_CREATOR;
        this.i = (CharSequence) creator.createFromParcel(parcel);
        this.j = parcel.readInt();
        this.k = (CharSequence) creator.createFromParcel(parcel);
        this.l = parcel.createStringArrayList();
        this.m = parcel.createStringArrayList();
        this.n = parcel.readInt() != 0;
    }
}
