package androidx.fragment.app;

import android.annotation.SuppressLint;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Objects;

@SuppressLint({"BanParcelableUsage"})
/* loaded from: classes2.dex */
final class BackStackRecordState implements Parcelable {
    public static final Parcelable.Creator<BackStackRecordState> CREATOR = new b(0);

    /* renamed from: a, reason: collision with root package name */
    public final int[] f14436a;

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f14437b;

    /* renamed from: c, reason: collision with root package name */
    public final int[] f14438c;

    /* renamed from: d, reason: collision with root package name */
    public final int[] f14439d;

    /* renamed from: e, reason: collision with root package name */
    public final int f14440e;

    /* renamed from: f, reason: collision with root package name */
    public final String f14441f;

    /* renamed from: g, reason: collision with root package name */
    public final int f14442g;

    /* renamed from: h, reason: collision with root package name */
    public final int f14443h;

    /* renamed from: i, reason: collision with root package name */
    public final CharSequence f14444i;

    /* renamed from: j, reason: collision with root package name */
    public final int f14445j;

    /* renamed from: k, reason: collision with root package name */
    public final CharSequence f14446k;

    /* renamed from: l, reason: collision with root package name */
    public final ArrayList f14447l;

    /* renamed from: m, reason: collision with root package name */
    public final ArrayList f14448m;
    public final boolean n;

    public BackStackRecordState(a aVar) {
        int size = aVar.f14661c.size();
        this.f14436a = new int[size * 6];
        if (!aVar.f14667i) {
            throw new IllegalStateException("Not on back stack");
        }
        this.f14437b = new ArrayList(size);
        this.f14438c = new int[size];
        this.f14439d = new int[size];
        int i5 = 0;
        for (int i11 = 0; i11 < size; i11++) {
            p1 p1Var = (p1) aVar.f14661c.get(i11);
            int i12 = i5 + 1;
            this.f14436a[i5] = p1Var.f14649a;
            ArrayList arrayList = this.f14437b;
            h0 h0Var = p1Var.f14650b;
            arrayList.add(h0Var != null ? h0Var.mWho : null);
            int[] iArr = this.f14436a;
            iArr[i12] = p1Var.f14651c ? 1 : 0;
            iArr[i5 + 2] = p1Var.f14652d;
            iArr[i5 + 3] = p1Var.f14653e;
            int i13 = i5 + 5;
            iArr[i5 + 4] = p1Var.f14654f;
            i5 += 6;
            iArr[i13] = p1Var.f14655g;
            this.f14438c[i11] = p1Var.f14656h.ordinal();
            this.f14439d[i11] = p1Var.f14657i.ordinal();
        }
        this.f14440e = aVar.f14666h;
        this.f14441f = aVar.f14669k;
        this.f14442g = aVar.f14489v;
        this.f14443h = aVar.f14670l;
        this.f14444i = aVar.f14671m;
        this.f14445j = aVar.n;
        this.f14446k = aVar.o;
        this.f14447l = aVar.f14672p;
        this.f14448m = aVar.f14673q;
        this.n = aVar.f14674r;
    }

    public final a a(h1 h1Var) {
        a aVar = new a(h1Var);
        int i5 = 0;
        int i11 = 0;
        int i12 = 0;
        while (true) {
            int[] iArr = this.f14436a;
            boolean z11 = true;
            if (i11 >= iArr.length) {
                break;
            }
            p1 p1Var = new p1();
            int i13 = i11 + 1;
            p1Var.f14649a = iArr[i11];
            if (h1.K(2)) {
                Objects.toString(aVar);
                int i14 = iArr[i13];
            }
            p1Var.f14656h = h6.t.values()[this.f14438c[i12]];
            p1Var.f14657i = h6.t.values()[this.f14439d[i12]];
            int i15 = i11 + 2;
            if (iArr[i13] == 0) {
                z11 = false;
            }
            p1Var.f14651c = z11;
            int i16 = iArr[i15];
            p1Var.f14652d = i16;
            int i17 = iArr[i11 + 3];
            p1Var.f14653e = i17;
            int i18 = i11 + 5;
            int i19 = iArr[i11 + 4];
            p1Var.f14654f = i19;
            i11 += 6;
            int i21 = iArr[i18];
            p1Var.f14655g = i21;
            aVar.f14662d = i16;
            aVar.f14663e = i17;
            aVar.f14664f = i19;
            aVar.f14665g = i21;
            aVar.c(p1Var);
            i12++;
        }
        aVar.f14666h = this.f14440e;
        aVar.f14669k = this.f14441f;
        aVar.f14667i = true;
        aVar.f14670l = this.f14443h;
        aVar.f14671m = this.f14444i;
        aVar.n = this.f14445j;
        aVar.o = this.f14446k;
        aVar.f14672p = this.f14447l;
        aVar.f14673q = this.f14448m;
        aVar.f14674r = this.n;
        aVar.f14489v = this.f14442g;
        while (true) {
            ArrayList arrayList = this.f14437b;
            if (i5 >= arrayList.size()) {
                aVar.i(1);
                return aVar;
            }
            String str = (String) arrayList.get(i5);
            if (str != null) {
                ((p1) aVar.f14661c.get(i5)).f14650b = h1Var.f14571c.b(str);
            }
            i5++;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeIntArray(this.f14436a);
        parcel.writeStringList(this.f14437b);
        parcel.writeIntArray(this.f14438c);
        parcel.writeIntArray(this.f14439d);
        parcel.writeInt(this.f14440e);
        parcel.writeString(this.f14441f);
        parcel.writeInt(this.f14442g);
        parcel.writeInt(this.f14443h);
        TextUtils.writeToParcel(this.f14444i, parcel, 0);
        parcel.writeInt(this.f14445j);
        TextUtils.writeToParcel(this.f14446k, parcel, 0);
        parcel.writeStringList(this.f14447l);
        parcel.writeStringList(this.f14448m);
        parcel.writeInt(this.n ? 1 : 0);
    }

    public BackStackRecordState(Parcel parcel) {
        this.f14436a = parcel.createIntArray();
        this.f14437b = parcel.createStringArrayList();
        this.f14438c = parcel.createIntArray();
        this.f14439d = parcel.createIntArray();
        this.f14440e = parcel.readInt();
        this.f14441f = parcel.readString();
        this.f14442g = parcel.readInt();
        this.f14443h = parcel.readInt();
        Parcelable.Creator creator = TextUtils.CHAR_SEQUENCE_CREATOR;
        this.f14444i = (CharSequence) creator.createFromParcel(parcel);
        this.f14445j = parcel.readInt();
        this.f14446k = (CharSequence) creator.createFromParcel(parcel);
        this.f14447l = parcel.createStringArrayList();
        this.f14448m = parcel.createStringArrayList();
        this.n = parcel.readInt() != 0;
    }
}
