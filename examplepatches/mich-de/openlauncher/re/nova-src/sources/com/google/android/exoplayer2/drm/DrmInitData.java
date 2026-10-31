package com.google.android.exoplayer2.drm;

import android.os.Parcel;
import android.os.Parcelable;
import b.c0;
import fe.f;
import gi.g;
import java.util.Arrays;
import java.util.Comparator;
import java.util.UUID;
import wf.v;

/* loaded from: classes3.dex */
public final class DrmInitData implements Comparator<SchemeData>, Parcelable {
    public static final Parcelable.Creator<DrmInitData> CREATOR = new g(29);

    /* renamed from: a, reason: collision with root package name */
    public final SchemeData[] f31452a;

    /* renamed from: b, reason: collision with root package name */
    public int f31453b;

    /* renamed from: c, reason: collision with root package name */
    public final String f31454c;

    /* renamed from: d, reason: collision with root package name */
    public final int f31455d;

    public DrmInitData(String str, boolean z11, SchemeData... schemeDataArr) {
        this.f31454c = str;
        schemeDataArr = z11 ? (SchemeData[]) schemeDataArr.clone() : schemeDataArr;
        this.f31452a = schemeDataArr;
        this.f31455d = schemeDataArr.length;
        Arrays.sort(schemeDataArr, this);
    }

    public final DrmInitData a(String str) {
        return v.a(this.f31454c, str) ? this : new DrmInitData(str, false, this.f31452a);
    }

    @Override // java.util.Comparator
    public final int compare(SchemeData schemeData, SchemeData schemeData2) {
        SchemeData schemeData3 = schemeData;
        SchemeData schemeData4 = schemeData2;
        UUID uuid = f.f54753a;
        return uuid.equals(schemeData3.f31457b) ? uuid.equals(schemeData4.f31457b) ? 0 : 1 : schemeData3.f31457b.compareTo(schemeData4.f31457b);
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // java.util.Comparator
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && DrmInitData.class == obj.getClass()) {
            DrmInitData drmInitData = (DrmInitData) obj;
            if (v.a(this.f31454c, drmInitData.f31454c) && Arrays.equals(this.f31452a, drmInitData.f31452a)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        if (this.f31453b == 0) {
            String str = this.f31454c;
            this.f31453b = ((str == null ? 0 : str.hashCode()) * 31) + Arrays.hashCode(this.f31452a);
        }
        return this.f31453b;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.f31454c);
        parcel.writeTypedArray(this.f31452a, 0);
    }

    public static final class SchemeData implements Parcelable {
        public static final Parcelable.Creator<SchemeData> CREATOR = new b();

        /* renamed from: a, reason: collision with root package name */
        public int f31456a;

        /* renamed from: b, reason: collision with root package name */
        public final UUID f31457b;

        /* renamed from: c, reason: collision with root package name */
        public final String f31458c;

        /* renamed from: d, reason: collision with root package name */
        public final String f31459d;

        /* renamed from: e, reason: collision with root package name */
        public final byte[] f31460e;

        public SchemeData(UUID uuid, String str, String str2, byte[] bArr) {
            uuid.getClass();
            this.f31457b = uuid;
            this.f31458c = str;
            str2.getClass();
            this.f31459d = str2;
            this.f31460e = bArr;
        }

        @Override // android.os.Parcelable
        public final int describeContents() {
            return 0;
        }

        public final boolean equals(Object obj) {
            if (!(obj instanceof SchemeData)) {
                return false;
            }
            if (obj == this) {
                return true;
            }
            SchemeData schemeData = (SchemeData) obj;
            return v.a(this.f31458c, schemeData.f31458c) && v.a(this.f31459d, schemeData.f31459d) && v.a(this.f31457b, schemeData.f31457b) && Arrays.equals(this.f31460e, schemeData.f31460e);
        }

        public final int hashCode() {
            if (this.f31456a == 0) {
                int iHashCode = this.f31457b.hashCode() * 31;
                String str = this.f31458c;
                this.f31456a = Arrays.hashCode(this.f31460e) + c0.e((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.f31459d);
            }
            return this.f31456a;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            UUID uuid = this.f31457b;
            parcel.writeLong(uuid.getMostSignificantBits());
            parcel.writeLong(uuid.getLeastSignificantBits());
            parcel.writeString(this.f31458c);
            parcel.writeString(this.f31459d);
            parcel.writeByteArray(this.f31460e);
        }

        public SchemeData(Parcel parcel) {
            this.f31457b = new UUID(parcel.readLong(), parcel.readLong());
            this.f31458c = parcel.readString();
            String string = parcel.readString();
            int i5 = v.f94376a;
            this.f31459d = string;
            this.f31460e = parcel.createByteArray();
        }
    }

    public DrmInitData(Parcel parcel) {
        this.f31454c = parcel.readString();
        SchemeData[] schemeDataArr = (SchemeData[]) parcel.createTypedArray(SchemeData.CREATOR);
        int i5 = v.f94376a;
        this.f31452a = schemeDataArr;
        this.f31455d = schemeDataArr.length;
    }
}
