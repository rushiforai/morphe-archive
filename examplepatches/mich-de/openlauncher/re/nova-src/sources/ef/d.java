package ef;

import android.os.Parcel;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final long f52697a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f52698b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f52699c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f52700d;

    /* renamed from: e, reason: collision with root package name */
    public final long f52701e;

    /* renamed from: f, reason: collision with root package name */
    public final List f52702f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f52703g;

    /* renamed from: h, reason: collision with root package name */
    public final long f52704h;

    /* renamed from: i, reason: collision with root package name */
    public final int f52705i;

    /* renamed from: j, reason: collision with root package name */
    public final int f52706j;

    /* renamed from: k, reason: collision with root package name */
    public final int f52707k;

    public d(long j11, boolean z11, boolean z12, boolean z13, ArrayList arrayList, long j12, boolean z14, long j13, int i5, int i11, int i12) {
        this.f52697a = j11;
        this.f52698b = z11;
        this.f52699c = z12;
        this.f52700d = z13;
        this.f52702f = Collections.unmodifiableList(arrayList);
        this.f52701e = j12;
        this.f52703g = z14;
        this.f52704h = j13;
        this.f52705i = i5;
        this.f52706j = i11;
        this.f52707k = i12;
    }

    public d(Parcel parcel) {
        this.f52697a = parcel.readLong();
        this.f52698b = parcel.readByte() == 1;
        this.f52699c = parcel.readByte() == 1;
        this.f52700d = parcel.readByte() == 1;
        int i5 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i5);
        for (int i11 = 0; i11 < i5; i11++) {
            arrayList.add(new c(parcel.readInt(), parcel.readLong()));
        }
        this.f52702f = Collections.unmodifiableList(arrayList);
        this.f52701e = parcel.readLong();
        this.f52703g = parcel.readByte() == 1;
        this.f52704h = parcel.readLong();
        this.f52705i = parcel.readInt();
        this.f52706j = parcel.readInt();
        this.f52707k = parcel.readInt();
    }
}
