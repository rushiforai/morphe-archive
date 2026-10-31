package com.facebook.ads.androidx.media3.extractor.metadata.scte35;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.ads.redexgen.X.C1084Mk;
import com.facebook.ads.redexgen.X.C1430aH;
import com.facebook.ads.redexgen.X.N1;

/* loaded from: assets/audience_network/classes.dex */
public final class PrivateCommand extends SpliceCommand {
    public static final Parcelable.Creator<PrivateCommand> CREATOR = new C1430aH();
    public final long A00;
    public final long A01;
    public final byte[] A02;

    public PrivateCommand(long j11, byte[] bArr, long j12) {
        this.A01 = j12;
        this.A00 = j11;
        this.A02 = bArr;
    }

    public PrivateCommand(Parcel parcel) {
        this.A01 = parcel.readLong();
        this.A00 = parcel.readLong();
        this.A02 = (byte[]) N1.A0f(parcel.createByteArray());
    }

    public /* synthetic */ PrivateCommand(Parcel parcel, C1430aH c1430aH) {
        this(parcel);
    }

    public static PrivateCommand A00(C1084Mk c1084Mk, int i5, long j11) {
        long jA0Q = c1084Mk.A0Q();
        byte[] bArr = new byte[i5 - 4];
        c1084Mk.A0k(bArr, 0, bArr.length);
        return new PrivateCommand(jA0Q, bArr, j11);
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel parcel, int i5) {
        parcel.writeLong(this.A01);
        parcel.writeLong(this.A00);
        parcel.writeByteArray(this.A02);
    }
}
