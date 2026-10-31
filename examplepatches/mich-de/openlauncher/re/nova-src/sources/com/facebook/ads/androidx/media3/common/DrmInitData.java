package com.facebook.ads.androidx.media3.common;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.redexgen.X.AbstractC1062Ln;
import com.facebook.ads.redexgen.X.KN;
import com.facebook.ads.redexgen.X.KT;
import com.facebook.ads.redexgen.X.KU;
import com.facebook.ads.redexgen.X.N1;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

/* loaded from: assets/audience_network/classes.dex */
public final class DrmInitData implements Comparator<SchemeData>, Parcelable {
    public static final Parcelable.Creator<DrmInitData> CREATOR = new KT();
    public int A00;
    public final int A01;
    public final String A02;

    @MetaExoPlayerCustomization
    public final SchemeData[] A03;

    public static final class SchemeData implements Parcelable {
        public static String[] A05 = {"oAeTEtAlyOup82kPMjCYy1oN1eNrefs", "QGGjAQe4Z8olu0cK5dOrsz8HTXnFZt8z", "u7yWEKrQ4besBW1akJBVvOd3m0RM11Y2", "mody2ULE", "jJZkWtj0BLVOZjPweF7bXhvdfUcsBGoO", "RBKqD8N9vp5NXHJGFGOpqbqufiZtAmHe", "57g0LXZV4yahChJV2Cc4Y1iuA02OcqCN", "qSKdrSyp7RZs"};
        public static final Parcelable.Creator<SchemeData> CREATOR = new KU();
        public int A00;
        public final String A01;
        public final String A02;
        public final UUID A03;
        public final byte[] A04;

        public SchemeData(Parcel parcel) {
            this.A03 = new UUID(parcel.readLong(), parcel.readLong());
            this.A01 = parcel.readString();
            this.A02 = (String) N1.A0f(parcel.readString());
            this.A04 = parcel.createByteArray();
        }

        public SchemeData(UUID uuid, String str, String str2, byte[] bArr) {
            this.A03 = (UUID) AbstractC1062Ln.A01(uuid);
            this.A01 = str;
            this.A02 = (String) AbstractC1062Ln.A01(str2);
            this.A04 = bArr;
        }

        public SchemeData(UUID uuid, String str, byte[] bArr) {
            this(uuid, null, str, bArr);
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
            if (!N1.A1E(this.A01, schemeData.A01)) {
                return false;
            }
            boolean zA1E = N1.A1E(this.A02, schemeData.A02);
            if (A05[5].charAt(14) == 'J') {
                String[] strArr = A05;
                strArr[2] = "nwzcIeoHX5G1x91stdhKFsj670J8g56s";
                strArr[6] = "bs6fqAatAEid7ZT4S3XpFwQ770ggyBjp";
                if (!zA1E || !N1.A1E(this.A03, schemeData.A03)) {
                    return false;
                }
                byte[] bArr = this.A04;
                if (A05[1].charAt(13) == '0') {
                    A05[5] = "kP6BuVeT4sNageJ64kijP1V3zOkf5MC7";
                    return Arrays.equals(bArr, schemeData.A04);
                }
            }
            throw new RuntimeException();
        }

        public final int hashCode() {
            if (this.A00 == 0) {
                int result = this.A03.hashCode();
                int i5 = result * 31;
                int result2 = this.A01 == null ? 0 : this.A01.hashCode();
                int result3 = (((i5 + result2) * 31) + this.A02.hashCode()) * 31;
                int result4 = Arrays.hashCode(this.A04);
                this.A00 = result3 + result4;
            }
            return this.A00;
        }

        @Override // android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            parcel.writeLong(this.A03.getMostSignificantBits());
            parcel.writeLong(this.A03.getLeastSignificantBits());
            parcel.writeString(this.A01);
            parcel.writeString(this.A02);
            parcel.writeByteArray(this.A04);
        }
    }

    public DrmInitData(Parcel parcel) {
        this.A02 = parcel.readString();
        this.A03 = (SchemeData[]) N1.A0f((SchemeData[]) parcel.createTypedArray(SchemeData.CREATOR));
        this.A01 = this.A03.length;
    }

    public DrmInitData(String str, boolean z11, SchemeData... schemeDataArr) {
        this.A02 = str;
        schemeDataArr = z11 ? (SchemeData[]) schemeDataArr.clone() : schemeDataArr;
        this.A03 = schemeDataArr;
        this.A01 = schemeDataArr.length;
        Arrays.sort(this.A03, this);
    }

    public DrmInitData(String str, SchemeData... schemeDataArr) {
        this(str, true, schemeDataArr);
    }

    public DrmInitData(List<SchemeData> schemeDatas) {
        this(null, false, (SchemeData[]) schemeDatas.toArray(new SchemeData[0]));
    }

    public DrmInitData(SchemeData... schemeDataArr) {
        this(null, schemeDataArr);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // java.util.Comparator
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final int compare(SchemeData schemeData, SchemeData schemeData2) {
        if (KN.A03.equals(schemeData.A03)) {
            return KN.A03.equals(schemeData2.A03) ? 0 : 1;
        }
        return schemeData.A03.compareTo(schemeData2.A03);
    }

    public final DrmInitData A01(String str) {
        if (N1.A1E(this.A02, str)) {
            return this;
        }
        return new DrmInitData(str, false, this.A03);
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
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        DrmInitData drmInitData = (DrmInitData) obj;
        if (N1.A1E(this.A02, drmInitData.A02) && Arrays.equals(this.A03, drmInitData.A03)) {
            return true;
        }
        return false;
    }

    public final int hashCode() {
        if (this.A00 == 0) {
            int result = this.A02 == null ? 0 : this.A02.hashCode();
            int i5 = result * 31;
            int result2 = Arrays.hashCode(this.A03);
            this.A00 = i5 + result2;
        }
        return this.A00;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeString(this.A02);
        parcel.writeTypedArray(this.A03, 0);
    }
}
