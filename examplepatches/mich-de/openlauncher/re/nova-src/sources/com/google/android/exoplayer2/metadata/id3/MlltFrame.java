package com.google.android.exoplayer2.metadata.id3;

import android.os.Parcel;
import android.os.Parcelable;
import cf.a;
import java.util.Arrays;
import wf.v;

/* loaded from: classes3.dex */
public final class MlltFrame extends Id3Frame {
    public static final Parcelable.Creator<MlltFrame> CREATOR = new a(6);

    /* renamed from: b, reason: collision with root package name */
    public final int f31533b;

    /* renamed from: c, reason: collision with root package name */
    public final int f31534c;

    /* renamed from: d, reason: collision with root package name */
    public final int f31535d;

    /* renamed from: e, reason: collision with root package name */
    public final int[] f31536e;

    /* renamed from: f, reason: collision with root package name */
    public final int[] f31537f;

    public MlltFrame(int i5, int i11, int[] iArr, int[] iArr2, int i12) {
        super("MLLT");
        this.f31533b = i5;
        this.f31534c = i11;
        this.f31535d = i12;
        this.f31536e = iArr;
        this.f31537f = iArr2;
    }

    @Override // com.google.android.exoplayer2.metadata.id3.Id3Frame, android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && MlltFrame.class == obj.getClass()) {
            MlltFrame mlltFrame = (MlltFrame) obj;
            if (this.f31533b == mlltFrame.f31533b && this.f31534c == mlltFrame.f31534c && this.f31535d == mlltFrame.f31535d && Arrays.equals(this.f31536e, mlltFrame.f31536e) && Arrays.equals(this.f31537f, mlltFrame.f31537f)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(this.f31537f) + ((Arrays.hashCode(this.f31536e) + ((((((527 + this.f31533b) * 31) + this.f31534c) * 31) + this.f31535d) * 31)) * 31);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeInt(this.f31533b);
        parcel.writeInt(this.f31534c);
        parcel.writeInt(this.f31535d);
        parcel.writeIntArray(this.f31536e);
        parcel.writeIntArray(this.f31537f);
    }

    public MlltFrame(Parcel parcel) {
        super("MLLT");
        this.f31533b = parcel.readInt();
        this.f31534c = parcel.readInt();
        this.f31535d = parcel.readInt();
        int[] iArrCreateIntArray = parcel.createIntArray();
        int i5 = v.f94376a;
        this.f31536e = iArrCreateIntArray;
        this.f31537f = parcel.createIntArray();
    }
}
