package com.google.android.exoplayer2.metadata.scte35;

import android.os.Parcel;
import android.os.Parcelable;
import di.b;
import ef.c;
import ef.d;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class SpliceScheduleCommand extends SpliceCommand {
    public static final Parcelable.Creator<SpliceScheduleCommand> CREATOR = new b(21);

    /* renamed from: a, reason: collision with root package name */
    public final List f31575a;

    public SpliceScheduleCommand(Parcel parcel) {
        int i5 = parcel.readInt();
        ArrayList arrayList = new ArrayList(i5);
        for (int i11 = 0; i11 < i5; i11++) {
            arrayList.add(new d(parcel));
        }
        this.f31575a = Collections.unmodifiableList(arrayList);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        List list = this.f31575a;
        int size = list.size();
        parcel.writeInt(size);
        for (int i11 = 0; i11 < size; i11++) {
            d dVar = (d) list.get(i11);
            parcel.writeLong(dVar.f52697a);
            parcel.writeByte(dVar.f52698b ? (byte) 1 : (byte) 0);
            parcel.writeByte(dVar.f52699c ? (byte) 1 : (byte) 0);
            parcel.writeByte(dVar.f52700d ? (byte) 1 : (byte) 0);
            List list2 = dVar.f52702f;
            int size2 = list2.size();
            parcel.writeInt(size2);
            for (int i12 = 0; i12 < size2; i12++) {
                c cVar = (c) list2.get(i12);
                parcel.writeInt(cVar.f52695a);
                parcel.writeLong(cVar.f52696b);
            }
            parcel.writeLong(dVar.f52701e);
            parcel.writeByte(dVar.f52703g ? (byte) 1 : (byte) 0);
            parcel.writeLong(dVar.f52704h);
            parcel.writeInt(dVar.f52705i);
            parcel.writeInt(dVar.f52706j);
            parcel.writeInt(dVar.f52707k);
        }
    }

    public SpliceScheduleCommand(ArrayList arrayList) {
        this.f31575a = Collections.unmodifiableList(arrayList);
    }
}
