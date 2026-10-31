package com.google.android.exoplayer2.metadata.scte35;

import android.os.Parcel;
import android.os.Parcelable;
import di.b;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class SpliceInsertCommand extends SpliceCommand {
    public static final Parcelable.Creator<SpliceInsertCommand> CREATOR = new b(19);

    /* renamed from: a, reason: collision with root package name */
    public final long f31562a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f31563b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f31564c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f31565d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f31566e;

    /* renamed from: f, reason: collision with root package name */
    public final long f31567f;

    /* renamed from: g, reason: collision with root package name */
    public final long f31568g;

    /* renamed from: h, reason: collision with root package name */
    public final List f31569h;

    /* renamed from: i, reason: collision with root package name */
    public final boolean f31570i;

    /* renamed from: j, reason: collision with root package name */
    public final long f31571j;

    /* renamed from: k, reason: collision with root package name */
    public final int f31572k;

    /* renamed from: l, reason: collision with root package name */
    public final int f31573l;

    /* renamed from: m, reason: collision with root package name */
    public final int f31574m;

    public SpliceInsertCommand(long j11, boolean z11, boolean z12, boolean z13, boolean z14, long j12, long j13, List list, boolean z15, long j14, int i5, int i11, int i12) {
        this.f31562a = j11;
        this.f31563b = z11;
        this.f31564c = z12;
        this.f31565d = z13;
        this.f31566e = z14;
        this.f31567f = j12;
        this.f31568g = j13;
        this.f31569h = Collections.unmodifiableList(list);
        this.f31570i = z15;
        this.f31571j = j14;
        this.f31572k = i5;
        this.f31573l = i11;
        this.f31574m = i12;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeLong(this.f31562a);
        parcel.writeByte(this.f31563b ? (byte) 1 : (byte) 0);
        parcel.writeByte(this.f31564c ? (byte) 1 : (byte) 0);
        parcel.writeByte(this.f31565d ? (byte) 1 : (byte) 0);
        parcel.writeByte(this.f31566e ? (byte) 1 : (byte) 0);
        parcel.writeLong(this.f31567f);
        parcel.writeLong(this.f31568g);
        List list = this.f31569h;
        int size = list.size();
        parcel.writeInt(size);
        for (int i11 = 0; i11 < size; i11++) {
            ef.b bVar = (ef.b) list.get(i11);
            parcel.writeInt(bVar.f52692a);
            parcel.writeLong(bVar.f52693b);
            parcel.writeLong(bVar.f52694c);
        }
        parcel.writeByte(this.f31570i ? (byte) 1 : (byte) 0);
        parcel.writeLong(this.f31571j);
        parcel.writeInt(this.f31572k);
        parcel.writeInt(this.f31573l);
        parcel.writeInt(this.f31574m);
    }

    public SpliceInsertCommand(Parcel parcel) {
        this.f31562a = parcel.readLong();
        this.f31563b = parcel.readByte() == 1;
        this.f31564c = parcel.readByte() == 1;
        this.f31565d = parcel.readByte() == 1;
        this.f31566e = parcel.readByte() == 1;
        this.f31567f = parcel.readLong();
        this.f31568g = parcel.readLong();
        int i5 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i5);
        for (int i11 = 0; i11 < i5; i11++) {
            arrayList.add(new ef.b(parcel.readInt(), parcel.readLong(), parcel.readLong()));
        }
        this.f31569h = Collections.unmodifiableList(arrayList);
        this.f31570i = parcel.readByte() == 1;
        this.f31571j = parcel.readLong();
        this.f31572k = parcel.readInt();
        this.f31573l = parcel.readInt();
        this.f31574m = parcel.readInt();
    }
}
